from __future__ import print_function
import roslibpy
import time
#import logging
client = roslibpy.Ros(host='localhost', port=9090)
service_list=['/rosplan_problem_interface/problem_generation_server','/rosplan_planner_interface/planning_server','/rosplan_parsing_interface/parse_plan','/rosplan_plan_dispatcher/dispatch_plan']
service_type=['std_srvs/Empty','std_srvs/Empty','std_srvs/Empty','rosplan_dispatch_msgs/DispatchService']

client.run()
		#client.run()
		#time.sleep(5)
		#client.on_ready(lambda: print('Is ROS connected?', client.is_connected))

def call_service():
	print("calling service function")
	request = roslibpy.ServiceRequest()
	service.call(request, success_callback, error_callback)

def success_callback(result):
    print('Service response: ', result['loggers'])
    return


def error_callback(result):
    print('Something went wrong')
    return

"""except KeyboardInterrupt:
	#client.terminate()
	pass"""

if __name__ == "__main__":
	
	for x in range(len(service_list)): 
		service = roslibpy.Service(client, service_list[x],service_type[x])

		print(service.name)
		client.on_ready(lambda :call_service())
		time.sleep(2)
		print(service.name,"completed")
	client.terminate()
	