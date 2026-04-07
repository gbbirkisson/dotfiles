; extends

;; river: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*river( )*\n")
  (#set! injection.language "river")
)

;; river: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// river")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "river")
)

;; river: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// river")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "river")
)

;; river: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// river")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "river")
)

;; river: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*alloy( )*\n")
  (#set! injection.language "river")
)

;; river: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// alloy")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "river")
)

;; river: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// alloy")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "river")
)

;; river: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// alloy")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "river")
)

;; yaml: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*yaml( )*\n")
  (#set! injection.language "yaml")
)

;; yaml: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// yaml")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "yaml")
)

;; yaml: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// yaml")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "yaml")
)

;; yaml: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// yaml")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "yaml")
)

;; json: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*json( )*\n")
  (#set! injection.language "json")
)

;; json: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// json")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "json")
)

;; json: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// json")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "json")
)

;; json: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// json")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "json")
)

;; json: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*yml( )*\n")
  (#set! injection.language "json")
)

;; json: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// yml")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "json")
)

;; json: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// yml")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "json")
)

;; json: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// yml")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "json")
)

;; sql: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*--( )*sql( )*\n")
  (#set! injection.language "sql")
)

;; sql: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// sql")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "sql")
)

;; sql: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// sql")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "sql")
)

;; sql: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// sql")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "sql")
)

;; query: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*;;( )*query( )*\n")
  (#set! injection.language "query")
)

;; query: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// query")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "query")
)

;; query: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// query")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "query")
)

;; query: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// query")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "query")
)

;; asm: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*;( )*asm( )*\n")
  (#set! injection.language "asm")
)

;; asm: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// asm")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "asm")
)

;; asm: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// asm")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "asm")
)

;; asm: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// asm")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "asm")
)

;; vcl: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*vcl( )*\n")
  (#set! injection.language "vcl")
)

;; vcl: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// vcl")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "vcl")
)

;; vcl: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// vcl")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "vcl")
)

;; vcl: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// vcl")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "vcl")
)

;; vtc: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*vtc( )*\n")
  (#set! injection.language "vtc")
)

;; vtc: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// vtc")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "vtc")
)

;; vtc: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// vtc")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "vtc")
)

;; vtc: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// vtc")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "vtc")
)

;; python: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*python( )*\n")
  (#set! injection.language "python")
)

;; python: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// python")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "python")
)

;; python: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// python")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "python")
)

;; python: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// python")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "python")
)

;; nginx: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*nginx( )*\n")
  (#set! injection.language "nginx")
)

;; nginx: comment before macro string (expression)
(
  (line_comment) @_lang (#eq? @_lang "// nginx")
  .
  (expression_statement
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "nginx")
)

;; nginx: comment before macro string (let binding)
(
  (line_comment) @_lang (#eq? @_lang "// nginx")
  .
  (let_declaration
    (macro_invocation
      (token_tree
        (raw_string_literal
          (string_content) @injection.content
        )
      )
    )
  )
  (#set! injection.language "nginx")
)

;; nginx: comment before macro string (inside token_tree)
(token_tree
  (line_comment) @_lang (#eq? @_lang "// nginx")
  .
  (identifier)
  .
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "nginx")
)

;; sqlx::query! macros
(macro_invocation
  macro: (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar" "query_unchecked" "query_as_unchecked" "query_scalar_unchecked")
  )
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "sql")
)

;; sqlx::query::<T>() calls
(call_expression
  function: (generic_function
    function: (scoped_identifier
      path: (identifier) @_path (#eq? @_path "sqlx")
      name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar" "query_unchecked" "query_as_unchecked" "query_scalar_unchecked")
    )
  )
  arguments: (arguments
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "sql")
)

;; asm_test macros
(macro_invocation
  macro: (identifier) @_name (#any-of? @_name "asm_test")
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )
  (#set! injection.language "asm")
)
