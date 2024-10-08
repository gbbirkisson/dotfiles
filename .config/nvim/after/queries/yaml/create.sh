#!/usr/bin/env bash

set -euo pipefail

cat <<EOF >injections.scm
; extends

;; for reference
;; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/yaml/injections.scm
EOF
for lang in river yaml json sql; do
    cat <<EOF >>injections.scm

(block_mapping_pair
  (comment) @_lang (#eq? @_lang "# $lang")
  (block_node
    (block_mapping
      (block_mapping_pair
        key: (flow_node) @_content
        (#any-of? @_content "content")
        value: (block_node
          (block_scalar) @injection.content
          (#set! injection.language "$lang")
          (#offset! @injection.content 0 1 0 0)
        )
      )
    )
  )
)
EOF
done
