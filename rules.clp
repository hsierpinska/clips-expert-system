; Book questions

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

(defrule book-ask-humanistic
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
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
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
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
    (not (typeface-preference ?))
=>
    (assert (question
        (text "A sans serif, maybe? Or perhaps a serif?")
        (choices
            "YES" "NO"
        )
        (facts
            "(typeface-preference sans-serif)" "(typeface-preference serif)"
        )
        (multiple 0)
    ))
)

; Recommendations

(defrule recommend-caslon
    (project book)
    (is-doubtful yes)
=>
    (assert (recommendation
        (font-name "Caslon")
        (preview-path "previews/caslon.png")
    ))
)

(defrule recommend-minion
    (project book)
    (is-doubtful no)
    (usability-champion yes)
=>
    (assert (recommendation
        (font-name "Minion")
        (preview-path "previews/minion.png")
    ))
)

(defrule recommend-sabon
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond loves)
    (larger-eye want)
=>
    (assert (recommendation
        (font-name "Sabon")
        (preview-path "previews/sabon.png")
    ))
)

(defrule recommend-garamond
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond loves)
    (larger-eye not-want)
=>
    (assert (recommendation
        (font-name "Garamond")
        (preview-path "previews/garamond.png")
    ))
)

(defrule recommend-optima
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference sans-serif)
=>
    (assert (recommendation
        (font-name "Optima")
        (preview-path "previews/optima.png")
    ))
)

(defrule recommend-joanna
     (project book)
     (is-doubtful no)
     (usability-champion no)
     (garamond not-loves)
     (typeface-preference serif)
     (eric-gill-opinion good)
 =>
     (assert (recommendation
         (font-name "Joanna")
         (preview-path "previews/joanna.png")
     ))
 )

(defrule recommend-baskerville
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-forms-pleasing no)
=>
    (assert (recommendation
        (font-name "Baskerville")
        (preview-path "previews/baskerville.png")
    ))
)

(defrule recommend-ff-scala
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-forms-pleasing yes)
    (cheese-preference gouda)
=>
    (assert (recommendation
        (font-name "FF Scala")
        (preview-path "previews/ff_scala.png")
    ))
)

(defrule recommend-syntax
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-forms-pleasing yes)
    (cheese-preference emmental)
=>
    (assert (recommendation
        (font-name "FF Syntax")
        (preview-path "previews/syntax.png")
    ))
)

