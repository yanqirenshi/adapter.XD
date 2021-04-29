(in-package :adapter.xd)

(defclass xd ()
  ((base-path    :reader base-path    :initarg :base-path)
   (resources    :reader resources    :initarg :resources)
   (artboards    :reader artboards    :initarg :artboards)
   (pasteboard   :reader pasteboard   :initarg :pasteboard)
   (interactions :reader interactions :initarg :interactions)
   (sharing      :reader sharing      :initarg :sharing)
   ;;
   (pool :reader pool :initform (make-instance 'pool))))


(defun xd2xd (&optional (base-path *zip-root*))
  (let* ((*zip-root* base-path)
         (xd (make-instance 'xd
                   :base-path base-path
                   :resources (resouces-data)
                   :artboards (artwork-artboards-data)
                   :pasteboard (artwork-pasteboard-data)
                   :interactions (interactions-data)
                   :sharing nil)))
    (add (pool xd)
         (plist2artboards (resouces-data-artboards (resources xd))))
    xd))
