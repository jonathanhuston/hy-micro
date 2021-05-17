(defmacro def [symbol expr]
    `(setv ~symbol ~expr))

(defmacro case [expr #* conditions]
    (if (is (type (last conditions)) hy.models.Expression)
        (setv conditions (+ (list (butlast conditions)) [[expr (last conditions)]])))
    (setv branches (lfor condition conditions `[(= ~expr ~(get condition 0)) ~(get condition 1)]))
    (+ `(cond) (tuple branches)))
    