# The below is the terraform code for provisioning S3 bucket along with life cycle policies created on bucket

resource "aws_s3_bucket" "imports3" {
    bucket                     = var.bucket_name
    tags                        = {
        Name                   = var.bucket_name
        application            = var.application
        built_by               = var.built_by
        costcenter             = var.costcenter
        group                  = var.group
        application_owner      = var.application_owner
        environment            = var.environment
        finance_contact        = var.finance_contact
        application_support    = var.application_support
        infrastructure_support = var.infrastructure_support
        dd_auto_discovery      = var.dd_auto_discovery
        hfm_entity             = var.hfm_entity
        rightsizing_exception  = var.rightsizing_exception
        project_number         = var.project_number
        compliance             = var.compliance
        tranche                = var.tranche
        division               = var.division
        }

    lifecycle_rule {
        abort_incomplete_multipart_upload_days = 1
        enabled                                = true
        id                                     = "Standard2Glacier"
        tags                                   = {}

        expiration {
            days                         = 0
            expired_object_delete_marker = true
        }

        transition {
            days          = 365
            storage_class = "DEEP_ARCHIVE"
        }
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}

#The below resource code making of S3 bucket public access denied
resource "aws_s3_bucket_public_access_block" "imports3" {
    block_public_acls       = true
    block_public_policy     = true
    bucket                  = aws_s3_bucket.imports3.id
    ignore_public_acls      = true
    restrict_public_buckets = true
}

#The below resource code adding bucket policies, so that bucket can be accessed from the list of ARN's specified in this resource

resource "aws_s3_bucket_policy" "imports3" {
  depends_on            = [aws_s3_bucket_public_access_block.imports3]
  bucket = aws_s3_bucket.imports3.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "accesstobucket",
            "Effect": "Allow",
            "Principal": {
                "AWS": [ "${join("\", \"", var.arns)}"]
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.imports3.id}",
                "arn:aws:s3:::${aws_s3_bucket.imports3.id}/*"
            ]
        }
    ]
}
POLICY
}



# The below resource configuring analytics configuration on s3 bucket

resource "aws_s3_bucket_analytics_configuration" "my-bucket-entire-bucket" {
    bucket = aws_s3_bucket.imports3.id 
    name   = "s3Analytics_${aws_s3_bucket.imports3.id}"

    storage_class_analysis {
        data_export {
            output_schema_version = "V_1"

            destination {
                s3_bucket_destination {
                    bucket_arn = "arn:aws:s3:::tfsdl-corp-s3analytics-test"
                    format     = "CSV"
                    prefix     = aws_s3_bucket.imports3.id
                }
            }
        }
    }
}


