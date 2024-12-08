(defrule invitation-recommend-zapfino
    (project invitation)
    (handwritten-opinion like)
    (calligraphic yes)
=>
    (assert (recommendation
        (name "Zapfino")
        (preview "previews/zapfino.png")
    ))
)

(defrule invitation-recommend-ff-erikrighthand
    (project invitation)
    (handwritten-opinion like)
    (calligraphic no)
=>
    (assert (recommendation
        (name "FF Erikrighthand")
        (preview "previews/ff_erikrighthand.png")
    ))
)

(defrule invitation-recommend-bodoni
    (project invitation)
    (handwritten-opinion dislike)
    (fancy yes)
    (hairlines thin)
=>
    (assert (recommendation
        (name "Bodoni")
        (preview "previews/bodoni.png")
    ))
)

(defrule invitation-recommend-walbaum
    (project invitation)
    (handwritten-opinion dislike)
    (fancy yes)
    (hairlines thinner)
    (readability yes)
=>
    (assert (recommendation
        (name "Walbaum")
        (preview "previews/walbaum.png")
    ))
)

(defrule invitation-recommend-didot
    (project invitation)
    (handwritten-opinion dislike)
    (fancy yes)
    (hairlines thinner)
    (readability no)
=>
    (assert (recommendation
        (name "Didot")
        (preview "previews/didot.png")
    ))
)

(defrule invitation-recommend-comic-sans
    (project invitation)
    (handwritten-opinion dislike)
    (fancy no)
    (something-fun yes)
    (is-alone yes)
    (is-coming-with yes)
=>
    (assert (recommendation
        (name "Comic Sans")
        (preview "previews/comic_sans.png")
    ))
)



