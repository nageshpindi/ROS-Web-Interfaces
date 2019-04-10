import roslibpy
import logging

client = roslibpy.Ros(host='100.96.162.232', port=9090)
client.run()

client.on_ready(lambda: call_service())

service = roslibpy.Service(client, '/rosplan_planner_interface/planning_server', 'std_srvs/Empty')
#service1 = roslibpy.Service(client, '/rosplan_knowledge_base/domain/functions', 'rosplan_knowledge_msgs/GetDomainAttributeService')
#service1 = roslibpy.Service(client, '/rosplan_knowledge_base/domain/functions', 'rosplan_knowledge_msgs/GetDomainAttributeService')

'''
FORMAT = '%(asctime)-15s [%(levelname)s] %(message)s'
logging.basicConfig(level=logging.DEBUG, format=FORMAT)
'''
logging.basicConfig( level=logging.DEBUG, format='[%(thread)03d] %(asctime)-15s [%(levelname)s] %(message)s') 
LOGGER = logging.getLogger('test')

def call_service():
    print('Calling service')
    request = roslibpy.ServiceRequest()
    service.call(request, success_callback, error_callback)
    return
def success_callback(result):
    print('Service response: ')
    #client.terminate()
    return
def error_callback(result):
    print('Something went wrong')
    return    
try:
    while True: 
        pass
except KeyboardInterrupt:
    pass

client.terminate()

'''
if __name__ == '__main__':

    logging.basicConfig(
        level=logging.DEBUG, format='[%(thread)03d] %(asctime)-15s [%(levelname)s] %(message)s')
    LOGGER = logging.getLogger('test')

    call_service()
'''
