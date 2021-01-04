import os
from slack import WebClient
import sys

if len(sys.argv) != 2:
	print("Usage python away.py [0|1]")
	exit()

client = WebClient(token=os.environ['SLACK_API_TOKEN'])

if (sys.argv[1] == '1'):
	print("Set away ...")
	client.dnd_setSnooze(num_minutes=60)
	client.users_setPresence(presence='away')
	client.users_profile_set(profile={'status_text':"at lunch",'status_emoji':":spaghetti:",'status_expiration':0})
else:
	print("Set online ...")
	client.dnd_endDnd()
	client.users_profile_set(profile={'status_text':"",'status_emoji':"",'status_expiration':0})
	client.users_setPresence(presence='auto')