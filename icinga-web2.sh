docker run \
  -d \
  --name icingaweb2 \
  -p 8080:80 \
  --add-host icinga2:192.168.56.100 \
  -e TIMEZONE=Europe/Berlin \
  -e ICINGA_API_PASS=1234 \
  -e WEB_DB_USER=icingaweb \
  -e WEB_DB_PASS=icinga \
  -e WEB_DB=icingaweb \
  -e WEB_DB_HOST=192.168.56.100 \
  -e IDO_DB_USER=icinga \
  -e IDO_DB_PASS=icinga \
  -e IDO_DB=icinga \
  -e IDO_DB_HOST=192.168.56.100 \
  -e DIRECTOR_DB=director \
  -e DIRECTOR_INSERT_DEFAULTS=true \
  psitrax/icingaweb2
