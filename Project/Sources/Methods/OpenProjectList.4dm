//%attributes = {}


// Create a new instance of the ContactListForm class to hold the form data
var $formData:=cs:C1710.ProjectListForm.new()

// Open the ContactList form, passing the form data instance
var $winRef:=Open form window:C675("ProjectList"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4; *)
DIALOG:C40("ProjectList"; $formData)
CLOSE WINDOW:C154($winRef)