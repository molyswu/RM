// Generated by gencpp from file detect_car/flight_msg.msg
// DO NOT EDIT!


#ifndef DETECT_CAR_MESSAGE_FLIGHT_MSG_H
#define DETECT_CAR_MESSAGE_FLIGHT_MSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Vector3.h>

namespace detect_car
{
template <class ContainerAllocator>
struct flight_msg_
{
  typedef flight_msg_<ContainerAllocator> Type;

  flight_msg_()
    : type(0)
    , data()  {
    }
  flight_msg_(const ContainerAllocator& _alloc)
    : type(0)
    , data(_alloc)  {
  (void)_alloc;
    }



   typedef int16_t _type_type;
  _type_type type;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _data_type;
  _data_type data;




  typedef boost::shared_ptr< ::detect_car::flight_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::detect_car::flight_msg_<ContainerAllocator> const> ConstPtr;

}; // struct flight_msg_

typedef ::detect_car::flight_msg_<std::allocator<void> > flight_msg;

typedef boost::shared_ptr< ::detect_car::flight_msg > flight_msgPtr;
typedef boost::shared_ptr< ::detect_car::flight_msg const> flight_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::detect_car::flight_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::detect_car::flight_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace detect_car

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'detect_car': ['/home/leroypc/RM/shit_ws/src/detect_car/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::detect_car::flight_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::detect_car::flight_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::detect_car::flight_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::detect_car::flight_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::detect_car::flight_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::detect_car::flight_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::detect_car::flight_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "479f5e7156bf9518d1a9151816bb4bd6";
  }

  static const char* value(const ::detect_car::flight_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x479f5e7156bf9518ULL;
  static const uint64_t static_value2 = 0xd1a9151816bb4bd6ULL;
};

template<class ContainerAllocator>
struct DataType< ::detect_car::flight_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "detect_car/flight_msg";
  }

  static const char* value(const ::detect_car::flight_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::detect_car::flight_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 type\n\
geometry_msgs/Vector3 data\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::detect_car::flight_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::detect_car::flight_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.type);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct flight_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::detect_car::flight_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::detect_car::flight_msg_<ContainerAllocator>& v)
  {
    s << indent << "type: ";
    Printer<int16_t>::stream(s, indent + "  ", v.type);
    s << indent << "data: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DETECT_CAR_MESSAGE_FLIGHT_MSG_H
