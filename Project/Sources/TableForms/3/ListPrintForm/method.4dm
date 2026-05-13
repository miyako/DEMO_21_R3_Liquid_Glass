var index : Integer

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		
		If (Undefined:C82(index))
			index=0
		End if 
		
		If ((index%2)=1)
			OBJECT SET VISIBLE:C603(*; "Rectangle"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "Rectangle"; True:C214)
		End if 
		
		index+=1
		
End case 