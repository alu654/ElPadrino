class Don {
	const property subordinados = #{}
	const property esSoldado = false
	
	method sabeDespacharElegantemente(unaPersona){
		return true
	}	
	
	method atacarlo(unMafioso, mafiosoAtacado){
		const unSubordinado = subordinados.anyOne()
		unSubordinado.atacarlo(mafiosoAtacado)
	}
	
	method subordinadoMasLeal(){
		return subordinados.max( {subordinado => subordinado.nivelLealtad()} )
	}
}

class Subjefe{
	const property subordinados
	const property esSoldado = false
	
	method sabeDespacharElegantemente(unaPersona){
		return subordinados.any( {subordinado => subordinado.tieneArmaSutil()} )
	}
	
	method atacarlo(unMafioso, mafiosoAtacado){
		unMafioso.cualquierArma().usarContra(mafiosoAtacado)
	}
}

class Soldado {
	const property esSoldado = true
	
	method sabeDespacharElegantemente(unaPersona){
		return unaPersona.tieneArmaSutil()
	}
	
	method atacarlo(unMafioso, mafiosoAtacado){
		unMafioso.armaMasCercana().usarContra(mafiosoAtacado)
	}
	
	method subordinados() {
		return #{}
	}
}
