# ROS-webInterfaces
Before cloning my repository we have to follow below instructions.
  1. For installing ROS please refer this http://wiki.ros.org/kinetic/Installation/Ubuntu 
  2. For installing ROSPlan framework follow this link: https://github.com/KCL-Planning/ROSPlan and follow documentation in          this link: http://kcl-planning.github.io/ROSPlan/documentation/
  3. For installing ROSBRIDGE refer this link:            https://github.com/RobotWebTools/rosbridge_suite/blob/develop/ROSBRIDGE_PROTOCOL.md
  4. For installing ROSLIBPY package please this link: https://roslibpy.readthedocs.io/en/latest/readme.html#
  5. Clone this repository and follow steps below steps for using my work.

     - The Domain and Problem .pddl files to /home/rosplan/Nagesh/src/rosplan/rosplan_demos. These files define the domain and        problem in PDDL language.
     
     - Make directory here  called "Roslib_node" and find those files to /home/rosplan/python-environments/Roslib_node which          make service calls to other nodes in ROSPlan framwork.
     
     - We are using "logistics.launch" at a time. Copy this ROSPlan workspace.
     
     - Next open a terminal and change directory to the ROSPlan workspace and source the terminal using "source                        devel/setup.bash"command, and then build the project using the command using "catkin build".
     
     - Next open other terminal to initiate ROSBRIDGE by the help of this command "roslaunch rosbridge_server                          rosbridge_websocket.launch.
     
     - Place "Allservices.py" in the directory of "/home/rosplan/python-environments/Roslib_node" from ROSPlan framework. This        file calls and executes ROSPlan framework within the ROSPlan

  
