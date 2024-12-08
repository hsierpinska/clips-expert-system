; Templates

(deftemplate question
    (slot text (type STRING))
    (multislot choices (type STRING))
    (multislot facts (type STRING))
    (slot multiple (type INTEGER))
)

(deftemplate recommendation
    (slot name (type STRING))
    (slot preview (type STRING))
)

(deftemplate program-info
    (slot name (type STRING))
)

; Initial facts
(deffacts program-setup
    (program-info
        (name "SO YOU NEED A TYPEFACE")
    )
    (question
        (text "What kind of project will you need it for?")
        (choices
            "BOOK" "INFOGRAPHIC" "NEWSPAPER" "INVITATION" "LOGO"
        )
        (facts
            "(project book)" "(project infographic)" "(project newspaper)" "(project invitation)" "(project logo)"
        )
        (multiple 0)
    )
)

