
(cl:in-package :asdf)

(defsystem "logical_core-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "SetGoal" :depends-on ("_package_SetGoal"))
    (:file "_package_SetGoal" :depends-on ("_package"))
  ))