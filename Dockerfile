FROM centos:6
MAINTAINER siniida <sinpukyu@gmail.com>

RUN yum update -y
RUN yum install -y tar which

# JDK7
RUN curl -O -L -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm
RUN rpm -ivh jdk-7u80-linux-x64.rpm && rm jdk-7u80-linux-x64.rpm

# JDK8
RUN curl -O -L -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm
RUN rpm -ivh jdk-8u60-linux-x64.rpm && rm jdk-8u60-linux-x64.rpm

# Maven
RUN curl http://ftp.meisei-u.ac.jp/mirror/apache/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz | tar zx -C /opt
RUN ln -s /opt/apache-maven-3.3.3/bin/mvn /usr/bin/mvn

# JST
RUN \cp --force /usr/share/zoneinfo/Japan /etc/localtime

# alternatives
RUN alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_80/jre/bin/java 17080 \
  --slave /usr/bin/ControlPanel ControlPanel /usr/java/jdk1.7.0_80/jre/bin/ControlPanel \
  --slave /usr/bin/java_vm java_vm /usr/java/jdk1.7.0_80/jre/bin/java_vm \
  --slave /usr/bin/javaws javaws /usr/java/jdk1.7.0_80/jre/bin/javaws \
  --slave /usr/bin/jcontrol jcontrol /usr/java/jdk1.7.0_80/jre/bin/jcontrol \
  --slave /usr/bin/keytool keytool /usr/java/jdk1.7.0_80/jre/bin/keytool \
  --slave /usr/bin/orbd orbd /usr/java/jdk1.7.0_80/jre/bin/orbd \
  --slave /usr/bin/pack200 pack200 /usr/java/jdk1.7.0_80/jre/bin/pack200 \
  --slave /usr/bin/policytool policytool /usr/java/jdk1.7.0_80/jre/bin/policytool \
  --slave /usr/bin/rmid rmid /usr/java/jdk1.7.0_80/jre/bin/rmid \
  --slave /usr/bin/rmiregistry rmiregistry /usr/java/jdk1.7.0_80/jre/bin/rmiregistry \
  --slave /usr/bin/servertool servertool /usr/java/jdk1.7.0_80/jre/bin/servertool \
  --slave /usr/bin/tnameserv tnameserv /usr/java/jdk1.7.0_80/jre/bin/tnameserv \
  --slave /usr/bin/unpack200 unpack200 /usr/java/jdk1.7.0_80/jre/bin/unpack200
RUN alternatives --install /usr/bin/javac javac /usr/java/jdk1.7.0_80/bin/javac 17080 \
  --slave /usr/bin/ControlPanel ControlPanel /usr/java/jdk1.7.0_80/bin/ControlPanel \
  --slave /usr/bin/appletviewer appletviewer /usr/java/jdk1.7.0_80/bin/appletviewer \
  --slave /usr/bin/apt apt /usr/java/jdk1.7.0_80/bin/apt \
  --slave /usr/bin/extcheck extcheck /usr/java/jdk1.7.0_80/bin/extcheck \
  --slave /usr/bin/idlj idlj /usr/java/jdk1.7.0_80/bin/idlj \
  --slave /usr/bin/jar jar /usr/java/jdk1.7.0_80/bin/jar \
  --slave /usr/bin/jarsigner jarsigner /usr/java/jdk1.7.0_80/bin/jarsigner \
  --slave /usr/bin/javadoc javadoc /usr/java/jdk1.7.0_80/bin/javadoc \
  --slave /usr/bin/javafxpackager javafxpackager /usr/java/jdk1.7.0_80/bin/javafxpackager \
  --slave /usr/bin/javah javah /usr/java/jdk1.7.0_80/bin/javah \
  --slave /usr/bin/javap javap /usr/java/jdk1.7.0_80/bin/javap \
  --slave /usr/bin/javaws javaws /usr/java/jdk1.7.0_80/bin/javaws \
  --slave /usr/bin/jcmd jcmd /usr/java/jdk1.7.0_80/bin/jcmd \
  --slave /usr/bin/jconsole jconsole /usr/java/jdk1.7.0_80/bin/jconsole \
  --slave /usr/bin/jcontrol jcontrol /usr/java/jdk1.7.0_80/bin/jcontrol \
  --slave /usr/bin/jdb jdb /usr/java/jdk1.7.0_80/bin/jdb \
  --slave /usr/bin/jhat jhat /usr/java/jdk1.7.0_80/bin/jhat \
  --slave /usr/bin/jinfo jinfo /usr/java/jdk1.7.0_80/bin/jinfo \
  --slave /usr/bin/jmap jmap /usr/java/jdk1.7.0_80/bin/jmap \
  --slave /usr/bin/jmc jmc /usr/java/jdk1.7.0_80/bin/jmc \
  --slave /usr/bin/jmc.ini jmc.ini /usr/java/jdk1.7.0_80/bin/jmc.ini \
  --slave /usr/bin/jps jps /usr/java/jdk1.7.0_80/bin/jps \
  --slave /usr/bin/jrunscript jrunscript /usr/java/jdk1.7.0_80/bin/jrunscript \
  --slave /usr/bin/jsadebugd jsadebugd /usr/java/jdk1.7.0_80/bin/jsadebugd \
  --slave /usr/bin/jstack jstack /usr/java/jdk1.7.0_80/bin/jstack \
  --slave /usr/bin/jstat jstat /usr/java/jdk1.7.0_80/bin/jstat \
  --slave /usr/bin/jstatd jstatd /usr/java/jdk1.7.0_80/bin/jstatd \
  --slave /usr/bin/jvisualvm jvisualvm /usr/java/jdk1.7.0_80/bin/jvisualvm \
  --slave /usr/bin/keytool keytool /usr/java/jdk1.7.0_80/bin/keytool \
  --slave /usr/bin/native2ascii native2ascii /usr/java/jdk1.7.0_80/bin/native2ascii \
  --slave /usr/bin/orbd orbd /usr/java/jdk1.7.0_80/bin/orbd \
  --slave /usr/bin/pack200 pack200 /usr/java/jdk1.7.0_80/bin/pack200 \
  --slave /usr/bin/policytool policytool /usr/java/jdk1.7.0_80/bin/policytool \
  --slave /usr/bin/rmic rmic /usr/java/jdk1.7.0_80/bin/rmic \
  --slave /usr/bin/rmid rmid /usr/java/jdk1.7.0_80/bin/rmid \
  --slave /usr/bin/rmiregistry rmiregistry /usr/java/jdk1.7.0_80/bin/rmiregistry \
  --slave /usr/bin/schemagen schemagen /usr/java/jdk1.7.0_80/bin/schemagen \
  --slave /usr/bin/serialver serialver /usr/java/jdk1.7.0_80/bin/serialver \
  --slave /usr/bin/servertool servertool /usr/java/jdk1.7.0_80/bin/servertool \
  --slave /usr/bin/tnameserv tnameserv /usr/java/jdk1.7.0_80/bin/tnameserv \
  --slave /usr/bin/unpack200 unpack200 /usr/java/jdk1.7.0_80/bin/unpack200 \
  --slave /usr/bin/wsgen wsgen /usr/java/jdk1.7.0_80/bin/wsgen \
  --slave /usr/bin/wsimport wsimport /usr/java/jdk1.7.0_80/bin/wsimport \
  --slave /usr/bin/xjc xjc /usr/java/jdk1.7.0_80/bin/xjc

# clean
RUN yum clean all

ADD entry.sh /

ENTRYPOINT ["/entry.sh"]
