class Pistola {
	var cantidadDeBalas
	
	method esSutil(){
		return cantidadDeBalas == 1
	}
	
	method usarlaContra(unMafioso){
		cantidadDeBalas--
		unMafioso.muere()
	}
}

object escopeta{
	method esSutil(){
		return false
	}
	
	method usarlaContra(unMafioso){
		if(!unMafioso.estaHerido())
		{
			unMafioso.quedaHerido()
		}
		else
		{
			unMafioso.muere()
		}
	}
}


class CuerdaDePiano {
	const buenaCalidad
	
	method esSutil(){
		return true
	}
	
	method usarlaContra(unMafioso){
		if(buenaCalidad){
			unMafioso.muere()
		}
	}
}
