;; # river in yaml files

(block_mapping_pair
  (comment) @_name (#eq? @_name "# river")
  (block_node
    (block_mapping
      (block_mapping_pair
        value: (block_node) @river
      )
    )
  )
  (#offset! @river 0 3 0 -2)
)

;; # sql in yaml files
; (block_mapping_pair
;   (comment) @_name (#eq? @_name "# sql")
;   (block_node
;     (block_mapping
;       (block_mapping_pair
;         value: ((block_node) @sql)
;       )
;     )
;   )
;   (#offset! @sql 0 3 0 -2)
; )

(block_mapping_pair
  (comment) @_name (#eq? @_name "# sql")
  (block_node
    (block_mapping
      (block_mapping_pair
        value: ((block_node) @sql (#set! "language" "sql"))
      )
    )
  )
)
