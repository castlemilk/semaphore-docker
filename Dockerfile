FROM centos:7.2.1511

LABEL \
	name="Ansible Semaphore" \
	version="2.2.0"

ADD target_filesystem/ /

RUN yum -y install \
			ansible \
			wget \
                        epel-release \
			&& \
                rpm -U http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm && \
                yum install -y git && \
                yum -y install \
                        python-pip \
                        gcc \
                        python-devel \
                        openssl-devel \ 
                        mysql \
                        && \
                pip install shade && \
		wget "https://github.com/ansible-semaphore/semaphore/releases/download/v2.2.0/semaphore_linux_amd64" && \
		mv semaphore_linux_amd64 /usr/bin/semaphore && \
		mkdir -p  /opt/data/semaphore/ && \
		chmod +x  /usr/bin/semaphore && \
		chmod +x  /opt/semaphore/start.sh && \
		touch /firstrun

# Ports
EXPOSE 3000

WORKDIR /opt/semaphore
ADD semaphore-startup.sh /usr/bin/semaphore-startup.sh
ENTRYPOINT ["/usr/bin/semaphore-startup.sh"]


# Default Command
#CMD ["/bin/bash", "-c", "/opt/semaphore/start.sh"]
CMD ["/usr/bin/semaphore", "-config", "/etc/semaphore/semaphore_config.json"]
