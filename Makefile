init:
	cd terraform && terraform init \
		-backend-config="access_key=$(SPACES_ACCESS_KEY)" \
		-backend-config="secret_key=$(SPACES_SECRET_KEY)"

plan:
	cd terraform && terraform plan \
		-var="do_token=$(DO_TOKEN)"

apply:
	cd terraform && terraform apply \
		-var="do_token=$(DO_TOKEN)"

destroy:
	cd terraform && terraform destroy \
		-var="do_token=$(DO_TOKEN)"
