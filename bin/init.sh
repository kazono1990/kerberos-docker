#!/bin/sh

KEYTAB_DIR="/etc/security/keytabs"
PRINCIPAL_LIST="/tmp/principals.txt"

kadmin.local -q "add_principal -randkey admin/admin"
mkdir -p $KEYTAB_DIR

kdb5_util create -r "$REALM" -s -P SuperSecretPassword

/create-principals.sh /tmp/principals.txt
