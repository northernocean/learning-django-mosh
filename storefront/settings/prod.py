import os

import os
from .common import *

DEBUG = False
SECRET_KEY = os.environ['SECRET_KEY']
ALLOWED_HOSTS = [] #Required when debug is turned off