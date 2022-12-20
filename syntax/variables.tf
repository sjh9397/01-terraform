#변수지정 
variable "number_example" {
	type = number
	default = 100
}

variable "list_example"{
	description = "An example of a list in Terraform"
	type		= list
	default		= ["a", "b", "c"]
}


variable "string_example"{
	type = string
    default = "terraform-example-instance"
}


