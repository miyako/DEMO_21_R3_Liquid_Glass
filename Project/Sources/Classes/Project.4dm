Class extends DataClass

Function load($search : Text) : cs:C1710.ProjectSelection
	If ($search="")
		return ds:C1482.Project.all().copy().orderBy("name")
	Else 
		return ds:C1482.Project.query("name = :1 or manager = :1"; "@"+$search+"@").orderBy("name")
	End if 