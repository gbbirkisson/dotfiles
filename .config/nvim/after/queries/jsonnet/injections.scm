; extends

;; asm: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*;( )*asm( )*\n"))
  (#set! injection.language "asm")
)

;; asm: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*;( )*asm( )*\n"))
  (#set! injection.language "asm")
  (#offset! @injection.content 0 1 0 0)
)

;; javascript: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*javascript( )*\n"))
  (#set! injection.language "javascript")
)

;; javascript: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*javascript( )*\n"))
  (#set! injection.language "javascript")
  (#offset! @injection.content 0 1 0 0)
)

;; json: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*json( )*\n"))
  (#set! injection.language "json")
)

;; json: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*json( )*\n"))
  (#set! injection.language "json")
  (#offset! @injection.content 0 1 0 0)
)

;; nginx: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*nginx( )*\n"))
  (#set! injection.language "nginx")
)

;; nginx: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*nginx( )*\n"))
  (#set! injection.language "nginx")
  (#offset! @injection.content 0 1 0 0)
)

;; promql: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*promql( )*\n"))
  (#set! injection.language "promql")
)

;; promql: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*promql( )*\n"))
  (#set! injection.language "promql")
  (#offset! @injection.content 0 1 0 0)
)

;; python: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*python( )*\n"))
  (#set! injection.language "python")
)

;; python: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*python( )*\n"))
  (#set! injection.language "python")
  (#offset! @injection.content 0 1 0 0)
)

;; query: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*;;( )*query( )*\n"))
  (#set! injection.language "query")
)

;; query: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*;;( )*query( )*\n"))
  (#set! injection.language "query")
  (#offset! @injection.content 0 1 0 0)
)

;; river: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*river( )*\n"))
  (#set! injection.language "river")
)

;; river: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*river( )*\n"))
  (#set! injection.language "river")
  (#offset! @injection.content 0 1 0 0)
)

;; river: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*alloy( )*\n"))
  (#set! injection.language "river")
)

;; river: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*alloy( )*\n"))
  (#set! injection.language "river")
  (#offset! @injection.content 0 1 0 0)
)

;; sh: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*sh( )*\n"))
  (#set! injection.language "sh")
)

;; sh: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*sh( )*\n"))
  (#set! injection.language "sh")
  (#offset! @injection.content 0 1 0 0)
)

;; sh: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*shell( )*\n"))
  (#set! injection.language "sh")
)

;; sh: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*shell( )*\n"))
  (#set! injection.language "sh")
  (#offset! @injection.content 0 1 0 0)
)

;; sh: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*bash( )*\n"))
  (#set! injection.language "sh")
)

;; sh: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*bash( )*\n"))
  (#set! injection.language "sh")
  (#offset! @injection.content 0 1 0 0)
)

;; sql: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*--( )*sql( )*\n"))
  (#set! injection.language "sql")
)

;; sql: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*--( )*sql( )*\n"))
  (#set! injection.language "sql")
  (#offset! @injection.content 0 1 0 0)
)

;; typescript: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*typescript( )*\n"))
  (#set! injection.language "typescript")
)

;; typescript: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*typescript( )*\n"))
  (#set! injection.language "typescript")
  (#offset! @injection.content 0 1 0 0)
)

;; vcl: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*vcl( )*\n"))
  (#set! injection.language "vcl")
)

;; vcl: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*vcl( )*\n"))
  (#set! injection.language "vcl")
  (#offset! @injection.content 0 1 0 0)
)

;; vtc: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*//( )*vtc( )*\n"))
  (#set! injection.language "vtc")
)

;; vtc: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*//( )*vtc( )*\n"))
  (#set! injection.language "vtc")
  (#offset! @injection.content 0 1 0 0)
)

;; yaml: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*yaml( )*\n"))
  (#set! injection.language "yaml")
)

;; yaml: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*yaml( )*\n"))
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 0)
)

;; yaml: comment in string
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^\n*( )*#( )*yml( )*\n"))
  (#set! injection.language "yaml")
)

;; yaml: comment in chomped text block
(
  (string
    (string_content) @injection.content
    (#match? @injection.content "^-\n*( )*#( )*yml( )*\n"))
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 0)
)

;; asm: comment before value
(
  (comment) @_lang (#any-of? @_lang "// asm")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "asm")
)

;; asm: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// asm")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "asm")
  (#offset! @injection.content 0 1 0 0)
)

;; javascript: comment before value
(
  (comment) @_lang (#any-of? @_lang "// javascript")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "javascript")
)

;; javascript: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// javascript")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "javascript")
  (#offset! @injection.content 0 1 0 0)
)

;; json: comment before value
(
  (comment) @_lang (#any-of? @_lang "// json")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "json")
)

;; json: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// json")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "json")
  (#offset! @injection.content 0 1 0 0)
)

;; nginx: comment before value
(
  (comment) @_lang (#any-of? @_lang "// nginx")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "nginx")
)

;; nginx: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// nginx")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "nginx")
  (#offset! @injection.content 0 1 0 0)
)

;; promql: comment before value
(
  (comment) @_lang (#any-of? @_lang "// promql")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "promql")
)

;; promql: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// promql")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "promql")
  (#offset! @injection.content 0 1 0 0)
)

;; python: comment before value
(
  (comment) @_lang (#any-of? @_lang "// python")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "python")
)

;; python: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// python")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "python")
  (#offset! @injection.content 0 1 0 0)
)

;; query: comment before value
(
  (comment) @_lang (#any-of? @_lang "// query")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "query")
)

;; query: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// query")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "query")
  (#offset! @injection.content 0 1 0 0)
)

;; river: comment before value
(
  (comment) @_lang (#any-of? @_lang "// river" "// alloy")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "river")
)

;; river: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// river" "// alloy")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "river")
  (#offset! @injection.content 0 1 0 0)
)

;; sh: comment before value
(
  (comment) @_lang (#any-of? @_lang "// sh" "// shell" "// bash")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "sh")
)

;; sh: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// sh" "// shell" "// bash")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "sh")
  (#offset! @injection.content 0 1 0 0)
)

;; sql: comment before value
(
  (comment) @_lang (#any-of? @_lang "// sql")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "sql")
)

;; sql: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// sql")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "sql")
  (#offset! @injection.content 0 1 0 0)
)

;; typescript: comment before value
(
  (comment) @_lang (#any-of? @_lang "// typescript")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "typescript")
)

;; typescript: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// typescript")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "typescript")
  (#offset! @injection.content 0 1 0 0)
)

;; vcl: comment before value
(
  (comment) @_lang (#any-of? @_lang "// vcl")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "vcl")
)

;; vcl: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// vcl")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "vcl")
  (#offset! @injection.content 0 1 0 0)
)

;; vtc: comment before value
(
  (comment) @_lang (#any-of? @_lang "// vtc")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "vtc")
)

;; vtc: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// vtc")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "vtc")
  (#offset! @injection.content 0 1 0 0)
)

;; yaml: comment before value
(
  (comment) @_lang (#any-of? @_lang "// yaml" "// yml")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#not-match? @injection.content "^-")
  (#set! injection.language "yaml")
)

;; yaml: comment before chomped text block
(
  (comment) @_lang (#any-of? @_lang "// yaml" "// yml")
  .
  [
    (string (string_content) @injection.content)
    (binary . (string (string_content) @injection.content))
    (args . (string (string_content) @injection.content))
    (args . (binary . (string (string_content) @injection.content)))
    (member (field (string (string_content) @injection.content)))
    (member (field (binary . (string (string_content) @injection.content))))
    (member (objlocal (bind (string (string_content) @injection.content))))
    (member (objlocal (bind (binary . (string (string_content) @injection.content)))))
    (local_bind (bind (string (string_content) @injection.content)))
    (local_bind (bind (binary . (string (string_content) @injection.content))))
  ]
  (#match? @injection.content "^-")
  (#set! injection.language "yaml")
  (#offset! @injection.content 0 1 0 0)
)
