FROM lancope/java:8

ENV LAST_APT_DOCKER_FETCH 20141205

RUN echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN apt-get update -o Dir::Etc::sourcelist="sources.list.d/docker.sources.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
RUN apt-get install -yq lxc-docker

ENV LAST_APT_JENKINS_FETCH 20141205

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.sources.list
RUN apt-get update -o Dir::Etc::sourcelist="sources.list.d/jenkins.sources.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
RUN apt-get install -yq --force-yes jenkins

RUN apt-get install -yq curl

VOLUME ["/var/lib/docker", "/var/lib/jenkins"]
ENV JENKINS_HOME /var/lib/jenkins
EXPOSE 443

ADD run /usr/local/bin/run
RUN chmod a+x /usr/local/bin/run
CMD /usr/local/bin/run
