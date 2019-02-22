FROM konradkleine/docker-registry-frontend:v2

# conf
RUN sed -i \
      -e 's#<Location "/"#<Location /#' \
      -e 's#<Location />#<Location /repo>#' \
      -e 's# /v2/# /repo/v2/#' \
      -e '/<\/VirtualHost>/i ProxyPass /gitbucket http://gitbucket:8080/gitbucket' \
      -e '/<\/VirtualHost>/i ProxyPassReverse /gitbucket http://gitbucket:8080/gitbucket' \
      -e '/<\/VirtualHost>/i ProxyPass /jenkins http://jenkins:8080/jenkins' \
      -e '/<\/VirtualHost>/i ProxyPassReverse /jenkins http://jenkins:8080/jenkins' \
      /etc/apache2/sites-available/docker-site.conf && \
    sed -i \
      -e 's#<base href="/">#<base href="/repo/">#g' \
      /var/www/html/index.html && \
    ln -s /var/www/html /var/www/html/repo

EXPOSE 80 443

VOLUME ["/etc/apache2/server.crt", "/etc/apache2/server.key"]

CMD /root/start-apache.sh
