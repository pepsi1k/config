#!/bin/sh 
GITBOOK_DIR="/var/www/gitbook"
REMOTE_DIR="root@main.pepsik.xyz:/var/www/gitbook"
LOG_FILE="$HOME/.config/polybar/polybar-script/gitbook_sync.log"

# book - 
# upload - 
TITLE=""


while true 
do
	#book icon
	echo 
	inotifywait -e modify --format '%:e %f'  -r "$GITBOOK_DIR" \
		"@$GITBOOK_DIR/book1/" \
		"@$GITBOOK_DIR/_book/" &>> $LOG_FILE

	#upload icon
	echo "%{F#0A82F5}%{F-}"
	
	if [[ $? == 0 ]]; then
		rsync -r $GITBOOK_DIR/knowledge $REMOTE_DIR --delete &>> $LOG_FILE
		echo "%{F#76B9FA}%{F-}"
		rsync $GITBOOK_DIR/{README.md,SUMMARY.md,book.json} $REMOTE_DIR &>> $LOG_FILE
	fi
done

