PROJECT_ID=devops-traversy-297413

run-local:
	docker-compose up

###

create-tf-backend-bucket:
	gsutil mb -p ${PROJECT_ID} gs://${PROJECT_ID}-terraform

###

ENV=staging

terraform-create-workspace:
	# because Makefile is in the parent directory, we need to cd into terraform first
	cd terraform && \
		terraform workspace new ${ENV}

terraform-init:
	cd terraform && \
		terraform workspace select ${ENV} && \
		terraform init

terraform-plan:
	cd terraform && \
		terraform workspace select ${ENV} && \
		terraform plan \
		-var-file="./environments/common.tfvars" \
		-var-file="./environments/${ENV}/config.tfvars"

TF_ACTION?=plan
terraform-action:
	cd terraform && \
		terraform workspace select ${ENV} && \
		terraform ${TF_ACTION} \
		-var-file="./environments/common.tfvars" \
		-var-file="./environments/${ENV}/config.tfvars"
