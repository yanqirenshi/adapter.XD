(in-package :adapter.xd)

(defun resouces-data ()
  (let ((plist (json2plist (filepath "/resources/graphics/graphicContent.agc"))))
    (list :|version|   (resouces-data-version plist)
          :|children|  (resouces-data-children plist)
          :|resources| (resouces-data-resources plist)
          :|artboards| (resouces-data-artboards plist))))
