# [siniida/jdk-maven](https://hub.docker.com/r/siniida/jdk-maven/)

for [gennai](https://github.com/TryGennai/gennai).

## Environment

* CentOS 6
* Oracle JDK
    * 8u65 (default)
    * 7u80
* Maven 3.3.3

## JDK8

    $ docker run -ti siniida/gennai-build /bin/bash
    
### switch JDK8 -> JDK7

    [root@CONTAINERID /]# alternatives --set java  /usr/java/jdk1.7.0_80/jre/bin/java
    [root@CONTAINERID /]# alternatives --set javac /usr/java/jdk1.7.0_80/bin/javac

## JDK7

    $ docker run -ti -e JDK=7 siniida/gennai-build /bin/bash

### switch JDK7 -> JDK8

    [root@CONTAINERID /]# alternatives --set java  /usr/java/jdk1.8.0_65/jre/bin/java
    [root@CONTAINERID /]# alternatives --set javac /usr/java/jdk1.8.0_65/bin/javac

----

DockerHub: [siniida/jdk-maven](https://hub.docker.com/r/siniida/jdk-maven/)
