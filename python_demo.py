import sys
from logstashHandler import *
import logging
IP = sys.argv[1]
logging.basicConfig(level=logging.DEBUG)
lhandler = logstashHandler(host=IP, port=12345, proto='TCP')
logger = logging.getLogger('python_demo')
logger.addHandler(lhandler)
logger.warn('this is a test warning trigger by a python script')