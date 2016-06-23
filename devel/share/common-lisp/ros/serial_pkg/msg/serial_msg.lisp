; Auto-generated. Do not edit!


(cl:in-package serial_pkg-msg)


;//! \htmlinclude serial_msg.msg.html

(cl:defclass <serial_msg> (roslisp-msg-protocol:ros-message)
  ((data_r
    :reader data_r
    :initarg :data_r
    :type cl:fixnum
    :initform 0))
)

(cl:defclass serial_msg (<serial_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_pkg-msg:<serial_msg> is deprecated: use serial_pkg-msg:serial_msg instead.")))

(cl:ensure-generic-function 'data_r-val :lambda-list '(m))
(cl:defmethod data_r-val ((m <serial_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-msg:data_r-val is deprecated.  Use serial_pkg-msg:data_r instead.")
  (data_r m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_msg>) ostream)
  "Serializes a message object of type '<serial_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_r)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_msg>) istream)
  "Deserializes a message object of type '<serial_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_r)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_msg>)))
  "Returns string type for a message object of type '<serial_msg>"
  "serial_pkg/serial_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_msg)))
  "Returns string type for a message object of type 'serial_msg"
  "serial_pkg/serial_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_msg>)))
  "Returns md5sum for a message object of type '<serial_msg>"
  "dad139ab50b66463e12c485d08e6c2b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_msg)))
  "Returns md5sum for a message object of type 'serial_msg"
  "dad139ab50b66463e12c485d08e6c2b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_msg>)))
  "Returns full string definition for message of type '<serial_msg>"
  (cl:format cl:nil "uint8 data_r~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_msg)))
  "Returns full string definition for message of type 'serial_msg"
  (cl:format cl:nil "uint8 data_r~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_msg>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_msg
    (cl:cons ':data_r (data_r msg))
))
