variable "do_token" {
  description = "DigitalOcean API token"
  sensitive   = true
}

variable "spaces_access_key" {
  description = "Spaces access key"
  sensitive   = true
}

variable "spaces_secret_key" {
  description = "Spaces secret key"
  sensitive   = true
}

variable "datadog_api_key" {
  description = "DataDog API key"
  sensitive   = true
}

variable "datadog_app_key" {
  description = "DataDog Application key"
  sensitive   = true
}
