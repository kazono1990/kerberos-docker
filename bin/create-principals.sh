#!/bin/sh

PRINCIPALS=$1
KEYTAB_DIRECTORY="/etc/security/keytabs"

cat $PRINCIPALS | while read line; do
  PRINCIPAL=$(echo "$line" | awk '{print $1}')
  KEYTAB=$(echo "$line" | awk '{print $2}')
  kadmin.local -q "add_principal -randkey $PRINCIPAL"
  kadmin.local -q "ktadd -k $KEYTAB_DIRECTORY/$KEYTAB $PRINCIPAL"
done
