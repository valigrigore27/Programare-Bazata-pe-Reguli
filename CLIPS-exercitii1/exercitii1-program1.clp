; (deffacts fapte
; (OL sunny) (HM normal)
; )

(defrule reading
=>
(printout t "How is the Outlook?" crlf)
(assert (OL (read)))
(printout t "How is the Humidity?" crlf)
(assert (HM (read)))
(printout t "How is the Wind?" crlf)
(assert (WD (read)))
)

(defrule good_condition
(or (and (OL sunny) (HM normal))
(and (OL overcast))
(and (OL rain) (WD weak))
)
=>
(printout t "Good conditions" crlf)
)

(defrule bad_condition
(or (and (OL sunny) (HM high))
(and (OL rain) (WD strong))
)
=>
(printout t "Bad conditions" crlf)
)