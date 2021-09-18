(in-package :adapter.xd)

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;;  CRUD
;;;;;   Create Read Update Delete
;;;;;
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;
;;;;; get
;;;;;
(defgeneric get-dao-stmt (dao)
  (:documentation ""))

(defgeneric get-dao (dao)
  (:documentation ""))



;;;;;
;;;;; create
;;;;;
(defgeneric create-dao-stmt (dao)
  (:documentation ""))

(defgeneric create-dao (dao)
  (:documentation ""))
