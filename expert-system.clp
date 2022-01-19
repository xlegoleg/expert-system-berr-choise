(defrule data-input

(initial-fact)

=>

(printout t crlf "Input beer kind (lager | ale | lambic): ")

(bind ?kind (read))

(if (or(eq ?kind lager) (eq ?kind ale) (eq ?kind lambic)) 
	then (assert (kind ?kind))
	else (assert (kind error))
)

(if (neq ?kind lambic) 
	then (printout t crlf "Input beer color (light | amber | dark): ")
		 (bind ?color (read))
		 (if (or(eq ?color light) (eq ?color amber) (eq ?color dark)) 
		   then (assert (color ?color))
		   else (assert (color error))
		 )
	else (printout t "Lambic has no color selection" crlf)
)

(printout t crlf "Sweet taste (no | yes): ")

(bind ?sweet (read))

(if (or(eq ?sweet yes) (eq ?sweet no)) 
	then (assert (sweet ?sweet))
	else (assert (sweet error))
)

(printout t crlf "Bitter taste (no | yes): ")

(bind ?bitter (read))

(if (or(eq ?bitter yes) (eq ?bitter no)) 
	then (assert (bitter ?bitter))
	else (assert (bitter error))
))

(defrule R0
	(kind ?kind)
	(color ?color)
	(sweet ?sweet)
	(bitter ?bitter)
	(test (or (eq ?kind error) (eq ?color error) (eq ?sweet error) (eq ?bitter error)))
=>
(printout t crlf crlf "Error in start params, bye bye" crlf)
(assert (beer "NO"))
(printout t crlf crlf "Let's try again" crlf)
(reset)
(run))

(defrule R1
	(kind lager)
	(color light)
=>
(printout t crlf crlf "Your choose is light lager" crlf)
(assert (style "light lager")))

(defrule R2
	(kind lager)
	(color amber)
=>
(printout t crlf crlf "Your choose is amber lager" crlf)
(assert (style "amber lager")))

(defrule R3
	(kind lager)
	(color dark)
=>
(printout t crlf crlf "Your choose is dark lager" crlf)
(assert (style "dark lager")))

(defrule R4
	(kind ale)
	(color light)
=>
(printout t crlf crlf "Your choose is light ale" crlf)
(assert (style "light ale")))

(defrule R5
	(kind ale)
	(color amber)
=>
(printout t crlf crlf "Your choose is amber ale" crlf)
(assert (style "amber ale")))

(defrule R6
	(kind ale)
	(color dark)
=>
(printout t crlf crlf "Your choose is dark ale" crlf)
(assert (style "dark ale")))

(defrule R7
	(kind lambic)
=>
(printout t crlf crlf "Your choose is lambic" crlf)
(assert (style "lambic")))

(defrule R8
	(sweet no)
	(bitter no)
=>
(printout t crlf crlf "Your choose is not sweet not bitter" crlf)
(assert (taste "classic")))

(defrule R9
	(sweet yes)
	(bitter no)
=>
(printout t crlf crlf "Your choose is sweet" crlf)
(assert (taste "sweet")))

(defrule R10
	(sweet no)
	(bitter yes)
=>
(printout t crlf crlf "Your choose is bitter" crlf)
(assert (taste "bitter")))

(defrule R11
	(sweet yes)
	(bitter yes)
=>
(printout t crlf crlf "Your choose is sweet and bitter" crlf)
(assert (style "rich")))

(defrule R12
	(style "light lager")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"\Augustiner Edelstoff\"" crlf)
(assert (beer "Augustiner Edelstoff")))

(defrule R13
	(style "light lager")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Fruh Kolsch\"" crlf)
(assert (beer "Fruh Kolsch")))

(defrule R14
	(style "light lager")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Bitburger\"" crlf)
(assert (beer "Bitburger")))

(defrule R15
	(style "light lager")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Miller\"" crlf)
(assert (beer "Miller")))

(defrule R16
	(style "amber lager")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"\Gambrinus Premium\"" crlf)
(assert (beer "Gambrinus Premium")))

(defrule R17
	(style "amber lager")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Fruh Kolsch\"" crlf)
(assert (beer "Fruh Kolsch")))

(defrule R18
	(style "amber lager")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Jaws Dvanadctka\"" crlf)
(assert (beer "Jaws Dvanadctka")))

(defrule R19
	(style "amber lager")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"387 Beer\"" crlf)
(assert (beer "387 Beer")))

(defrule R20
	(style "dark lager")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"Monchoff schwarzbier\"" crlf)
(assert (beer "Monchoff schwarzbier")))

(defrule R21
	(style "dark lager")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Klosterbrau schwarz ABT\"" crlf)
(assert (beer "Klosterbrau schwarz ABT")))

(defrule R22
	(style "dark lager")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Vasikeostrovskoye temnoe\"" crlf)
(assert (beer "Vasikeostrovskoye temnoe")))

(defrule R23
	(style "dark lager")
	(taste "rich")
=>
(printout t crlf crlf "YOUR BEER IS: \"Klaster Tmave\"" crlf)
(assert (beer "Klaster Tmave")))

(defrule R24
	(style "light ale")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"Affligem Blonde\"" crlf)
(assert (beer "Affligem Blonde")))

(defrule R25
	(style "light ale")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Leffe Blonde\"" crlf)
(assert (beer "Leffe Blonde")))

(defrule R26
	(style "light ale")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Kona Hanalei IPA\"" crlf)
(assert (beer "Kona Hanalei IPA")))

(defrule R27
	(style "light ale")
	(taste "rich")
=>
(printout t crlf crlf "YOUR BEER IS: \"Westmalle Tripple\"" crlf)
(assert (beer "Westmalle Tripple")))

(defrule R28
	(style "amber ale")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"Palm\"" crlf)
(assert (beer "Palm")))

(defrule R29
	(style "amber ale")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Pauel's KWAK\"" crlf)
(assert (beer "Pauel's KWAK")))

(defrule R30
	(style "amber ale")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Old speckled Hen\"" crlf)
(assert (beer "Old speckled Hen")))

(defrule R31
	(style "amber ale")
	(taste "rich")
=>
(printout t crlf crlf "YOUR BEER IS: \"Bush Amber\"" crlf)
(assert (beer "Bush Amber")))

(defrule R32
	(style "dark ale")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"Leffe Brune\"" crlf)
(assert (beer "Leffe Brune")))

(defrule R33
	(style "dark ale")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Grimbergen dubble\"" crlf)
(assert (beer "Grimbergen dubble")))

(defrule R34
	(style "dark ale")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Chimay Blue\"" crlf)
(assert (beer "Chimay Blue")))

(defrule R35
	(style "dark ale")
	(taste "rich")
=>
(printout t crlf crlf "YOUR BEER IS: \"Kasteel Barista\"" crlf)
(assert (beer "Kasteel Barista")))

(defrule R36
	(style "lambic")
	(taste "classic")
=>
(printout t crlf crlf "YOUR BEER IS: \"Boon gueuze\"" crlf)
(assert (beer "Boon gueuze")))

(defrule R37
	(style "lambic")
	(taste "sweet")
=>
(printout t crlf crlf "YOUR BEER IS: \"Lindemmans kreik\"" crlf)
(assert (beer "Lindemmans kreik")))

(defrule R38
	(style "lambic")
	(taste "bitter")
=>
(printout t crlf crlf "YOUR BEER IS: \"Boon Mariaje Parfait\"" crlf)
(assert (beer "Boon Mariaje Parfait")))

(defrule R39
	(style "lambic")
	(taste "rich")
=>
(printout t crlf crlf "YOUR BEER IS: \"Roddenbach Rosso\"" crlf)
(assert (beer "Roddenbach Rosso")))





