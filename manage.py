#!/usr/bin/env python
"""
Command-line utility for administrative tasks.
"""

import logging.handlers
import os
import sys

if __name__ == "__main__":
	os.environ.setdefault(
		"DJANGO_SETTINGS_MODULE",
		"DjangoHome.settings"
	)

	from django.core.management import execute_from_command_line

	# Current 'when' events supported:
	#   S - Seconds
	#   M - Minutes
	#   H - Hours
	#   D - Days
	#   midnight - roll over at midnight
	#   W{0-6} - roll over on a certain day; 0 - Monday
	logging_level = logging.INFO
	formatter = logging.Formatter(
		fmt='%(asctime)s,%(msecs)d - %(name)s - %(levelname)s - %(message)s',
		datefmt='%Y-%m-%d %H:%M:%S'
	)
	logger = logging.getLogger()   
	logger.setLevel(logging_level)

	consoleHandler = logging.StreamHandler()
	consoleHandler.setFormatter(formatter)
	logger.addHandler(consoleHandler)

	if bool(os.environ.get("ENABLE_FILE_LOGGING", 0)):
		log_file_name = 'Logs/log.log'

		if not os.path.exists("./Logs"):
			os.makedirs("./Logs", 777)

		fileHandler = logging.handlers.TimedRotatingFileHandler(filename=log_file_name, when="midnight", interval=1, encoding='utf-8')
		fileHandler.setFormatter(formatter)
		fileHandler.suffix = "%d.%B.%Y.log"
		logger.addHandler(fileHandler)

	execute_from_command_line(sys.argv)
