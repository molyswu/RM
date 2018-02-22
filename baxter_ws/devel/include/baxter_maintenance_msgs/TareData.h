// Generated by gencpp from file baxter_maintenance_msgs/TareData.msg
// DO NOT EDIT!


#ifndef BAXTER_MAINTENANCE_MSGS_MESSAGE_TAREDATA_H
#define BAXTER_MAINTENANCE_MSGS_MESSAGE_TAREDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace baxter_maintenance_msgs
{
template <class ContainerAllocator>
struct TareData_
{
  typedef TareData_<ContainerAllocator> Type;

  TareData_()
    : tuneGravitySpring(false)  {
    }
  TareData_(const ContainerAllocator& _alloc)
    : tuneGravitySpring(false)  {
  (void)_alloc;
    }



   typedef uint8_t _tuneGravitySpring_type;
  _tuneGravitySpring_type tuneGravitySpring;




  typedef boost::shared_ptr< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> const> ConstPtr;

}; // struct TareData_

typedef ::baxter_maintenance_msgs::TareData_<std::allocator<void> > TareData;

typedef boost::shared_ptr< ::baxter_maintenance_msgs::TareData > TareDataPtr;
typedef boost::shared_ptr< ::baxter_maintenance_msgs::TareData const> TareDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_maintenance_msgs::TareData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace baxter_maintenance_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'baxter_maintenance_msgs': ['/home/leroypc/baxter_ws/src/baxter_common/baxter_maintenance_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "241e9c2ceee7da9db50693da0b3f2741";
  }

  static const char* value(const ::baxter_maintenance_msgs::TareData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x241e9c2ceee7da9dULL;
  static const uint64_t static_value2 = 0xb50693da0b3f2741ULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_maintenance_msgs/TareData";
  }

  static const char* value(const ::baxter_maintenance_msgs::TareData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool tuneGravitySpring\n\
";
  }

  static const char* value(const ::baxter_maintenance_msgs::TareData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.tuneGravitySpring);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TareData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_maintenance_msgs::TareData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_maintenance_msgs::TareData_<ContainerAllocator>& v)
  {
    s << indent << "tuneGravitySpring: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.tuneGravitySpring);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MAINTENANCE_MSGS_MESSAGE_TAREDATA_H
