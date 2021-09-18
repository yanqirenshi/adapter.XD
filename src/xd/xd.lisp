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
