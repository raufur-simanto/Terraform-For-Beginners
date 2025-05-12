## workspace
### workspace commands:
    - terraform workspace new <workspace-name>
    - terraform workspace select <workspace-name>
    - terraform workspace list
    - terraform workspace show # current workspace
    - terraform workspace delete <workspace-name>
### select specific tfvars file
    - terraform apply -var-file=<tfvar-file-name>