data_dir = "/var/lib/nomad"

server {
  enabled = true
  bootstrap_expect = 1
}

# Normally, server and client should not both be present
client {
  enabled = true
  servers = ["127.0.0.1"]
}

plugin "docker" {
  config {
    endpoint = "unix:///var/run/docker.sock"
    volumes {
      enabled = true
      selinuxlabel = "z"
    }
    allow_privileged = true
    gc {
      image = true
      container = true
    }
  }
}

