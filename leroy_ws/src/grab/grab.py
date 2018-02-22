#!/usr/bin/env python
#
# Lirui Wang

import argparse
import copy
import numpy as np

import rospy
import rospkg

from lula_pyutil import arg_parsing
from lula_control.robot import Robot
from lula_control.robot import calc_target_elements
from lula_control.world import World

if __name__ == '__main__':
	parser = argparse.ArgumentParser('grab')
	parser.add_argument(
			'--orig',
			type=arg_parsing.parse_3d_nparray,
			required=False,
			help='Specifying the end-effector origin target.')
	parser.add_argument(
			'--rotation',
			type=arg_parsing.parse_3d_nparray,
			required=False,
			help='Specifying the end-effector target rotation.')
	args = parser.parse_args()
	config = arg_parsing.load_yaml_config(
		'package://lula_baxter/config/grab.yaml') # change to my own directory.
	rospy.init_node('grab_object', disable_signals=True)
	world = World() #load the world grab_world.yaml 
	robot = Robot(robot='baxter')
	obj = world.get_controllable_object('obj') #change the positions using ros?
	obj.pose.position.x = 0.5
	standoff = float(config['approach_standoff'])
	target_orig, target_axis_x, target_axis_z = calc_target_elements(
			obj.pose, #calculating
			local_target = [float(s) for s in config['local_grasp_target']], #?
			local_orientation = [0., 0., -1],
			approach_reference = [float(s) for s in config['approach_reference']] ) #how? change reference
	standoff_target_orig = target_orig - standoff * target_axis_z
	robot.set_speed('fast')
	robot.right_side.end_effector.go_local( 
		orig = standoff_target_orig,
		axis_x = target_axis_x, 
		axis_z = target_axis_z,
		wait_time=2.)
	robot.set_speed('med')  # Perform the entirety of the grasp and move at med speed.
	obj.suppress('right')  # Turn off collision checks with this obj
	robot.right_side.end_effector.approach(
		orig = target_orig,
		axis_x = target_axis_x, 
		axis_z = target_axis_z)
	robot.right_side.end_effector.freeze()

	try:
		controllable_frames = robot.right_side.end_effector.gripper.close(obj)
		obj_frame = controllable_frames[config['obj_control_frame']]
		target_orig = [float(s) for s in config['obj_target']] #end point
		pre_target_orig = copy.deepcopy(target_orig)
		pre_target_orig[2] += float(config['target_standoff']) #standoff for back
		robot.set_speed('med')
		obj_frame.async_go_local(
		        orig = pre_target_orig,
		        required_orig_err=float(config['target_standoff_required_error']),
		        wait_time=10.).join()
		robot.set_speed('med')
		obj_frame.async_go_local(
		        orig = target_orig,
#		        axis_z = [0, 0, 0.0386], 
		        wait_time=10.).join()
		robot.right_side.end_effector.freeze()
	finally:
		robot.right_side.end_effector.gripper.open()
		robot.set_speed('med')
		robot.right_side.end_effector.move_backward(dist = standoff, wait_time=3.)
		obj.unsuppress('right') # Turn the collision checks back on.
		robot.set_speed('fast')
		robot.right_side.end_effector.retract()
	rospy.signal_shutdown('<done>')
