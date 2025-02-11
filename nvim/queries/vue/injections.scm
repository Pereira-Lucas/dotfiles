; <route lang="json">
(element
  (start_tag
    (tag_name) @_tag)
  (text) @injection.content
  (#eq? @_tag "route")
  (#set! injection.language "json"))

