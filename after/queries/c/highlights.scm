;; vim: ft=query
;; extends

(function_declarator
  declarator: (identifier) @GruvboxAlabasterDefinition)
(preproc_function_def
  name: (identifier) @GruvboxAlabasterDefinition)

(type_definition
  type: (struct_specifier
          name: (type_identifier) @GruvboxAlabasterDefinition)
  declarator: (type_identifier) @GruvboxAlabasterDefinition)

(type_definition
  type: (struct_specifier)
  declarator: (type_identifier) @GruvboxAlabasterDefinition)

(type_definition
  type: (enum_specifier)
  declarator: (type_identifier) @GruvboxAlabasterDefinition)

(struct_specifier
  name: (type_identifier) @GruvboxAlabasterDefinition)

(declaration
  type: (struct_specifier
          name: (type_identifier) @GruvboxAlabasterBase))

(enum_specifier
    name: (type_identifier) @GruvboxAlabasterDefinition)

(declaration
  type: (enum_specifier
          name: (type_identifier) @GruvboxAlabasterBase))
