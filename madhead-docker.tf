resource "gitlab_group" "madhead-docker" {
  name                   = "madhead-docker"
  path                   = "madhead-docker"
  description            = "Docker images"
  lfs_enabled            = true
  request_access_enabled = false
  visibility_level       = "public"
  auto_devops_enabled    = false
}

resource "gitlab_project" "example" {
  name                       = "docker-image"
  namespace_id               = gitlab_group.madhead-docker.id
  visibility_level           = "public"
  import_url                 = "https://github.com/madhead/docker-image.git"
  mirror                     = true
  issues_enabled             = false
  merge_requests_enabled     = false
  pipelines_enabled          = false
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
}
