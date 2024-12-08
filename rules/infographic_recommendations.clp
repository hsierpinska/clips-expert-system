(defrule infographic-recommend-univers
    (project infographic)
    (condensed-opinion like)
=>
    (assert (recommendation
        (name "Univers")
        (preview "previews/univers.png")
    ))
)

(defrule infographic-recommend-letter-gothic
    (project infographic)
    (condensed-opinion dislike)
    (got-tables yes)
=>
    (assert (recommendation
        (name "Letter Gothic")
        (preview "previews/letter_gothic.png")
    ))
)

(defrule infographic-recommend-ocr
    (project infographic)
    (condensed-opinion dislike)
    (got-tables no)
    (cried-at-terminator yes)
=>
    (assert (recommendation
        (name "OCR")
        (preview "previews/ocr.png")
    ))
)

(defrule infographic-recommend-ff-din
    (project infographic)
    (condensed-opinion dislike)
    (got-tables no)
    (cried-at-terminator no)
    (flowchart-hot yes)
=>
    (assert (recommendation
        (name "FF Din")
        (preview "previews/ff_din.png")
    ))
)