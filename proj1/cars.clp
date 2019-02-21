(defrule p1
  ?p <- (start)
 =>
  (printout t "does engine turn over?")
  (assert (turns (read)))
  (retract ?p))

(defrule p2
  (turns no)
 =>
  (printout t "do the lights go on?")
  (assert (lights (read))))

(defrule rule2
  (turns no)
  (lights no)
 =>
  (printout t "problem is battery or cables"))

(defrule rule3
  (turns no)
  (lights yes)
 =>
  (printout t "problem is the starter motor"))

(defrule p5
  (turns yes)
 =>
  (printout t "does the gas tank have gas in it?")
  (assert (tgas (read))))

(defrule p6
  (turns yes)
  (tgas yes)
 =>
  (printout t "does the carburetor have gas in it?")
  (assert (cgas (read))))

(defrule rule4
  (tgas yes)
  (cgas yes)
 =>
  (assert (egas yes)))

(defrule rule1
  (turns yes)
  (egas yes)
 =>
  (printout t "problem is spark plugs"))

(deffacts startup
  (start))
