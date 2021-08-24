FROM alpine

ENV REALM="DEV"

RUN apk add --update krb5-server krb5

COPY principals.txt /tmp/principals.txt

COPY conf/krb5.conf /etc/krb5.conf
COPY conf/kadm5.acl /etc/kadm5.acl
COPY conf/kdc.conf /var/lib/krb5kdc/kdc.conf

COPY bin/init.sh /init.sh
COPY bin/entrypoint.sh /entrypoint.sh
COPY bin/create-principals.sh /create-principals.sh

RUN chmod 755 /init.sh /entrypoint.sh /create-principals.sh

EXPOSE 88 464 749
CMD ["/entrypoint.sh"]
