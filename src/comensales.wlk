import comidas.*

class Comensales {
	
	var peso
	const comido=[]
	method comer(unaComida) { comido.add(unaComida) }
	method leAgrada(unaComida)
	method satisfecho() = 
		self.comidaIngerida() >= peso*0.01 && self.condicionComensal()
		
	method comidaIngerida()= comido.sum({p=>p.peso()})
	method condicionComensal()=true
	
}
class Vegetariano inherits Comensales {
	
	override method leAgrada(unaComida) = 
		unaComida.esAptoVegetariano() && unaComida.valoracion() > 85
	
	override method condicionComensal() = 
		comido.all{ c=>not c.esAbundante() }
}

class HambrePopu inherits Comensales {
	
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class PaladarFino inherits Comensales {
	
	override method leAgrada(unaComida) = 
		unaComida.peso().between(150,300) && 
			unaComida.valoracion() > 100
	
	override method condicionComensal() = comido.size().even()
} 