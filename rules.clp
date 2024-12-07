

; Project: Book

(defrule recommend-baskerville
    (dislikes humanistic)
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
