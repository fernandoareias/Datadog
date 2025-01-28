#!/bin/zsh


java_version=$(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}')
echo "Java version: " $java_version

java -javaagent:../dd-java-agent.jar -Ddd.logs.injection=true -Ddd.service=datadogx -Ddd.env=dev datadogx.java
