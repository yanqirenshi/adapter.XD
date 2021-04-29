(in-package :adapter.xd)


(defclass svg-element ()
  ((id        :reader id        :initarg :id)
   (name      :reader name      :initarg :name)
   (style     :reader style     :initarg :style)
   (transform :reader transform :initarg :transform)
   (meta      :reader meta      :initarg :meta)
   (contents  :reader contents  :initarg :contents)))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   transform
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-transform ()
  ((ty :reader transform-ty :initarg :ty)
   (tx :reader transform-tx :initarg :tx)
   (d  :reader transform-d  :initarg :d)
   (c  :reader transform-c  :initarg :c)
   (b  :reader transform-b  :initarg :b)
   (a  :reader transform-a  :initarg :a)))

(defun make-svg-transform (d)
  (make-instance 'svg-transform
                 :ty (getf d :ty)
                 :tx (getf d :tx)
                 :d (getf d :d)
                 :c (getf d :c)
                 :b (getf d :b)
                 :a (getf d :a)))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   rect
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-rect ()
  ((h  :reader rect-h  :initarg :h)
   (w  :reader rect-w  :initarg :w)
   (x  :reader rect-x  :initarg :x)
   (y  :reader rect-y  :initarg :y)))

(defun make-svg-rect (d)
  (make-instance 'svg-rect
                 :h (getf d :|height|)
                 :w (getf d :|width|)
                 :x (getf d :|x|)
                 :y (getf d :|y|)))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   path
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-path (svg-element)
  ((path :reader path :initarg :path)))

(defun make-svg-path (d)
  (make-instance 'svg-path
                 :path  (getf d :|path|)))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   circle
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-circle (svg-element)
  ((r  :reader r  :initarg :r)
   (cx :reader cx :initarg :cx)
   (cy :reader cy :initarg :cy)))

(defun make-svg-circle (d)
  (make-instance 'svg-circle
                 :r  (getf d :|r|)
                 :cx (getf d :|cx|)
                 :cy (getf d :|cy|)))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   line
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-line (svg-element)
  ((x  :reader x  :initarg :x)
   (y  :reader y  :initarg :y)
   (x2 :reader x2 :initarg :x2)
   (y2 :reader y2 :initarg :y2)))

(defun make-svg-line (d)
  (make-instance 'svg-line
                 :x  (getf d :|x|)
                 :y  (getf d :|y|)
                 :x2 (getf d :|x2|)
                 :y2 (getf d :|y2|)))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   sync-ref
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-sync-ref (svg-element)
  ((gu-id             :reader gu-id             :initarg :gu-id)
   (sync-source-gu-id :reader sync-source-gu-id :initarg :sync-source-gu-id)))


(defun make-svg-sync-ref (d)
  (make-instance 'svg-sync-ref
                 :id         (getf d :|id|)
                 :gu-id      (getf d :|guid|)
                 :sync-source-gu-id (getf d :|syncSourceGuid|)))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   group
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-group (svg-element)
  ((group     :reader group     :initarg :group)))

(defun make-svg-group (d)
  (make-svg-elements d))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   shape
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-shape (svg-element)
  ((shape :reader shape :initarg :shape)))

(defun make-svg-shape (d)
  (make-svg-element d))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   text
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass svg-text (svg-element)
  ((raw-text   :reader raw-text   :initarg :raw-text)
   (paragraphs :reader paragraphs :initarg :paragraphs)
   (frame      :reader frame      :initarg :frame)))

(defun make-svg-text (d)
  (make-instance 'svg-text
                 :id         (getf d :|id|)
                 :raw-text   (getf d :|rawText|)
                 :paragraphs (getf d :|paragraphs|)
                 :frame      (getf d :|frame|)))

(defun type-data (d)
  (let ((type (getf d :|type|)))
    (cond ((string= "group"   type) (list :f #'make-svg-group    :indicator :|group|))
          ((string= "shape"   type) (list :f #'make-svg-shape    :indicator :|shape|))
          ((string= "rect"    type) (list :f #'make-svg-rect     :indicator :|rect|))
          ((string= "text"    type) (list :f #'make-svg-text     :indicator :|text|))
          ((string= "syncRef" type) (list :f #'make-svg-sync-ref :indicator nil))
          ((string= "line"    type) (list :f #'make-svg-line     :indicator nil))
          ((string= "path"    type) (list :f #'make-svg-path     :indicator nil))
          ((string= "circle"  type) (list :f #'make-svg-circle   :indicator nil))
          (t (progn (print d)
                    (error "Not Support type ~S" type))))))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   make-svg-elements
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun make-svg-element (d)
  (let ((data (type-data d)))
    (make-instance 'svg-element
                   :id        (getf d :|id|)
                   :name      (getf d :|name|)
                   :style     (getf d :|style|)
                   :transform (make-svg-transform (getf d :|transform|))
                   :meta      (getf d :|meta|))
    :contents  (funcall (getf data :f) (getf d (getf data :indicator)))))

(defun %make-svg-elements (list)
  (alexandria:when-let ((data (car list)))
    (cons (make-svg-element data)
          (%make-svg-elements (cdr list)))))


(defun make-svg-elements (plist)
  (%make-svg-elements (getf plist :|children|)))
