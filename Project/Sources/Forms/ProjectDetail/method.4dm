
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (Form:C1466.project=Null:C1517)
			// Creation mode
			SET WINDOW TITLE:C213("New Project")
			
		Else 
			// Edit mode
			SET WINDOW TITLE:C213("Project Details")
			
		End if 
		
		Form:C1466.initDropDown()
		
		// Update button states
		Form:C1466.updateNavigationButtons()
		
	: (Form event code:C388=On Printing Detail:K2:18)
		OBJECT SET VISIBLE:C603(*; "Rectangle"; False:C215)
		
End case 