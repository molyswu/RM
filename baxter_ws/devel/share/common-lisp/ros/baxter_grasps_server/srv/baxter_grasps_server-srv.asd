
(cl:in-package :asdf)

(defsystem "baxter_grasps_server-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :moveit_msgs-msg
)
  :components ((:file "_package")
    (:file "GraspService" :depends-on ("_package_GraspService"))
    (:file "_package_GraspService" :depends-on ("_package"))
  ))