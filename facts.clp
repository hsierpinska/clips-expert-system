(deftemplate question
    (slot text (type STRING))
    (multislot choices (type STRING))
    (slot multiple (type INTEGER))
)
; (program-info (title "Typeface Chooser"))
(deffacts program-info
    (question
        (text "SO YOU NEED A TYPEFACE\\nWhat kind of project you'll need it for?")
        (choices "BOOK" "INFOGRAPHIC" "NEWSPAPER" "INVITATION" "LOGO")
        (multiple 0)
    )
)

