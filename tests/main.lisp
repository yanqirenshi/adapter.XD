(defpackage adapter.xd/tests/main
  (:use :cl
        :adapter.xd
        :rove))
(in-package :adapter.xd/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :adapter.xd)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
