// Projet form properties
property name : Text
property manager : Text
property status : Text
property notificationsEnabled : Boolean
property clientValidationRequired : Boolean
property progress : Integer
property comments : Text
property tasks : cs:C1710.TaskSelection

// Database and state properties
property project : cs:C1710.ProjectEntity  // Reference to the database entity
property isNew : Boolean  // True if creating new contact, False if editing existing
property currentIndex : Integer  // Current position in the selection
property maxIndex : Integer  // Selection size

Class constructor($obj : cs:C1710.ProjectEntity; $selectionSize : Integer)
	
	If ($obj=Null:C1517)
		// Creating a new project
		This:C1470.isNew:=True:C214
		This:C1470.name:=""
		This:C1470.manager:=""
		This:C1470.status:=""
		This:C1470.notificationsEnabled:=False:C215
		This:C1470.clientValidationRequired:=False:C215
		This:C1470.progress:=0
		This:C1470.comments:=""
		
		This:C1470.currentIndex:=0
		This:C1470.maxIndex:=0
	Else 
		// Editing an existing project
		This:C1470.isNew:=False:C215
		This:C1470.loadEntity($obj)
		This:C1470.maxIndex:=$selectionSize-1
	End if 
	
Function loadEntity($entity : cs:C1710.ProjectEntity)
	This:C1470.project:=$entity
	This:C1470.name:=$entity.name
	This:C1470.manager:=$entity.manager
	This:C1470.status:=$entity.status
	This:C1470.notificationsEnabled:=$entity.notificationsEnabled
	This:C1470.clientValidationRequired:=$entity.clientValidationRequired
	This:C1470.progress:=$entity.progress
	This:C1470.comments:=$entity.comments
	This:C1470.tasks:=This:C1470.project.Tasks
	This:C1470.currentIndex:=$entity.indexOf()
	
Function save
	If (This:C1470.project=Null:C1517)
		// Creation
		This:C1470.project:=ds:C1482.Project.new()
	End if 
	
	This:C1470.project.name:=This:C1470.name
	This:C1470.project.manager:=This:C1470.manager
	This:C1470.project.status:=This:C1470.status
	This:C1470.project.notificationsEnabled:=This:C1470.notificationsEnabled
	This:C1470.project.clientValidationRequired:=This:C1470.clientValidationRequired
	This:C1470.project.progress:=This:C1470.progress
	This:C1470.project.comments:=This:C1470.comments
	
	var $status:=This:C1470.project.saveProject()
	
	If ($status.success=False:C215)
		ALERT:C41($status.statusText)
	Else 
		CANCEL:C270
	End if 
	
Function next
	This:C1470.loadEntity(This:C1470.project.next())
	Form:C1466.updateNavigationButtons()
	
Function previous
	This:C1470.loadEntity(This:C1470.project.previous())
	Form:C1466.updateNavigationButtons()
	
Function first
	This:C1470.loadEntity(This:C1470.project.first())
	Form:C1466.updateNavigationButtons()
	
Function last
	This:C1470.loadEntity(This:C1470.project.last())
	Form:C1466.updateNavigationButtons()
	
Function canGoNext : Boolean
	return This:C1470.currentIndex<This:C1470.maxIndex
	
Function canGoPrevious : Boolean
	return This:C1470.currentIndex>0
	
Function canGoFirst : Boolean
	return This:C1470.currentIndex>0
	
Function canGoLast : Boolean
	return This:C1470.currentIndex<This:C1470.maxIndex
	
Function updateNavigationButtons
	// Disable all navigation buttons in create mode
	// Enable/disable based on position in selection in edit mode
	OBJECT SET ENABLED:C1123(*; "bFirstRecord"; This:C1470.canGoFirst())
	OBJECT SET ENABLED:C1123(*; "bPreviousRecord"; This:C1470.canGoPrevious())
	OBJECT SET ENABLED:C1123(*; "bNextRecord"; This:C1470.canGoNext())
	OBJECT SET ENABLED:C1123(*; "bLastRecord"; This:C1470.canGoLast())