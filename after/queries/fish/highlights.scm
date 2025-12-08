;; vim: ft=query
;; extends

(function_definition
  name: (word) @GruvboxAlabasterDefinition)

(command
  name: (word) @function.builtin
  (#match? @function.builtin "^set$")
  argument: (word) @parameter
  (#any-of? @parameter "-g" "--global" "-U" "--universal" "-x" "--export")
  argument: (word) @GruvboxAlabasterDefinition
  argument: (_))

((program . (comment) @GruvboxAlabasterHashbang)
 (#match? @GruvboxAlabasterHashbang "^#!/"))
