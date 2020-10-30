import Arma.*

class Familia {
	 var integrantes = []
	 var don
	 
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
}
