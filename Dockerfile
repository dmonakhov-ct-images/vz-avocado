FROM virtuozzo/vz7-minimal
MAINTAINER dmonakhov@gmail.com

COPY files /tmp/files
RUN yum install -y python-pip rsync openssh-clients && \
    pip install /tmp/files/pkg/avocado-* && \
    install -v -o root /tmp/files/etc/avocado/conf.d/resultsdb.conf /etc/avocado/conf.d && \
    install -v -o root /tmp/files/etc/avocado/conf.d/result_upload.conf /etc/avocado/conf.d && \
    install -v -o root -m 644 /tmp/files/bin/avrun /usr/bin/avrun && \
    mkdir /root/.ssh && \
    curl http://autotest.qa.sw.ru/pub/qanet-rsa > /root/.ssh/id_rsa && \
    curl http://autotest.qa.sw.ru/pub/qanet-rsa.pub > /root/.ssh/id_rsa.pub && \
    chmod 600 -R /root/.ssh/ && \
    rm -rf /tmp/files && \
    yum clean all
