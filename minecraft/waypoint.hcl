project = "minecraft"

app "minecraft" {
  labels = {
    "service" = "minecraft",
    "env"     = "eks"
  }

  build {
    use "docker-pull" {
      image = "itzg/minecraft-server"
      tag   = "latest"
    }
  }

  deploy {
    use "kubernetes-apply" {
      path = templatedir("${path.app}/server")
      prune_label = "app=minecraft"
    }
  }
}