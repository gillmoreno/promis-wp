# chmod 400 "promise-key.pem"

ssh -i promise-key.pem ec2-user@35.152.140.218

# scp -i promise-key.pem admin.zip ec2-user@15.161.127.104:/mnt/efs/fs1/promis-wp
# scp -i promise-key.pem registrazione.zip ec2-user@15.161.127.104:/mnt/efs/fs1/promis-wp
