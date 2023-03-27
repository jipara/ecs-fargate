module "security_group" {
  source      = "./security-group"
  lb_sg_name  = "example-alb-security-group"
  task_sg_name = "example-task-security-group"
  vpc_id      = aws_vpc.default.id
}

module "autoscaling" {
  source = "./app-autoscaling"

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
  ecs_network_mode     = "awsvpc"
  ecs_compatibilities  = ["FARGATE"]
  ecs_task_cpu         = 1024
  ecs_task_memory      = 2048
  ecs_task_role_arn    = aws_iam_role.ECSToECR.arn
  ecs_execution_role_arn = aws_iam_role.ECSToECR.arn
  container_image      = "844024018158.dkr.ecr.us-east-1.amazonaws.com/demo-repo:latest"
  container_cpu        = 1024
  container_memory     = 2048
  container_port       = 8081
}

module "iam-role" {
  source = "./iam-role"

  role_name          = "ECSToECR"
  assume_role_policy = file("rolepolicy.json")
  policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicFullAccess",
  ]
}

# Use the role ARN in other resources that depend on it
resource "aws_iam_instance_profile" "example" {
  name = "example-instance-profile"

  roles = [
    module.iam-role.role_arn,
  ]
}

module "alb" {
  source = "./modules/alb"

  alb_name            = "example-lb"
  alb_subnets         = aws_subnet.public.*.id
  alb_security_groups = [aws_security_group.lb.id]
}

module "my_vpc" {
  source = "./module/vpc"
  availability_zone_count = var.availability_zone_count
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_block_offset = var.public_subnet_cidr_block_offset
  private_subnet_cidr_block_offset = var.private_subnet_cidr_block_offset
}