(define atom?
  (lambda (a)
    (and (not (pair? a)) (not (null? a)))))

(define rember*
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((atom? (car lat))
       (cond
         ((eq? (car lat) a)
          (rember* a (cdr lat)))
         (else
          (cons (car lat)
                (rember* a (cdr lat))))))
       (else
        (cons (rember* a (car lat))
              (rember* a (cdr lat)))))))

(define subst*
  (lambda (new old l)
   (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
      ((eq? (car l) old)
       (cons new (subst* new old (cdr l))))
      (else
       (cons (car l) (subst* new old (cdr l))))))
     (else
      (cons (subst* new old (car l))
            (subst* new old (cdr l)))))))