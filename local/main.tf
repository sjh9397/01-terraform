#공급자에 대한 내용 
provider "local" {
}

# Infra resource
# block이름/공급자_타입/테라폼에서 사용할 이름 
				  # ↘ 리소스의 종류  
resource "local_file" "foo" {

  # path.module - String inter pdation terraform 변수
  # ${path.module} : string interpolation 문법, 현재 디렉토리 반환 
	
  # 파일이 위치한 디렉토리 경로, main.tf
  filename = "${path.module}/foo.txt"
  content  = data.local_file.bar.content 
}

#테라폼에서 사용할 입력 데이터 지정 
data "local_file" "bar" {
	filename = "${path.module}/bar.txt"
}

#출력 지정 
output "bar_content"{
	value = data.local_file.bar.content
}
