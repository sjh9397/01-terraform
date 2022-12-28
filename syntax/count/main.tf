provider "aws" {
	region = "ap-northeast-2"
	}

variable"user_names"{
	description = "Create IAM users with these names"
	type = list(string)
	default = ["aws07-neo",  "aws07-morpheus"]
}
			#   <↓얘를 3번반복>  <호출> 
resource "aws_iam_user" "example" {
	count = length(var.user_names)
	name = var.user_names[count.index]

}

output "neo_arn"{
	value = aws_iam_user.example[*].arn
}
