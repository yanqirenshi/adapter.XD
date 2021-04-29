(in-package :adapter.xd)

(defclass svg ()
  ((svg-type  :reader svg-type  :initarg :svg-type)
   (id        :reader id        :initarg :id)
   (name      :reader name      :initarg :name)
   (style     :reader style     :initarg :style)
   (transform :reader transform :initarg :transform)
   (meta      :reader meta      :initarg :meta)
   (contents  :reader contents  :initarg :contents)))


(defun plist2svg (plist)
  (make-instance 'svg
                 :svg-type (getf plist :|type|)
                 :id (alexandria:make-keyword (getf plist :|id|))
                 :name (getf plist :|name|)
                 :style (getf plist :|style|)
                 :transform (getf plist :|transform|)
                 :meta (getf plist :|meta|)
                 :contents (plists2svg (getf (getf plist :|group|) :|children|))))


(defun plists2svg (plists)
  (alexandria:when-let ((plist (car plists)))
    (cons (plist2svg plist)
          (plists2svg (cdr plists)))))
