(defrule newspaper-recommend-times
    (project newspaper)
    (form text-face)
    (boring yes)
=>
    (assert (recommendation
        (name "Times")
        (preview "previews/times.png")
    ))
)

(defrule newspaper-recommend-miller
    (project newspaper)
    (form text-face)
    (boring no)
    (heavily-used yes)
=>
    (assert (recommendation
        (name "Miller")
        (preview "previews/miller.png")
    ))
)

(defrule newspaper-recommend-proforma
    (project newspaper)
    (form text-face)
    (boring no)
    (heavily-used no)
    (award-thoughts good)
=>
    (assert (recommendation
        (name "Proforma")
        (preview "previews/proforma.png")
    ))
)

(defrule newspaper-recommend-arnhem
    (project newspaper)
    (form text-face)
    (boring no)
    (heavily-used no)
    (award-thoughts bad)
=>
    (assert (recommendation
        (name "Arnhem")
        (preview "previews/arnhem.png")
    ))
)

(defrule newspaper-recommend-to-get-out
    (project newspaper)
    (form combination)
    (spiekermann-thoughts wrong)
    (netherlands bad)
=>
    (assert (recommendation
        (name "to get out")
        (preview "previews/get_out_of_my_flowchart.png")
    ))
)

(defrule newspaper-recommend-swift
    (project newspaper)
    (form combination)
    (spiekermann-thoughts wrong)
    (netherlands nice)
    (spiky-serifs ok)
=>
    (assert (recommendation
        (name "Swift")
        (preview "previews/swift.png")
    ))
)

(defrule newspaper-recommend-arnhem2
    (project newspaper)
    (form combination)
    (spiekermann-thoughts right)
=>
    (assert (recommendation
        (name "Arnhem")
        (preview "previews/arnhem.png")
    ))
)

(defrule newspaper-recommend-ff-meta
    (project newspaper)
    (form display)
    (traditional no)
    (modern no)
    (not-afraid-of-nineties no)
=>
    (assert (recommendation
        (name "FF Meta")
        (preview "previews/ff_meta.png")
    ))
)

(defrule newspaper-recommend-helvetica
    (project newspaper)
    (form display)
    (traditional no)
    (modern no)
    (not-afraid-of-nineties yes)
=>
    (assert (recommendation
        (name "Helvetica")
        (preview "previews/helvetica.png")
    ))
)

(defrule newspaper-recommend-gotham
    (project newspaper)
    (form display)
    (traditional no)
    (modern yes)
=>
    (assert (recommendation
        (name "Gotham")
        (preview "previews/gotham.png")
    ))
)

(defrule newspaper-recommend-helvetica2
    (project newspaper)
    (form display)
    (traditional yes)
    (swiss yes)
=>
    (assert (recommendation
        (name "Helvetica")
        (preview "previews/helvetica.png")
    ))
)

(defrule newspaper-recommend-franklin-gothic
    (project newspaper)
    (form display)
    (traditional yes)
    (swiss no)
    (age old)
=>
    (assert (recommendation
        (name "Franklin Gothic")
        (preview "previews/franklin_gothic.png")
    ))
)

(defrule newspaper-recommend-interstate
    (project newspaper)
    (form display)
    (traditional yes)
    (swiss no)
    (age new)
=>
    (assert (recommendation
        (name "Interstate")
        (preview "previews/interstate.png")
    ))
)
