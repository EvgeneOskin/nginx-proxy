FROM nginx:alpine

ADD app.conf /etc/nginx/
ADD run.sh /etc/nginx/

RUN mkdir -p /opt/www/static
RUN mkdir -p /etc/nginx/html/ \
    && echo '<!doctype html><html>50x</html>' >> /etc/nginx/html/50x.html

CMD /etc/nginx/run.sh

EXPOSE 80
EXPOSE 443
