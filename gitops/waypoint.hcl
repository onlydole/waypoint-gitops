project = "gitops"

app "gitops" {
  build {
    use "docker" {}

    registry {
      use "aws-ecr" {
        region = "us-west-2"
        repository = "gitops"
        tag = "uptown-func"
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