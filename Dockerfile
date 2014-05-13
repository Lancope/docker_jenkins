FROM zaiste/jenkins

RUN echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.sources.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN apt-get update -o Dir::Etc::sourcelist="sources.list.d/docker.sources.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
RUN apt-get install -yq lxc-docker

VOLUME /var/lib/docker

ADD run /usr/local/bin/run_with_docker
RUN chmod a+x /usr/local/bin/run_with_docker
CMD /usr/local/bin/run_with_docker
