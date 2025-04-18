import cosas.*
import cuentasbancarias.*

object casaDePepeYJulian {
    const cosas = []
    const importeDerrochon = 9000
    const minimoDeComida = 2
    var property cuentaBancaria = cuentaCorriente

    method comprar(cosa){
        cuentaBancaria.extraer(cosa.precio())
        cosas.add(cosa)
    }

    method cantidadDeCosasCompradas(){
        return cosas.count({_ => true})
    }

    method tieneAlgun(categoria) {
        return cosas.any({c => c.categoria() == categoria})
    }

    method vieneDeComprar(categoria){
        return !cosas.isEmpty() && cosas.last().categoria() == categoria
    }

    method esDerrochona(){
        return cosas.sum({c => c.precio()}) >= importeDerrochon
    }

    method compraMasCara() {
        // PRECONDICION: Se compró algo
        return cosas.max({c => c.precio()})
    }

    method comprados(categoria){    
        return cosas.filter({c => c.categoria() == categoria})
    }

    method malaEpoca(){
        return cosas.all({c => c.categoria().esComestible()})
    }

    method queFaltaComprar(lista){
        return lista.asSet().difference(cosas.asSet()) 
    }

    method faltaComida(){
        var cantidadDeComida = cosas.count({c => c.categoria().esComestible()})
        return cantidadDeComida < minimoDeComida
    }

    method categoriasCompradas(){
        return cosas.map({c => c.categoria()}).asSet()
    }

    // comprar(cosa): registra que se ha comprado una cosa.
    // cantidadDeCosasCompradas(): indica ... eso.
    // tieneAlgun(categoria): indica si compró algo que es corresponde a esa categoría alguna vez.
    // vieneDeComprar(categoria): indica si la última cosa que se compró es de la categoría indicada.
    // esDerrochona(): indica si el importe total de las cosas compradas es de 9000 pesos o más.
    // compraMasCara(): retorna la cosa comprada de mayor valor.
    // comprados(categoría): devuelve un objeto que contiene todas las cosas compradas que de esa categoría.
    // malaEpoca(): indica si todas las cosas compradas son comida.
    // queFaltaComprar(lista): recibe una lista de cosas y devuelve las cosas de esa lista que aún no se han comprado.
    // Atención: es una pregunta. No se pide que se compren.
    // faltaComida(): indica si se han comprado menos de 2 cosas que son comida.
    // categoríasCompradas():
}
