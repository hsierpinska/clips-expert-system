; Book questions

(defrule book-ask-doubtful
    (project book)
    (not (doubtful ?))
=>
    (assert (question
        (text "Are you completely in doubt?")
        (choices
            "YES" "NO"
        )
        (facts
            "(doubtful yes)" "(doubtful no)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-usability
    (project book)
    (doubtful no)
    (not (usability ?))
=>
    (assert (question
        (text "A champion in usability, perhaps?")
        (choices
            "YES" "NO"
        )
        (facts
            "(usability yes)" "(usability no)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-garamond
    (project book)
    (doubtful no)
    (usability no)
    (not (ask-garamond ?))
=>
    (assert (question
        (text "Everybody loves Garamond")
        (choices
            "YES" "NO"
        )
        (facts
            "(garamond loves)" "(garamond not-loves)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-larger-eye
    (project book)
    (doubtful no)
    (usability no)
    (garamond yes)
    (not (larger-eye ?))
=>
    (assert (question
        (text "But perhaps, one would want a larger eye?")
        (choices
            "YES" "NO"
        )
        (facts
            "(larger-eye yes)" "(larger-eye no)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-sans-serif
    (project book)
    (doubtful no)
    (usability no)
    (garamond no)
    (not (font-type-preference ?))
=>
    (assert (question
        (text "You want a sans serif, is that the case?")
        (choices
            "YES" "NO"
        )
        (facts
            "(font-type-preference sans-serif)" "(font-type-preference serif)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-eric-gill
    (project book)
    (doubtful no)
    (usability no)
    (garamond no)
    (font-type-preference serif)
    (not (eric-gill-opinion ?))
=>
    (assert (question
        (text "What is your opinion of Eric Gill?")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(eric-gill-opinion good)" "(eric-gill-opinion bad)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-humanistic
    (project book)
    (doubtful no)
    (usability no)
    (garamond no)
    (font-type-preference serif)
    (eric-gill-opinion bad)
    (not (humanistic-forms-pleasing ?))
=>
    (assert (question
        (text "Humanistic forms please your eye?")
        (choices
            "YES" "NO"
        )
        (facts
            "(humanistic-forms-pleasing yes)" "(humanistic-forms-pleasing no)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-cheese-preference
    (project book)
    (doubtful no)
    (usability no)
    (garamond no)
    (font-type-preference serif)
    (eric-gill-opinion bad)
    (humanistic-forms-pleasing yes)
    (not (cheese-preference ?))
=>
    (assert (question
        (text "Okay, to a question of food:")
        (choices
            "GOUDA" "EMMENTAL"
        )
        (facts
            "(cheese-preference gouda)" "(cheese-preference emmental)"
        )
        (multiple 0)
    ))
)

; Logo questions

(defrule ask-sans-serif-logo
    (project logo)
    (not (font-type-preference ?))
=>
    (assert (question
        (text "A sans serif, maybe? Or perhaps a serif?")
        (choices
            "YES" "NO"
        )
        (facts
            "(font-type-preference sans-serif)" "(font-type-preference serif)"
        )
        (multiple 0)
    ))
)

; Recommendations

