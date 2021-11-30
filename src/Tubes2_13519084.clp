 ; ======================================
 ; defrule Start
 ; Begins program for Prediction by asserting
 ; phase start.
 ; ======================================

(defrule mean-concave-points
=>
	(printout t "mean-concanve-points? ")
	(assert (mean-concanve-points (read))))



 ; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ; 			Left Sub-node Tree			
 ; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

 ; ======================================
 ; defrule worst-radius
 ; input worst radius from user
 ; ======================================
(defrule worst-radius
	(mean-concanve-points ?value)
	(test (<= ?value 0.05))
=> 
	(printout t ?value)
)