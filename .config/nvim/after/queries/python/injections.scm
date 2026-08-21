; extends

;; inspired by
;; https://github.com/DariusCorvus/tree-sitter-language-injection.nvim

;; asm: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*;( )*asm( )*\n")
  (#set! injection.language "asm")
)

;; asm: comment before string
(
  (comment) @_lang (#eq? @_lang "# asm")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "asm")
      )
    )
  )
)

;; javascript: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*javascript( )*\n")
  (#set! injection.language "javascript")
)

;; javascript: comment before string
(
  (comment) @_lang (#eq? @_lang "# javascript")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "javascript")
      )
    )
  )
)

;; json: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*json( )*\n")
  (#set! injection.language "json")
)

;; json: comment before string
(
  (comment) @_lang (#eq? @_lang "# json")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "json")
      )
    )
  )
)

;; nginx: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*nginx( )*\n")
  (#set! injection.language "nginx")
)

;; nginx: comment before string
(
  (comment) @_lang (#eq? @_lang "# nginx")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "nginx")
      )
    )
  )
)

;; promql: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*promql( )*\n")
  (#set! injection.language "promql")
)

;; promql: comment before string
(
  (comment) @_lang (#eq? @_lang "# promql")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "promql")
      )
    )
  )
)

;; python: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*python( )*\n")
  (#set! injection.language "python")
)

;; python: comment before string
(
  (comment) @_lang (#eq? @_lang "# python")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "python")
      )
    )
  )
)

;; query: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*;;( )*query( )*\n")
  (#set! injection.language "query")
)

;; query: comment before string
(
  (comment) @_lang (#eq? @_lang "# query")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "query")
      )
    )
  )
)

;; river: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*river( )*\n")
  (#set! injection.language "river")
)

;; river: comment before string
(
  (comment) @_lang (#eq? @_lang "# river")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "river")
      )
    )
  )
)

;; river: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*alloy( )*\n")
  (#set! injection.language "river")
)

;; river: comment before string
(
  (comment) @_lang (#eq? @_lang "# alloy")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "river")
      )
    )
  )
)

;; sh: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*sh( )*\n")
  (#set! injection.language "sh")
)

;; sh: comment before string
(
  (comment) @_lang (#eq? @_lang "# sh")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "sh")
      )
    )
  )
)

;; sh: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*shell( )*\n")
  (#set! injection.language "sh")
)

;; sh: comment before string
(
  (comment) @_lang (#eq? @_lang "# shell")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "sh")
      )
    )
  )
)

;; sh: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*bash( )*\n")
  (#set! injection.language "sh")
)

;; sh: comment before string
(
  (comment) @_lang (#eq? @_lang "# bash")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "sh")
      )
    )
  )
)

;; sql: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*--( )*sql( )*\n")
  (#set! injection.language "sql")
)

;; sql: comment before string
(
  (comment) @_lang (#eq? @_lang "# sql")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "sql")
      )
    )
  )
)

;; typescript: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*typescript( )*\n")
  (#set! injection.language "typescript")
)

;; typescript: comment before string
(
  (comment) @_lang (#eq? @_lang "# typescript")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "typescript")
      )
    )
  )
)

;; vcl: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*vcl( )*\n")
  (#set! injection.language "vcl")
)

;; vcl: comment before string
(
  (comment) @_lang (#eq? @_lang "# vcl")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "vcl")
      )
    )
  )
)

;; vtc: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*vtc( )*\n")
  (#set! injection.language "vtc")
)

;; vtc: comment before string
(
  (comment) @_lang (#eq? @_lang "# vtc")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "vtc")
      )
    )
  )
)

;; yaml: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*yaml( )*\n")
  (#set! injection.language "yaml")
)

;; yaml: comment before string
(
  (comment) @_lang (#eq? @_lang "# yaml")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "yaml")
      )
    )
  )
)

;; yaml: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*yml( )*\n")
  (#set! injection.language "yaml")
)

;; yaml: comment before string
(
  (comment) @_lang (#eq? @_lang "# yml")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "yaml")
      )
    )
  )
)
