# required_providerに定義したプロバイダーの詳細を設定する
provider "aws" {
  region = "us-west-2"
}

# AWSから最新のUbuntu AMI情報を動的に取得する
# AMI IDをハードコードせず、常に最新版を使える
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "learn-terraform"
  }
}
