variable "server_port" {
  description = "The port the will use for HTTP requests"
  type        = number
  default     = 8080

}

variable "security_group_name" {
  type    = string
  default = "aws07-terraform-example-instance"
}
