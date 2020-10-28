import Armas.*
import Mafioso.*

class Famiglia{
	var integrantes = []
	var don
	var integrantesQueTraicionaron = []
	
	//PUNTO 2
	method elMasPeligroso(){
		return self.cantidadDeArmasDeLosVivos().max()
	}
	
	method integrantesVivos(){
		return integrantes.filter( {mafioso => mafioso.duermeConLosPeces().negate()} ).add(don)
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
		const enemigoMasPeligroso = otraFamilia.elMasPeligroso()
		integrantes.forEach( {mafioso => mafioso.atacarA(enemigoMasPeligroso)} )
		otraFamilia.verificarVida(enemigoMasPeligroso)
		
		if(otraFamilia.yaNoQuedanVivos()){
			throw new Exception(message = "La quedaron todos")
		}
	}
	
	method verificarVida(unMafioso){
		if(unMafioso.estaMuerto()){
			self.eliminarMiembro(unMafioso)
		}
	}
	
	method eliminarMiembro(unMafioso){
		integrantes.remove(unMafioso)
	}
	
	method yaNoQuedanVivos(){
		return integrantes.size() == 0
	}
	
	//PUNTO 6
	method muereElDon(){
		integrantes.remove(don)
		const subjefes = self.soloSubjefes()
		const soldados = self.soloSoldados()
		self.subirRangoASubjefe(soldados)
		self.subirRangoADon(subjefes)
	}
	
	method soloSubjefes(){
		return integrantes.filter( {mafioso => mafioso.esSubjefe()} )
	}
	
	method soloSoldados(){
		return integrantes.filter( {mafioso => mafioso.esSoldado()} )
	}
	
	method subirRangoASubjefe(unosSoldados){
		const futurosSubjefes = unosSoldados.filter( {soldado => soldado.armasDisponibles() > 5} )
		futurosSubjefes.forEach( {futuroSubjefe => futuroSubjefe.subirDeRango()} )
	}
	
	method subirRangoADon(unosSubjefes){
		const futuroDon = unosSubjefes.max( {subjefe => subjefe.nivelLealtad()} )
		futuroDon.subirADon()
	}
	
	method asignarNuevoDon(unNuevoDon){
		don = unNuevoDon
	}
	
	method verificarTraicion(unTraidor, unasVictimas, familiaNueva){
		if(self.lealtadPromedio() > unTraidor.nivelLealtad() * 2)
		{
			unTraidor.muere()
			integrantes.remove(unTraidor)
		}
		else
		{
			unTraidor.efectuarTraicion(unasVictimas, familiaNueva)
			
		}
		
		integrantesQueTraicionaron.add(unTraidor)
	}
	
	method cualquieIntegrante(){
		return integrantes.anyOne()
	}
	
	method lealtadPromedio(){
		return self.sumatoriaLealtad() / integrantes.size()
	}
	
	method sumatoriaLealtad(){
		return integrantes.sum( {mafioso => mafioso.nivelLealtad()} )
	}
	
	method sumarMiembro(){
		integrantes.add(new Soldado(nivelLealtad = 100, armasDisponibles = [], familiaPerteneciente = self))
	}
}
