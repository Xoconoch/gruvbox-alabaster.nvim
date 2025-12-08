;; vim: ft=query
;; extends

(function_definition
  name: (word) @GruvboxAlabasterDefinition)

((program . (comment) @GruvboxAlabasterHashbang)
 (#match? @GruvboxAlabasterHashbang "^#!/"))
