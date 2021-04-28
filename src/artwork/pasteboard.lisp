(in-package :adapter.xd)

;;;  zip/
;;;   |
;;;   +-- artwork
;;;   |     |
;;;   |     +--- pasteboard/
;;;   |             |
;;;   |             `--- graphics/
;;;   |                     |
;;;   |                     `--- graphicContent.agc (json)

(defun artwork-pasteboard-data ()
  (let ((file (format nil
                      "/artwork/pasteboard/graphics/graphicContent.agc")))
    (json2plist (filepath file))))
