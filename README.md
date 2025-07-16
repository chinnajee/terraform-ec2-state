1. Create a backend source (S3 bucker and DynamoDB Table via aws commands

# S3 Bucket (replace your-bucket-name)

aws s3api create-bucket --bucket chinna1-terraform-state-bucket --region us-east-1

# DynamoDB Table (for locking)

aws dynamodb create-table \

  --table-name terraform-locks \
  
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  
  --key-schema AttributeName=LockID,KeyType=HASH \
  
  --billing-mode PAY_PER_REQUEST

=================================================

2. Add Remote State to Each Environment

cat envs/dev/backend.tf


terraform {

  backend "s3" {
  
    bucket         = "chinna1-terraform-state-bucket"
    
    key            = "dev/terraform.tfstate"
    
    region         = "us-east-1"
    
    dynamodb_table = "terraform-locks"
    
    encrypt        = true

  }

}



terraform-project/

├── envs/

|
│   ├── dev/

|   |

│   │   ├── main.tf

|   |   |

│   │   ├── variables.tf

|   |   |

│   │   ├── terraform.tfvars

|   |   |

│   │   ├── backend.tf      <-- New

|   |  

│   ├── stage/

|   |

│   ├── prod/

...

===============================================

3. Run terraform commands

cd envs/dev

terraform init

terraform apply


or

cd ../..

terraform -chdir=envs/dev init

terraform -chdir=envs/dev plan

terraform -chdir=envs/dev apply --auto-approve

terraform -chdir=envs/dev destroy --auto-approve

======================================================

⚙️ cat .gitignore


.git

.terraform

*.tfstate

*.tfstate.*

.terraform.lock.hcl
