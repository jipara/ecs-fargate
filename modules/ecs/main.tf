resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster
}

resource "aws_ecs_service" "hello_world" {
  name            = var.ecs_service
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.hello_world.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [var.task_sg_id]
    subnets         = var.aws_subnet_private_id
  }

  load_balancer {
    target_group_arn = var.aws_lb_target_group_id
    container_name   = "hello-world-app"
    container_port   = 8081
  }

  /* alarms {
    enable   = true
    rollback = true
    alarm_names = [
      aws_cloudwatch_metric_alarm.example.alarm_name
    ]
  } */

  #depends_on = [aws_lb_listener.hello_world]
}

resource "aws_ecs_task_definition" "hello_world" {
  family                   = var.ecs_task_family
  network_mode             = var.ecs_network_mode
  requires_compatibilities = var.ecs_compatibilities
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  task_role_arn            = var.ecs_task_role_arn
  execution_role_arn       = var.ecs_execution_role_arn

  container_definitions = jsonencode([{
    image        = var.container_image
    cpu          = var.container_cpu
    memory       = var.container_memory
    name         = "hello-world-app"
    networkMode  = var.ecs_network_mode
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.container_port
      protocol      = "tcp"
    }]
  }])
}
