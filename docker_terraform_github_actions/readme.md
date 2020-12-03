This project is from Brad's YouTube page [here](https://www.youtube.com/watch?v=OXE2a8dqIAI&feature=youtu.be)

#### Steps
- Run Mongo DB in a docker container in the background
```bash
docker run -p 27017:27017 -d mongo:3.6-xenial
```

- Create Google Oauth ID and Secret from a Google project and add it to `config.env`

- Create a `Dockerfile` and a `docker-compose.yml` file to run mongo also.

- Create a `Makefile` to store commands. See it as a way to store a bunch of different shell commands

### Terraform
When tf is run, it produces a state file which can contain sensitive information. Because of this, it's better not to store this locally, instead configure a remote backend. In this case, Google Cloud Storage (GCS), where the state file is stored in a bucket. That way we can protect it with IAM.
```bash
terraform {
  backend "gcs" {
    bucket = "bucket_name"
    prefix = "bucket_prefix"
  }
}
```

The bucket is created running the command `make create-tf-backend-bucket` using the Makefile before it can be used in the tf code for GCS.

- Create a service account to grant tf permissions to interact with Google Cloud. Then, save the credentials (terraform-sa-key.json).

- Set `GOOGLE_APPLICATION_CREDENTIALS` env so Google can authenticate correctly.
```bash
export GOOGLE_APPLICATION_CREDENTIALS=<$PWD>/terraform-sa-key.json
```

- Run `terraform init` which will initialize the working directory and store the state file in Google Cloud. You can verify by checking `Storage` on GC.

- There's a need to separate into different envs as it is initialized in the default workspace by creating a new `Make target`.
Create a workspace:
```bash
terraform-create-workspace:
	terraform workspace new ${ENV}
```
Re-initialze tf:
```bash
terraform workspace select ${ENV} && \
	terraform init
```
`${ENV}` being either `staging` or `production`.

- Proceed to create a tf file for every provider (gcp, atlas...)
Note: You'll need to always run the `make terraform-init` command for every time you add a module or change the providers within your terraform configuration.
Resource: a resource block is a resource being created.
Data: a data block is a reference to an already existing resource.
