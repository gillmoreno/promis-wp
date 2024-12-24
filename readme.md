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

# 4. The fucking permissions on the files for registrazione

```bash
# Change ownership of the registrazione directory and all its contents to match the others
sudo chown -R 82:www-data registrazione/

# Make sure permissions are set correctly
sudo find registrazione/ -type d -exec chmod 755 {} \;
sudo find registrazione/ -type f -exec chmod 644 {} \;

# Do the same for admin directory
sudo chown -R 82:www-data admin/
sudo find admin/ -type d -exec chmod 755 {} \;
sudo find admin/ -type f -exec chmod 644 {} \;
```
