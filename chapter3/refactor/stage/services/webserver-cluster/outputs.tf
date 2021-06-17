output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The dns name of the load balancer"
}
