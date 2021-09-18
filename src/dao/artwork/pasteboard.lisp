(in-package :adapter.xd)

(defun artwork-pasteboard-data ()
  (let ((file (format nil
                      "/artwork/pasteboard/graphics/graphicContent.agc")))
    (json2plist (filepath file))))
