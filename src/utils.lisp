(in-package :adapter.xd)

(defun file2str (f)
  (let ((p f))
    (with-open-file (s p)
      (do ((l (read-line s) (read-line s nil 'eof))
           (out ""))
          ((eq l 'eof) out)
        (setf out
              (concatenate 'string out l))))))

(defun json2plist (f)
  (jojo:parse (file2str f)))


(defun plist-keys (plist)
  (when plist
    (cons (car plist)
          (plist-keys (cddr plist)))))
