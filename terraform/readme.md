This project follows Free Code Camp's tutorial on [Terraform](https://www.youtube.com/watch?v=SLB_c_ayRMo)


#### Terraform Commands
- Initialize TF to download the specified provider(s) resources
```bash
terraform init
```

- Visualize changes or additions to be made/applied to verify if it's correct
```bash
terraform plan
```

- Apply changes to your provider. It also runs `terraform plan`.
```bash
terraform apply
```
Arguments are
1. `--auto-approve` so as not to type "yes" e.g `terraform apply --auto-approve`
2. `-var "<var_name/key> = <value>"` if you want to pass the variable to the command line e.g `terraform apply -var "subnet_prefix=10.0.1.0/24"`
3. `-var-file` to attach a variable file if it isn't named `terraform.tfvars` e.g `terraform apply --auto-approve -var-file example.tfvars`
4. `-target <resource>.<name>` to apply just a particular resource e.g `terraform apply -target aws_instance.web_server_instance`

- Destroy or delete the resources created with TF.
```bash
terraform destroy
```
Similar arguments to the `apply` command.
```bash
terraform destroy -target aws_instance.web_server_instance
```

- Returns or logs any output(s) defined in the TF files
```bash
terraform output
```

- This modifies the state file if there's a need by checking the infrastructure
```bash
terraform refresh
```

- Prints out the details about a resource
```bash
terraform state
```
Arguments:
1. list all applied resources in the infrastructure e.g `terraform state list`
2. show details about a specific resource e.g `terraform state show <resource_name>` -> `terraform state show aws_eip.one`


- If confused or not sure of the command to run, list out all available TF commands
```bash
terraform
```
