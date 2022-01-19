(deffacts test (x x) (y y) (z z)) 

(defrule R1
	(x x)
	(y y) 
=>
(assert (a a)))
(defrule R2
	(y y)
	(z z) 
=>
(assert (b b)))
(defrule R3
	(a a)
	(b b) 
=>
(assert (c c)))