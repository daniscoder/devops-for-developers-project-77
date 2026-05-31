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

install:
	ansible-galaxy install -r ansible/requirements.yml

setup:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --tags setup --ask-vault-pass

deploy:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --tags deploy --ask-vault-pass
