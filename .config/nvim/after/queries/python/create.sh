#!/usr/bin/env bash

set -euo pipefail

cat <<EOF >injections.scm
; extends

;; inspired by
;; https://github.com/DariusCorvus/tree-sitter-language-injection.nvim


;; Comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*-{2,}( )*[sS][qQ][lL]( )*\n")
  (#set! injection.language "sql")
)
EOF
for lang in river yaml json sql; do
  cat <<EOF >>injections.scm

;; Comment before assignment
(
  (comment) @_lang (#eq? @_lang "# $lang")
  (expression_statement
    (assignment
      (string
        (string_content) @injection.content
        (#set! injection.language "$lang")
      )
    )
  )
)
EOF
done

# ;; Comment before assignment
# (
#   (comment) @_comment (#match? @_comment "^#( )*[sS][qQ][lL]$")
#   (expression_statement
#     (assignment
#       (string
#         (string_content) @injection.content
#         (#set! injection.language "sql")
#       )
#     )
#   )
# )
#
#
# ;; Comment in string
# (
#   (string_content) @injection.content (#match? @injection.content "^\n*( )*-{2,}( )*[sS][qQ][lL]( )*\n")
#   (#set! injection.language "sql")
# )
