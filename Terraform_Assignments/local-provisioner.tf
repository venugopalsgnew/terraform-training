resource "null_resource" "s3_backup_delete" {
  provisioner "local-exec" {
    command = <<EOT
      # Create local backup directory if not exists
      mkdir -p /opt/s3-backup/

      # Copy all files from S3 bucket to local folder
      aws s3 cp s3://datacenter-bck-16584/ /opt/s3-backup/ --recursive

      # Delete all objects inside the S3 bucket
      aws s3 rm s3://datacenter-bck-16584/ --recursive

      # Delete the S3 bucket itself
      aws s3 rb s3://datacenter-bck-16584 --force
    EOT
  }
}


======================================================


resource "aws_s3_bucket" "my_bucket" {
  bucket = "nautilus-cp-19211"
  acl    = "private"

  tags = {
    Name        = "nautilus-cp-19211"
  }
}

resource "null_resource" "copy_file" {
   provisioner "local-exec" {
    command = "aws s3 cp /tmp/nautilus.txt s3://nautilus-cp-19211/"
   }
}


