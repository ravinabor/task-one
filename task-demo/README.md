#  Infrastructure creation for 2 tier Application using terraform 

## Pre-requisite 
## AWS CLI
## Terraform
## IAM User Crdentials for Access Key ID and Secret Key with least privileges attached 
### Create S3 Backend Bucket
## Configure AWS-CLI , open the terminal on your system and type aws configure provide Acess key ID and secret key id 
 
  ### Create S3 bucket in ap-south-1 reagion to store *.tfstate remotely for backup and recovery
- Give unique name to the bucket
- enable bucket versioning  for backups

 ### Create a Dynamo DB table for state file locking
- Give the table a name
- Make sure to add a `Partition key` with the name `LockID` and type as `String`

**Note**: We will need update the bucket name and dynamo db table name in the code accordingly


 ## Please find the github repository link and clone the repo : 
[![ (https://github.com/ravinabor/hello-world.git)]



### Generate a public-private key pair for our instances
We need a public key and a private key for our server so please follow the procedure I've included below.

```sh
D:\Project\root>  ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (C:\Users\home/.ssh/id_rsa): ./client_key
```
The above command asks for the key name and then gives `client_key` it will create pair of keys one public and one private. you can give any name you want but then you need to edit the Terraform file

edit below file accoding to your configuration
```sh
vim book_shop_app/backend.tf
```
add below code in book_shop_app/backend.tf
```sh
terraform {
  backend "s3" {
    bucket = "BUCKET_NAME"
    key    = "backend/FILE_NAME_TO_STORE_STATE.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamoDB_TABLE_NAME"
  }
}
```
###  Let's set up the variable for Infrastructure
Create one file with the name of `terraform.tfvars` or edit exisinf file
```sh
vim root/terraform.tfvars
```

Add the below content into the `root/terraform.tfvars` file and add the values of each variable.
```javascript
region = ""
project_name = ""
vpc_cidr                = ""
pub_sub_1a_cidr        = ""
pub_sub_2b_cidr        = ""
pri_sub_3a_cidr        = ""
pri_sub_4b_cidr        = ""
pri_sub_5a_cidr        = ""
pri_sub_6b_cidr        = ""
db_username = ""
db_password = ""
endpoint =  ""
aws_ami    = ""
my_ip = ""


```

##  Now we are ready to deploy our application on the cloud ⛅
get into the project directory 
```sh
cd root
```
 let install dependency to deploy the application 

```sh
terraform init 
```

Type the below command to see the plan of the execution 
```sh
terraform plan
```

Finally, HIT the below command to deploy the application...
```sh
terraform apply 
```

Type `yes`, and it will prompt you for approval..

**Thank you**
