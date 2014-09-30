FROM graybullet/jenkins-slave-grunt
MAINTAINER Tomo Masakura <tomo.masakura@gmail.com>

# Install packages.
RUN echo 'Acquire::http::proxy "http://192.168.0.9:3142/";' > /etc/apt/apt.conf.d/30proxy && dpkg --add-architecture i386 && apt-get update && apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 default-jdk ant gradle expect && rm -rf /var/lib/apt/lists /var/cache/apt /etc/apt/apt.conf.d/30proxy

# Set environment variables.
ENV JAVA_HOME /usr/lib/jvm/default-java
RUN echo JAVA_HOME="$JAVA_HOME" >> /etc/environment
ENV ANDROID_HOME /usr/local/android-sdk-linux
RUN echo ANDROID_HOME="$ANDROID_HOME" >> /etc/environment
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
RUN sed -i "s#^\(PATH=\"[^\"]*\)#\1:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools#;" /etc/environment

# Install Android SDK.
ADD tmp/android-sdk_r23.0.2-linux.tgz /usr/local/
ADD updateall /usr/local/android-sdk-linux/
RUN ["bash", "-c", "$ANDROID_HOME/updateall"]

