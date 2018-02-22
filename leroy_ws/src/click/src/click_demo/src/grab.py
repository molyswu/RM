#!/usr/bin/env python
#
# Lirui Wang
import argparse
import copy
import numpy as np

import rospy
import rospkg
from geometry_msgs.msg import Pose
from lula_pyutil import arg_parsing
from lula_control.robot import Robot
from lula_control.robot import calc_target_elements
from lula_control.world import World
from lula_baxter import baxter
positions = [0, 0, 0]
def callback(data):
	parser = argparse.ArgumentParser('grab')
	# parser.add_argument(
	# 		'--orig',
	# 		type=arg_parsing.parse_3d_nparray,
	# 		required=False,
	# 		help='Specifying the end-effector origin target.')
	# parser.add_argument(
	# 		'--rotation',
	# 		type=arg_parsing.parse_3d_nparray,
	# 		required=False,
	# 		help='Specifying the end-effector target rotation.')
	# /opt/lula/lib/python2.7/dist-packages/lula_control
	args = parser.parse_args()
	config = arg_parsing.load_yaml_config(
		'package://lula_baxter/config/grab.yaml') # in /share/lula_baxter/grab
	#rospy.init_node('grab_object', disable_signals=True)
	world = World() #load the world grab_world.yaml 
	robot = baxter.Baxter(is_simulation=False)
	global positions
	#obj = world.get_controllable_object('detection') #change the positions using ros?
	#obj.pose = data;
	#print obj.pose
	standoff = float(config['approach_standoff'])
	robot.left_side.end_effector.gripper.open()	
	if [data.position.x, data.position.y, data.position.z] != positions:

		positions = [data.position.x, data.position.y, data.position.z]
		target_orig, target_axis_x, target_axis_z = calc_target_elements(
	  		data, #calculating
	  		local_target = [float(s) for s in config['local_grasp_target']], #?
	  		local_orientation = [0., 0., -1],
	  		approach_reference = [float(s) for s in config['approach_reference']] ) #determinates the pose of gripper
		standoff_target_orig = target_orig - standoff * target_axis_z
		robot.set_speed('slow')
		robot.left_side.end_effector.go_local( 
			orig = standoff_target_orig,
		 	wait_time = 3.0)
		robot.left_side.end_effector.freeze()
		robot.set_speed('slow')  # Perform the entirety of the grasp and move at med speed.
		# robot.suppress('left')  # Turn off collision checks with this obj
		robot.left_side.end_effector.go_local(
	 		orig = target_orig,
	 		axis_x = target_axis_x, 
	 		axis_z = target_axis_z)
		robot.left_side.end_effector.freeze()
 		try:
 			controllable_frames = robot.left_side.end_effector.gripper.close()
#  			obj_frame = controllable_frames[config['obj_control_frame']]
#  			target_orig = [float(s) for s in config['obj_target']] #end point
#  			pre_target_orig = copy.deepcopy(target_orig)
#  			pre_target_orig[2] += float(config['target_standoff']) #standoff for back
# 			robot.set_speed('med')
# 			obj_frame.async_go_local(
# 		        orig = pre_target_orig,
# 		        required_orig_err=float(config['target_standoff_required_error']),
# 		        wait_time=10.).join()
# 			robot.set_speed('med')
# 			obj_frame.async_go_local(
# 		        orig = target_orig,
# #		        axis_z = [0, 0, 0.0386], 
# 		        wait_time=10.).join()
# 			robot.left_side.end_effector.freeze()
		finally:

	 		robot.set_speed('slow')
			robot.left_side.end_effector.move_backward(dist = standoff, wait_time=3.)
			#obj.unsuppress('left') # Turn the collision checks back on.
	 		robot.set_speed('slow')
			robot.left_side.end_effector.retract() # lula_control scripts api
			#robot.left_side.end_effector.gripper.open()
#	rospy.signal_shutdown('<done>')

def listener():
	rospy.init_node('listener', anonymous = True, disable_signals=True)
	rospy.Subscriber("click_points", Pose, callback)
	rospy.spin()

if __name__ == '__main__':
	listener()

