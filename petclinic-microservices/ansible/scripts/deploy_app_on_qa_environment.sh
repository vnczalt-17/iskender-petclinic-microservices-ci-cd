PATH="$PATH:/usr/local/bin"
APP_NAME="petclinic"
sed -i "s/APP_STACK_NAME/${APP_STACK_NAME}/" ./petclinic-microservices/ansible/inventory/qa_stack_dynamic_inventory_aws_ec2.yaml
envsubst < petclinic-microservices/docker-compose-swarm-qa.yml > petclinic-microservices/docker-compose-swarm-qa-tagged.yml
ansible-playbook -i ./petclinic-microservices/ansible/inventory/qa_stack_dynamic_inventory_aws_ec2.yaml -b --extra-vars "workspace=${WORKSPACE} app_name=${APP_NAME} aws_region=${AWS_REGION} ecr_registry=${ECR_REGISTRY}" ./petclinic-microservices/ansible/playbooks/pb_deploy_app_on_qa_environment.yaml