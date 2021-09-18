(in-package :adapter.xd)

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   Fundamental Classes
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass node ()
  ((core :reader core :initarg :core :initform nil)))

(defclass node-children (node)
  ((parent :reader parent :initarg :parent :initform nil)))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   File *.agc
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass agc (node)
  ((children     :reader children     :initarg :children     :initform nil)
   (resources    :reader resourcecs   :initarg :resourcecs   :initform nil)
   (artboards    :reader artboards    :initarg :artboards    :initform nil)
   (version      :reader version      :initarg :version      :initform nil)
   (interactions :reader interactions :initarg :interactions :initform nil))
  (:documentation "(:|version| :|children| :|resources| :|artboards| :|interactions|)"))

(defclass branch (node-children)
  ((id       :reader id       :initarg :id       :initform nil)
   (ui-type  :reader ui-type  :initarg :ui-type  :initform nil)
   (meta     :reader meta     :initarg :meta     :initform nil)
   (style    :reader style    :initarg :style    :initform nil)
   (artboard :reader artboard :initarg :artboard :initform nil))
  (:documentation "(:|type| :|id| :|meta| :|style| :|artboard|)"))

(defclass artboard-root (node-children)
  ((ref      :reader ref      :initarg :ref      :initform nil)
   (meta     :reader meta     :initarg :meta     :initform nil)
   (children :reader children :initarg :children :initform nil))
  (:documentation "(:|children| :|meta| :|ref|)"))

(defclass artboard-item (node-children)
  ((id        :reader id        :initarg :id        :initform nil)
   (name      :reader name      :initarg :name      :initform nil)
   (meta      :reader meta      :initarg :meta      :initform nil)
   (style     :reader style     :initarg :style     :initform nil)
   (transform :reader transform :initarg :transform :initform nil)
   (shape     :reader shape     :initarg :shape     :initform nil)
   (visible   :reader visible   :initarg :visible   :initform nil)
   (ui-type   :reader ui-type   :initarg :ui-type   :initform nil))
  (:documentation "(:|id| :|name| :|type| :|meta| :|transform| :|visible| :|style| :|shape|)"))

(defclass ui-branch (artboard-item)
  ((children :reader children :initarg :children :initform nil))
  (:documentation "(:|group| :|transform| :|id| :|meta| :|name| :|type| :|visible| :|style|)"))

(defclass ui-reaf (artboard-item)
  ()
  (:documentation "(:|type| :|id| :|meta| :|style| :|name| :|transform| :|shape|)"))
