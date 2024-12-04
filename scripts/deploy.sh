#!/usr/bin/env bash
set -e

echo 'Building project...'
gradle clean build

echo 'Copy files...'
scp -i ~/.ssh/elzat-key.pem \
    build/libs/sweter-0.0.1-SNAPSHOT.jar \
    ubuntu@13.48.138.0:~/IdeaProject/

echo 'Restart server...'
ssh -i ~/.ssh/elzat-key.pem ubuntu@13.48.138.0 << EOF

pgrep java | xargs kill -9
nohup java -jar /home/ubuntu/IdeaProject/sweter-0.0.1-SNAPSHOT.jar > log.txt &

EOF

echo 'Bye'