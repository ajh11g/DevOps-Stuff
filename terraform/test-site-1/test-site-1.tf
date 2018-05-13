# use to create free tier ubuntu 16.04 LTS instance

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-east-1"
}

resource "aws_instance" "test-site-1" {
  ami             = "ami-43a15f3e"
  instance_type   = "t2.micro"
  security_groups = ["test-site-1"]
  key_name        = "${var.key_name}"

  ebs_block_device {
    device_name           = "${var.device_name}"
    delete_on_termination = false
    snapshot_id           = "${var.snapshot_id}"
    volume_size           = 30
  }

  tags {
    name = "test-site-1"
  }
}
