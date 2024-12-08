(defrule logo-recommend-futura
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion like)
    (futura-opinion like)
=>
    (assert (recommendation
        (name "Futura")
        (preview "previews/futura.png")
    ))
)

(defrule logo-recommend-metro
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion like)
    (futura-opinion dislike)
=>
    (assert (recommendation
        (name "Metro")
        (preview "previews/metro.png")
    ))
)

(defrule logo-recommend-eurostile
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk yes)
    (scifi-favorite-thoughts good)
=>
    (assert (recommendation
        (name "Eutostile")
        (preview "previews/eurostile.png")
    ))
)

(defrule logo-recommend-helvetica
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk yes)
    (scifi-favorite-thoughts bad)
=>
    (assert (recommendation
        (name "Helvetica")
        (preview "previews/helvetica.png")
    ))
)

(defrule logo-recommend-myriad
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion like)
    (adobe-opinion like)
=>
    (assert (recommendation
        (name "Myriad")
        (preview "previews/myriad.png")
    ))
)

(defrule logo-recommend-frutiger
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion like)
    (adobe-opinion dislike)
=>
    (assert (recommendation
        (name "Frutiger")
        (preview "previews/frutiger.png")
    ))
)

(defrule logo-recommend-akzidenz-grotesk
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion dislike)
    (classic yes)
=>
    (assert (recommendation
        (name "Akzidenz Grotesk")
        (preview "previews/akzidenz_grotesk.png")
    ))
)

(defrule logo-recommend-peignot
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion dislike)
    (classic no)
    (decorative ok)
=>
    (assert (recommendation
        (name "Peignot")
        (preview "previews/peignot.png")
    ))
)

(defrule logo-recommend-fedra
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (semi-sans-semi-serif-opinion like)
=>
    (assert (recommendation
        (name "Fedra")
        (preview "previews/fedra.png")
    ))
)

(defrule logo-recommend-fedra
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif yes)
=>
    (assert (recommendation
        (name "Fedra")
        (preview "previews/fedra.png")
    ))
)

(defrule logo-recommend-bodoni
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (is-italian-restaurant yes)
=>
    (assert (recommendation
        (name "Bodoni")
        (preview "previews/bodoni.png")
    ))
)

(defrule logo-recommend-lexicon
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (is-italian-restaurant no)
    (has-office-correspondence yes)
=>
    (assert (recommendation
        (name "Lexicon")
        (preview "previews/lexicon.png")
    ))
)

(defrule logo-recommend-palatino
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (semi-sans-semi-serif-opinion dislike)
    (is-italian-restaurant no)
    (has-office-correspondence no)
    (classic-waiting ok)
=>
    (assert (recommendation
        (name "Palatino")
        (preview "previews/palatino.png")
    ))
)
