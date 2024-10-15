; extends

;; for reference
;; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/yaml/injections.scm

;; river: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*//( )river( )*\n")
  (#set! injection.language "river")
  (#offset! @injection.content 0 1 0 0)
)

;; river: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# river")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "river")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; river: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*//( )alloy( )*\n")
  (#set! injection.language "river")
  (#offset! @injection.content 0 1 0 0)
)

;; river: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# alloy")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "river")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; yaml: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*#( )yaml( )*\n")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 0)
)

;; yaml: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# yaml")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "yaml")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; json: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*//( )json( )*\n")
  (#set! injection.language "json")
  (#offset! @injection.content 0 1 0 0)
)

;; json: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# json")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "json")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; json: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*//( )yml( )*\n")
  (#set! injection.language "json")
  (#offset! @injection.content 0 1 0 0)
)

;; json: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# yml")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "json")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; sql: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*--( )sql( )*\n")
  (#set! injection.language "sql")
  (#offset! @injection.content 0 1 0 0)
)

;; sql: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# sql")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "sql")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; query: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*;;( )query( )*\n")
  (#set! injection.language "query")
  (#offset! @injection.content 0 1 0 0)
)

;; query: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# query")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "query")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; asm: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*;( )asm( )*\n")
  (#set! injection.language "asm")
  (#offset! @injection.content 0 1 0 0)
)

;; asm: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# asm")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "asm")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; vcl: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*//( )vcl( )*\n")
  (#set! injection.language "vcl")
  (#offset! @injection.content 0 1 0 0)
)

;; vcl: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# vcl")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "vcl")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; vtc: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*//( )vtc( )*\n")
  (#set! injection.language "vtc")
  (#offset! @injection.content 0 1 0 0)
)

;; vtc: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# vtc")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "vtc")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; python: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*#( )python( )*\n")
  (#set! injection.language "python")
  (#offset! @injection.content 0 1 0 0)
)

;; python: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# python")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "python")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; nginx: comment in string
(block_node
  (block_scalar) @injection.content (#match? @injection.content "^[\\|\\>]\n*( )*#( )nginx( )*\n")
  (#set! injection.language "nginx")
  (#offset! @injection.content 0 1 0 0)
)

;; nginx: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# nginx")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "nginx")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)
