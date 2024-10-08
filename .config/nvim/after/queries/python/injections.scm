; extends

;; inspired by
;; https://github.com/DariusCorvus/tree-sitter-language-injection.nvim


;; Comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*-{2,}( )*[sS][qQ][lL]( )*\n")
  (#set! injection.language "sql")
)

;; Comment before assignment
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

;; Comment before assignment
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

;; Comment before assignment
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

;; Comment before assignment
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
