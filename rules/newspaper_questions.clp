(defrule newspaper-ask-form
    (project newspaper)
    (not (form ?))
=>
    (assert (question
        (text "Which one do you prefer the most?")
        (choices
            "TEXT-FACE" "COMBINATION" "DISPLAY"
        )
        (facts
            "(form text-face)" "(form combination)" "(form display)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-if-boring
    (project newspaper)
    (form text-face)
    (not (boring ?))
=>
    (assert (question
        (text "Do people call you boring from time to time?")
        (choices
            "YES" "NO"
        )
        (facts
            "(boring yes)" "(boring no)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-heavily-used
    (project newspaper)
    (form text-face)
    (boring no)
    (not (heavily-used ?))

=>
    (assert (question
        (text "How about something heavily used?")
        (choices
            "YES" "NO"
        )
        (facts
            "(heavily-used yes)" "(heavily-used no)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-award
    (project newspaper)
    (form text-face)
    (boring no)
    (heavily-used no)
    (not (award ?))

=>
    (assert (question
        (text "How about something award winning?")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(award good)" "(award bad)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-spiekermann
    (project newspaper)
    (form combination)
    (not (spiekermann ?))

=>
    (assert (question
        (text "Think Mr Spiekermann is mostly right?")
        (choices
            "YES" "NO"
        )
        (facts
            "(spiekermann right)" "(spiekermann wrong)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-netherlands
    (project newspaper)
    (form combination)
    (spiekermann wrong)
    (not (netherlands ?))

=>
    (assert (question
        (text "The Netherlands is nice, right?")
        (choices
            "YES" "NO"
        )
        (facts
            "(netherlands nice)" "(netherlands bad)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-spiky-serifs
    (project newspaper)
    (form combination)
    (spiekermann wrong)
    (netherlands nice)
    (not (spiky-serifs ?))

=>
    (assert (question
        (text "Mmm, spiky serifs are nice")
        (choices
            "OK"
        )
        (facts
            "(spiky-serifs ok)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-traditional
    (project newspaper)
    (form display)
    (not (traditional ?))

=>
    (assert (question
        (text "Do you like it traditional?")
        (choices
            "YES" "NO"
        )
        (facts
            "(traditional yes)" "(traditional no)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-swiss
    (project newspaper)
    (form display)
    (traditional yes)
    (not (swiss ?))

=>
    (assert (question
        (text "It's okay with you if it's swiss?")
        (choices
            "YES" "NO"
        )
        (facts
            "(swiss yes)" "(swiss no)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-age
    (project newspaper)
    (form display)
    (traditional yes)
    (swiss no)
    (not (age ?))

=>
    (assert (question
        (text "Okay, to a question of age:")
        (choices
            "OLD" "NEW"
        )
        (facts
            "(age old)" "(age new)"
        )
        (multiple 0)
    ))
)



(defrule newspaper-ask-modern
    (project newspaper)
    (form display)
    (traditional no)
    (not (modern ?))

=>
    (assert (question
        (text "Something modern, yet plainspoken?")
        (choices
            "YES" "NO"
        )
        (facts
            "(modern yes)" "(modern no)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-nineties
    (project newspaper)
    (form display)
    (traditional no)
    (modern no)
    (not (nineties ?))

=>
    (assert (question
        (text "Not afraid to be asked if you live in the nineties?")
        (choices
            "YES" "NO"
        )
        (facts
            "(nineties yes)" "(nineties no)"
        )
        (multiple 0)
    ))
)


