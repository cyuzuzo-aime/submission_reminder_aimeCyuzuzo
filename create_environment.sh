#!/bin/bash

read -p "Enter your name: " NAME
DIR_NAME="submission_reminder_${NAME// /}"
mkdir -p "$DIR_NAME"

echo "Preparing essential files.... please wait..."

mkdir -p "$DIR_NAME/app" && cp ./base_files/reminder.sh "$DIR_NAME/app/"
mkdir -p "$DIR_NAME/modules" && cp ./base_files/functions.sh "$DIR_NAME/modules/"
mkdir -p "$DIR_NAME/assets" && cp ./base_files/submissions.txt "$DIR_NAME/assets/"
mkdir -p "$DIR_NAME/config" && cp ./base_files/config.env "$DIR_NAME/config/"

echo "Files ready --- initializing the reminder...."

chmod +x "$DIR_NAME/app/reminder.sh"

cd "$DIR_NAME"
echo "#!/bin/bash" > startup.sh
echo "chmod +x app/reminder.sh" >> startup.sh
echo "./app/reminder.sh" >> startup.sh
chmod +x startup.sh

echo "--------------"

./startup.sh

