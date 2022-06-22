import comidas.*
import comensales.*

object cocina {
	const preparadas = []

	method prepararComida(unaComida) { preparadas.add(unaComida) }
	method quitarComida(unaComida) { preparadas.remove(unaComida) }
	
	method tieneBuenaOfertaVegetariana() = 
		(self.comidasNoVegetariana().size() - self.comidasVegetariana().size()) <= 2
		
	method comidasVegetariana() = 
		preparadas.filter{ c=>c.esAptoVegetariano() }
	
	method comidasNoVegetariana() = 
		preparadas.filter{ c=>!c.esAptoVegetariano() }
		
	method platoFuerteCarnivoro() = 
		self.comidasNoVegetariana().max{ c=>c.valoracion() }
		
	method comidasLeGustanA(comensal) = 
		preparadas.filter{ c=>comensal.leAgrada(c) }

	

	method elegirPlatoPara(comensal) {
		if(self.platosQueGustanA(comensal).isEmpty()) 
			self.error("No le gusta")

		const platoElegido = self.platosQueGustanA(comensal).anyOne()
		
		preparadas.remove(platoElegido)
		comensal.comer(platoElegido)
	}
	method platosQueGustanA(comensal) = 
		preparadas.filter{ c=>comensal.leAgrada(c) }
} 



