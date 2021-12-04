(defsystem "adapter.xd"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (:jonathan :local-time :api.neo4j)
  :components ((:module "src"
                :components
                ((:file "packages")
                 (:file "utils")
                 (:file "zip")
                 (:file "svg")
                 (:module "dao"
                  :components ((:file "classes")
                               (:file "operators")
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

                               (:file "sharing")))
                 (:file "pool")
                 (:module "xd"
                  :components ((:file "xd")))
                 (:module "checker"
                  :components ((:file "classes")
                               (:file "operators")))
                 (:module "sync"
                  :components ((:file "main")))
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
