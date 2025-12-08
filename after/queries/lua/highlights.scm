;; vim: ft=query
;; extends

(function_declaration
  name: (identifier) @GruvboxAlabasterDefinition)

(assignment_statement
  (variable_list
    name: (dot_index_expression
            field: (identifier) @GruvboxAlabasterDefinition))
  (expression_list
    value: (function_definition)))

(assignment_statement
  (variable_list
    name: (identifier) @GruvboxAlabasterDefinition)
  (expression_list
    value: (function_definition)))

(function_declaration
  name: (dot_index_expression
          field: (identifier) @GruvboxAlabasterDefinition))

(table_constructor
  (field name: (identifier) @GruvboxAlabasterString))

(hash_bang_line) @GruvboxAlabasterHashbang
