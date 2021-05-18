(defmacro def [symbol expr]
    `(setv ~symbol ~expr))

(defmacro case [expr #* conditions]
    (if-not (is (-> conditions last type) hy.models.List)
        (setv conditions (+ (list (butlast conditions)) [[expr (last conditions)]])))
    (+ `(cond) (tuple (lfor condition conditions `[(= ~expr ~(get condition 0)) ~(get condition 1)]))))
