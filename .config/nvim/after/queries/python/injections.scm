; extends

;; inspired by
;; https://github.com/DariusCorvus/tree-sitter-language-injection.nvim

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

;; json: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*yml( )*\n")
  (#set! injection.language "json")
)

;; json: comment before string
(
  (comment) @_lang (#eq? @_lang "# yml")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "json")
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
