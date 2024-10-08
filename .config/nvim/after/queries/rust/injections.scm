;; Assembly test macro in hemul
(macro_invocation
  macro: (identifier) @_name (#eq? @_name "asm_test")
  (token_tree
    (raw_string_literal) @asm
  )
  (#offset! @asm 0 3 0 -2)
)

(token_tree
  (identifier) @n1 (#eq? @n1 "asm_test")
  (token_tree
    (identifier) @n2 (#eq? @n2 "format")
    (token_tree
      (raw_string_literal) @asm
    )
  )
  (#offset! @asm 0 3 0 -2)
)

;; Sql queries
(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#eq? @_name "query")
  )
  (token_tree
    (raw_string_literal) @sql
  )
  (#offset! @sql 0 3 0 -2)
)

;; HTML templates
(
  (attribute_item
    (attribute
      arguments: (token_tree
        (identifier) @_source (#eq? @_source "source")
        (raw_string_literal) @html
      )
      (#offset! @html 0 3 0 -2)
    )
  )
)
