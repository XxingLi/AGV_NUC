; Auto-generated. Do not edit!


(cl:in-package serial_pkg-msg)


;//! \htmlinclude Serial_rw.msg.html

(cl:defclass <Serial_rw> (roslisp-msg-protocol:ros-message)
  ((data_r
    :reader data_r
    :initarg :data_r
    :type cl:fixnum
    :initform 0)
   (data_w
    :reader data_w
    :initarg :data_w
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Serial_rw (<Serial_rw>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Serial_rw>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Serial_rw)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_pkg-msg:<Serial_rw> is deprecated: use serial_pkg-msg:Serial_rw instead.")))

(cl:ensure-generic-function 'data_r-val :lambda-list '(m))
(cl:defmethod data_r-val ((m <Serial_rw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-msg:data_r-val is deprecated.  Use serial_pkg-msg:data_r instead.")
  (data_r m))

(cl:ensure-generic-function 'data_w-val :lambda-list '(m))
(cl:defmethod data_w-val ((m <Serial_rw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-msg:data_w-val is deprecated.  Use serial_pkg-msg:data_w instead.")
  (data_w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Serial_rw>) ostream)
  "Serializes a message object of type '<Serial_rw>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_w)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Serial_rw>) istream)
  "Deserializes a message object of type '<Serial_rw>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data_w)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Serial_rw>)))
  "Returns string type for a message object of type '<Serial_rw>"
  "serial_pkg/Serial_rw")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial_rw)))
  "Returns string type for a message object of type 'Serial_rw"
  "serial_pkg/Serial_rw")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Serial_rw>)))
  "Returns md5sum for a message object of type '<Serial_rw>"
  "69cd4e57328de94dbd223b996ce60dc1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Serial_rw)))
  "Returns md5sum for a message object of type 'Serial_rw"
  "69cd4e57328de94dbd223b996ce60dc1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Serial_rw>)))
  "Returns full string definition for message of type '<Serial_rw>"
  (cl:format cl:nil "uint8 data_r~%uint8 data_w~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Serial_rw)))
  "Returns full string definition for message of type 'Serial_rw"
  (cl:format cl:nil "uint8 data_r~%uint8 data_w~%~%~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Serial_rw>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Serial_rw>))
  "Converts a ROS message object to a list"
  (cl:list 'Serial_rw
    (cl:cons ':data_r (data_r msg))
    (cl:cons ':data_w (data_w msg))
))
