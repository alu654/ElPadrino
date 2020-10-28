class Pistola {
	var cantidadDeBalas
	
	method esSutil(){
		return cantidadDeBalas == 1
	}
	
}

class Escopeta{
	method esSutil(){
		return false
	}
}


object cuerdaDePiano {
	method esSutil(){
		return true
	}
}
