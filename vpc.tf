resource "aws_vpc" "default" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name            = "${var.owner}-vpc-${var.env_name}"
    ManagedBy       = "${var.manageby}"
    EnvironmentName = "${var.env_name}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name            = "${var.owner}-igw-${var.env_name}"
    ManagedBy       = "${var.manageby}"
    EnvironmentName = "${var.env_name}"
  }
}
