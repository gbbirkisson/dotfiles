;; Assembly test macro in hemul
(macro_invocation
  macro: (identifier) @_name (#eq? @_name "asm_test")
(token_tree
  (raw_string_literal) @asm)
  (#offset! @asm 1 0 0 0))

(token_tree
  (identifier) @n1 (#eq? @n1 "asm_test")
  (token_tree
    (identifier) @n2 (#eq? @n2 "format")
    (token_tree
      (raw_string_literal) @asm
    )
  )
  (#offset! @asm 1 0 0 0)
)

;; Sql queries
(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#eq? @_name "query"))
(token_tree
  (raw_string_literal) @sql)
  (#offset! @sql 1 0 0 0))
