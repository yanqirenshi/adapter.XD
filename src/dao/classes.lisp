(in-package :adapter.xd)

(defclass dao ()
  ((id :reader id :initarg :id)
   (loaded-at  :reader loaded-at  :initarg :loaded-at)
   (created-at :reader created-at :initarg :created-at)
   (updated-at :reader updated-at :initarg :updated-at)
   (deleted-at :reader deleted-at :initarg :deleted-at)))
