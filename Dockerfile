FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget

RUN cd /tmp && wget https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/10852/download?i_agree_to_tenable_license_agreement=true

RUN mv /tmp/download?i_agree_to_tenable_license_agreement=true /tmp/Nesus.deb

RUN dpkg -i /tmp/Nesus.deb 

EXPOSE 8834

ENTRYPOINT [ "/opt/nessus/sbin/nessusd" ]

RUN echo "Then go to https://<your-hostname>:8834/ to configure your scanner"
