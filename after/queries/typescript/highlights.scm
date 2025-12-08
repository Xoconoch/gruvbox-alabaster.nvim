;; vim: ft=query
;; extends

(interface_declaration
  name: (type_identifier) @GruvboxAlabasterDefinition)

(method_definition
  name: (property_identifier) @GruvboxAlabasterDefinition)

(function_declaration
  name: (identifier) @GruvboxAlabasterDefinition)

(variable_declarator
  name: (identifier) @GruvboxAlabasterDefinition
  value: (arrow_function))

(type_alias_declaration
  name: (type_identifier) @GruvboxAlabasterDefinition)

(undefined) @GruvboxAlabasterConstant
