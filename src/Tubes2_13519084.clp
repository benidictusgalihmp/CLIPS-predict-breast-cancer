 ; ======================================
 ; defrule Start
 ; Begins program for Prediction by asserting
 ; phase start.
 ; ======================================

(defrule mean-concave-points
=>
	(printout t "mean-concanve-points? ")
	(assert (mean-concanve-points (read)))
)



; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; 			Depth Level 1 Tree			
; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; ======================================
; defrule worst-radius
; input worst radius from user
; ======================================
(defrule worst-radius
	(mean-concanve-points ?value)
	(test (<= ?value 0.05))
=> 
	(printout t "worst-radius? ")
	(assert (worst-radius (read)))
)

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; 			Depth Level 2 Tree			
; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
(defrule radius-error
	(worst-radius ?value)
	(test (<= ?value 16.83))
=> 
	(printout t "radius-error? ")
	(assert (radius-error (read)))
)

(defrule mean-texture
	(worst-radius ?value)
	(test (> ?value 16.83))
=> 
	(printout t "mean-texture? ")
	(assert (mean-texture (read)))
)

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
; 			Depth Level 3 Tree			
; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
(defrule concanve-points-error
	(mean-texture ?value)
	(test (> ?value 16.19))
=> 
	(printout t "concanve-points-error? ")
	(assert (concanve-points-error (read)))
)