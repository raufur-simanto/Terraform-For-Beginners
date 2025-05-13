provider "aws" {
  region = "us-east-1"      
  
}

provider "vault" {
  address = "<>:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = ""
      secret_id = ""
    }
  }
}

data "vault_kv_secret_v2" "my_secret" {
    mount = "kv"
    name = "new-secret"
}    

resource "aws_instance" "web" {
    ami           = "" 
    instance_type = "t2.micro"
    
    tags = {
        Secret = data.vault_kv_secret_v2.my_secret.data["username"]
    }
    
   
}
