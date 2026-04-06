resource "aws_s3_bucket" "s3b234" {
bucket = "terra-bucket-2345"
}

resource "aws_s3_bucket_ownership_controls"  "bucketowner" {

bucket = aws_s3_bucket.s3b234.id

rule{
object_ownership = "BucketOwnerPreferred"
}
}

resource "aws_s3_bucket_acl" "buckacl" {
bucket = aws_s3_bucket.s3b234.id
depends_on = [aws_s3_bucket_ownership_controls.bucketowner]
acl = "private"
}

resource "aws_s3_bucket_public_access_block" "publock" {
bucket = aws_s3_bucket.s3b234.id
block_public_acls = true
block_public_policy = true
ignore_public_acls = true
restrict_public_buckets = true

}


resource "aws_s3_bucket_versioning" "vers" {
bucket = aws_s3_bucket.s3b234.id

versioning_configuration {
status = "Enabled"
}
}

terraform {
backend "s3" {
region = "us-east-1"
bucket = "terra-bucket-2345"
key = "prod/terraform.tfstate"
}
}
