import Armas.*

class Famiglia{
	var integrantes
	
	//PUNTO 2
	method elMasPeligroso(){
		return self.cantidadDeArmasDeLosVivos().max()
	}
	
	method integrantesVivos(){
		return integrantes.filter( {mafioso => mafioso.duermeConLosPeces().negate()} )
	}
	
	method armasDeLosVivos(){
		return self.integrantesVivos().map( {mafioso => mafioso.armasDisponibles()} )
	}
	
	method cantidadDeArmasDeLosVivos(){
		return self.armasDeLosVivos().map( {armasDisponibles => armasDisponibles.size()} )
	}
	
	//PUNTO 3
	method distribuirArmas(){
		integrantes.forEach( {mafioso => mafioso.agregarArma(new Pistola(cantidadDeBalas = 6))} )
	}
	
	//PUNTO 5
	method ataqueSorpresaA(otraFamilia){
		/*const enemigoMasPeligroso = otraFamilia.elMasPeligroso()
		integrantes.forEach( {mafioso => mafioso.atacarA(enemigoMasPeligroso)} )
		if(otraFamilia.yaNoQuedanVivos()){
			throw new Exception(message = "La quedaron todos")
		}*/
	}
}
