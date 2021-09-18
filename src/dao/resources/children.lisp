(in-package :adapter.xd)

(defun resouces-data-children (&optional (plist (resouces-data)))
  (getf plist :|children|))
