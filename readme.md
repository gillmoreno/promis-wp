# Setup docker

# Setup git

# Setup SSL certificates

Run docker-compose -f docker-compose.cert.yaml up

# NGINX files permissions inside wp_nginx

# Set permissions on the EFS mount point first

sudo chown -R 101:101 /mnt/efs/fs1/wordpress
sudo chmod -R 755 /mnt/efs/fs1/wordpress

# Set permissions for certbot

sudo chown -R 101:101 /var/www/certbot
sudo chmod -R 755 /var/www/certbot

# Note: If still getting 403 errors, verify:

# 1. EFS mount is working: df -h | grep efs

# 2. Files exist in the mount: ls -la /mnt/efs/fs1/wordpress

# 3. SELinux/AppArmor settings if applicable
