(in-package :adapter.xd)

(defun file2str (f)
  (let ((p f))
    (with-open-file (s p)
      (do ((l (read-line s) (read-line s nil 'eof))
           (out ""))
          ((eq l 'eof) out)
        (setf out
              (concatenate 'string out l))))))


(defvar *filecache* (make-hash-table :test 'equal))

(defun file-timestamp (f)
  (file-write-date f))

(defun file-size (f)
  (with-open-file (s f :element-type '(unsigned-byte 8))
    (file-length s)))

(defun get-cache (f)
  (let* ((cache (gethash (format nil "~a" f) *filecache*))
         (timestamp (file-timestamp f))
         (size (file-size f)))

    (when (and (= timestamp (or (getf cache :timestamp) -1))
               (= size      (or (getf cache :size) -1)))
      (getf cache :data))))

(defun set-cache (f data)
  (let* ((key (format nil "~a" f))
         (timestamp (file-timestamp f))
         (size (file-size f)))
    (progn (setf (gethash key *filecache*)
                 (list :timestamp timestamp
                       :size      size
                       :data      data))
           data)))

(defun json2plist (f)
  (let ((cache (get-cache f)))
    (or cache
        (set-cache f (jojo:parse (file2str f))))))


(defun plist-keys (plist)
  (when plist
    (cons (car plist)
          (plist-keys (cddr plist)))))

(defun check-plist-keys (label plist master-plist)
  (let ((x (remove nil
                   (mapcar #'(lambda (key)
                               (unless (find key master-plist)
                                 key))
                           (plist-keys plist)))))
    (when x
      (format t "~a: ~a~%" label x))))

;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;; 4 statement
;;;;;
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun join (&rest list)
  (labels ((core (list)
             (alexandria:when-let ((str (car list)))
               (concatenate 'string
                            (string-trim '(#\Space #\Tab #\Newline) str)
                            " "
                            (core (cdr list))))))
    (core list)))
