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
