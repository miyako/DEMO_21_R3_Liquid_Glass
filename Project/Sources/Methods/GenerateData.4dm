//%attributes = {}
var $i; $j : Integer
var $project : cs:C1710.ProjectEntity
var $task : cs:C1710.TaskEntity
var $statuses; $managers : Collection
var $commentStarts; $commentRisks; $commentNextSteps : Collection
var $status : Text

// Clean existing data
ds:C1482.Task.all().drop()
ds:C1482.Project.all().drop()

// Base data
var $projectNames : Collection

$projectNames:=New collection:C1472(\
"Website Redesign"; \
"Mobile App Launch"; \
"Customer Portal Development"; \
"E-commerce Platform Upgrade"; \
"CRM System Implementation"; \
"Internal Dashboard Revamp"; \
"Cloud Migration Project"; \
"Data Analytics Platform"; \
"Marketing Automation Setup"; \
"Payment System Integration"; \
"Inventory Management System"; \
"HR Management Tool"; \
"Booking System Development"; \
"API Platform Modernization"; \
"Digital Transformation Initiative"\
)

$statuses:=New collection:C1472("To Do"; "Pending"; "In Progress"; "Completed")

$managers:=New collection:C1472(\
"Alice Martin"; \
"John Smith"; \
"Sophie Leroy"; \
"Mark Brown"; \
"Claire Wilson")

$commentStarts:=New collection:C1472(\
"Kickoff done with client stakeholders."; \
"Technical workshop completed with the delivery team."; \
"Current sprint is focused on high-value user stories."; \
"Dependencies were reviewed during the weekly steering meeting."; \
"Business priorities were aligned with product owners."\
)

$commentRisks:=New collection:C1472(\
"Main risk: API response times are still unstable."; \
"Main risk: final design sign-off is pending."; \
"Main risk: data migration quality checks are behind plan."; \
"Main risk: vendor feedback is delayed this week."; \
"Main risk: test environment availability is limited."\
)

$commentNextSteps:=New collection:C1472(\
"Next step: finalize integration tests."; \
"Next step: prepare UAT with key users."; \
"Next step: complete backlog refinement for phase 2."; \
"Next step: validate reporting metrics with finance."; \
"Next step: schedule go/no-go decision meeting."\
)

var $taskNames : Collection

$taskNames:=New collection:C1472(\
"Define project scope"; \
"Gather requirements"; \
"Create wireframes"; \
"Design UI mockups"; \
"Setup project repository"; \
"Implement authentication"; \
"Develop core features"; \
"Integrate API services"; \
"Write unit tests"; \
"Perform code review"; \
"Fix bugs and issues"; \
"Prepare deployment"; \
"Deploy to staging"; \
"Client validation"; \
"Production release"\
)

For ($i; 1; 10)
	
	$project:=ds:C1482.Project.new()
	
	$project.name:=$projectNames[Random:C100%$projectNames.length]
	$project.manager:=$managers[Random:C100%$managers.length]
	
	$status:=$statuses[Random:C100%$statuses.length]
	$project.status:=$status
	
	$project.notificationsEnabled:=((Random:C100%2)=1)
	$project.clientValidationRequired:=((Random:C100%2)=1)
	
	Case of 
		: ($status="Completed")
			$project.progress:=100
		: ($status="To Do")
			$project.progress:=0
		Else 
			$project.progress:=Random:C100%90
	End case 
	
	$project.comments:=$commentStarts[Random:C100%$commentStarts.length]+" "+$commentNextSteps[Random:C100%$commentNextSteps.length]
	If ((Random:C100%3)=1)
		$project.comments:=$project.comments+" "+$commentRisks[Random:C100%$commentRisks.length]
	End if 
	Case of 
		: ($status="Completed")
			$project.comments:=$project.comments+" Project delivered and validated by the client."
		: ($status="In Progress")
			$project.comments:=$project.comments+" Execution is on track with active monitoring."
		: ($status="Pending")
			$project.comments:=$project.comments+" Waiting for dependency clearance before full execution."
		: ($status="To Do")
			$project.comments:=$project.comments+" Planning phase in progress before development start."
	End case 
	
	$project.save()
	
	// Create tasks
	For ($j; 1; (Random:C100%5)+2)
		
		$task:=ds:C1482.Task.new()
		
		$task.title:=$taskNames[Random:C100%$taskNames.length]
		$task.assignee:=$managers[Random:C100%$managers.length]
		
		$status:=$statuses[Random:C100%$statuses.length]
		$task.status:=$status
		
		If ($status="Completed")
			$task.progress:=100
		Else 
			$task.progress:=Random:C100%100
		End if 
		
		// relation
		$task.IDproject:=$project.ID
		
		$task.save()
		
	End for 
	
End for 