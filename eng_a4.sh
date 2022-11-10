# Read and parse a CSV file in Bash
INFILE=USERS.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INFILE ] && { echo "$INFILE file not found"; exit 99; }
while read username fname lname grp
do
echo "Username : $username" >> eng_a4_Output.txt
echo "Name     : $fname $lname" >> eng_a4_Output.txt
echo "Group    : $grp" >> eng_a4_Output.txt
echo "==========" >> eng_a4_Output.txt
# INSERT YOUR SCRIPTING CODE HERE
# adding user with provided username
# adding user to provided group, not overwriting default group
sudo useradd -g $grp $username 
echo "temp12345" |  sudo passwd --stdin "$username" >> eng_a4_Output.txt
echo "==========" >> eng_a4_Output.txt
# END OF YOUR SCRIPTING CODE
done < $INFILE
IFS=$OLDIFS
