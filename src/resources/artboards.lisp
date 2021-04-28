(in-package :adapter.xd)

(defun resouces-data-artboards (&optional (plist (resouces-data)))
  (getf plist :|artboards|))

(defclass artboard ()
  ((id              :reader id              :initarg :id)
   (name            :reader name            :initarg :name)
   (x               :reader x               :initarg :x)
   (y               :reader y               :initarg :y)
   (width           :reader width           :initarg :width)
   (height          :reader height          :initarg :height)
   (viewport-height :reader viewport-height :initarg :viewport-height)))

(defun make-artboard (id plist)
  (make-instance 'artboard
                 :id id
                 :name (getf plist :|name|)
                 :x (getf plist :|x|)
                 :y (getf plist :|y|)
                 :width (getf plist :|width|)
                 :height (getf plist :|height|)
                 :viewport-height (getf plist :|viewportHeight|)))

(defun plist2artboards (plist)
  (when plist
    (let ((id (car plist))
          (data (cadr plist)))
      (cons (make-artboard id data)
            (plist2artboards (cddr plist))))))

;; (dolist (a (plist2artboards (resouces-data-artboards (resouces-data))))
;;   (format t "| ~a | ~4a | ~4a| ~a~%"
;;           (id a)
;;           (width  a)
;;           (height a)
;;           (name   a)))
