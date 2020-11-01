import Arma.*
import Mafioso.*

class Familia {
	 var integrantes = []
	 var don
	 var traidores
	 
	 //PUNTO 2
	 method elMasPeligroso(){
	 	return self.mafiososVivos().max( {mafioso => mafioso.cantidadDeArmas()} )
	 }
	 
	 method mafiososVivos(){
	 	return integrantes.filter( {mafioso => mafioso.estaVivo()} )
	 }
	 
	 //PUNTO 3
	 method armarse(){
	 	integrantes.forEach( {mafioso => mafioso.agregarArma(new Pistola(cantidadBalas = 6))} )
	 }
	 
	 //PUNTO 5
	 method ataqueSorpresaA(unaFamilia){
	 	const mafiosoMasPeligroso = unaFamilia.elMasPeligroso()
	 	
	 	self.mafiososVivos().forEach( {mafioso => mafioso.atacarA(mafiosoMasPeligroso)} )
	 }	
	 
	 //PUNTO 6
	 method muereElDon(){
	 	self.aumentarLealtadDeLuto()
	 	self.asignarNuevoDon()
	 	self.asignarNuevosSubjefes()
	 }
	 
	 method aumentarLealtadDeLuto(){
	 	integrantes.forEach( {mafioso => mafioso.subirLealtadDeLuto()} )
	 }
	 
	 method asignarNuevoDon(){
	 	don.subordinadoMasLeal().ascenderADon(self)
	 }
	 
	 method asignarADon(nuevoDon){
	 	don = nuevoDon
	 }
	 
	 method asignarNuevosSubjefes(){
	 	self.soldadosVivos()
			.filter( {mafioso => mafioso.esSoldado().tieneMasDeCincoArmas()} )
			.forEach { integrante => integrante.ascenderASubjefe() } 
	 }
	 
	 method soldadosVivos(){
	 	return integrantes.filter( {mafioso => mafioso.esSoldado().estaVivo()} )
	 }
	 
	 method cualquierMiembro() = return integrantes.anyOne()
	 
	 method lealtadPromedio(){
	 	return integrantes.sum( {mafioso => mafioso.nivelLealtad()} ) / integrantes.size()
	 }
	 
	 method agregarMafioso(unMafioso){
	 	const maximaLealtad = integrantes.max( {mafioso => mafioso.nivelLealtad()} )
	 	integrantes.add(new Soldado(nivelLealtad = maximaLealtad, familiaPerteneciente = self))
	 }
	 
	 method eliminarMiembro(unMafioso){
	 	integrantes.remove(unMafioso)
	 } 
	 
	 method ajusticiar(unMafioso){
	 	unMafioso.morir()
	 	self.eliminarMiembro(unMafioso)
	 }
	 
	 method agregarTraidor(unMafioso){
	 	traidores.add(unMafioso)
	 }
}
