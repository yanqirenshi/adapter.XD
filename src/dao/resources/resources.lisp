(in-package :adapter.xd)

(defun resouces-data-resources (&optional (plist (resouces-data)))
  (getf plist :|resources|))

(defun resouces-data-symbols (&optional (plist (resouces-data)))
  (getf (getf (getf (getf plist :|resources|) :|meta|) :|ux|) :|symbols|))

(defun resouces-data-elements (&optional (plist (resouces-data)))
  (getf (getf (getf (getf (getf plist :|resources|) :|meta|) :|ux|) :|documentLibrary|) :|elements|))
