
        resource "aws_s3_bucket" "bucket" {
          bucket = "example-bucket-name"
          acl    = "private"

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
        
