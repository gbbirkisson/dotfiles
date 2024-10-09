; extends

;; river: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*river( )*\n")
  (#set! injection.language "river")
)

;; river: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*alloy( )*\n")
  (#set! injection.language "river")
)

;; yaml: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*#( )*yaml( )*\n")
  (#set! injection.language "yaml")
)

;; json: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*json( )*\n")
  (#set! injection.language "json")
)

;; json: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*yml( )*\n")
  (#set! injection.language "json")
)

;; sql: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*--( )*sql( )*\n")
  (#set! injection.language "sql")
)

;; query: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*;;( )*query( )*\n")
  (#set! injection.language "query")
)

;; asm: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*;( )*asm( )*\n")
  (#set! injection.language "asm")
)

;; vcl: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*vcl( )*\n")
  (#set! injection.language "vcl")
)

;; vtc: comment in string
(
  (string_content) @injection.content (#match? @injection.content "^\n*( )*//( )*vtc( )*\n")
  (#set! injection.language "vtc")
)
