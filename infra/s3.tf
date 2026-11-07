   resource "aws_s3_bucket" "oms_logs" {
     bucket              = "regmind-oms-logs"
     object_lock_enabled = true
   }

   resource "aws_s3_bucket_object_lock_configuration" "oms_logs" {
     bucket = aws_s3_bucket.oms_logs.id
     rule {
       default_retention {
         mode = "COMPLIANCE"
         days = 730
       }
     }
   }
