provider "local" {

}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["aws07-neo", "aws07-trinity", "aws07-morpheus"]

}

output "for_directive" {
  value = <<EOF
		%{~ for name in var.user_names}
	    ${name}
		%{~ endfor}
		EOF
}

