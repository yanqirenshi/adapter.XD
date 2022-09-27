(in-package :adapter.xd)


;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;
;;;;;  Flow
;;;;;  ====
;;;;;   File.xd -- xd2xd --> Class:xd --+--> sync
;;;;;                                   |
;;;;;                                   +--> checker --+--> results (hash table)
;;;;;                                                  |
;;;;;                                                  +--> message (console)
;;;;;
;;;;;
;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun xd2xd (&optional (base-path *zip-root*))
  (let* ((*zip-root* base-path)
         (xd (make-instance 'xd
                            :base-path base-path
                            :resources (resouces-data)
                            :artboards (artwork-artboards-data)
                            :pasteboard (artwork-pasteboard-data)
                            :interactions (interactions-data)
                            :sharing nil)))
    (resouces-data-artboards (resources xd))
    ;; (add (pool xd)
    ;;     (plist2artboards (resouces-data-artboards (resources xd))))
    xd))


(defun checker ()
  (setf *index*   (make-hash-table))
  (plist2network  (resources *xd*))
  (plists2network (artboards *xd*))
  (plist2network  (pasteboard *xd*))
  (plist2network  (interactions *xd*))
  *index*)

(defun sync () nil)


;;;;;
;;;;; examples
;;;;;
(defun artboads2json (xd)
  (jojo:to-json
   (mapcar #'(lambda (d)
               (list :|id| (id d)
                     :|name| (name d)
                     :|x| (x d)
                     :|y| (y d)
                     :|width|  (width d)
                     :|height| (height d)
                     :|viewportHeight| (VIEWPORT-HEIGHT d)))
           (plist2artboards (resouces-data-artboards (resources xd))))))

(defun components2csv (xd)
  (let ((data (resouces-data-resources (resources xd))))
    (jojo:to-json
     (mapcar #'(lambda (d)
                 (list :|backup| :false
                       :|id|     (getf d :|id|)
                       :|name|   (getf d :|name|)
                       :|type|   (getf d :|type|)))
             (getf (getf (getf data :|meta|) :|ux|) :|symbols|)))))


;;;;;
;;;;; main ?
;;;;;
(defun xd2jsons (xd dir)
  (with-open-file (s (merge-pathnames dir "xd_artboads.json")
                     :direction :output
                     :if-does-not-exist :create
                     :if-exists :overwrite)
    (format s (xd:artboads2json xd)))
  (with-open-file (s (merge-pathnames dir "xd_components.json")
                     :direction :output
                     :if-does-not-exist :create
                     :if-exists :overwrite)
    (format s (xd:components2csv xd)))
  nil)
