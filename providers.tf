locals {
 terraform_service_account = "terraform@cauthen-sandbox.iam.gserviceaccount.com"
}

provider "google" {
 alias = "impersonation"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}

data "google_service_account_access_token" "default" {
 provider               	= google.impersonation
 target_service_account 	= local.terraform_service_account
 scopes                 	= ["userinfo-email", "cloud-platform"]
 lifetime               	= "1200s"
}

provider "google" {
 project 		= "cauthen_sandbox"
 region     = "us-west1"
 zone       = "us-west1-a"
 access_token	= data.google_service_account_access_token.default.access_token
 request_timeout 	= "60s"
}