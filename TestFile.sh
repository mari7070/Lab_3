#!/bin/sh
#Matthew Rigelman SID:106914492
#INITIALIZE THE FUNCTIONS AND THEIR OPERATIONS



#START MAIN BODY FOR WHEN THE FILE EXISTS
printf "What is the filename you wish to use?: \n"
read -p "Filename:" filename
if ls | grep "$filename"
then
#Create a menu with the case function
while(true)	
	do
	printf "Choose from the following operations: \n"
	printf "[1] Count the lines of the text sample\n[2] Count specific words in text sample\n[3] Add text to the text sample\n[4] Copy the text sample to solution folder and EXIT\n"
	printf "###############################################\n"
	read -p "Your choice: " choice

	case $choice in
		[1])
			#count_lines
			printf "The number of lines in your file is: \n"
			sed -n '$=' $filename
			;;
		[2])
			#count_words
			grep -w Lorem $filename
			grep -w model $filename
			grep -w Ipsum $filename
			grep -w will $filename
			;;
		[3])
			read -p "What text would you like to add to the end of the file?: " newtext
			echo $newtext >> sample_text_edited.txt
			;;
		[4])
			rm -rf solutions
			mkdir solutions
			cp $filename solutions
			return
			;;
	esac
done

else
	echo "File is not found in current directory"
fi
