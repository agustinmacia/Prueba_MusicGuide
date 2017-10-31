class Presentacion {
 var fecha = new Date()
 var lugar
 var artistas = #{}
 
 constructor(_fecha,_lugar){
  fecha = _fecha
  lugar = _lugar
 } 
 
 constructor (_fecha,_lugar,_artistas){
	fecha = _fecha
	lugar = _lugar
	artistas = _artistas
 }
 
 method artistas(_artista) { artistas.add(_artista)}
 method artistas() = artistas
 method fecha() = fecha
 method lugar() = lugar
 
 method costoTotal(){
 	return _artistas.sum({unArtista => unArtista.costoPresentacion()})
 }
}

class Lugar {
  var capacidadPlantaAlta = 0
  var capacidadPlantaBaja = 0
  
  constructor(_capacidadPlantaAlta, _capacidadPlantaBaja)
  {
   capacidadPlantaAlta = _capacidadPlantaAlta
   capacidadPlantaBaja = _capacidadPlantaBaja
  }
  
  method capacidad(_fecha){
   return self.capacidadPlantaAlta(_fecha) 
          +  self.capacidadPlantaBaja(_fecha)
  }
  method capacidadPlantaAlta(_fecha) 
  {
   return capacidadPlantaAlta
  }
  method capacidadPlantaBaja(_fecha) 
  {
   return capacidadPlantaBaja
  }
}

class Canciones{
 var duracion = 0
 var letra = null
 
 constructor(_duracion,_letra) {
  duracion = _duracion
  letra = _letra
 }
 method duracion() = duracion
 method letra() = letra
}

object pimpinella {
 var integrantes = #{}
 
 method agregarIntegrante(_integrante)
 {
  integrantes.add(_integrante)
 }
 method quitarIntegrante(_integrante)
 {
  integrantes.remove(_integrante)
 }
 
}
object joaquin{
 var grupo = pimpinella
 var habilidad = 20
 
  method tocaEnGrupo() = {
  	habilidad  = 25
  }
  
  method habilidadDeJoaquin() = habilidad
  method integraGrupo() = grupo
  method integraGrupo(_grupo){
   _grupo.agregarIntegrante(self)
   grupo = _grupo
  } 

  method dejarGrupo(_grupo){
   _grupo.quitarIntegrante(self)
   grupo = null
  } 

  method habilidad(_presentacion){
   if(_presentacion.artistas().contains(self)
    && _presentacion.size() > 1)
   {
     return habilidad + 5
   }else return habilidad
  }

   method costoPresentacion(_presentacion){
   if(_presentacion.artistas().contains(self)
    && _presentacion.artistas().size() > 1)
   {
     return 50
   }else return 100
    
   } 
   method interpretaBien(_cancion) {
   return _cancion.duracion() > 300
  }
}

object lucia{
 
 var grupo = pimpinella
 var habilidad = 70
 var costoPresentacion
 
  method integraGrupo() = grupo
  method integraGrupo(_grupo){
   _grupo.agregarIntegrante(self)
   grupo = _grupo
  } 

  method dejarGrupo(_grupo){
   _grupo.quitarIntegrante(self)
   grupo = null
  } 


 method tocaEnGrupo(){
 	
    habilidad -= 20
  }
  
  
 method habilidadDeLucia() = habilidad
 
 
 method lugarConcurrido(lugarPresentacion){
   if (lugarPresentacion.capacidad() > 5000) {
    costoPresentacion = 500
   }
   else
   {
    costoPresentacion = 400
   }
 }
 
 method costoPresentacion() = costoPresentacion
 
 
 method interpretaBien(_cancion){
  return _cancion.letra().toLowerCase().contains("familia")
 }
}


object luisAlberto{
  var guitarra = fender
  var fechaLimite = new Date(1,10,2017)

	
  method guitarraMostrar() = guitarra
  method guitarra(_guitarra) {
   guitarra = _guitarra
  }
  
  method habilidad()
  {
   if(8 * guitarra.unidadGuitarra() > 100){
    return 100
    }else{ return 8 * guitarra.unidadGuitarra()  }
  }
  
  method costoPresentacion(_presentacion){
  if(_presentacion.fecha()<= fechaLimite){
   return 1000
  } else return 1200
 }
 
 method interpretaBien(_cancion)= true
}


object fender{
 var unidadGuitarra = 10
 method unidadGuitarra() = unidadGuitarra
}

object gibson{
 var unidadGuitarra = 15
 
 method unidadGuitarra() = unidadGuitarra
 method estaRota(){
  unidadGuitarra = 5
}
}

object lunaPark{
	var capacidad = 9290
	method capacidad() = capacidad
}

object trastienda{
	var capacidadPlantaBaja = 400
	var capacidadPrimerPiso = 300
	var fechaSabado = new Date(5,8,2017)
	
method capacidad(_fecha){
   if(_fecha == fechaSabado){
 		return (capacidadPrimerPiso +  capacidadPlantaBaja)}
  else{
  	return capacidadPlantaBaja}
  }
  method capacidadPrimerPiso(_fecha) 
  {
   return capacidadPrimerPiso
  }
  method capacidadPlantaBaja(_fecha) 
  {
   return capacidadPlantaBaja
  }
}