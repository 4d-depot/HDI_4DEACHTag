If (btnTrace)
	TRACE:C157
End if 


var $input; $output : Text
var $start; $product; $price; $end : Text
var products : Object
var $file : cs:C1710.File

$start:="<!--#4DEACH $key in products-->"+Char:C90(Carriage return:K15:38)
$product:="<!--#4DTEXT $key--> costs "
$price:="<!--#4DTEXT products[$key] -->"+Char:C90(Carriage return:K15:38)
$end:="<!--#4DENDEACH-->"

products:=New object:C1471("Blue ink"; 10; "White paper"; 20; "Agenda"; 30; "Binder"; 35; "Note book"; 10)

$input:=$start
$input:=$input+$product+$price
$input:=$input+$end

PROCESS 4D TAGS:C816($input; $output)

$file:=Folder:C1567(fk database folder:K87:14).file("products.txt")
If ($file.exists)
	$file.delete()
End if 

TEXT TO DOCUMENT:C1237("products.txt"; $output)

OBJECT SET ENABLED:C1123(*; "ShowOnDiskButton"; True:C214)



