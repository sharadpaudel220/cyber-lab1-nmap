FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server apache2 curl && \
    mkdir /var/run/sshd

RUN echo "<h1>CyberSecurity Lab Target</h1>" > /var/www/html/index.html

RUN echo -e "#!/bin/bash\nwhile true; do echo 'Fake Service Running'; sleep 2; done" > /usr/local/bin/fake_service.sh && \
    chmod +x /usr/local/bin/fake_service.sh

EXPOSE 22 80 9090

CMD service ssh start && \
    service apache2 start && \
    /usr/local/bin/fake_service.sh
