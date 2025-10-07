/*
CLASES -- polimorficos
- es el modelo a partir del cual crear los objetos
- no se pueden mandar mensajes

persona -->
        clase-->
               - dni
               - edad
               - nombre
               - cumplirAños() = edad + 1


el method van a ser para todos "el mismo"

INSTANCIA -- objeto creado a raiz de una clase

pueden tener distintos valores --> si --> ATRIBUTO
                               --> no --> puede cambiar con el tiempo --> si VARIABLE
                                                                      --> no puedo acceder desde afuera --> si METHOD / no CONSTANTE    


*/

class ChevroletCorsa{
   const property color 

   method capacidad() = 4                         // {return 4}
   method velocidadMaxima() = 150                 //{return 150}
   method peso() = 1300

}

class RenaultKwid{
    var tieneTanqueDeGas 
    

    method agregarTanque(){tieneTanqueDeGas = true}
    method quitarTanque(){tieneTanqueDeGas = false}
    method tieneTanqueDeGas() = true

    method capacidad() = if(tieneTanqueDeGas) 3 else 4 
    method velocidadMaxima() = if(tieneTanqueDeGas) 120 else 110 
    method peso() = if(tieneTanqueDeGas) 1350 else 1200

    //Todos los autos de este tipo con que cuenta la municipalidad son azules.
    method color() = "Azul"
}


object trafic {
    var property interior = comodo
    var property motor =  bataton



    method capacidad() = interior.capacidad()
    method velocidadMaxima() = motor.velocidadMaxima()
    method color() = "Blanco"
    method peso() = 4000 + interior.peso() + motor.peso()


}


object comodo{

  method capacidad() = 5
  method peso() = 700

}

object popular{
  
  method capacidad() = 12
  method peso() = 1000
}


object pulenta{

  method peso() = 800
  method velocidadMaxima() = 130
}

object bataton{
  method peso() = 500
  method velocidadMaxima() = 80
}

class AutoEspecial{
  const property capacidad
  const property velocidadMaxima
  const property color
  const property peso
}


class Dependencia {
    const property flota = #{}

    var property empleados

    method agregarAFlota(rodado){
      flota.add(rodado)
    } 

    method quitarDeFlota(rodado){
      flota.remove(rodado)
    }

    method pesoTotalFlota(){
      flota.sum({unRodado => unRodado.peso()})
    }

    method estaBienEquipado(){
      flota.size() >= 3  && flota.all({unRodado => unRodado.velocidadMaxima() >= 100 })
    }

    method capacidadTotalEnColor(color){
      flota.filter({unRodado => unRodado.color() == color}).sum({unRodado => unRodado.capacidad()})
    }

    method colorDelRodadoMasRapido() = self.rodadoMasRapido()     //self autoreferencia
    //aux
    method rodadoMasRapido() = flota.max({unRodado => unRodado.velocidadMaxima()})

    method capacidadFaltante() =  empleados - capacidadTotal()
  
    method capacidadTotal(){
      flota.sum({})
    }

    method esGrande(){
      empleados >= 40 && flota.size() >= 5
    }

    
    method totalPasajeros(){
      pedidos.sum({unPedido => unPedido.})
    }

    method cualesPedidosNoSatisfechos(){
      pedidos.filter({unPedido => unPedido.satisfaceElPedido(****)})
    }

    method todosLosPedidosIncompatiblesConUnColor(color){
      pedidos.all({unPedido => unPedido.esColorIncompatible(color)})
    }

    method relajarATodos(){
      pedidos.forEach({unPedido=> unPedido.relajar()})
    }


}   

//ETAPA 2



class Pedido {
  const property distancia
  var  tiempoMaximo
  const property cantidadPasajeros
  const property coloresIncompatibles    

 method tiempoMaximo() = tiempoMaximo
  method velocidadRequerida() = distancia / tiempoMaximo

  method satisfaceElPedido(auto){
      auto.velocidadMaxima() >= self.velocidadRequerida() + 10 &&
      auto.capacidad() >= cantidadPasajeros &&
      !coloresIncompatibles.contains(auto.color())
  }

  method acelerar(){
    tiempoMaximo -= 1
  } 

  method relajar(){
    tiempoMaximo += 1
  } 

  const property pedidos = #{} 

    method agregarPedido(){
      pedidos.add(pedido)
    }

    method quitarPedido(){
      pedidos.remove(pedido)
    }

    method esColorIncompatible(color){
      coloresIncompatibles.contains(color)
    }


}
