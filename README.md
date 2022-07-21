# GCP Resource Bucket #

This Terraform project creates a GCP bucket and pushes a local PDF file up for temporary sharing. Anyone on the internet can then download the file with the appropriate link.

## Requirements ##

This project makes uses of a JSON credentials file that is downloaded from the GCP project being used after making a service account. For obvious reasons, this file is not stored in version control.

This project requires the use of a `terraform.tfvars` file. This file contains several variables for configuring the bucket. Likewise, this file is not commited to version control. Below are the variables used in this file:

```
  project          = <name_of_project>
  credentials_file = <path_to_JSON_credentials_file>
  resource_name    = <name_of_resource>
  resource_path    = <path_to_resource>
  bucket_name      = <name_of_bucket>
```