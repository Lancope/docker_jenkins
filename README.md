# Jenkins with Docker #

Allows builds to utilize docker. Includes fig too.
Obviously, this utilizes docker in docker.

To run:

    docker run -d -t -p 443:443 --privileged=true -v /var/lib/jenkins:/var/lib/jenkins -v /var/lib/jenkins_docker:/var/lib/docker lancope/jenkins
