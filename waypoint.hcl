project = "gitops-example"

app "gitops-example" {
  labels = {
    "service" = "gitops-example",
    "env"     = "dev"
  }

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "onlydole/gitops-example"
        tag   = "1"
      }
    }
  }

  deploy {
    use "kubernetes-apply" {
      // Template the directory so that we process each file in the directory
      // as a template. This lets us inject the artifact from the previous step.
      path = templatedir("${path.app}/kubernetes")

      // This label determines what resources we own. Any that aren't present
      // in our folder that match this label will be deleted.
      prune_label = "app=gitops-example"
    }
  }
}
