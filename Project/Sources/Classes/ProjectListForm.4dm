// Project list properties
property projects : cs:C1710.ProjectSelection  // All projects from database, ordered by name
property selection : cs:C1710.ProjectSelection  // Filtered projects based on search or criteria
property selectedProject : cs:C1710.ProjectEntity  // Currently selected contact for editing

property delaySearch : Integer
property search : Text

Class constructor
	
	This:C1470.projects:=Null:C1517
	This:C1470.selection:=Null:C1517
	This:C1470.selectedProject:=Null:C1517
	
	This:C1470.delaySearch:=500
	This:C1470.search:=""
	
	// Load all projects
	This:C1470.loadProjects()
	
	
Function loadProjects()
	This:C1470.projects:=ds:C1482.Project.load(This:C1470.search)
	This:C1470.selection:=This:C1470.projects
	This:C1470.selectedProject:=This:C1470.selection.first()
	
	
Function onEditProject
	
	If (This:C1470.selectedProject#Null:C1517)
		
		// Initialize Detail Form with the selection for navigation
		var $formData:=cs:C1710.ProjectDetailForm.new(This:C1470.selectedProject; This:C1470.projects.length)
		
		// Open Detail Form window (edit mode)
		var $winRef:=Open form window:C675("ProjectDetail"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
		DIALOG:C40("ProjectDetail"; $formData)
		CLOSE WINDOW:C154($winRef)
	End if 
	
	
Function onNewProject
	
	// Initialize Detail Form
	var $formData:=cs:C1710.ProjectDetailForm.new(Null:C1517)
	
	// Open Detail Form window (create mode)
	var $winRef:=Open form window:C675("ProjectDetail"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4; *)
	DIALOG:C40("ProjectDetail"; $formData)
	CLOSE WINDOW:C154($winRef)
	
	// Refresh List Form
	This:C1470.projects.add($formData.project)
	This:C1470.projects.refresh()
	
Function onRemoveProject
	
	If (This:C1470.selectedProject#Null:C1517)
		var $status : Object
		var $deleteDialogData : Object
		var $winRef : Integer
		
		$deleteDialogData:=New object:C1471
		$deleteDialogData.confirmed:=False:C215
		$deleteDialogData.title:="Are you sure you want to delete this project: \""+This:C1470.selectedProject.name+"\"?"
		$deleteDialogData.message:="You can't undo this action."
		
		$winRef:=Open form window:C675("DeleteProjectConfirm"; Movable form dialog box no title:K39:20; Horizontally centered:K39:1; Vertically centered:K39:4; *)
		DIALOG:C40("DeleteProjectConfirm"; $deleteDialogData)
		CLOSE WINDOW:C154($winRef)
		
		If ($deleteDialogData.confirmed)
			$status:=This:C1470.selectedProject.removeProject()
		End if 
		
		If ($status.success=False:C215)
			ALERT:C41($status.statusText)
		End if 
		
		This:C1470.projects:=This:C1470.projects.clean()
		
	End if 
	