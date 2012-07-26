#Convert_SOPAC_MRK.py
#Python 2.7
#Author: Sachindra Singh - August, 2011

import os

replace_list = ["=245  ", "=250  ", "=300  ", "=400  ", "=440  ", "=495  ", "=500  ", "=501  ", "=700  ", "=710  ", "=711  "]
def replace(l):
	if (l.startswith("=260  $")):
		l = l.replace("=260  $","=260  \\\$")
	if (l.startswith("=995  ")):
		l = l.replace("=995  ","=995  \\\$o")
	if (l.startswith("=595  ")):
		l = l.replace("=595  ","=020  \\\$a")
		#print l
	for r in replace_list:
		if (l.startswith(r)):
			#print l
			l = l.replace(r, r + "\\\$a")
			#print l
	return l.strip()		
	

def replace_slashes(l):
	l = str(l)
	if "  $a" in l:
		l = l.replace("  $a", "  \\\$a")
		#print l
	return l.strip()

remove_list = ["=997", "=998", "=999"]
temp_remove_list =["=953", "=954", "=491", "=952", "=959"]
remove_list.extend(temp_remove_list)
def remove(l):
	for r in remove_list:
		if (l.startswith(r)):
			l = ""
	return l.strip()

divide_list = ["=650  ", "=651  "]
def divide(l):
	res = ""
	for r in divide_list:
		if l.startswith(r):
			#print l
			for x in l.split(">"):
				x = x.replace(r, "").strip()
				x = x.replace("<", "").strip()
				if len(x) != 0:
					res = res + r + "\\\$a" + x + "\n"
	if len(res) != 0:
		#print res
		return res.strip()
	else:
		return l.strip()




line_count = 0
record_count = 0
res1 = []
with open("sopac.mrk") as f:
	for line in f:
		line_count = line_count + 1
		if line.startswith("=LDR"): record_count = record_count + 1
		line = replace(line)
		line = replace_slashes(line)
		line = remove(line)
		line = divide(line).strip()
		if line.startswith("=245  "):
			line = line.replace("<", "")
			line = line.replace(">", "")

		if line.startswith("=745"):
			line = line.replace("=745  ",  "")
			x = line.split(":")
			if len(x) == 1: x.append(" ")
			line = "=773  \\\$t" + x[0].strip() + "$g" + x[1].strip()
			print line

		if len(line.strip()) != 0:
			res1.append(line)

#append itemtype and library
res2 = []
type = "B"
first = True
for l in res1:	
	ls = l.lower()
	if ls.startswith("=440") and "report" in ls:
		type = "R"
	if ls.startswith("=745") and "journal" in ls:
		type = "JOU"
	if ls.startswith("=440") and "trip" in ls:
		type = "MR"
	if ls.startswith("=225") and "trip" in ls:
		type = "MR"
	if (l.startswith("=LDR") and not first):
		l = "=942  \\\$c" + type + "\n=952  \\\$bSOPAC\n\n" + l
		type = "B"
	 	
	res2.append(l)
	first = False
#final record ammendment
res2.append("=942  \\\$c" + type + "\n=952  \\\$bSOPAC")



#write
file = "test.mrk"
if os.path.isfile(file): os.remove(file)
with open("test.mrk", "w") as w:
	for l in res2:		
		w.write(l + "\n")		

#verify
final_count = 0
with open(file) as f:
	for line in f:
		if (line.startswith("=LDR")): final_count = final_count + 1



print "\r\n" + str(record_count) + " records processed - " + str(final_count) + " verified"
print "Finished."

