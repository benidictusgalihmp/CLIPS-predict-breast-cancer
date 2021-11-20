 ; ======================================
 ; defrule Start
 ; Begins program for Prediction by asserting
 ; phase start.
 ; ======================================

(defrule start
=>
(assert (phase start)))

 ; ======================================
 ; defrule mean-concave-points
 ; input mean concave point from user
 ; ======================================

(defrule mean-concave-points
	(phase start)
=>
	(printout t "mean_concave_points? ")
	(assert (user-select (read))))



 ; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 ; 			Left Sub-node Tree			
 ; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

 ; ======================================
 ; defrule worst-radius
 ; input worst radius from user
 ; ======================================

(defrule worst-radius
	()
	(<= user-select 0.05)
=>
	(printout t "worst_radius? ")
	(printout t "?user-select ?value")
	(assert (fw-radius (read))))
