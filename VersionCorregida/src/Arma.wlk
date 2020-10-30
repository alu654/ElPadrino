class Pistola {
		var cantidadBalas

	method esSutil() {
		return cantidadBalas == 1
	}

	method usarContra(unaPersona) {
		if (self.estaCargada()) {
			unaPersona.morir()
			cantidadBalas--			
		}
	}
	
	method estaCargada() {
		return cantidadBalas > 0
	}
	
}

class CuerdaDePiano {

	const esDeBuenaCalidad

	method esSutil() {
		return true
	}
	
	method usarContra(unaPersona) {
		if (esDeBuenaCalidad) {
			unaPersona.morir()			
		}
	}
}

class Escopeta {

	method esSutil() {
		return false
	}

	method usarContra(unaPersona) {
		unaPersona.herir()
	}
}
