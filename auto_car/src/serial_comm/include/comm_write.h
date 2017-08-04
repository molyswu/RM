#ifndef COMM_WRITE_H
#define COMM_WRITE_H

#include <fstream>
#include <iostream>
#include <string>
#include <math.h>
#include <std_msgs/String.h>
#include <fcntl.h>      /*file control lib*/
#include <termios.h>    /*PPSIX terminal*/
#include <errno.h>      /*error information*/
#include <stdlib.h>     /*standard lib*/
#include <unistd.h>     /*Unix standard func*/

namespace autocar
{
namespace serial_mul
{
typedef struct
{
    uint8_t sof;//0xA5
    uint8_t myinfo;//???
    int16_t auto_vx;//?->move_base::vel_data.linear.x
    int16_t auto_vy;//?->move_base::vel_data.linear.x
    int16_t auto_vw;//?->move_base::vel_data.angular.z
    uint8_t vision_data_status;//enemy detected, 1 for yes, 0 for no
    int16_t vision_data_x;//enemy x coordination
    int16_t vision_data_y;//enemy y coordination
    int16_t vision_data_d;//enemy angle direction
    uint8_t end;//0xFE

}__attribute__((packed)) data_t;

class comm_write{
public:
  comm_write();
  ~comm_write();
  /**
   * @brief Initialization the serial paramters for writing data
   * @return
   */
  bool write_setup();
  /**
   * @brief Writing data to serial
   */
  void write_data(data_t data_to_write);
private:
  data_t data;
  std::string dev;
  int serial_baudrate;
  std_msgs::String pubData;
  int fd;
  int data_len;
};

}
}
#endif // COMM_WRITE_H
