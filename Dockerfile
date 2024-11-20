FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y apache2

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]