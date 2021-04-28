(in-package :adapter.xd)

(defun resouces-data-version (&optional (plist (resouces-data)))
  (getf plist :|version|))
