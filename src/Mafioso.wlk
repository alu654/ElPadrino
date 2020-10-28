class Mafioso {
	var nivelLealtad
	var property armasDisponibles
	var nivelVida
	var rango
	
	//PUNTO 1
	method duermeConLosPeces(){
		return nivelVida == 0
	}
	
	method agregarArma(unArma){
		armasDisponibles.add(unArma)	
	}	
}
