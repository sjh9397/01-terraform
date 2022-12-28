#!/bin/bash

cat > index.html <<EOF
<h1>hello, World<h/1>
EOF

nohup busybox httpd -f -p ${server_port} &
