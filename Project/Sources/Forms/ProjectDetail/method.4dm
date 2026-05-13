
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		Form:C1466.myDrop:=New object:C1471
		Form:C1466.myDrop.values:=New collection:C1472("To Do"; "Pending"; "In Progress"; "Completed")
		
		If (Form:C1466.project=Null:C1517)
			// Creation mode
			SET WINDOW TITLE:C213("New Project")
			Form:C1466.myDrop.currentValue:="To Do"
			Form:C1466.myDrop.index:=Form:C1466.myDrop.values.indexOf("To Do")
			
		Else 
			// Edit mode
			SET WINDOW TITLE:C213("Project Details")
			
			Form:C1466.myDrop.currentValue:=Form:C1466.status
			Form:C1466.myDrop.index:=Form:C1466.myDrop.values.indexOf(Form:C1466.status)
			
		End if 
		
		// Update button states
		Form:C1466.updateNavigationButtons()
		
	: (Form event code:C388=On Printing Detail:K2:18)
		OBJECT SET VISIBLE:C603(*; "Rectangle"; False:C215)
		
End case 