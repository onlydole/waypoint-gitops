project = "minecraft"

app "minecraft" {
  labels = {
    "service" = "minecraft",
    "env"     = "eks"
  }

  build {
    use "docker-pull" {
      image = "itzg/minecraft-server"
      tag   = "2021.16.0"
    }
  }

  deploy {
    use "kubernetes-apply" {
      path = templatedir("${path.app}/server")
      prune_label = "app=minecraft"
    }
  }
}