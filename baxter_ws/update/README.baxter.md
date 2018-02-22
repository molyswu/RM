# Quickstart guide to testing the setup

In general, baxter commands are handled by the `baxter` governor script. See

    baxter -h

for usage details. The quick start guide gives some basic usage examples. The
documentation section below discusses the broad categories, but leaves the
details of command usage to the help documentation. All command categories have
a help file that can be accessed via

    baxter <category> -h

And most commands, themselves, have help listings that can be accessed using
the flag `-h`.

## Installation

See `README.md` for installation instructions.

## Testing the Lula system on Baxter in simulation

To startup and test the Lula system in simulation, run the following (each in
separate Lula terminals):

Terminal 1:

    baxter sim  # Startup the simlator.

Terminal 2:

    baxter world baxter_two_cylinder_world.yaml  # Load the two-cylinder world.

Note that you can see all possible worlds by running just `baxter world`, but
the API demo uses the two cylinder world.

Terminal 3:

    baxter backend  # Startup the backend.

Terminal 4: 

    baxter run_api_demo  # Run a demo script

The robot should move at this point: it reaches out, grabs one of the
cylinders, moves it (in a particular motion controlling the bottom of the
cylinder that places the bottom of the cylinder at a prespecified point from
above), then retracts.

Move the cylinder to a different location using 

    baxter world interact

That adds interactive markers over the top of the (non-static) world objects so
they can be moved. This program can remain running through executions of API
scripts that interact with the world, or you can cancel out of it using
`<ctrl>-c`. Canceling removes the interactive markers.

With the cylinder in a different pose, you can rerun the API demo script.
Additionally, the section below describes how to move the end-effectors around
manually with interactive markers to play with it and get a feel for the
controllers.

Note that in all cases these demos use local control only and no motion
planning (as in the `go_local` functionality described below). A form of motion
planning is built into the `go_long_range` method described below.

## Enabling manual control

Once the backend has started, one can additionally enable manual control of the
end effectors by running

    baxter manual_control

Interactive markers will appear in the visualization, and you can move the
robot by moving those markers around.

Change the speed of the robot using

    baxter set_speed --speed_level=[slow|med|fast]

There's also a `super_fast` speed level that can be used in simulation,
although be careful about using it on the physical robot.

By default, manual control just sends local control commands. Long-range manual
control can be started using

    baxter manual_control --long_range

However, this requires an active guiding configuration collection (see the
discussion below) and won't work otherwise. For long-range motion, when you
move the end-effector's target interactive marker around, no command is sent
until you explicitly call

    baxter manual_control_trigger --side=[right|left]

Once that's called, it'll trigger a `go_long_range` command to move the
specified end-effector its respective target. Since this command uses
`go_long_range`, it requires a guiding configuration collection to be
constructed as described below.

## Connecting to the real robot

Start the visualization up without an explicit simulator using
    
    baxter viz # Rather than 'baxter sim'

and enable baxter using 

    baxter enable

At this point you can start the backend. It'll start streaming commands to the
real robot and move to a default configuration with its arms loosely in front
of its body.  Note that by default, it has no world representation aside from
the internal representation loaded using `baxter world <world>`, so make sure
there are no unmodeled objects in the way when it starts up.

Once the robot session is finished, remember to disable the robot using 

    baxter disable

Everything else works the same as in simulation. However, now you can access
the cuff and physically reconfigure the arms. To do so, start a cuff monitor for 
each arm using
    
    baxter cuff [right|left]

Then, once the backend is running and controlling the robot, pressing the
circular button on a given arm's cuff will disable the controllers for that arm
temporarily, allowing you to move the arm around freely by squeezing the cuff.
Once the arm has been positioned into the desired configuration, press the
circular button again to re-enable the arm controllers. The controllers start
back up from the current configuration. Note that the arm may move slightly,
especially in the nullspace of the end-effector configuration, if the collision
controllers find that a part of the arm is too close to a modeled object.

# Documentation

In general, baxter commands are handled by the `baxter` governor script. See

    baxter -h

for usage details. The quick start guide gives some basic usage examples. The
documentation section below discusses the broad categories, but leaves the
details of command usage to the help documentation. All command categories have
a help file that can be accessed via

    baxter <category> -h

And most commands, themselves, have help listings that can be accessed using
the flag `-h`.

## Governor script overview

For baxter-specific functionality, such as enabling/disabling the robot 
and physically reconfiguring the arms using the cuff, see

    baxter robot

Baxter's basic usage summary can be seen by running

    baxter basic

and a list of movement API commands (see below for details) can be seen by
running

    baxter list_api

Each of those API commands can be run as

    baxter <command> [flags]


## Command categories

In all cases, more detailed documentation can be found by using the `-h` flag
on any of these. For instance:

    baxter world -h

Command categories:

    [sim|viz], world, backend, manual_control, run_api_demo

Overview:
- `sim|viz`: Start up the simulator or just the visualization without the
  simulator.
- `world`: Load a world model
- `backend`: Start the control backend. Includes controllers for both arms,
  command interpreters, etc.
- `manual_control`: Creates interactive markers for each end-effector. Enables
  manually dragging the end-effectors around. The resulting robot commands are
  generated by the backend and will execute either in the simulator, if one is
  running, or on the real robot if those commands are bridged to the physical
  robot.
- `run_api_demo`: Runs a demo script showing the API capabilities.

## Movement API commands

The movement commands are listed by 

    baxter list_api

They are: 
- `go_local`: Move the end-effector to a (partial) frame target using only
  local controllers.
- `go_long_range`: Move end-effector to a (partial) frame target over a long
  range using the best guiding configuration of the currently active guiding
  configuration collection (see below).
- `approach`: Move in a controlled straight line from the current pose to the
  target pose.
- `retract`: Retract one or both arms from any current configuration to a
  retracted ready configuration.
- `set_speed`: Set the speed level to one of `slow`, `med`, `fast`,
  `super_fast`.  Most speed levels are safe, but be cautious using `super_fast`
  on the physical platform. It's performance depends on how well calibrated the
  robot is.  Note that it will never be unsafe, since Baxter has built in
  safety stop mechanisms. It just may not run smoothly if it's halted by
  controller lag errors periodially.
- `manual_robot_control`: Explicit script access to the manual control command.

## Long-range motion

Moving long range via the `go_long_range` functionality currently requires a
short training phase to give inverse kinematics hints in a 'guiding
configuration collection'. That involves just moving the arms around through
the open space using local control and is pretty quick, but full descriptions
of that will come in future documentation. (Note that this is just a quick
replacement for an automated obstacle aware inverse kinematics solver. It will
likely be phased out in the future.)

We provide tools for waving the arm across a workspace and around obstacles to
train the system on how to resolve redundancies and solve course inverse
kinematics problems for long-range movement. 

TODO: More details to come.

## Registering world model objects with the real world

When vision is unavailable, you can create internal world model collision
representations from primitive objects. The primary difficulty of creating one
of these is in registering it correctly with the world. We provide a set of
tools for laying down virtual points in the visualization of the end-effector's
current location to help guide the placement of the collision primitives. This
enables you to move the physical object to points close to the surface of of
obstacles, and mark those locations in the visualization. You can even lay down
a stream of such markers by moving the arm around the object. Then, manual
placement and size adjustment of primitives is straightforward.

TODO: More details to come.

## Creating an ambient world representation

We provide tools for creating layered ambient world representations.

TODO: More details to come.
