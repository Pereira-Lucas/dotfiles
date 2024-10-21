; <route lang="json">
(element
  (start_tag
    (attribute
      (attribute_name) @_lang
      (quoted_attribute_value
        (attribute_value) @_json)))
  (text) @injection.content
  (#eq? @_lang "lang")
  (#eq? @_json "json")
  (#set! injection.language "json"))

