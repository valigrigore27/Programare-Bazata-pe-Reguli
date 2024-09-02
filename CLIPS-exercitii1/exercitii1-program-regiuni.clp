(defrule start
  =>
  (assert (region A))
  (assert (region B))
  (assert (region C))
  (assert (region D))
  (assert (color A red))
  (assert (color B green))
  (assert (color C blue))
  (assert (color D green))
)

(defrule color-constraint
  ?r1 <- (region ?region1)
  ?r2 <- (region ?region2&:(neq ?region1 ?region2))
  ?c1 <- (color ?region1 ?color1)
  ?c2 <- (color ?region2 ?color2&:(neq ?color1 ?color2))
  =>
  (modify ?c2 (color ?region2 (get-available-color ?region2 ?r1)))
)

(deffunction get-available-color (?region ?exclude)
  (loop for ?c in (list red green blue)
        when (not (find ?c (get-adjacent-colors ?region ?exclude)))
        return ?c))

(deffunction get-adjacent-colors (?region ?exclude)
  (loop for ?r in (get-adjacent-regions ?region)
        when (not (eq ?r ?exclude))
        collect (get-color ?r)))

(deffunction get-adjacent-regions (?region)
  (loop for ?r in (list A B C D)
        when (is-adjacent ?region ?r)
        collect ?r))

(deffunction get-color (?region)
  (cadr (first (run-query* (bind ?region) (color ?region ?color)))))

(defrule print-solution
  (forall (region ?region) (color ?region ?color))
  =>
  (printout t "Region " ?region " is colored " ?color crlf)
)

(deffacts initial-facts
  (start)
)

(defrule stop
  ?f <- (final)
  =>
  (retract ?f)
)

(defrule check-stop
  (not (color ?region ?color))
  =>
  (assert (final))
)
