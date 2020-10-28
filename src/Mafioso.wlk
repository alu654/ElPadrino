import Armas.*

class Mafioso {
	var property nivelLealtad
	var estaMuerto = false
	var property estaHerido = false
	var armasDisponibles
	var familiaPerteneciente
	
	//PUNTO 1
	method duermeConLosPeces(){
		return estaMuerto
	}
	
	method agregarArma(unArma){
		armasDisponibles.add(unArma)	
	}
	
	//PUNTO 4
	method sabeDespacharElegantemente(){
		return armasDisponibles.any( {arma => arma.esSutil()} )
	}
	
	method muere(){
		estaMuerto = true
		estaHerido = true
	}
	
	method quedaHerido(){
		estaHerido = true
		estaMuerto = false
	}
	
	//TRAICIONES
	method iniciarTraicion(familiaNueva){
		const victimas = []
		const unaVictima = familiaPerteneciente.anyOne()
		victimas.add(unaVictima)
		const hoy = new Date()
		const fechaTentativa = hoy + 7
		
		familiaPerteneciente.verificarTraicion(self, victimas, familiaNueva) 
	}
	
	method efectuarTraicion(unasVictimas, familiaNueva){
		unasVictimas.forEach( {victima => self.atacarA(victima)} )
		familiaPerteneciente.eliminarMiembro(self)
		familiaNueva.sumarMiembro()
	}
	
	method atacarA(unMafioso){
		
	}
}

class Don inherits Mafioso {
	var subordinados
	
	override method sabeDespacharElegantemente(){
		return true
	}
	
	override method atacarA(unMafioso){
		subordinados.anyOne().atacarA(unMafioso)
	}
}

class Subjefe inherits Mafioso {
	
	
	override method atacarA(unMafioso){
		const armaAUsar = armasDisponibles.anyOne()
		armaAUsar.usarlaContra(unMafioso)
	}
}

class Soldado inherits Mafioso {
	
	override method atacarA(unMafioso){
		const armaAUsar = armasDisponibles.head()
		armaAUsar.usarlaContra(unMafioso)
	}
}
