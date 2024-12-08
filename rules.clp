

; Project: Book
(defrule ask-doubtful
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

(defrule recommend-baskerville
    (humanistic dislikes)
    (dislikes eric-gill)
    (dislikes sans-serif)
    (dislikes garamond)
    (dislikes usability)
    (is doubtful)
    (project book)
=>
    (assert (recommend baskerville))
)

(defrule recommend-ff-scala
    (likes gouda)
    (likes humanistic)
    (dislikes eric-gill)
    (dislikes sans-serif)
    (dislikes garamond)
    (dislikes usability)
    (is doubtful)
    (project book)
=>
    (assert (recommend ff-scala))
)

(defrule recommend-syntax
    (likes emmental)
    (likes humanistic)
    (dislikes eric-gill)
    (dislikes sans-serif)
    (dislikes garamond)
    (dislikes usability)
    (is doubtful)
    (project book)
=>
    (assert (recommend syntax))
)
