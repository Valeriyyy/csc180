(defrule p1
    ?p <- (start)
    =>
    (printout t "is it cold outside?")
    (assert (cold (read)))
    (retract ?p)
)
(defrule p2
    (cold no)
    => 
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p3
    (cold no)
    (sports yes)
    =>
    (printout t "Is it raining?")
    (assert (rain (read)))
)
(defrule p4
    (cold no)
    (sports yes)
    (rain no)
    =>
    (printout t "Is it sunny?")
    (assert (sunny (read)))
)
(defrule p5
    (cold no)
    (sports yes)
    (rain no)
    (sunny yes)
    =>
    (printout t "Wear short sleeves, shorts, athletic shoes and a hat")
)
(defrule p6
    (cold yes)
    =>
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p7
    (cold yes)
    (sports no)
    =>
    (printout t "Is it raining?")
    (assert (rain (read)))
)
(defrule p8
    (cold yes)
    (sports no)
    (rain yes)
    =>
    (printout t "Is it sunny?")
    (assert (sunny (read)))
)
(defrule p9
    (cold yes)
    (sports no)
    (rain yes)
    (sunny no)
    =>
    (printout t "Wear long sleeves, pants and normal shoes")
    (assert (rain (read)))
)
(defrule p10
    (cold no)
    =>
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p11
    (cold no)
    (sports no)
    =>
    (printout t "Is it raining?")
    (assert (rain (read)))
)
(defrule p12
    (cold no)
    (sports no)
    (rain yes)
    =>
    (printout t "Is it sunny?")
    (assert (sunny (read)))
)
(defrule p13
    (cold no)
    (sports no)
    (rain yes)
    (sunny no)
    =>
    (printout t "Wear short sleeves, pants and normal shoes")
)
(defrule p14
    (cold yes)
    =>
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p15
    (cold yes)
    (sports yes)
    =>
    (printout t "Is it raining?")
    (assert (rain (read)))
)
(defrule p16
    (cold yes)
    (sports yes)
    (rain no)
    =>
    (printout t "Is it sunny?")
    (assert (sunny (read)))
)
(defrule p17
    (cold yes)
    (sports yes)
    (rain no)
    (sunny yes)
    =>
    (printout t "Wear long sleeves, shorts, athletic shoes and a hat")
)
(deffacts startup
    (start)
)


