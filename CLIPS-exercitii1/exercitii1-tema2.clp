(defrule start
  =>
  (assert (region (read)))
  (assert (region (read)))
  (assert (region (read)))
  (assert (region (read)))
  (assert (color (read)))
  (assert (color (read)))
  (assert (color (read)))
  (assert (color (read)))
)

(deffunction myprint ($?rest)
   (foreach ?r $?rest
      (printout t ?r crlf)))
	  
;(defrule citeste_vecinii
;?a<-(citeste DA)
;=>
;	(printout t "dati vecinii: ")
;	(assert (vecini (read) (read)))
;	(printout t "mai continuati? (1/0)")
;	(assert (citeste (read)))
;	(retract ?a)
;)

(deffunction citestevecinii (?a)
        (if (= ?a 0) then
            0
         else
			(printout t "dati vecinii: ")
			(assert (vecini (read) (read)))
			(printout t "mai continuati? (1/0)")
			(assert (a (read)))
            (citestevecinii (?(read) ))))
