 ; ======================================
 ; defrule Start
 ; Begins program for Prediction by asserting
 ; concave-points.
 ; ======================================

(defrule start
=>
	(assert (phase concave-point)))

 ; ======================================
 ; defrule concave-point
 ; input mean concave point from user
 ; ======================================

(defrule concave-point
	(phase concave-point)
=>
(printout t "mean_concave_points? ")
	(assert (user-select (read))))
