// Generated by gencpp from file apriltags_ros/AprilTagDetection.msg
// DO NOT EDIT!


#ifndef APRILTAGS_ROS_MESSAGE_APRILTAGDETECTION_H
#define APRILTAGS_ROS_MESSAGE_APRILTAGDETECTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/PoseStamped.h>

namespace apriltags_ros
{
template <class ContainerAllocator>
struct AprilTagDetection_
{
  typedef AprilTagDetection_<ContainerAllocator> Type;

  AprilTagDetection_()
    : id(0)
    , size(0.0)
    , pose()  {
    }
  AprilTagDetection_(const ContainerAllocator& _alloc)
    : id(0)
    , size(0.0)
    , pose(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef double _size_type;
  _size_type size;

   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _pose_type;
  _pose_type pose;




  typedef boost::shared_ptr< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> const> ConstPtr;

}; // struct AprilTagDetection_

typedef ::apriltags_ros::AprilTagDetection_<std::allocator<void> > AprilTagDetection;

typedef boost::shared_ptr< ::apriltags_ros::AprilTagDetection > AprilTagDetectionPtr;
typedef boost::shared_ptr< ::apriltags_ros::AprilTagDetection const> AprilTagDetectionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::apriltags_ros::AprilTagDetection_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace apriltags_ros

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'apriltags_ros': ['/home/leory/shit_ws/src/apriltags_ros/apriltags_ros/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c7dd623e54eca222750cda2ae82f5257";
  }

  static const char* value(const ::apriltags_ros::AprilTagDetection_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc7dd623e54eca222ULL;
  static const uint64_t static_value2 = 0x750cda2ae82f5257ULL;
};

template<class ContainerAllocator>
struct DataType< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "apriltags_ros/AprilTagDetection";
  }

  static const char* value(const ::apriltags_ros::AprilTagDetection_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 id\n\
float64 size\n\
geometry_msgs/PoseStamped pose\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::apriltags_ros::AprilTagDetection_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.size);
      stream.next(m.pose);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AprilTagDetection_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::apriltags_ros::AprilTagDetection_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::apriltags_ros::AprilTagDetection_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "size: ";
    Printer<double>::stream(s, indent + "  ", v.size);
    s << indent << "pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.pose);
  }
};

} // namespace message_operations
} // namespace ros

#endif // APRILTAGS_ROS_MESSAGE_APRILTAGDETECTION_H
