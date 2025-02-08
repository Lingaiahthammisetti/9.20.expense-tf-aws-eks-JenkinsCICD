module "jenkins-master" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    name ="${var.project_name}-${var.environment}-jenkins-master"
    instance_type = "t3.micro"
    vpc_security_group_ids = [data.aws_ssm_parameter.jenkins_sg_id.value]

    #Convert StringList to list and get first element
    #subnet_id = element(split(",",data.aws_ssm_parameter.public_subnet_ids.value),0)
    subnet_id = local.public_subnet_id

    #user_data = file("install_jenkins_master.sh")
    user_data  = file("${path.module}/install_jenkins_master.sh")
    ami   = data.aws_ami.ami_info.id
    tags =merge(
        var.common_tags,
        {
            name ="${var.project_name}-${var.environment}-jenkins-master"
        }
    ) 
}
module "jenkins-agent" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    name ="${var.project_name}-${var.environment}-jenkins-agent"
    instance_type = "t3.micro"
    vpc_security_group_ids = [data.aws_ssm_parameter.jenkins_sg_id.value]

    #Convert StringList to list and get first element
    #subnet_id = element(split(",",data.aws_ssm_parameter.public_subnet_ids.value),0)
    subnet_id = local.public_subnet_id

    #user_data = file("install_jenkins_agent.sh")
    user_data  = file("${path.module}/install_jenkins_agent.sh")
    ami   = data.aws_ami.ami_info.id
    tags =merge(
        var.common_tags,
        {
            name ="${var.project_name}-${var.environment}-jenkins-agent"
        }
    )
}
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"
  zone_name = var.zone_name


records = [
      {
        name = "jenkins_master"
        type = "A"
        ttl  = 1
        records = [
          module.jenkins-master.public_ip
        ]
       # allow_overwrite = true
      },
      {
        name = "jenkins_agent"
        type = "A"
        ttl  = 1
        records = [
          module.jenkins-agent.public_ip
        ]
        #allow_overwrite = true
       } 
   ]
}
