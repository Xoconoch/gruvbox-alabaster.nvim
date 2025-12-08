;; vim: ft=query
;; extends

(function_definition
  name: (identifier) @GruvboxAlabasterDefinition)
(class_definition
  name: (identifier) @GruvboxAlabasterDefinition)

((module . (comment) @GruvboxAlabasterHashbang)
 (#match? @GruvboxAlabasterHashbang "^#!/"))

(decorator
  (identifier) @GruvboxAlabasterBase)
