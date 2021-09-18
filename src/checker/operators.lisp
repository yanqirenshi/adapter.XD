(in-package :adapter.xd)

(defparameter *keys-ast*
  '(:|version| :|children| :|resources| :|artboards|))

(defparameter *keys-branch*
  '(:|type| :|id| :|meta| :|style| :|artboard|))

(defparameter *keys-artboard*
  '(:|children| :|meta| :|ref|))

(defparameter *keys-artboard-item*
  '(:|type| :|id| :|meta| :|style| :|name| :|transform| :|shape|
    :|text| :|visible| :|visualBounds|
    :|guid| :|syncSourceGuid|
    :|group|))

(defparameter *keys-ui-branch*
  (nconc (copy-list *keys-artboard-item*)
         '(:|group|)))

(defparameter *keys-ui-reaf*
  (copy-list *keys-artboard-item*))

(defun get-id (plist)
  (let ((id (getf plist :|id|)))
    (when id
      (alexandria:make-keyword id))))

(defun add-index (obj &key label)
  (declare (ignore label))
  (let ((id (id obj)))
    (when id
      ;; (when (gethash id *index*)
      ;;   (format t "~a: ~S~%" label id))
      (setf (gethash id *index*) obj))))


(defun agc-artboards (plist)
  (let ((artboards (getf plist :|artboards|)))
    (if (and (= 2 (length artboards))
             (eq :|href| (car artboards)))
        artboards
        (mapcar #'(lambda (id)
                    (let ((obj (make-artboard id (getf artboards id))))
                      (add-index obj :label "agc-artboards")
                      obj))
                (plist-keys artboards)))))

(defun agc-resources (plist)
  (let ((resources (getf plist :|resources|)))
    (if (and (= 2 (length resources))
             (eq :|href| (car resources)))
        resources
        (mapcar #'plist2network
                (getf (getf (getf resources :|meta|) :|ux|) :|symbols|)))))

(defun plist2agc (plist)
  (check-plist-keys "branch" plist *keys-ast*)
  (let ((children (getf plist :|children|))
        (interactions (getf plist :|interactions|))
        (obj (make-instance 'agc
                            :version    (getf plist :|version|)
                            :artboards  (agc-artboards plist)
                            :resourcecs (agc-resources plist)
                            :core       plist)))
    (setf (slot-value obj 'children)
          (plists2network children :parent obj))
    (setf (slot-value obj 'interactions)
          (mapcar #'(lambda (list)
                      ;; (format t "~S~%" list)
                      list)
                  interactions))
    obj))

(defun plist2branch (plist parent)
  (check-plist-keys "branch" plist *keys-branch*)
  (let* ((artboard (getf plist :|artboard|))
         (obj (make-instance 'branch
                             :id      (get-id plist)
                             :ui-type (getf plist :|type|)
                             :meta    (getf plist :|meta|)
                             :style   (getf plist :|style|)
                             :core    plist)))
    (setf (slot-value obj 'parent) parent)
    (setf (slot-value obj 'artboard)
          (plist2network artboard :parent obj))
    (add-index obj :label "branch")
    obj))

(defun plist2artboard-root (plist parent)
  (check-plist-keys "branch" plist *keys-artboard*)
  (let ((children (getf plist :|children|))
        (obj (make-instance 'artboard-root
                            :ref  (getf plist :|ref|)
                            :meta (getf plist :|meta|)
                            :core plist)))
    (setf (slot-value obj 'parent) parent)
    (setf (slot-value obj 'children)
          (plists2network children :parent obj))
    obj))

(defun plist2ui-branch (plist parent)
  (check-plist-keys "branch" plist *keys-ui-branch*)
  (let ((children (getf (getf plist :|group|) :|children|))
        (obj (make-instance 'ui-branch
                            :id        (get-id plist)
                            :name      (getf plist :|name|)
                            :meta      (getf plist :|meta|)
                            :style     (getf plist :|style|)
                            :transform (getf plist :|transform|)
                            :shape     (getf plist :|shape|)
                            :visible   (getf plist :|visible|)
                            :ui-type   (getf plist :|type|)
                            :core plist)))
    (setf (slot-value obj 'parent) parent)
    (setf (slot-value obj 'children)
          (plists2network children))
    (add-index obj :label "ui-branch")
    obj))

(defun plist2ui-reaf (plist parent)
  (check-plist-keys "reaf" plist *keys-ui-reaf*)
  (let ((obj (make-instance 'ui-reaf
                            :id        (get-id plist)
                            :name      (getf plist :|name|)
                            :meta      (getf plist :|meta|)
                            :style     (getf plist :|style|)
                            :transform (getf plist :|transform|)
                            :shape     (getf plist :|shape|)
                            :visible   (getf plist :|visible|)
                            :ui-type   (getf plist :|type|)
                            :core      plist)))
    (setf (slot-value obj 'parent) parent)
    (add-index  obj :label "ui-reaf")
    obj))

(defun plist2network (plist &key parent)
  (let ((version  (getf plist :|version|))
        (artboard (getf plist :|artboard|))
        (children (getf plist :|children|))
        (group    (getf plist :|group|)))
    (cond (version  (plist2agc           plist))
          (artboard (plist2branch        plist parent))
          (children (plist2artboard-root plist parent))
          (group    (plist2ui-branch     plist parent))
          (t        (plist2ui-reaf       plist parent)))))


(defvar *index* (make-hash-table))

(defun plists2network (plists &key parent)
  (mapcar #'(lambda (plist)
              (plist2network plist :parent parent))
          plists))
