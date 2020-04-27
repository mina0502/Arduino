import time
from datetime import datetime
while True:
    print(datetime.utcfromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S'))
    time.sleep(1)
