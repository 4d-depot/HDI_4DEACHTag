
C_BOOLEAN:C305(btnTrace)


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		btnTrace:=False:C215
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		ARRAY TEXT:C222(_TabLineCode; 0)
		ARRAY TEXT:C222(_TabLineHTML; 0)
		
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4<=9)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		//QUERY([INFO]; [INFO]PageNumber>=10)
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=10; *)
		QUERY:C277([INFO:1];  & ; [INFO:1]PageNumber:4<50)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]Description:2; _TabLineCode)
		
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4>=50)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		SELECTION TO ARRAY:C260([INFO:1]Description:2; _TabLineHTML)
		
		WA_URL_Customers:=""
		
		WA_URL_SalesPersons:="http://localhost:8044/salesPersons.shtml"
		
		manageTexts
		
		RW
		
		viewTrace
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		//Page 2
		Form:C1466.userId:="1"
		
		//Page 3
		WA_URL_SalesPersons:="http://localhost:8044/salesPersons.shtml"
		WA REFRESH CURRENT URL:C1023(*; "WA_URL_SalesPersons")
		
		//Page 4
		OBJECT SET ENABLED:C1123(*; "ShowOnDiskButton"; False:C215)
		
		manageTexts
		
		viewTrace
		
End case 