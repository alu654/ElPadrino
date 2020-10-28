class Don{
	var subordinados
	
	method hacerElTrabajo(){
		subordinados.anyOne().hacerElTrabajo()
	}
	
	method sabeDespacharElegantemente(){
		return true
	}
}

class Subjefe{	
	var armasDisponibles
	var subordinados
	
	method hacerElTrabajo(){
		
	}
	
	method sabeDespacharElegantemente(){
		return armasDisponibles.any( {arma => arma.esSutil()} )
	}
}

class Soldado{
	var armasDisponibles
	
	method hacerElTrabajo(){
		
	}
	
	method sabeDespacharElegantemente(){
		return armasDisponibles.any( {arma => arma.esSutil()} ) //REVISAR REPETICION LOGICA
	}
}
