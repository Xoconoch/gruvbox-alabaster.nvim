;; vim: ft=query
;; extends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMMENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(comment) @comment


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STRINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(string) @string
(raw_span) @string
(raw_blck) @string


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STATIC CONSTANTS
;; (things whose meaning is fixed and obvious)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(number) @constant
(bool)   @constant
(none)   @constant
(auto)   @constant
(symbol) @constant
(letter) @constant

;; Math literals / markup literals
(math)   @constant
(label)  @constant
(ref)    @constant
(url)    @constant


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL DEFINITIONS
;; (names that introduce meaning)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Function definitions
(function_definition
  name: (ident) @definition)

;; Let bindings at top level
(let_binding
  name: (ident) @definition)

;; Imported names
(import_item
  name: (ident) @definition)

;; Struct / enum / type-like constructs
(type_definition
  name: (ident) @definition)

;; Tagged blocks that define reusable entities
(tagged
  field: (ident) @definition)

