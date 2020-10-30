import Arma.*
import Rangos.*

class Mafioso{
	const armas = [new Escopeta()]
	
	var estaHerido = false
	var estaMuerto = false
	
	var rango
	var property nivelLealtad
	
	//PUNTO 1
	method duermeConLosPeces(){
		return estaMuerto
	}
	
	method estaVivo() = return not estaMuerto
	
	method cantidadDeArmas(){
		return armas.size()
	}
	
	method agregarArma(unArma){
		armas.add(unArma)
	}
	
	//PUNTO 4
	method sabeDespacharElegantemente(){
		return rango.sabeDespacharElegantemente(self)
	}
	
	method tieneArmaSutil(){
		return armas.any( {arma => arma.esSutil()} )
	}
	
	method atacarA(unMafioso){
		if(unMafioso.estaVivo()){
			self.atacarlo(unMafioso)
		}
	}
	
	method atacarlo(unMafioso){
		rango.atacarlo(self, unMafioso)
	}
	
	method cualquierArma() {
		return armas.anyOne()
	}

	method armaMasCercana() {
		return armas.first()
	}
	
	method morir() {
		estaMuerto = true
	}
	
	method herir() {
		if (estaHerido) {
			self.morir()
		} else {
			estaHerido = true
		}
	}
	
	method subirLealtadDeLuto(){
		nivelLealtad *= 1.1
	}
	
	method ascenderADonDe(unaFamilia) {
		rango = new Don(subordinados = self.subordinados())
		unaFamilia.ascenderADon(self)
	}
	
	method subordinados() {
		return rango.subordinados()
	}
	
	method esSoldado(){
		return rango.esSoldado()
	}
	
	method ascenderASubjefe() {
		rango = new Subjefe(subordinados = #{})
	}
	
	method tieneMasDeCincoArmas(){
		return self.cantidadDeArmas() > 5
	}
}
