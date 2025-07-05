variable "project_name" {
    default = "expense"
}
variable "environment" {
    default = "dev"
}
variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "ingress-alb"
    }
}
variable "zone_name" {
    default = "lingaiah.online"
 }
 variable "zone_id" {
    default ="Z07608533HHBQHW47XU3F"
  }