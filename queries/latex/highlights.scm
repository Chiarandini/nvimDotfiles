;extends

(
  (generic_environment
    begin: (begin
      name: (curly_group_text
        (text (word) @env_name)
      )
    )
    (curly_group)
    (curly_group
      (text) @texTheoremTag
    )
  )
  (#match? @env_name "^(defn|prop|thm|lem|titledBox|cor|example)$")
)
