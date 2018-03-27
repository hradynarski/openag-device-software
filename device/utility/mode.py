class Mode(object):
	""" State machine modes """

	BOOT = "BOOT"
	CONFIG = "CONFIG"
	SETUP = "SETUP"
	INIT = "INIT"
	NORMAL = "NORMAL"
	ERROR = "ERROR"
	RESET = "RESET"
	WARMING = "WARMING"
	LOAD = "LOAD"
	QUEUED = "QUEUED"
	PAUSE = "PAUSE"
	RESUME = "RESUME"
	STOP = "STOP"
	NORECIPE= "NORECIPE"
	INVALID = "INVALID"