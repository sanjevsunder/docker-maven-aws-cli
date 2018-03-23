FROM anapsix/alpine-java:jdk8

RUN apk add --update curl tar python py-pip && \
  pip install awscli && \
  rm -rf /tmp/* /var/cache/apk/*

# install Maven
ENV MAVEN_VERSION 3.3.9
RUN mkdir -p /usr/share/maven && \
  curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 && \
  ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 /usr/bin/docker
RUN chmod +x /usr/bin/docker

CMD ["mvn"]
