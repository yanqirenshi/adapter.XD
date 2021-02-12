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
                 (:module "resources"
                  :components ((:file "plist")
                               (:file "artboards")
                               (:file "resources")
                               (:file "children")
                               (:file "version")))
                 (:file "interactions")
                 (:file "artwork")
                 (:file "sharing"))))
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
