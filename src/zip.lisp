(in-package :adapter.xd)

(defvar *zip-root* nil)

(defun filepath (path)
  (when *zip-root*
    (format nil "~a~a" *zip-root* path)))

;; https://common-lisp.net/project/zip/
