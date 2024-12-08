(defrule invitation-ask-handwritten-opinion
    (project invitation)
    (not (handwritten-opinion ?))
=>
    (assert (question
        (text "Like something handwritten, do you?")
        (choices
            "YES" "NO"
        )
        (facts
            "(handwritten-opinion like)" "(handwritten-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-calligraphic
    (project invitation)
    (handwritten-opinion like)
    (not (calligraphic ?))
=>
    (assert (question
        (text "Something calligraphic, maybe?")
        (choices
            "YES" "NO"
        )
        (facts
            "(calligraphic yes)" "(calligraphic no)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-fancy
    (project invitation)
    (handwritten-opinion dislike)
    (not (fancy ?))
=>
    (assert (question
        (text "How about something a bit fancy?")
        (choices
            "YES" "NO"
        )
        (facts
            "(fancy yes)" "(fancy no)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-hairlines
    (project invitation)
    (handwritten-opinion dislike)
    (fancy yes)
    (not (hairlines ?))
=>
    (assert (question
        (text "Thin or thinner hairlines?")
        (choices
            "THIN HAIRLINES" "THINNER HAIRLINES"
        )
        (facts
            "(hairlines thin)" "(hairlines thinner)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-readability
    (project invitation)
    (handwritten-opinion dislike)
    (fancy yes)
    (hairlines thinner)
    (not (readability ?))
=>
    (assert (question
        (text "Readability?")
        (choices
            "YES" "NO"
        )
        (facts
            "(readability yes)" "(readability no)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-something-fun
    (project invitation)
    (handwritten-opinion dislike)
    (fancy no)
    (not (something-fun ?))
=>
    (assert (question
        (text "Something fun, then?")
        (choices
            "YES"
        )
        (facts
            "(something-fun yes)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-is-alone
    (project invitation)
    (handwritten-opinion dislike)
    (fancy no)
    (something-fun yes)
    (not (is-alone ?))
=>
    (assert (question
        (text "Are you alone?")
        (choices
            "YES"
        )
        (facts
            "(is-alone yes)"
        )
        (multiple 0)
    ))
)

(defrule invitation-ask-is-coming-with
    (project invitation)
    (handwritten-opinion dislike)
    (fancy no)
    (something-fun yes)
    (is-alone yes)
    (not (is-coming-with ?))
=>
    (assert (question
        (text "Okay then, come with me")
        (choices
            "OK"
        )
        (facts
            "(is-coming-with yes)"
        )
        (multiple 0)
    ))
)
