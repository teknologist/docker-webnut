#!/usr/bin/env bash
set -xe


upshost="${UPS_HOST:-127.0.0.1}"
upsport="${UPS_PORT:-3493}"
upsuser="${UPS_USER:-monuser}"
upspassword="${UPS_PASSWORD:-secret}"

echo "server = '$upshost'" > /app/webNUT/webnut/config.py
echo "port = '$upsport'" >> /app/webNUT/webnut/config.py
echo "username = '$upsuser'" >> /app/webNUT/webnut/config.py
echo "password = '$upspassword'" >> /app/webNUT/webnut/config.py

cat /app/webNUT/webnut/config.py

cd /app/webNUT && python setup.py install

cd webnut
exec pserve ../production.ini
