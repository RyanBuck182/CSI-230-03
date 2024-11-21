#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

	echo -n "Please Input an Instructor Full Name: "
	read instName

	echo ""
	echo "Courses of $instName :"
	cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
	sed 's/;/ | /g'
	echo ""

}

function courseCountofInsts(){

	echo ""
	echo "Course-Instructor Distribution"
	cat "$courseFile" | cut -d';' -f7 | \
	grep -v "/" | grep -v "\.\.\." | \
	sort -n | uniq -c | sort -n -r 
	echo ""

}

function displayCoursesByLoc(){

	echo -n "Please input a location: "
	read locName

	echo ""
	echo "Courses in $locName :"
	cat "$courseFile" | grep "$locName" | cut -d';' -f1,2,5-7 | \
	sed 's/;/ | /g'
	echo ""

}

# TODO - 2
# Make a function that displays all the courses that has availability
# (seat number will be more than 0) for the given course code
# Add function to the menu
# Example input: SEC
# Example output: See the screenshots in canvas
function displayAvailableCourses(){

	echo -n "Please input a subject: "
	read subName

	echo ""
	echo "Available courses in $subName :"
	cat "$courseFile" | grep "$subName" | \
	sed 's/ /,/g' | sed 's/;/ | /g' | \
	awk '{if ($7 > "0") print $0}' | sed 's/,/ /g'
	echo ""

}

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display courses at a location"
	echo "[4] Display courses that have availability"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		displayCoursesByLoc

	elif [[ "$userInput" == "4" ]]; then
		displayAvailableCourses

	else
		echo "Invalid input. Please input a number between 1 and 5."

	fi
done
