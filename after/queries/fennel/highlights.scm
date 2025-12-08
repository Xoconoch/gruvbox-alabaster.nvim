;; vim: ft=query
;; extends

; (fn
;   name: (symbol) @GruvboxAlabasterDefinition)
;   ; TODO: add this when https://github.com/nvim-treesitter/nvim-treesitter/issues/1788 is fixed
;   ; docstring: (string)? @GruvboxAlabasterComment
; (fn
;   name: (multi_symbol (symbol) @GruvboxAlabasterDefinition))

; (global
;   (binding
;     (symbol) @GruvboxAlabasterDefinition))

(list
  (symbol) @function.macro
  (#match? @function.macro "^macro$")
  (symbol) @GruvboxAlabasterDefinition)


; ((program . (hashfn) @GruvboxAlabasterHashbang)
;  (#match? @GruvboxAlabasterHashbang "^#!/")
;  (#set! "priority" 101))
