import sys
from core import colors

errorstr = "["+colors.bold+colors.red+"err"+colors.end+"] "
infostr = "["+colors.bold+colors.blue+"inf"+colors.end+"] "
warningstr = "["+colors.bold+colors.yellow+"war"+colors.end+"] "
successstr = "["+colors.bold+colors.green+"suc"+colors.end+"] "

def animline(message, last=False):
	sys.stdout.write("\033[K")
	if last == False:
		sys.stdout.write(message+"\r")
	else:
		sys.stdout.write(message+"\n")

def animError(message, last=False):
	sys.stdout.write("\033[K")
	if last == False:
		sys.stdout.write(errorstr+message+"\r")
	else:
		sys.stdout.write(errorstr+message+"\n")

def animWarning(message, last=False):
	sys.stdout.write("\033[K")
	if last == False:
		sys.stdout.write(warningstr+message+"\r")
	else:
		sys.stdout.write(warningstr+message+"\n")

def animInfo(message, last=False):
	sys.stdout.write("\033[K")
	if last == False:
		sys.stdout.write(infostr+message+"\r")
	else:
		sys.stdout.write(infostr+message+"\n")

def animSuccess(message, last=False):
	sys.stdout.write("\033[K")
	if last == False:
		sys.stdout.write(successstr+text+"\r")
	else:
		sys.stdout.write(successstr+text+"\n")
