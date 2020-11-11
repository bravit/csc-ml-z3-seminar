(declare-const a Int)
(assert (> a 10))
(check-sat)
(get-model)
