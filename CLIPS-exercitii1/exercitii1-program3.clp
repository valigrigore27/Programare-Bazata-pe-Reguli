(defmodule PROPAG
 (import MAIN deftemplate ?ALL))
;################## possible values for the variables ################
(deffacts PROPAG::variables
 (var (name x1) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x2) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x3) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x4) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x5) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x6) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x7) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x8) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x9) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x10) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x11) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x12) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x13) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x14) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x15) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x16) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x17) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x18) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x19) (possible-values (create$ Cyan Magenta Yellow)));
 (var (name x20) (possible-values (create$ Cyan Magenta Yellow)));
)
19
;##################### Description of the graph ########################
(deftemplate node
 (slot name)
 (multislot neighbours)
)
(deffacts PROPAG::graph
 (node (name x1)(neighbours (create$ x3 x4 x6 x13 x17)))
 (node (name x2)(neighbours (create$ x9 x14 x15 x17)))
 (node (name x3)(neighbours (create$ x1 x10 x12 x17)))
 (node (name x4)(neighbours (create$ x1 x18)))
 (node (name x5)(neighbours (create$ x6 x18)))
 (node (name x6)(neighbours (create$ x1 x5 x7)))
 (node (name x7)(neighbours (create$ x6 x13 x14 x19)))
 (node (name x8)(neighbours (create$ x10 x20 x17)))
 (node (name x9)(neighbours (create$ x2 x16 x20)))
 (node (name x10)(neighbours (create$ x3 x8 x11 x20)))
 (node (name x11)(neighbours (create$ x10 x12)))
 (node (name x12)(neighbours (create$ x3 x11 x18)))
 (node (name x13)(neighbours (create$ x1 x7 x17)))
 (node (name x14)(neighbours (create$ x2 x7)))
 (node (name x15)(neighbours (create$ x2 x16)))
 (node (name x16)(neighbours (create$ x2 x9 x15 x20)))
 (node (name x17)(neighbours (create$ x1 x2 x3 x8 x13)))
 (node (name x18)(neighbours (create$ x4 x5 x12)))
 (node (name x19)(neighbours (create$ x7)))
 (node (name x20)(neighbours (create$ x8 x9 x10 x16)))
)
;###################### Constraints propagation ########################
(defrule PROPAG::no-same-color-for-neighbours
; if the node ?x is colored with the color ?v then remove ?v from the
possible values
; of any node ?y connected to ?x
 (declare (salience 2))
 (logical (level_search ?n))
 (not (level_search ?n1&:(> ?n1 ?n)))
 (var (name ?x) (value ?v&~nil)(level ?n))
 ?f <- (var (name ?y) (value nil) (level ?m)
 (possible-values $?liste&:(member$ ?v ?liste)))
 (not (var (name ?y) (level ?m1&:(> ?m1 ?m))))
 (node (name ?x))
 (node (name ?y)(neighbours $?neigh&:(member$ ?x $?neigh)))
=>
 (bind ?x (member$ ?v ?liste))
 (if (= ?m ?n)
 then (modify ?f (possible-values (delete$ ?liste ?x ?x)))
 else (duplicate ?f (level ?n) (possible-values (delete$ ?liste ?x
?x)))
 )
)