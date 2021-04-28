(in-package :adapter.xd)

;;;  zip/
;;;   |
;;;   +-- artwork
;;;   |     |
;;;   |     +--- artboard-${id}/
;;;   |            |
;;;   |            `--- graphics/
;;;   |                    |
;;;   |                    `--- graphicContent.agc (json)

(defun artwork-artboard-data (artboard-id)
  (let ((file (format nil
                      "/artwork/artboard-~a/graphics/graphicContent.agc"
                      artboard-id)))
    (json2plist (filepath file))))


(defvar artwork-artboard-model
  '(:|artboards| "plist" ;; (:|href| "/resources/graphics/graphicContent.agc")
    :|resources| "plist" ;; (:|href| "/resources/graphics/graphicContent.agc")
    :|children| ((:|id| "string"
                  :|type| "string" ;; "artboard"
                  ;; ここで入れこになってるんじゃろうね。
                  :|artboard| (:|ref| ;; おやのIDがさんしょう
                               :|meta|
                               :|children|)
                  :|style| "plist"
                  :|meta|  "plist"))
    :|version| "string"))

;;; // <場所>
;;; // 操作ボタン > 機能
;;; // https://xd.adobe.com/view/
;;; // a1e9bcb4-68ec-42f1-6161-d89571e663ea-d7d8
;;; // /screen/
;;; // c9ffab28-3292-41aa-82fc-d8c4b2abeea7
;;; // /
;;; 
;;; // https://xd.adobe.com/view/???/screen/${artboard-id}/
;;; // https://xd.adobe.com/view/a1e9bcb4-68ec-42f1-6161-d89571e663ea-d7d8/screen/33d0e899-7255-4554-b08e-46818ff65507/
;;; // https://xd.adobe.com/view/a1e9bcb4-68ec-42f1-6161-d89571e663ea-d7d8/screen/675d63d7-d686-4475-a086-febefd96568f/
;;; // https://xd.adobe.com/view/a1e9bcb4-68ec-42f1-6161-d89571e663ea-d7d8/screen/ab385fd2-3a40-4d70-8fe2-eef4a2e506cf/
;;; // https://xd.adobe.com/view/a1e9bcb4-68ec-42f1-6161-d89571e663ea-d7d8/screen/56fd8ade-3a45-45d3-b406-8b65120dd55d/
