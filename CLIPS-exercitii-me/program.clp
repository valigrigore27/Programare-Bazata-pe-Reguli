(deftemplate tara
    (slot nume)
    (slot culoare (type SYMBOL)))

(deftemplate vecin
    (slot tara1)
    (slot tara2))

(deffacts culori-posibile
    (culoare albastru)
    (culoare rosu)
    (culoare verde)
    (culoare galben))

(defrule citeste-culori
    =>
    (printout t "Introduceti lista de culori separate prin virgula: " crlf)
    (bind ?input (readline))
    (assert (culori-disponibile (culori (explode$ ?input)))))

(defrule citeste-tari
    =>
    (printout t "Introduceti lista de tari separate prin virgula: " crlf)
    (bind ?input (readline))
    (assert (tari (nume (explode$ ?input)))))

(defrule citeste-vecini
    =>
    (printout t "Introduceti perechile de tari vecine separate prin virgula (de exemplu: Romania,Bulgaria): " crlf)
    (bind ?input (readline))
    (bind ?vecini (explode$ ?input))
    (assert (vecin (tara1 (nth$ 1 ?vecini)) (tara2 (nth$ 2 ?vecini))))
    (assert (vecin (tara1 (nth$ 2 ?vecini)) (tara2 (nth$ 1 ?vecini)))))

(defrule colorare
    (declare (salience 10))
    (exists (culori-disponibile (culori $?culori)))
    (not (tara (culoare ?)))
    =>
    (bind ?tara (find-fact ((?f tara)) TRUE))
    (bind ?tara-nr (fact-index ?tara))
    (bind ?culori-disponibile (nth$ ?tara-nr $?culori))
    (assert (tara (nume (fact-slot-value ?tara nume)) (culoare ?culori-disponibile)))
    (retract (culori-disponibile (culori $?culori)))
    (printout t "Tara " (fact-slot-value ?tara nume) " a fost colorata cu " ?culori-disponibile "." crlf))

(defrule vecini-aceeasi-culoare
    (vecin (tara1 ?tara1) (tara2 ?tara2))
    (tara (nume ?tara1) (culoare ?culoare))
    (tara (nume ?tara2) (culoare ?culoare))
    =>
    (printout t "Nu exista solutie." crlf)
    (halt))

(defrule afisare-solutie
    (not (exists (culori-disponibile (culori $?))))
    =>
    (printout t "Solutia gasita:" crlf)
    (printout t "----------------" crlf)
    (do-for-all-facts ((?t tara)) TRUE
        (printout t (fact-slot-value ?t nume) " -> " (fact-slot-value ?t culoare) crlf))
    (printout t "----------------" crlf))

(defrule start
    =>
    (assert (culori-disponibile (culori albastru rosu verde galben)))
    (assert (tari (nume Romania Bulgaria Ungaria Ucraina Serbia)))
    (assert (vecin (tara1 Romania) (tara2 Bulgaria)))
    (assert (vecin (tara1 Romania) (tara2 Ungaria)))
    (assert (vecin (tara1 Romania) (tara2 Serbia)))
    (assert (vecin (tara1 Bulgaria) (tara2 Serbia)))
    (assert (vecin (tara1 Bulgaria) (tara2 Ungaria)))
    (assert (vecin (tara1 Serbia) (tara2 Ungaria)))
    (assert (vecin (tara1 Serbia) (tara2 Ucraina)))
    (assert (vecin (tara1 Ungaria) (tara2 Ucraina)))
    (assert (vecin (tara1 Ungaria) (tara2 Serbia)))
    (assert (vecin (tara1 Ungaria) (tara2 Bulgaria)))
    (assert (vecin (tara1 Ucraina) (tara2 Serbia)))
    (assert (vecin (tara1 Ucraina) (tara2 Ungaria)))
    (citeste-culori)
    (citeste-tari)
    (citeste-vecini))

(defrule stop
    (not (exists (culori-disponibile (culori $?))))
    =>
    (printout t "Nu exista solutie." crlf)
    (halt))
