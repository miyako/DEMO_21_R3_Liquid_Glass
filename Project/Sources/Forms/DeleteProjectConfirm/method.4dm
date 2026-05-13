
Case of 
	: (Form event code:C388=On Load:K2:1)
		SET WINDOW TITLE:C213("Delete Project")
		If (Form:C1466.title="")
			Form:C1466.title:="Delete this project?"
		End if 
		If (Form:C1466.message="")
			Form:C1466.message:="This action cannot be undone."
		End if 
		
	: (Form event code:C388=On Validate:K2:3)
		Form:C1466.confirmed:=True:C215
		
End case 