;; vim: ft=query
;; extends

(function_declarator
  declarator: (qualified_identifier
                name: (identifier) @GruvboxAlabasterDefinition))

;; TODO there's probably a lot of duplicates here

(function_definition
  declarator: (function_declarator
                declarator: (destructor_name (identifier) @GruvboxAlabasterDefinition)))

(function_definition
  declarator: (function_declarator
                declarator: (field_identifier) @GruvboxAlabasterDefinition))

(function_definition
  declarator: (function_declarator
                declarator: (qualified_identifier
                              name: (destructor_name
                                      (identifier) @GruvboxAlabasterDefinition))))

(declaration
  declarator: (function_declarator
                declarator:
                  (destructor_name (identifier) @GruvboxAlabasterDefinition)))

(field_declaration
  declarator: (function_declarator
                declarator: (field_identifier) @GruvboxAlabasterDefinition))

(field_declaration
  declarator: (pointer_declarator
                declarator: (function_declarator
                              declarator:
                                (field_identifier) @GruvboxAlabasterDefinition)))

(function_declarator
 declarator: (field_identifier) @GruvboxAlabasterDefinition)

(function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @GruvboxAlabasterDefinition))
(function_declarator
     declarator: (qualified_identifier
                   name: (qualified_identifier
                           name: (identifier) @GruvboxAlabasterDefinition)))
((function_declarator
     declarator: (qualified_identifier
                   name: (identifier) @GruvboxAlabasterDefinition))
 (#lua-match? @GruvboxAlabasterDefinition "^[A-Z]"))

(labeled_statement
  label: (statement_identifier) @GruvboxAlabasterDefinition)

(type_definition
  declarator: (type_identifier) @GruvboxAlabasterDefinition)

(preproc_def
  name: (identifier) @GruvboxAlabasterDefinition)

(class_specifier
  name: (type_identifier) @GruvboxAlabasterDefinition)

(struct_specifier
  name: (type_identifier) @GruvboxAlabasterDefinition)

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
