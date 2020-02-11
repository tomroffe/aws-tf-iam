PROJECT=iam
NAME=herkules
ENVIRONMENT=shared

init:
	@echo "${PROJECT}/${ENVIRONMENT}"
	@terraform init -backend=true -backend-config='environments/${ENVIRONMENT}/backend.tfvars' -lock=true

bootstrap:
	@cd tools/state-locking && terraform init
	@cd tools/state-locking && terraform plan -out plan.tfout
	@cd tools/state-locking && terraform apply -auto-approve "plan.tfout" 

plan:
	terraform plan -lock=true -out=plan.tfout -var-file='environments/${ENVIRONMENT}/inputs.tfvars' .

import:
	terraform import -var-file='environments/${ENVIRONMENT}/inputs.tfvars' ${RESOURCE_TFPATH} ${RESOURCE_ID}

apply:
	terraform apply "plan.tfout"

destroy:
	terraform destroy -var-file='environments/${ENVIRONMENT}/inputs.tfvars' .

validate:
	@terraform validate

clean:
	rm -f plan.tfout

clean-all: clean 
	rm -rf .terraform

format:
	@terraform fmt

PHONY: init validate format

