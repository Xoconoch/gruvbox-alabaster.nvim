;; vim: ft=query
;; extends
(function_declaration
  (simple_identifier) @GruvboxAlabasterDefinition)

(class_declaration
  (type_identifier) @GruvboxAlabasterDefinition)

(object_declaration
  (type_identifier) @GruvboxAlabasterDefinition)

(string_literal) @GruvboxAlabasterString

(boolean_literal) @GruvboxAlabasterConstant
(integer_literal) @GruvboxAlabasterConstant
(long_literal) @GruvboxAlabasterConstant
(unsigned_literal) @GruvboxAlabasterConstant
(real_literal) @GruvboxAlabasterConstant

(line_comment) @GruvboxAlabasterHashbang
(multiline_comment) @Comment


(modifiers (annotation (user_type (type_identifier) @GruvboxAlabasterPunctuation)))
