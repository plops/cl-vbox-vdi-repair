(defparameter *vdi-head*
 (let ((a (make-array 72 :element-type '(unsigned-byte 8))))
   ;; i created a new vdi image in virtual box and copy the first 72 bytes
   (with-open-file (s "ccs2/ccs2.vdi" :element-type '(unsigned-byte 8))
     (read-sequence a s))
   a))

(with-open-file (s "ccs/vdi-head" :direction :output
		   :if-exists :supersede
		   :if-does-not-exist :create
		   :element-type '(unsigned-byte 8))
  (write-sequence *vdi-head* s))

;; => #(60 60 60 32 79 114 97 99 108 101 32 86 77 32 86 105 114 116 117 97 108 66
;;      111 120 32 68 105 115 107 32 73 109 97 103 101 32 62 62 62 10 0 0 0 0 0 0
;;      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 16 218 190 1 0 1 0)


(with-open-file (s "ccs/ccs_repaired.vdi" :direction :output
		   :if-exists :overwrite
		   :element-type '(unsigned-byte 8))
  (write-sequence *vdi-head* s))
