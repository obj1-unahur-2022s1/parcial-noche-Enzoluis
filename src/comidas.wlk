
class Plato {
	
	method peso()
	method esAptoVegetariano() = false
	method valoracion()
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato {
	var property peso
	var especias

	override method esAptoVegetariano() = not especias
	method esEspecial() = 
		self.esAbundante() || especias
	override method valoracion() = 
		if(self.esEspecial()) 120 else 80
}

class BurgerCarne inherits Plato {
	var panC = panIndus

	override method peso() = 250
	method configurarPan(pan) { 
		panC = pan
	}
	override method valoracion() = 60+panC.valoracion()
}

object panIndus {
	method valoracion() = 0
}

object panCas {
	method valoracion() = 20
}

object panMaMa {
	method valoracion() = 45
}

class BurgerVegan inherits BurgerCarne {
	
	var legumbre

	override method esAptoVegetariano() = true
	
	override method valoracion() = 
		super() + 17.min(2*legumbre.size())
}

class Parrillada inherits Plato {
	
	const cortes = []

	method agregarCorte(corte) { 
		cortes.add(corte)
	}
	
	method quitarCorte(corte) { 
		cortes.remove(corte)
	}
	
	override method peso() = cortes.sum{ c=>c.peso() }
	
	override method valoracion() = 
		0.max(15* self.maxCalidad() - cortes.size())
	
	method maxCalidad() = 
		cortes.max({ c=>c.calidad() }).calidad()
}

class CorteCarne {
	const nom
	const property calidad
	const property peso
} 

