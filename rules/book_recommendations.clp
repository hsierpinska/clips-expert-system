(defrule book-recommend-caslon
    (project book)
    (is-doubtful yes)
=>
    (assert (recommendation
        (name "Caslon")
        (preview "previews/caslon.png")
    ))
)

(defrule book-recommend-minion
    (project book)
    (is-doubtful no)
    (usability-champion yes)
=>
    (assert (recommendation
        (name "Minion")
        (preview "previews/minion.png")
    ))
)

(defrule book-recommend-sabon
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond loves)
    (larger-eye want)
=>
    (assert (recommendation
        (name "Sabon")
        (preview "previews/sabon.png")
    ))
)

(defrule book-recommend-garamond
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond loves)
    (larger-eye not-want)
=>
    (assert (recommendation
        (name "Garamond")
        (preview "previews/garamond.png")
    ))
)

(defrule book-recommend-optima
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference sans-serif)
=>
    (assert (recommendation
        (name "Optima")
        (preview "previews/optima.png")
    ))
)

(defrule book-recommend-joanna
     (project book)
     (is-doubtful no)
     (usability-champion no)
     (garamond not-loves)
     (typeface-preference serif)
     (eric-gill-opinion good)
 =>
     (assert (recommendation
         (name "Joanna")
         (preview "previews/joanna.png")
     ))
 )

(defrule book-recommend-baskerville
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-opinion dislike)
=>
    (assert (recommendation
        (name "Baskerville")
        (preview "previews/baskerville.png")
    ))
)

(defrule book-recommend-ff-scala
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-opinion like)
    (cheese-preference gouda)
=>
    (assert (recommendation
        (name "FF Scala")
        (preview "previews/ff_scala.png")
    ))
)

(defrule book-recommend-syntax
    (project book)
    (is-doubtful no)
    (usability-champion no)
    (garamond not-loves)
    (typeface-preference serif)
    (eric-gill-opinion bad)
    (humanistic-opinion like)
    (cheese-preference emmental)
=>
    (assert (recommendation
        (name "Syntax")
        (preview "previews/syntax.png")
    ))
)
