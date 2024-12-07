(defrule find-ground-animals
    (animal ?a)
    (habitat ?a ground)
=>
    (printout t "Ground animal: " ?a crlf)
)

(defrule find-water-animals
    (animal ?a)
    (habitat ?a water)
=>
    (printout t "Water animal: " ?a crlf)
)
