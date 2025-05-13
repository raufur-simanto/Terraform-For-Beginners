## Integration with HashiCorp Vault
### Overview
This integration allows you to use HashiCorp Vault as a secure storage for your secrets.
### Prerequisites
- A HashiCorp Vault instance.
- A Vault token with read access to the secrets you want to use.
### Configuration
1. Install the integration package:
```wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install vault
```
2. Configure the integration:
```vault server -dev -dev-listen-address="0.0.0.0:8200"
   export VAULT_ADDR="http://127.0.0.1:8200"
```