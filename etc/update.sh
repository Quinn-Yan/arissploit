#!/bin/bash

# MIT License
#
# Copyright (C) 2019, Arissploit Team. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

BS="\033[1;94m"
RS="\033[1;91m"
YS="\033[1;33m"
GNS="\033[1;32m"
CE="\033[0m"
        
if [[ -d /data/data/com.termux ]]
then
if [[ -f /data/data/com.termux/files/usr/bin/arissploit ]]
then
UPD="true"
else
UPD="false"
fi
else
if [[ -f /usr/local/bin/mouse ]]
then
UPD="true"
else
UPD="false"
fi
fi
{
ASESR="$( curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//' )"
} &> /dev/null
if [[ "$ASESR" = "" ]]
then 
sleep 1
echo -e "["$RS"err"$CE"] Download failed!"
sleep 1
exit
fi
if [[ $EUID -ne 0 ]]
then
sleep 1
echo -e "["$RS"err"$CE"] Permission denied!"
sleep 1
exit
fi
sleep 1
echo -e "["$BS"inf"$CE"] Installing update..."
{
rm -rf ~/arissploit
rm /bin/arissploit
rm /usr/local/bin/arissploit
rm /data/data/com.termux/files/usr/bin/arissploit
cd ~
git clone https://github.com/entynetproject/arissploit.git
if [[ "$UPD" != "true" ]]
then
sleep 0
else
cd ~/arissploit
chmod +x install.sh
echo | ./install.sh
fi
} &> /dev/null
echo -e "["$GNS"suc"$CE"] Successfully updated!"
sleep 1
exit
