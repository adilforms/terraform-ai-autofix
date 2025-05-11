resource "aws_s3_bucket" "bucket" {
  bucket = "example-bucket-name"
  acl    = "private"

  lifecycle_rule {
    id      = "bucket-lifecycle-rule"
    status  = "Enabled"
    enabled = true

    expiration {
      days = 365
    }

    noncurrent_version_expiration {
      days = 30
    }
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = "example-bucket-name"
  key          = "index.html"
  content      = "
    <html>
      <body>
        <h1>Hello, AI</h1>
        <p>AI can now create a PR</p>
      </body>
    </html>
    "
  acl          = "public-read"
  content_type = "text/html"
}