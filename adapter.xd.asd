(defsystem "adapter.xd"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:jonathan)
  :components ((:module "src"
                :components
                ((:file "packages")
                 (:file "utils")
                 (:file "zip")
                 (:file "svg")
                 (:module "resources"
                  :components ((:file "artboards")
                               (:file "resources")
                               (:file "children")
                               (:file "version")
                               (:file "main")))
                 (:file "interactions")
                 (:module "artwork"
                  :components ((:file "artboard")
                               (:file "pasteboard")))
                 (:file "sharing")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "adapter.xd/tests"))))

(defsystem "adapter.xd/tests"
  :author ""
  :license ""
  :depends-on ("adapter.xd"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for adapter.xd"
  :perform (test-op (op c) (symbol-call :rove :run c)))
