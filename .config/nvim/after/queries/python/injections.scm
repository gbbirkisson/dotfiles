;; query
; extends

;; Inspired by https://github.com/DariusCorvus/tree-sitter-language-injection.nvim

;; Comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*-{2,}( )*[sS][qQ][lL]( )*\n")
  (#set! injection.language "sql")
)

;; Comment before assignment
(
  (comment) @_comment (#match? @_comment "^#( )*[sS][qQ][lL]$")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "sql")
      )
    )
  )
)
