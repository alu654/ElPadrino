import Armas.*

class Mafioso {
	var nivelLealtad
	var estaMuerto = false
	var property estaHerido = false
	var armasDisponibles
	
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
}

class Don inherits Mafioso {
	var subordinados
	
	override method sabeDespacharElegantemente(){
		return true
	}
	
	method atacarA(unMafioso, otraFamilia){
		subordinados.anyOne().hacerElTrabajo(unMafioso, otraFamilia)
	}
}

class Subjefe inherits Mafioso {
	var subordinados
	
	method atacarA(unMafioso, otraFamilia){
		const armaAUsar = armasDisponibles.anyOne()
		armaAUsar.usarlaContra(unMafioso, otraFamilia)
	}
}

class Soldado inherits Mafioso {
	
	method atacarA(unMafioso, otraFamilia){
		const armaAUsar = armasDisponibles.head()
		armaAUsar.usarlaContra(unMafioso, otraFamilia)
	}
}
