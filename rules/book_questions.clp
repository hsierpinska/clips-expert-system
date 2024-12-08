(defrule book-ask-is-doubtful
    (project book)
    (not (is-doubtful ?))
=>
    (assert (question
        (text "Are you completely in doubt?")
        (choices
            "YES" "NO"
        )
        (facts
            "(is-doubtful yes)" "(is-doubtful no)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-usability-champion

    (project book)
    (is-doubtful no)
    (not (usability-champion ?))
=>
    (assert (question
        (text "A champion in usability, perhaps?")
        (choices
            "YES" "NO"
        )
        (facts
            "(usability-champion yes)" "(usability-champion no)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-garamond
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (not (garamond ?))
=>
    (assert (question
        (text "Everybody loves Garamond:")
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
    (is-doubtful no)
    (usability-champion no)
    (garamond loves)
    (not (larger-eye ?))
=>
    (assert (question
        (text "But perhaps, one would want a larger eye?")
        (choices
            "YES" "NO"
        )
        (facts
            "(larger-eye want)" "(larger-eye not-want)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-sans-serif
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (not (typeface-preference ?))
=>
    (assert (question
        (text "You want a sans serif, is that the case?")
        (choices
            "YES" "NO"
        )
        (facts
            "(typeface-preference sans-serif)" "(typeface-preference serif)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-eric-gill
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
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

(defrule book-ask-humanistic-opinion
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (not (humanistic-opinion ?))
=>
    (assert (question
        (text "Humanistic forms please your eye?")
        (choices
            "YES" "NO"
        )
        (facts
            "(humanistic-opinion like)" "(humanistic-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule book-ask-cheese-preference
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-opinion like)
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
