If (Form event code:C388=On Clicked:K2:4)
	If (Form:C1466.myDrop#Null:C1517)
		Form:C1466.status:=Form:C1466.myDrop.currentValue
	End if 
	
	Form:C1466.save()
	
End if 