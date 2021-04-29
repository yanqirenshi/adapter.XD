(in-package :adapter.xd)

(defclass pool ()
  ((contents :accessor contents :initform nil)
   (index    :reader index    :initform (make-hash-table))))

(defgeneric add (pool data)
  (:method ((pool pool) (list list))
    (dolist (data list)
      (let ((id (id data))
            (index (index pool))
            (contents (contents pool)))
        (when (gethash id index)
          (format t "Exist id=~S" id))
        (setf (gethash id index) data)
        (setf (contents pool)
              (push data contents))))
    pool))