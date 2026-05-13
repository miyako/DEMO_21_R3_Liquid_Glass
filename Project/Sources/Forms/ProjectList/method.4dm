
var $event:=FORM Event:C1606
Case of 
	: ($event.code=On Load:K2:1)
		
		LISTBOX SELECT ROWS:C1715(*; "ListBox"; Form:C1466.projects.slice(0; 1); lk replace selection:K53:1)
		
		//SearchPicker SET HELP TEXT("SearchPicker"; "Name")
		
		
	: ($event.code=On Double Clicked:K2:5)
		
		// Double-click on listbox
		If ($event.objectName="ListBox")
			// Call the onEditContact method of the contact detail form
			Form:C1466.onEditProject()
		End if 
		
		// Timer expired - user has stopped typing for delaySearch ms
	: ($event.code=On Timer:K2:25)
		// Stop the timer and execute the search with current search text
		SET TIMER:C645(0)
		Form:C1466.loadProjects()
		
End case 