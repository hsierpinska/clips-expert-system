(defrule newspaper-ask-form
    (project newspaper)
    (not (form ?))
=>
    (assert (question
        (text "Which one do you prefer the most?")
        (choices
            "TEXT FACE" "COMBINATION" "DISPLAY"
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

(defrule newspaper-ask-award-thoughts
    (project newspaper)
    (form text-face)
    (boring no)
    (heavily-used no)
    (not (award-thoughts ?))

=>
    (assert (question
        (text "How about something award winning?")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(award-thoughts good)" "(award-thoughts bad)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-spiekermann-thoughts
    (project newspaper)
    (form combination)
    (not (spiekermann-thoughts ?))

=>
    (assert (question
        (text "Think Mr Spiekermann is mostly right?")
        (choices
            "YES" "NO"
        )
        (facts
            "(spiekermann-thoughts right)" "(spiekermann-thoughts wrong)"
        )
        (multiple 0)
    ))
)

(defrule newspaper-ask-netherlands
    (project newspaper)
    (form combination)
    (spiekermann-thoughts wrong)
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
    (spiekermann-thoughts wrong)
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

(defrule newspaper-ask-not-afraid-of-nineties
    (project newspaper)
    (form display)
    (traditional no)
    (modern no)
    (not (not-afraid-of-nineties ?))

=>
    (assert (question
        (text "Not afraid to be asked if you live in the nineties?")
        (choices
            "YES" "NO"
        )
        (facts
            "(not-afraid-of-nineties yes)" "(not-afraid-of-nineties no)"
        )
        (multiple 0)
    ))
)


