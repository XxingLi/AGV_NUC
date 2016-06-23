; Auto-generated. Do not edit!


(cl:in-package serial_pkg-srv)


;//! \htmlinclude Serial-request.msg.html

(cl:defclass <Serial-request> (roslisp-msg-protocol:ros-message)
  ((flag_write
    :reader flag_write
    :initarg :flag_write
    :type cl:fixnum
    :initform 0)
   (flag_read
    :reader flag_read
    :initarg :flag_read
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Serial-request (<Serial-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Serial-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Serial-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_pkg-srv:<Serial-request> is deprecated: use serial_pkg-srv:Serial-request instead.")))

(cl:ensure-generic-function 'flag_write-val :lambda-list '(m))
(cl:defmethod flag_write-val ((m <Serial-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-srv:flag_write-val is deprecated.  Use serial_pkg-srv:flag_write instead.")
  (flag_write m))

(cl:ensure-generic-function 'flag_read-val :lambda-list '(m))
(cl:defmethod flag_read-val ((m <Serial-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-srv:flag_read-val is deprecated.  Use serial_pkg-srv:flag_read instead.")
  (flag_read m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Serial-request>) ostream)
  "Serializes a message object of type '<Serial-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flag_write)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flag_read)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Serial-request>) istream)
  "Deserializes a message object of type '<Serial-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flag_write)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'flag_read)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Serial-request>)))
  "Returns string type for a service object of type '<Serial-request>"
  "serial_pkg/SerialRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial-request)))
  "Returns string type for a service object of type 'Serial-request"
  "serial_pkg/SerialRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Serial-request>)))
  "Returns md5sum for a message object of type '<Serial-request>"
  "77e4bd5ab3181f65a110283ab4ab9176")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Serial-request)))
  "Returns md5sum for a message object of type 'Serial-request"
  "77e4bd5ab3181f65a110283ab4ab9176")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Serial-request>)))
  "Returns full string definition for message of type '<Serial-request>"
  (cl:format cl:nil "uint8 flag_write~%uint8 flag_read~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Serial-request)))
  "Returns full string definition for message of type 'Serial-request"
  (cl:format cl:nil "uint8 flag_write~%uint8 flag_read~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Serial-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Serial-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Serial-request
    (cl:cons ':flag_write (flag_write msg))
    (cl:cons ':flag_read (flag_read msg))
))
;//! \htmlinclude Serial-response.msg.html

(cl:defclass <Serial-response> (roslisp-msg-protocol:ros-message)
  ((write_data
    :reader write_data
    :initarg :write_data
    :type cl:fixnum
    :initform 0)
   (read_data
    :reader read_data
    :initarg :read_data
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Serial-response (<Serial-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Serial-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Serial-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_pkg-srv:<Serial-response> is deprecated: use serial_pkg-srv:Serial-response instead.")))

(cl:ensure-generic-function 'write_data-val :lambda-list '(m))
(cl:defmethod write_data-val ((m <Serial-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-srv:write_data-val is deprecated.  Use serial_pkg-srv:write_data instead.")
  (write_data m))

(cl:ensure-generic-function 'read_data-val :lambda-list '(m))
(cl:defmethod read_data-val ((m <Serial-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_pkg-srv:read_data-val is deprecated.  Use serial_pkg-srv:read_data instead.")
  (read_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Serial-response>) ostream)
  "Serializes a message object of type '<Serial-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'write_data)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Serial-response>) istream)
  "Deserializes a message object of type '<Serial-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'write_data)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_data)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Serial-response>)))
  "Returns string type for a service object of type '<Serial-response>"
  "serial_pkg/SerialResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial-response)))
  "Returns string type for a service object of type 'Serial-response"
  "serial_pkg/SerialResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Serial-response>)))
  "Returns md5sum for a message object of type '<Serial-response>"
  "77e4bd5ab3181f65a110283ab4ab9176")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Serial-response)))
  "Returns md5sum for a message object of type 'Serial-response"
  "77e4bd5ab3181f65a110283ab4ab9176")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Serial-response>)))
  "Returns full string definition for message of type '<Serial-response>"
  (cl:format cl:nil "uint8 write_data~%uint8 read_data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Serial-response)))
  "Returns full string definition for message of type 'Serial-response"
  (cl:format cl:nil "uint8 write_data~%uint8 read_data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Serial-response>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Serial-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Serial-response
    (cl:cons ':write_data (write_data msg))
    (cl:cons ':read_data (read_data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Serial)))
  'Serial-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Serial)))
  'Serial-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial)))
  "Returns string type for a service object of type '<Serial>"
  "serial_pkg/Serial")