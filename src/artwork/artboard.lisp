(in-package :adapter.xd)

(defun artwork-artboards-data ()
  (mapcar #'(lambda (pathname)
              (json2plist (format nil "~a~a" pathname "/graphics/graphicContent.agc")))
          (directory (filepath "/artwork/artboard-*"))))

(defun artwork-artboard-data (artboard-id)
  (let ((file (format nil
                      "/artwork/artboard-~a/graphics/graphicContent.agc"
                      artboard-id)))
    (json2plist (filepath file))))
