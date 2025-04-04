#!/bin/sh -l

APP_PATH="${1:-.}"

echo "Deploying to Zendesk..."
echo "Switching to directory: $APP_PATH"

cd "$APP_PATH" || {
  echo "Error: Failed to change directory to $APP_PATH"
  exit 1
}

ls -la

FILE=.zat
PASSWORD="\"password\""
APP_ID="\"app_id\""

if grep -q "$APP_ID" "$FILE" ; then
    echo "App ID detected, running update"
    zat clean
    zat update
elif grep -q "$PASSWORD" "$FILE" ; then
    echo "No existing APP ID detected, creating new app."
    zat clean
    zat create
else
    echo "Can't deploy. Please check your .zat file"
    exit 1
fi
