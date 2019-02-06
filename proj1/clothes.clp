(defrule p1
    ?p <- (start)
    =>
    (printout t "is it cold outside?")
    (assert (cold (read)))
    (retract ?p)
)
(defrule p2
    (cold yes)
    =>
    (printout t "Rain?")
    (assert (rain (read)))
)
(defrule p3
    (cold no)
    =>
    (printout t "Sunny?")
    (assert (sunny (read)))
)
(defrule p4 
    (rain yes)
    =>
    (printout t "playin sports?")
    (assert (sports (read)))
)
(defrule p5
    (rain no)
    =>
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p8
    (rain yes)
    (sports yes)
    =>
    (printout t "wear long sleeves, pants, and athletic shoes")
)
(defrule p9
    (rain yes)
    (sports no)
    =>
    (printout t "wear long sleeves, pants, and normal shoes")
)
(defrule p10
    (rain no)
    (sports yes)
    =>
    (printout t "wear long sleeves, shorts, and athletic shoes")
)
(defrule p11
    (rain no)
    (sports no)
    =>
    (printout t "wear long sleeves, shorts, and normal shoes")
)
(defrule p12
    (sunny yes)
    =>
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p13
    (sunny yes)
    (sports yes)
    =>
    (printout t "Wear short sleeves, shorts, athletic shoes, and a hat")
)
(defrule p14
    (sunny yes)
    (sports no)
    =>
    (printout t "Wear short sleeves, pants, normal shoes, and a hat")
)
(defrule p15
    (sunny no)
    =>
    (printout t "Playing sports?")
    (assert (sports (read)))
)
(defrule p16
    (sunny no)
    (sports yes)
    =>
    (printout t "Wear short sleeves, shorts, and athletic shoes")
)
(defrule p17
    (sunny no)
    (sports no)
    =>
    (printout t "Wear short sleeves, pants and normal shoes")
)
(deffacts startup
    (start)
)
