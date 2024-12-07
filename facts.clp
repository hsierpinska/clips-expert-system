(deftemplate question
    (slot text (type STRING))
    (multislot choices (type STRING))
    (multislot facts (type STRING))
    (slot multiple (type INTEGER))
)

; (program-info (title "Typeface Chooser"))

(deffacts initial-question
    (question
        (text "SO YOU NEED A TYPEFACE\\nWhat kind of project you'll need it for?")
        (choices
            "BOOK" "INFOGRAPHIC" "NEWSPAPER" "INVITATION" "LOGO"
        )
        (facts
            "(project book)" "(project infographic)" "(project newspaper)" "(project invitation)" "(project logo)"
        )
        (multiple 1)
    )
)

