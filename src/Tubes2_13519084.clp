; ======================================
; 			       FACTS 
; ======================================

(deffacts init
	(result 0 "Tidak Terprediksi ")
	(result 1 "Terprediksi ")
)


; ======================================
; 			     ROOT NODE 
; ======================================

(defrule mean-concave-points
=>
	(printout t "mean-concave-points? ")
	(assert (mean-concave-points (read)))
)


; ======================================
; 			  CONCLUSION RULE 
; ======================================
; if (prediction X) and (result X Y) in 
; facts 
; then print the prediction
; ======================================
(defrule conlusion
	(prediction ?value)
	(result ?value ?outcome)
=> 
	(printout t "Hasil Prediksi = "?outcome"Kanker Payudara" crlf)
)


; @@@ PSEUDOCODE RULE @@@@@@@@@@@@@@@@@@
; ======================================
; 			 BRANCH NODE RULE 
; ======================================
; if (<name past node> X) in facts
; and X <= (constraint)
;
; then [Activate child node]
; read input from user 
; and assert fact 
; (<name current node> <input>)

; ======================================
; 			  LEAF NODE RULE
; ======================================
; if (<name past node> X) in facts
; and X <= (constraint)
;
; then [Activate conclusion rule]
; assert fact (prediction X [0/1])


; @@@ DECISION TREE @@@@@@@@@@@@@@@@@@@@
; ======================================
; 			Depth Level 1 Tree			
; ======================================

(defrule worst-radius
	(mean-concave-points ?value)
	(test (<= ?value 0.05))
=> 
	(printout t "worst-radius? ")
	(assert (worst-radius (read)))
)


; ======================================
; 			Depth Level 2 Tree			
; ======================================

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


; ======================================
; 			Depth Level 3 Tree			
; ======================================

(defrule predict-mean-texture
	(mean-texture ?value)
	(test (<= ?value 16.19))
=> 
	(assert (prediction 1))
)

; ******* End of Leaf Node Rule ********
; **************************************

(defrule concave-points-error
	(mean-texture ?value)
	(test (> ?value 16.19))
=> 
	(printout t "concave-points-error? ")
	(assert (concave-points-error (read)))
)


; ======================================
; 			Depth Level 4 Tree			
; ======================================

(defrule yes-concave-points-error
	(concave-points-error ?value)
	(test (> ?value 0.01))
=> 
	(assert (prediction 1))
)

(defrule no-concave-points-error
	(concave-points-error ?value)
	(test (<= ?value 0.01))
=> 
	(assert (prediction 0))
)
; ******* End of Leaf Node Rule ********
; **************************************

