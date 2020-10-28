import Armas.*

class Mafioso {
	var property nivelLealtad
	var estaMuerto = false
	var property estaHerido = false
	var armasDisponibles = []
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
	
	method aumentarLealtad(){
		nivelLealtad = nivelLealtad * 1.1
	}
	
	//TRAICIONES
	method iniciarTraicionParaPasarseA(familiaNueva){
		if (!estaMuerto) {
			const victimas = []
			const unaVictima = familiaPerteneciente.cualquierIntegrante()
			victimas.add(unaVictima)
			const hoy = new Date()
			const fechaTentativa = hoy + 7
			
			familiaPerteneciente.verificarTraicion(self, victimas, familiaNueva)
		}
		 
	}
	
	method efectuarTraicion(unasVictimas, familiaNueva){
		unasVictimas.forEach( {victima => self.atacarA(victima)} )
		familiaPerteneciente.eliminarMiembro(self)
		familiaNueva.sumarMiembro()
		familiaPerteneciente = familiaNueva
	}
	
	method atacarA(unMafioso){
		
	}
}

class Don inherits Mafioso {
	var subordinados
	var property esSubjefe = false
	var property esSoldado = false
	
	override method sabeDespacharElegantemente(){
		return true
	}
	
	override method atacarA(unMafioso){
		subordinados.anyOne().atacarA(unMafioso)
	}
}

class Subjefe inherits Mafioso {
	var property esSubjefe = true
	var property esSoldado = false
	var subordinados
	
	override method atacarA(unMafioso){
		armasDisponibles.anyOne().usarlaContra(unMafioso)
	}
	
	method subirADon(){
		const nuevoDon = new Don(subordinados = subordinados, nivelLealtad = 100, familiaPerteneciente = familiaPerteneciente)
		familiaPerteneciente.asignarNuevoDon(nuevoDon)
	}
}

class Soldado inherits Mafioso {
	var property esSubjefe = false
	var property esSoldado = true
	
	override method atacarA(unMafioso){
		armasDisponibles.head().usarlaContra(unMafioso)
	}
	
	method subirDeRango(){
		return new Subjefe(subordinados = [], nivelLealtad = 100, familiaPerteneciente = familiaPerteneciente) //REVISAR!
	}
}
