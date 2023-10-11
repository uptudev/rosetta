(defun fibonacci (a b)
    (if (< 18446744073709551615 (+ a b))
        (progn 
            (format t "Overflowed!~%")
            (quit)
        nil)
    (let ((c (the (unsigned-byte 64) (+ a b))))
        (progn 
            (format t "~a~%" c)
            (fibonacci b c)))))

(let ((a (the (unsigned-byte 64) 0)) 
      (b (the (unsigned-byte 64) 1)))
        (progn 
            (format t "~a~%" a)
            (format t "~a~%" b)
            (fibonacci a b)))

