;; vim: ft=query
;; extends

(struct_item
  name: (type_identifier) @GruvboxAlabasterDefinition)
(enum_item
  name: (type_identifier) @GruvboxAlabasterDefinition)

(impl_item
  type: (type_identifier) @GruvboxAlabasterDefinition)

(impl_item
  type: (scoped_type_identifier
          path: (scoped_identifier)
          name: (type_identifier) @GruvboxAlabasterDefinition))

(impl_item
  body: (declaration_list
          (type_item
            name: (type_identifier) @GruvboxAlabasterDefinition)))
(impl_item
  type: (generic_type
          type: (type_identifier) @GruvboxAlabasterDefinition))

(trait_item
  name: (type_identifier) @GruvboxAlabasterDefinition)

(trait_item
  body: (declaration_list
          (associated_type
            name: (type_identifier) @GruvboxAlabasterDefinition)))

(trait_item
  body: (declaration_list
          (function_signature_item
            name: (identifier) @GruvboxAlabasterDefinition)))

(function_item
  name: (identifier) @GruvboxAlabasterDefinition)

(macro_definition
  name: (identifier) @GruvboxAlabasterDefinition)

(for_expression
  "in" @GruvboxAlabasterPunctuation)
(type_arguments
  "<" @GruvboxAlabasterPunctuation)
(type_arguments
  ">" @GruvboxAlabasterPunctuation)
(type_parameters
  "<" @GruvboxAlabasterPunctuation)
(type_parameters
  ">" @GruvboxAlabasterPunctuation)
