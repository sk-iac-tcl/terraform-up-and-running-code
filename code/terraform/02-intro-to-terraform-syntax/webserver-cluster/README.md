# Web Server Example

This folder contains example [Terraform](https://www.terraform.io/) templates that deploy a cluster of web servers 
(using [EC2](https://aws.amazon.com/ec2/) and [Auto Scaling](https://aws.amazon.com/autoscaling/)) and a load balancer
(using [ELB](https://aws.amazon.com/elasticloadbalancing/)) in an [Amazon Web Services (AWS) 
account](http://aws.amazon.com/). The load balancer listens on port 80 and returns the text "Hello, World" for the 
`/` URL.

For more info, please see Chapter 2, "Getting started with Terraform", of 
*[Terraform: Up and Running](http://www.terraformupandrunning.com)*.

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer. 
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

## 주의사항
[https://www.terraform.io/docs/providers/aws/d/availability_zones.html](https://www.terraform.io/docs/providers/aws/d/availability_zones.html)

```
# Declare the data source
data "aws_availability_zones" "available" {}

# e.g. Create subnets in the first two available availability zones

resource "aws_subnet" "primary" {
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  # ...
}

resource "aws_subnet" "secondary" {
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  # ...
}
```


## Quick start

**Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure 
all the resources qualify for the [AWS Free Tier](https://aws.amazon.com/free/), but we are not responsible for any
charges you may incur.** 

Configure your [AWS access 
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as 
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Validate the templates:

```
terraform plan
```

Deploy the code:

```
terraform apply
```

When the `apply` command completes, it will output the DNS name of the load balancer. To test the load balancer:

```
curl http://(elb_dns_name):8080/
```

Clean up when you're done:

```
terraform destroy
```
