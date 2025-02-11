#!/usr/bin/env rust-script

//! ```cargo
//! [dependencies]
//! chrono = "0.4"
//! dirs = "5.0"
//! ```

use chrono::Local;
use std::fs::File;
use std::fs::read_to_string;
use std::path::Path;

fn main() {
    let now = Local::now();
    let hour = now.format("%H").to_string();

    let todo_trigger = format!("/tmp/TODO-{}", hour);

    if Path::new(&todo_trigger).exists() {
        //return;
    }

    let todo = dirs::home_dir()
        .expect("Could not find home directory")
        .join("repos/personal/notes/todo.md");
    for line in read_to_string(&todo).unwrap().lines() {
        if line.starts_with("- [ ") {
            println!("{}", &line[2..line.len()]);
        }
    }

    println!("‎");
    println!("‎");

    File::create(&todo_trigger).expect(&format!("failed to create {todo_trigger}"));
}
