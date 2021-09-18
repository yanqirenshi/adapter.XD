(in-package :adapter.xd)

(defun resouces-data-artboards (&optional (plist (resouces-data)))
  (getf plist :|artboards|))

(defclass artboard (dao)
  ((name            :reader name            :initarg :name)
   (x               :reader x               :initarg :x)
   (y               :reader y               :initarg :y)
   (width           :reader width           :initarg :width)
   (height          :reader height          :initarg :height)
   (viewport-height :reader viewport-height :initarg :viewport-height)))

(defun str2localtime (str)
  (when str
    (local-time:parse-timestring str)))

(defun make-artboard (id plist)
  (make-instance 'artboard
                 :id id
                 :name (getf plist :|name|)
                 :x (getf plist :|x|)
                 :y (getf plist :|y|)
                 :width (getf plist :|width|)
                 :height (getf plist :|height|)
                 :viewport-height (getf plist :|viewportHeight|)
                 :created-at (str2localtime (getf plist :|createdAt|))
                 :updated-at (str2localtime (getf plist :|updatedAt|))
                 :deleted-at nil))

(defun plist2artboards (plist)
  (when plist
    (let ((id (car plist))
          (data (cadr plist)))
      (cons (make-artboard id data)
            (plist2artboards (cddr plist))))))


;; (neo4j:http :statements (mapcar #'stmt-create-artboard (plist2artboards (getf (resources *xd*) :|artboards|)))
;;             :commit t)

(defmethod applyRow ((artboard artboard) row timestamp)
  (setf (slot-value artboard 'loaded-at)  (str2localtime timestamp))
  (setf (slot-value artboard 'updated-at) (str2localtime (getf row :|updatedAt|)))
  (setf (slot-value artboard 'created-at) (str2localtime (getf row :|createdAt|)))
  (setf (slot-value artboard 'deleted-at) nil)
  artboard)

(defun assert-exist-dao (dao)
  (unless dao
    (error "Not exist dao. id=~S" (id dao))))

(defun assert-not-exist-dao (dao)
  (when dao
    (error "Aledy exist dao. id=~S" (id dao))))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;  Read
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *get-dao-statement*
  (join "MATCH (n:ARTBOARD)"
        "WHERE n.id=$id"
        "RETURN datetime() as timestamp, n"))

(defmethod get-dao-stmt ((artboard artboard))
  (cons *get-dao-statement*
        (list :|id| (id artboard))))

(defun get-timestamp (result)
  (getf (getf (caar (getf result :|results|)) :TIMESTAMP) :|row|))

(defun get-row (result)
  (getf (getf (caar (getf result :|results|)) :n) :|row|))

(defmethod get-dao ((artboard artboard))
  (let* ((stmt   (get-dao-stmt artboard))
         (result (neo4j:http :statements (list stmt))))
    (if (getf result :|errors|)
        (error "Faild get-dao. stmt=~S" stmt)
        (let ((row (get-row result))
              (timestamp (get-timestamp result)))
          (when row
            (applyRow artboard row timestamp))))))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;  Create
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *create-dao-statement*
  (join "CREATE (n:ARTBOARD {"
        "       id: $id"
        "     , name : $name"
        "     , x: $x"
        "     , y: $y"
        "     , width: $width"
        "     , height: $height"
        "     , viewportHeight: $viewportHeight"
        "     , createdAt: datetime()"
        "     , updatedAt: datetime()"
        "})"
        "RETURN datetime() as timestamp, n"))

(defmethod create-dao-stmt ((artboard artboard))
  (let ((now (local-time:format-timestring nil (local-time:now))))
    (cons *create-dao-statement*
          (list :|id|   (id artboard)
                :|name| (name artboard)
                :|y| (x artboard)
                :|x| (y artboard)
                :|height| (height artboard)
                :|width|  (width artboard)
                :|viewportHeight| (viewport-height artboard)))))

(defmethod create-dao ((artboard artboard))
  (assert-not-exist-dao (get-dao artboard))
  (let* ((stmt (create-dao-stmt artboard))
         (result (neo4j:http :statements (list stmt) :commit t)))
    (if (getf result :|errors|)
        (error "Faild create-dao. stmt=~S" stmt)
        (let ((row (get-row result))
              (timestamp (get-timestamp result)))
          (when row
            (applyRow artboard row timestamp))))))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;  Update
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *update-dao-statement*
  (join "MATCH (n:ARTBOARD)"
        "WHERE n.id=$id"
        "  SET n.name = $name"
        "    , n.x = $x"
        "    , n.y = $y"
        "    , n.width  = $width"
        "    , n.height = $height"
        "    , n.viewportHeight = $viewportHeight"
        "    , n.updatedAt = datetime()"
        "RETURN datetime() as timestamp, n"))

(defmethod update-dao-stmt ((artboard artboard))
  (cons *update-dao-statement*
        (list :|id| (id artboard)
              :|y| (x artboard)
              :|x| (y artboard)
              :|name| (name artboard)
              :|height| (height artboard)
              :|width| (width artboard)
              :|viewportHeight| (viewport-height artboard))))

(defmethod update-dao ((artboard artboard))
  (assert-exist-dao (get-dao artboard))
  (let* ((stmt (update-dao-stmt artboard))
         (result (neo4j:http :statements (list stmt) :commit t)))
    (if (getf result :|errors|)
        (error "Faild update-dao. stmt=~S" stmt)
        (let ((row (get-row result))
              (timestamp (get-timestamp result)))
          (when row
            (applyRow artboard row timestamp))))))


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;  Delete
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *delete-dao-statement*
  (join "MATCH (n:ARTBOARD)"
        "WHERE n.id=$id"
        "DELETE n"))

(defmethod delete-dao-stmt ((artboard artboard))
  (cons *delete-dao-statement*
        (list :|id| (id artboard))))

(defmethod delete-dao ((artboard artboard))
  (let* ((stmt (delete-dao-stmt artboard))
         (result (neo4j:http :statements (list stmt) :commit t)))
    (if (getf result :|errors|)
        (error "Faild delete-dao. stmt=~S" stmt)
        (let ((timestamp (local-time:now)))
          (setf (slot-value artboard 'loaded-at)  timestamp)
          (setf (slot-value artboard 'deleted-at) timestamp)
          artboard))))
