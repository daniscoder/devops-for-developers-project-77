init:
	cd terraform && terraform init \
		-backend-config="access_key=$(SPACES_ACCESS_KEY)" \
		-backend-config="secret_key=$(SPACES_SECRET_KEY)"

plan:
	cd terraform && terraform plan \
		-var="do_token=$(DO_TOKEN)" \
		-var="datadog_api_key=$(DATADOG_API_KEY)" \
		-var="datadog_app_key=$(DATADOG_APP_KEY)"

apply:
	cd terraform && terraform apply \
		-var="do_token=$(DO_TOKEN)" \
		-var="datadog_api_key=$(DATADOG_API_KEY)" \
		-var="datadog_app_key=$(DATADOG_APP_KEY)"

destroy:
	cd terraform && terraform destroy \
		-var="do_token=$(DO_TOKEN)" \
		-var="datadog_api_key=$(DATADOG_API_KEY)" \
		-var="datadog_app_key=$(DATADOG_APP_KEY)"

install:
	ansible-galaxy install -r ansible/requirements.yml

setup:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --tags setup --ask-vault-pass

deploy:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --tags deploy --ask-vault-pass

monitoring:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --tags monitoring --ask-vault-pass
