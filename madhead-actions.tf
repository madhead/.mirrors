resource "gitlab_group" "madhead-actions" {
  name                   = "madhead-actions"
  path                   = "madhead-actions"
  description            = "GitHub Actions"
  lfs_enabled            = true
  request_access_enabled = false
  visibility_level       = "public"
  auto_devops_enabled    = false
}

resource "gitlab_project" "semver-utils" {
  name                       = "semver-utils"
  namespace_id               = gitlab_group.madhead-actions.id
  visibility_level           = "public"
  import_url                 = "https://github.com/madhead/semver-utils.git"
  mirror                     = true
  issues_enabled             = false
  merge_requests_enabled     = false
  pipelines_enabled          = false
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  packages_enabled           = false
}
