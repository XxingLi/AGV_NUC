
(cl:in-package :asdf)

(defsystem "serial_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Serial_rw" :depends-on ("_package_Serial_rw"))
    (:file "_package_Serial_rw" :depends-on ("_package"))
  ))