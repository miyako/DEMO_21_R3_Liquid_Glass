Class extends Entity

Function saveProject : Object
	
	// Validation
	If (This:C1470.name="")
		return {success: False:C215; statusText: "The name is mandatory."}
	End if 
	
	// Save
	return This:C1470.save()
	
Function removeProject : Object
	
	return This:C1470.drop(dk force drop if stamp changed:K85:17)