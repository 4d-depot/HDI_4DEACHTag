
var $url; $1; $param : Text
var userId : Integer
var name : Text

$url:=$1

Case of 
	: (Position:C15("/viewCustomers"; $url)#0)
		
		If (Position:C15("?userId="; $url)#0)
			$param:=Substring:C12($url; Position:C15("="; $url)+1; Length:C16($url))
			userId:=Num:C11($param)
		End if 
		WEB SEND FILE:C619(Get 4D folder:C485(HTML Root folder:K5:20)+"customers.shtml")
End case 

