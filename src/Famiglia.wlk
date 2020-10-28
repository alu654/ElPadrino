class Famiglia{
	var integrantes
	
	//PUNTO 2
	method elMasPeligroso(){
		return self.integrantesVivos().sum() //REVISAR!
	}
	
	method integrantesVivos(){
		return integrantes.filter( {mafioso => mafioso.duermeConLosPeces().negate()} )
	}
	
	method armasDeLosVivos(){
		return self.integrantesVivos().map( {mafioso => mafioso.armasDisponibles()} )
	}
}
