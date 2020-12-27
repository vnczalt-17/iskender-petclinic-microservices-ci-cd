PATH="$PATH:/usr/local/bin"
APP_NAME="petclinic"
envsubst < petclinic-microservices/docker-compose-swarm-dev.yml > petclinic-microservices/docker-compose-swarm-dev-tagged.yml
ansible-playbook -i ./petclinic-microservices/ansible/inventory/dev_stack_dynamic_inventory_aws_ec2.yaml -b --extra-vars "workspace=${WORKSPACE} app_name=${APP_NAME} aws_region=${AWS_REGION} ecr_registry=${ECR_REGISTRY}" ./petclinic-microservices/ansible/playbooks/pb_deploy_app_on_docker_swarm.yaml