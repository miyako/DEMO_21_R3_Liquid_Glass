Case of 
	: (Form event code:C388=On Load:K2:1)
		
		RELATE MANY:C262([Project:3])
		SELECTION TO ARRAY:C260([Task:4]title:2; arrTitle; [Task:4]assignee:4; arrAssignee; [Task:4]status:3; arrStatus)
		
	: (Form event code:C388=On Printing Detail:K2:18)
		OBJECT SET VISIBLE:C603(*; "Rectangle"; False:C215)
		
End case 