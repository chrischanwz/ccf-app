data "aws_s3_bucket" "billing_data_bucket" {
  bucket = "curtestaunuehg1"
}

data "aws_s3_bucket" "athena_query_results_bucket" {
  bucket = "athenachrisresultsversion1"
}
