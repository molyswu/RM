#!/usr/bin/env python
#
# Lirui Wang
import argparse
import copy
import numpy as np

import rospy
import rospkg
from geometry_msgs.msg import Pose
from lula_controller_msgs import msg as lula_controller_msgs
from lula_pyutil import arg_parsing
from lula_control.robot import Robot
from lula_control.message_listener import *
from lula_baxter import baxter
from lula_control.robot import calc_target_elements
from lula_control.world import World
import baxter_interface
import baxter_external_devices
from baxter_core_msgs.msg import *
if __name__ == '__main__':
	rospack = rospkg.RosPack()
	rospy.init_node('test_gripper', disable_signals=True)
	world = World() #load the world grab_world.yaml 
	robot = baxter.Baxter(is_simulation=False)
	#robot = Robot(robot='baxter')
	robot.left_side.end_effector.retract()	
	# robot.left_side.end_effector.gripper.close()		
	# robot.right_side.end_effector.gripper.open()
	# robot.right_side.end_effector.gripper.close()
	#baxter_dir = rospack.get_path('lula_baxter')
	#guiding_dir = baxter_dir + '/config'
	#print guiding_dir + '/' + 'retract_configs.pkl'