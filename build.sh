#!/bin/sh

# Parse the config.ini file and set the 'JAVA_VERSION' environment variable
while IFS='=' read -r key value; do
    key=$(echo "$key" | tr -d ' ')
    if [ "$key" = "java" ]; then
        export JAVA_VERSION="$value"
    fi
done < config.ini

# Check if the 'JAVA_VERSION' variable is set
if [ -n "$JAVA_VERSION" ]; then
    echo "Java version is set to $JAVA_VERSION"
else
    echo "Java version not found in config.ini"
fi