(in-package :adapter.xd)

(defun interactions-data ()
  (json2plist (filepath "/interactions/interactions.json")))

(defun resouces-data-interactions (interactions-data)
  (getf resouces-data :|interactions|))

(defvar *MODEL-INTERACTIONS*
  '((:|interactions| "plist"
     :|version| "string")))

(defclass interaction ()
  ((id            :reader id            :initarg :id)
   (artboard-id   :reader artboard-id   :initarg :artboard-id)
   (action        :reader action        :initarg :action)
   (trigger-event :reader trigger-event :initarg :trigger-event)
   (properties    :reader properties    :initarg :properties)))

;; <action>
;; artboard-transition
;; auto-animate
;; overlay-transition
;; previous-artboard
;; scroll-transition
;; state-transition
;;
;; <trigger event>
;; drag
;; hover
;; keys-gamepad
;; tap
;; time

(defclass interaction-properties ()
  ((voice-locale     :reader voice-locale     :initarg :voice-locale)
   (overlay-position :reader overlay-position :initarg :overlay-position)
   (destination      :reader destination      :initarg :destination)
   (easing           :reader easing           :initarg :easing)
   (duration         :reader duration         :initarg :duration)
   (transition       :reader transition       :initarg :transition)))

(defun make-interaction-properties (plist)
  (make-instance 'interaction-properties
                 :voice-locale     (getf plist :|voiceLocale|)
                 :overlay-position (getf plist :|overlayPosition|)
                 :destination      (getf plist :|destination|)
                 :easing           (getf plist :|easing|)
                 :duration         (getf plist :|duration|)
                 :transition       (getf plist :|transition|)))

(defun make-interaction (artboard-id plist)
  (make-instance 'interaction
                 :artboard-id artboard-id
                 :id (getf plist :|id|)
                 :action (getf plist :|action|)
                 :trigger-event (getf plist :|triggerEvent|)
                 :properties (make-interaction-properties (getf plist :|properties|))))

(defun plist2interactions (plist)
  (when plist
    (let ((artboard-id (car plist))
          (data (cadr plist)))
      (nconc (mapcar #'(lambda (d) (make-interaction artboard-id d))
                     data)
             (plist2interactions (cddr plist))))))
