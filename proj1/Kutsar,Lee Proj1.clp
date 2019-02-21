(deffacts startup
    (start)
)
(defrule p1
    ?p <- (start)
    =>
    (printout t "Is the seller motivated? Enter yes or no: ");
    (assert (motivated (read)))
    (retract ?p)
)
(defrule p2
    (motivated yes)
    =>
    (printout t "Do you have past experience in this submarket? Yes or No: ")
    (assert (expe (read)))
)
(defrule p3
    (motivated no)
    =>
    (printout t "Do you have past experience in this submarket? Yes or No: ")
    (assert (expe (read)))
)

(defrule p4
    (motivated yes)
    (expe yes)
    =>
    (printout t "Do you represent any potential buyers? Yes or No: ")
    (assert (potb(read)))
)
(defrule p5
    (motivated yes)
    (expe no)
    =>
    (printout t "Do you represent any potential buyers? Yes or No: ")
    (assert (potb(read)))    
)
(defrule p8
    (motivated no)
    (expe yes)
    =>
    (printout t "Do you represent any potential buyers? Yes or No: ")
    (assert (potb(read)))
)
(defrule p7
    (motivated no)
    (expe no)
    =>
    (printout t "Do you represent any potential buyers? Yes or No: ")
    (assert (potb(read)))
)
(defrule p6
    ;;(motivated yes)
    ;;(expe yes)
    (potb no)
    =>
    (printout t "Do not take the deal or recommend it to someone else who does have buyers")
    (printout t "  ")
)

;;Template for how many buyers you have
(deftemplate Buyers 
0 10 buyers
(  
    (No (3 1) (5 0))
    (Maybe (3 0) (5 1) (7 0))
    (Yes (5 0) (7 1))    
)
)
;;Template for how likely to sell
(deftemplate Sell 
0 10 sell
( 
    (No (1 1) (5 0))
    (Maybe (1 0) (5 1) (9 0))
    (Yes (5 0) (9 1))    
)
)
;;
(deftemplate Act 
0 10 deal
    (
        (BN (1 1) (3 0))
        (LN (1 0) (3 1) (5 0))
        (M  (3 0) (5 1) (7 0))
        (LY (5 0) (7 1) (9 0))
        (BY (7 0) (9 1))
    )

)

(defrule Get_Observations
    (potb yes)
?i <- (initial-fact)
=>
(printout t "How many buyers? Enter value between 1 and 10: ")
(bind ?response (read))
(assert (crispBuyers ?response))
(printout t "How likely to sell? Enter value between 1 and 10: ")
(bind ?response (read))
(assert (crispSell ?response))
(retract ?i)
)

(defrule fuzzify
    (crispBuyers ?b)
    (crispSell ?s)
    =>
    (assert (Buyers (?b 0) (?b 1) (?b 0)))
    (assert (Sell   (?s 0) (?s 1) (?s 0)))
)

(defrule defuzzify
    (declare (salience -1))
    ?d <- (Act ?)
    =>
    (bind ?t (moment-defuzzify ?d))
    (printout t "action--> " ?t crlf)
)
;;FAM
(defrule YY
    (Buyers Yes)
    (Sell Yes)
    =>
    (assert (Act BY))
)
(defrule YM
    (Buyers Yes)
    (Sell Maybe)
    =>
    (assert (Act LY))
)
(defrule YN
    (Buyers Yes)
    (Sell No)
    =>
    (assert (Act M))
)
(defrule MY
    (Buyers Maybe)
    (Sell Yes)
    =>
    (assert (Act LY))
)
(defrule MM
    (Buyers Maybe)
    (Sell Maybe)
    =>
    (assert (Act M))
)
(defrule MN
    (Buyers Maybe)
    (Sell No)
    =>
    (assert (Act LN))
)
(defrule NP
    (Buyers No)
    (Sell Yes)
    =>
    (assert (Act M))
)
(defrule NM
    (Buyers No)
    (Sell Maybe)
    =>
    (assert (Act LN))
)
(defrule NN
    (Buyers No)
    (Sell No)
    =>
    (assert (Act BN))
)