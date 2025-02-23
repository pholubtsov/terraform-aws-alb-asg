#!/bin/bash

# Install nginx
apt-get update
apt-get install -y nginx
systemctl enable nginx

# Create a script to update the index.html file
mkdir -p /usr/local/bin/my-scripts
echo '#!/bin/bash' > /usr/local/bin/my-scripts/update-index-html.sh
echo 'echo "Server: $(hostname -f) </br>" > /var/www/html/index.html' >> /usr/local/bin/my-scripts/update-index-html.sh
echo 'echo "Server time: $(date)" >> /var/www/html/index.html' >> /usr/local/bin/my-scripts/update-index-html.sh
chmod +x /usr/local/bin/my-scripts/update-index-html.sh

# Add a cron job to update the index.html file every minute
echo "*/1 * * * * root /usr/local/bin/my-scripts/update-index-html.sh" > /etc/cron.d/update-index-html-job
systemctl restart cron