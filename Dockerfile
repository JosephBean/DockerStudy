FROM ubuntu:24.04

RUN apt-get update
RUN apt-get install -y apache2

RUN echo '<html><head><meta charset="UTF-8"></head><body><h1>안녕하세요.</h1></body></html>' > /var/www/html/index.html

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]