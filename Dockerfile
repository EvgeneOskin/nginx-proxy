FROM nginx:alpine

ADD app.conf /etc/nginx/
ADD run.sh /etc/nginx/

RUN mkdir -p /opt/www/static

CMD /etc/nginx/run.sh

EXPOSE 80
EXPOSE 443
