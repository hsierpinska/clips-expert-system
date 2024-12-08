(defrule infographic-ask-condensed
    (project infographic)
    (not (condensed-opinion ?))
=>
    (assert (question
        (text "We all like something very condensed, yes?")
        (choices
            "YES" "NO"
        )
        (facts
            "(condensed-opinion like)" "(condensed-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule infographic-ask-tables
    (project infographic)
    (condensed-opinion dislike)
    (not (got-tables ?))
=>
    (assert (question
        (text "Got a lot of tables, have you?")
        (choices
            "YES" "NO"
        )
        (facts
            "(got-tables yes)" "(got-tables no)"
        )
        (multiple 0)
    ))
)

(defrule infographic-ask-terminator
    (project infographic)
    (condensed-opinion dislike)
    (got-tables no)
    (not (cried-at-terminator ?))

=>
    (assert (question
        (text "You cried when watching terminator?")
        (choices
            "YES" "NO"
        )
        (facts
            "(cried-at-terminator yes)" "(cried-at-terminator no)"
        )
        (multiple 0)
    ))
)

(defrule infographic-ask-is-flowchart-hot
    (project infographic)
    (condensed-opinion dislike)
    (got-tables no)
    (cried-at-terminator no)
    (not (flowchart-hot ?))

=>
    (assert (question
        (text "I must say that this flowchart is looking hot")
        (choices
            "YES"
        )
        (facts
            "(flowchart-hot yes)"
        )
        (multiple 0)
    ))
)
