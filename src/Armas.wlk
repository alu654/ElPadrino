class Revolver{
	var cantidadDeBalas
	
	method esSutil(){
		return cantidadDeBalas == 1
	}
	
	method usarlaContra(unMafioso){
		if(cantidadDeBalas <= 0){
			throw new Exception(message = "Tenes que recargar")
		}
		else
		{
			cantidadDeBalas--
			unMafioso.muere()
		}		
	}
}

object escopeta{
	method esSutil(){
		return false
	}
	
	method usarlaContra(unMafioso){
		if(unMafioso.estaHerido())
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
