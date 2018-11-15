# Configure the Heroku provider
provider "heroku" {
  email = "jarandwaagekleppa@gmail.com"
}
provider "environment" {}

data "environment_variable" "HOME" {
  name = "HOME"
  failIfEmpty = true
  normalize_file_path = true
}
