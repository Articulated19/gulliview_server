#!/usr/bin/env python
import SocketServer
import rospy
import json
import os
from custom_msgs.msg import *

class GulliViewServer:

    def __init__(self):
        print "hi"
        rospy.init_node('gulliview', anonymous=True)
        self.gv_position_publisher = rospy.Publisher('gv_positions', GulliViewPositions, queue_size=10)


    def handlePositionUpdate(self, data):
        print data
        msg = GulliViewPositions()

        msg.p1.x = data.get('x1')
        msg.p1.y = data.get('y1')
        msg.cameraid = data.get('cameraid')
        msg.tagid1 = data.get('tagid1')
        
        msg.p2.x = data.get('x2')
        msg.p2.y = data.get('y2')
        msg.tagid2 = data.get('tagid2')

        self.gv_position_publisher.publish(msg)

class GVSocketServer(SocketServer.BaseRequestHandler):

    def handle(self):
        global gv
        data = self.request[0].strip()
        data = json.loads(data.decode())

        gv.handlePositionUpdate(data)
        print data

if __name__ == "__main__":
    HOST, PORT = "localhost", 2121

    gv = GulliViewServer()
    server = SocketServer.UDPServer((HOST, PORT), GVSocketServer)
    server.serve_forever()
    rospy.spin()
