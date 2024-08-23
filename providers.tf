provider "google" {
  project = "cauthen-sandbox"
  region  = "us-west1"
  zone    = "us-west1-a"
}

provider "google" {
 alias = "impersonation"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}