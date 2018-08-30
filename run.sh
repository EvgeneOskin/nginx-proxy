#!/bin/sh -u

envsubst "\${HOST_NAME} \${APP_UPSTREAM}" < /etc/nginx/app.conf > /etc/nginx/conf.d/app.conf
if [ -n "${SUPPORT_UPGRADE:-}" ]; then
cat >> /etc/nginx/conf.d/app.conf <<EOF
proxy_set_header Upgrade \$http_upgrade;
proxy_set_header Connection "upgrade";
EOF
fi

nginx -g 'daemon off;'
