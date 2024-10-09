; extends

;; for reference
;; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/yaml/injections.scm

;; river: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# river")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "river")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; river: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# alloy")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "river")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; yaml: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# yaml")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "yaml")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; json: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# json")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "json")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; json: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# yml")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "json")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; sql: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# sql")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "sql")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; query: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# query")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "query")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; asm: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# asm")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "asm")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; vcl: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# vcl")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "vcl")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)

;; vtc: comment before string
(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# vtc")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "vtc")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)
