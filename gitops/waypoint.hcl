project = "gitops"

app "gitops" {
  build {
    use "docker" {}

    registry {
      use "aws-ecr" {
        region = "us-west-2"
        tag = "latest"
      }
    }
  }

  deploy { 
    use "aws-lambda" {
      region = "us-west-2"
    }
  }

  release {
    use "aws-alb" {
    }
  }
}