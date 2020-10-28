class Pistola {
	var cantidadDeBalas
	
	method esSutil(){
		return cantidadDeBalas == 1
	}
	
	method usarlaContra(unMafioso, otraFamilia){
		cantidadDeBalas--
		unMafioso.muere()
		otraFamilia.eliminarMiembro(unMafioso)
	}
}

object escopeta{
	method esSutil(){
		return false
	}
	
	method usarlaContra(unMafioso, otraFamilia){
		if(!unMafioso.estaHerido())
		{
			unMafioso.quedaHerido()
		}
		else
		{
			unMafioso.muere()
			otraFamilia.eliminarMiembro(unMafioso)
		}
	}
}


class CuerdaDePiano {
	const buenaCalidad
	
	method esSutil(){
		return true
	}
	
	method usarlaContra(unMafioso, otraFamilia){
		if(buenaCalidad){
			unMafioso.muere()
			otraFamilia.eliminarMiembro(unMafioso)
		}
	}
}
