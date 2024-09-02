
(defrule list-culori
    (not (culori $?))
    =>
    (printout t "Introduceti culorile: ")
    (bind ?input (readline))
    (assert (culori (explode$ ?input)))
)

(defrule list-tari
    (not (tari $?))
    =>
    (printout t "Introduceti tarile: ")
    (bind ?input (readline))
    (assert (tari (explode$ ?input)))
)

(defrule tari-adiacente
   =>
   (printout t "Introduceti perechile de tari adiacente: ")
   (bind ?input (readline))
   (while (not (eq ?input "stop"))
      (assert (adiacente (explode$ ?input)))
      (printout t "Introduceti perechile de tari adiacente: ")
      (bind ?input (readline)))
)

(defrule tari-colorate
    (culori $?culori)
    (tari $?tari)
    (adiacente $?adiacente)
    =>
	(bind ?index 1)
	(bind ?lentari (length$ ?tari))
	(bind ?lenculori (length$ ?culori))
	(while (<= ?index ?lentari)
		(bind ?tara (nth$ ?index ?tari))
		(bind ?culoare (nth$ ?index ?culori))
		(assert (colored ?tara ?culoare))
		(bind ?index (+ ?index 1)))
    (retract (tari ?tara))
    (retract (adiacente ?adiacente))
    (retract (culori ?culoare))
)