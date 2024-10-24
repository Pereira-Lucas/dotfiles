 (variable_declarator
   name: (identifier) @variable_name
   (#match? @variable_name ".*Sql$|sql")
   value: [
		   (string) @injection.content
		   (template_string) @injection.content
		   ]
   (#offset! @injection.content 0 1 0 -1)
   (#set! injection.include-children)
   (#set! injection.language "sql")
)

(assignment_expression
  left: (identifier) @variable_name
  (#match? @variable_name ".*Sql$|sql")
  right: [
		   (string) @injection.content
		   (template_string) @injection.content
		   ]
   (#offset! @injection.content 0 1 0 -1)
   (#set! injection.include-children)
   (#set! injection.language "sql")
  )
