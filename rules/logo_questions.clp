(defrule logo-ask-typeface-preference
    (project logo)
    (not (typeface-preference ?))
=>
    (assert (question
        (text "A sans serif, maybe? Or perhaps a serif?")
        (choices
            "SANS SERIF" "SERIF"
        )
        (facts
            "(typeface-preference sans-serif)" "(typeface-preference serif)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-geometrics-opinion
    (project logo)
    (typeface-preference sans-serif)
    (not (geometrics-opinion ?))
=>
    (assert (question
        (text "Do you like geometrics?")
        (choices
            "YES" "NO"
        )
        (facts
            "(geometrics-opinion like)" "(geometrics-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-futura-opinion
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion like)
    (not (futura-opinion ?))
=>
    (assert (question
        (text "Do you like Futura?")
        (choices
            "YES" "NO"
        )
        (facts
            "(futura-opinion like)" "(futura-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-futura-opinion
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion like)
    (not (futura-opinion ?))
=>
    (assert (question
        (text "Do you like Futura?")
        (choices
            "YES" "NO"
        )
        (facts
            "(futura-opinion like)" "(futura-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-neo-grotesk
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (not (neo-grotesk ?))
=>
    (assert (question
        (text "A neo-grotesk perhaps?")
        (choices
            "YES" "NO"
        )
        (facts
            "(neo-grotesk yes)" "(neo-grotesk no)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-scifi-favorite-thoughts
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk yes)
    (not (scifi-favorite-thoughts ?))
=>
    (assert (question
        (text "If I say \"science fiction movies are my favorite\":")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(scifi-favorite-thoughts good)" "(scifi-favorite-thoughts bad)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-humanistic-opinion
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (not (humanistic-opinion ?))
=>
    (assert (question
        (text "Something humanistic, then?")
        (choices
            "YES" "NO"
        )
        (facts
            "(humanistic-opinion like)" "(humanistic-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-classic
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion dislike)
    (not (classic ?))
=>
    (assert (question
        (text "How about something classic?")
        (choices
            "YES" "NO"
        )
        (facts
            "(classic yes)" "(classic no)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-decorative
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion dislike)
    (classic no)
    (not (decorative ?))
=>
    (assert (question
        (text "Then we only have something decorative")
        (choices
            "OK"
        )
        (facts
            "(decorative ok)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-adobe-opinion
    (project logo)
    (typeface-preference sans-serif)
    (geometrics-opinion dislike)
    (neo-grotesk no)
    (humanistic-opinion like)
    (not (adobe-opinion ?))
=>
    (assert (question
        (text "Do you like the look of Adobe??")
        (choices
            "YES" "NO"
        )
        (facts
            "(adobe-opinion like)" "(adobe-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-understands-semi-sans-semi-serif
    (project logo)
    (typeface-preference serif)
    (not (understands-semi-sans-semi-serif ?))
=>
    (assert (question
        (text "How do the words semi-sans, semi-serif sound?")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(understands-semi-sans-semi-serif yes)" "(understands-semi-sans-semi-serif no)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-understands-semi-sans-semi-serif
    (project logo)
    (typeface-preference serif)
    (not (understands-semi-sans-semi-serif ?))
=>
    (assert (question
        (text "How do the words semi-sans, semi-serif sound?")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(understands-semi-sans-semi-serif yes)" "(understands-semi-sans-semi-serif no)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-semi-sans-semi-serif-opinion
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (not (semi-sans-semi-serif-opinion ?))
=>
    (assert (question
        (text "Something new, got serifs, got sans?")
        (choices
            "GOOD" "BAD"
        )
        (facts
            "(semi-sans-semi-serif-opinion like)" "(semi-sans-semi-serif-opinion dislike)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-is-italian-restaurant
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (semi-sans-semi-serif-opinion dislike)
    (not (is-italian-restaurant ?))
=>
    (assert (question
        (text "Is it an Italian restaurant?")
        (choices
            "YES" "NO"
        )
        (facts
            "(is-italian-restaurant yes)" "(is-italian-restaurant no)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-has-office-correspondence
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (semi-sans-semi-serif-opinion dislike)
    (is-italian-restaurant no)
    (not (has-office-correspondence ?))
=>
    (assert (question
        (text "Got a bunch of office correspondence?")
        (choices
            "YES" "NO"
        )
        (facts
            "(has-office-correspondence yes)" "(has-office-correspondence no)"
        )
        (multiple 0)
    ))
)

(defrule logo-ask-classic-waiting
    (project logo)
    (typeface-preference serif)
    (understands-semi-sans-semi-serif no)
    (semi-sans-semi-serif-opinion dislike)
    (is-italian-restaurant no)
    (has-office-correspondence no)
    (not (classic-waiting ?))
=>
    (assert (question
        (text "Here we have a classic waiting for you...")
        (choices
            "OK"
        )
        (facts
            "(classic-waiting ok)"
        )
        (multiple 0)
    ))
)
