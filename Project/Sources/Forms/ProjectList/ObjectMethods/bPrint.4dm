var $breakManager : Text
var $es : cs:C1710.ProjectSelection
var $e : cs:C1710.ProjectEntity

SET PRINT PREVIEW:C364(True:C214)

$breakManager:=""
$es:=Form:C1466.projects.orderBy("manager asc")

// Header
Print form:C5("ProjectPrintList"; Form header:K43:3)

For each ($e; $es)
	
	// Manager header
	If ($breakManager#$e.manager)
		$breakManager:=$e.manager
		Print form:C5("ProjectPrintList"; $e; Form header1:K43:4)
	End if 
	
	// Detail line
	Print form:C5("ProjectPrintList"; $e; Form detail:K43:1)
End for each 

