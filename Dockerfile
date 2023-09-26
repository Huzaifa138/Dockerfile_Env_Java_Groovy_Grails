# Base image with Java
FROM openjdk:8-jre

# Set environment variables
ENV GROOVY_VERSION 1.8.6
ENV GRAILS_VERSION 3.0.8
ENV JDK_VERSION 1.8.0_202
ENV GRAILS_HOME /home/dev012/grails
ENV GROOVY_HOME /home/dev012/groovy
ENV JDK_HOME /home/dev012/jdk
ENV PATH $GRAILS_HOME/bin:$GROOVY_HOME/bin:$JDK_HOME/bin:$PATH

# Install Groovy
RUN apt-get update && apt-get install -y unzip
RUN wget -O /tmp/groovy.zip https://dl.bintray.com/groovy/maven/groovy-binary-$GROOVY_VERSION.zip && \
    unzip /tmp/groovy.zip -d /home/dev012/ && \
    mv /home/dev012/groovy-$GROOVY_VERSION $GROOVY_HOME && \
    rm /tmp/groovy.zip

# Install Grails
RUN wget -O /tmp/grails.zip https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip /tmp/grails.zip -d /home/dev012/ && \
    mv /home/dev012/grails-$GRAILS_VERSION $GRAILS_HOME && \
    rm /tmp/grails.zip

# Install JDK
RUN wget -O /tmp/jdk.tar.gz https://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION/jdk-$JDK_VERSION-linux-x64.tar.gz --no-check-certificate --no-cookies && \
    tar -zxvf /tmp/jdk.tar.gz -C /home/dev012/ && \
    mv /home/dev012/jdk-$JDK_VERSION $JDK_HOME && \
    rm /tmp/jdk.tar.gz

