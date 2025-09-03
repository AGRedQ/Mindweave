extends ProgressBar

var concentration: int = 0

func increase(amount):
	concentration += amount
	if concentration > 100:
		concentration = 100
	value = concentration

func decrease(amount):
	concentration -= amount 
	if concentration < 0:
		concentration = 0
	value = concentration 
	
	
