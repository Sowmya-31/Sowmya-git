#!usr/bin/python3
import smtplib
import schedule
import time
import os
def sendEmail():
	ServiceStatus = os.system("systemctl is-active nodejs")
	server = smtplib.SMTP('smtp.gmail.com', 587)
	server.ehlo()
	server.starttls()
	server.login("yamini.tsn@gmail.com", "9948904077")
	msg = "Hi!!!" 
	if(ServiceStatus == 0):
		server.sendmail("yamini.tsn@gmail.com", "gangulakrishna7@gmail.com", msg)
		print("Message sent successfully!")
schedule.every(30).minutes.do(sendEmail)
while True:
	schedule.run_pending()
	time.sleep(1)
