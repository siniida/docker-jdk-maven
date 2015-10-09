#!/bin/sh

if [ -n "${JDK}" ]
then
	case ${JDK} in
		7|jdk7|JDK7|7*)
			alternatives --set java  /usr/java/jdk1.7.0_80/jre/bin/java
			alternatives --set javac /usr/java/jdk1.7.0_80/bin/javac
			;;
	esac
fi

mvn -version
javac -version

exec $@
