FROM partlab/ubuntu-jenkins

RUN curl -sSL https://get.docker.com/ | sh

CMD /usr/sbin/service docker start && /usr/bin/java -jar /usr/share/jenkins/jenkins.war
