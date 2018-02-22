# Testing the Lula system for ABB's YuMi and EGM

To startup and test the Lula system in simulation, run the following (each in
separate Lula terminals):

Terminal 1:

    yumi sim egm:=true  # Startup the simlator expecting EGM commands.

Terminal 2:

    yumi world yumi_two_cylinder_world.yaml  # Load the two-cylinder world.

Terminal 3:

    yumi backend egm:=true  # Startup the backend with the EGM bridge.

Terminal 4: 

    yumi run_api_demo  # Run a demo script

The robot should move at this point: it reaches out, grabs one of the
cylinders, moves it, then retracts.


# The Lula ABB driver

RabbitMQ must be installed.

## Starting up and testing the driver

Startup the driver in a new terminal:

    yumi abb_driver

Note: must kill -9 to get out of it. The easiest way is to suspend
(`<ctrl>-z`), which provides a number in brackets `[n]` (often `n = 1`), and
run `kill -9 %n` (replacing `n` with the corresponding number). This seems to
be a RabbitMQ issue-- likely blocking on socket IO.

Test the driver by running

    yumi test_abb_driver --test=1

Tests 1 and 2 make local movements with both arms. Add the flag
`--freeze_on_convergence` to test freezing EGM on convergence (which shuts down
the EGM connection on the real system). In simulation, EGM isn't actually shut
down, and must be explicitly unfrozen by running 

    yumi test_abb_driver --test=6

## Details about using Lula ABB driver

To find the `test_abb_driver` script, go to

    cd /opt/lula/lib/lula_abb_bridge/scripts

The `test_abb_driver` script in that directory can be copied anywhere and run
from any Lula terminal. The method `test_lula_command()` in that script 
demonstrates the basic message format:

    right_parameters = {
        'side': 'right',
        'orig': [.4,-.1,.6],
        'axis_z': [1,.5,-1],
        'freeze_on_convergence': args.freeze_on_convergence
    }
    left_parameters = {
        'side': 'left',
        'orig': [.3,.4,.3],
        'axis_z': [1,-.5,-1],
        'freeze_on_convergence': args.freeze_on_convergence
    }
    command = 'go_local'
    message = [
        {
            'device': 'lula',
            'command': command,
            'parameters': right_parameters
        },
        {
            'device': 'lula',
            'command': command,
            'parameters': left_parameters
        }
    ]

This example sends go-local commands simultaneously for the right and left
end-effectors.  If `freeze_on_convergence` is True, then the system will freeze
when it reaches the specified goal to shutdown EGM using its convergence
criterion. Otherwise, it will keep EGM open (useful for testing). 

When a RabbitMQ Lula command is sent to the driver, there are two responses.
The first is just a `lula_ready` response. The sender, once it receives that,
can turn on EGM. Once EGM is established (or if it's already running), the
driver sends the command to the Lula system to move the robot. Once the Lula
system is (asynchronously) moving the robot, it'll respond with a
`lula_command_sent` response indicating that the Lula system is moving the
robot. If `freeze_on_convergence` is specified, Lula will freeze the motion
once it reaches its goal and send the resulting final robot configuration in a
stream until the ABB controller shuts down EGM.

Lula driver messages are preemptive. A movement command can be sent and resent
with differing targets repeatedly, and the Lula system will automatically
switch to executing the latest for each arm. For each command, it responds the
`lula_ready` initially and then `lula_command_sent` once the command is sent.
The first time through, if EGM isn't currently running, it's the sending node's
responsibility turn it on once it receives the `lula_ready` response. Once EGM
has been started externally, the Lula ABB driver will notice and forward the
command on to the Lula system, and only then will it respond with
`lula_command_sent`. If EGM is already running, the driver will still respond
first with `lula_ready`, but the command will be forwarded immediately to the
Lula system and the driver will additionally immediately respond with
`lula_command_sent`.
