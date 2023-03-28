data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "my_vpc" {
  source = "./modules/vpc"
  availability_zone_count = var.availability_zone_count
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_block_offset = var.public_subnet_cidr_block_offset
  private_subnet_cidr_block_offset = var.private_subnet_cidr_block_offset
}

module "security_group" {
  source      = "./modules/security-group"
  lb_sg_name  = "example-alb-security-group"
  ecs_sg_name = "example-task-security-group"
  vpc_id      =  module.my_vpc.vpc_id
  task_sg_id  = module.security_group.task_sg_id
}

module "autoscaling" {
  source = "./modules/app-autoscaling"

  max_capacity         = 5
  min_capacity         = 1
  resource_id          = "service/example-cluster/hello-world-service"
  scalable_dimension   = "ecs:service:DesiredCount"
  service_namespace    = "ecs"
  policy_name          = "dev-to-cpu"
  target_metric_type   = "ECSServiceAverageCPUUtilization"
  target_value         = 0.02
}

module "hello_world_task" {
  source = "./modules/ecs"

  ecs_task_family      = "hello-world-app"
  ecs_service = "hello-world-service"
  ecs_cluster          = "example-cluster"
  ecs_network_mode     = "awsvpc"
  ecs_compatibilities  = ["FARGATE"]
  ecs_task_cpu         = 1024
  ecs_task_memory      = 2048
  ecs_task_role_arn    = "arn:aws:iam::161911848143:role/ecs-test-role"#module.iam-role.role_arn
  ecs_execution_role_arn = "arn:aws:iam::161911848143:role/ecs-test-role"#module.iam-role.role_arn
  container_image      = "161911848143.dkr.ecr.us-east-2.amazonaws.com/demo-python"
  container_cpu        = 1024
  container_memory     = 2048
  container_port       = 8081
  aws_subnet_private_id = module.my_vpc.aws_subnet_private_id
  task_sg_id      = module.security_group.task_sg_id
  aws_lb_target_group_id     = module.alb.aws_lb_target_group_id
}

# module "iam-role" {
#   source = "./modules/iam-role"

#   role_name          = "ECSToECR"
#   assume_role_policy = file("./policies/rolepolicy.json")
#   policy_arns = [
#     "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
#     "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicFullAccess",
#   ]
# }

# # Use the role ARN in other resources that depend on it
# resource "aws_iam_instance_profile" "example" {
#   name = "example-instance-profile"

#   roles = [
#     module.iam-role.role_arn,
#   ]
# }

module "alb" {
  source = "./modules/alb"

  alb_name            = "example-lb"
  alb_subnets         = module.my_vpc.aws_subnet_pub_id
  alb_security_groups = [module.security_group.lb_sg_id]
  target_group_name   = "example-target-group"
  target_group_port   = 8081
  target_group_vpc_id = module.my_vpc.vpc_id
  listener_port       = 80
  listener_protocol   = "HTTP"
  target_group_protocol = "HTTP"
  
}
