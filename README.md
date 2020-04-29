# Terraform: Email Notifications of unencrypted S3 Buckets

This Terraform repository would provide a lambda which will scan S3 Buckets and turn off public access (Public Block Access ACL enforced and turned on). This lambda requires access to SSM Parameter.

## Overview

![Image](s3public.png?raw=true)

You can also follow the following [guideline](https://medium.com/@obutterbach/enforcing-public-block-access-on-s3-bucket-automatically-9b4a167ce650) for more information

## Installation

This is controlled and deployed by Terraform, just indicate the source module in the root of this repository. This module requires access to the following SSM parameter (StringList):
- `s3-public-exception-list`

If this exception list is missing, this lambda would stop running prematurely

Indicate the list of recipient's email address in your SSM parameter (StringList):
- `default-destination-emails`

Indicate the sender email address in your SSM parameter:
- `default-source-email`

## Usage

As an example, lets deploy this Lambda in main AWS account.

```hcl
module "s3-public-lambda" {
  source = "./modules/s3-scan-public"

  filename = "s3-public-payload.zip"
}
```

## Tests

`s3_public.py` is being tested by `pylint` and `pytest`. If you do any changes, Please run the following commands:
- `pytest .`
- `pylint s3_public.py`

## Deployment

As explained previously, this lambda is deployed by Terraform. All lambdas of this repository are tested and packaged by the script:
```bash
cd modules
./python_packages.sh
```

Run then the following:

- `terraform init`

Finally, deploy as follow:

- `terraform apply`
