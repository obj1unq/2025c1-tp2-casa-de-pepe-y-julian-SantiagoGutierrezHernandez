object cuentaCorriente{
    var saldo = 0

    method saldo() = saldo

    method depositar(monto){
        saldo += monto
    }

    method extraer(monto){
        if (monto > saldo)
            throw new AssertionException()
        saldo -= monto
    }
}

object cuentaConGastos {
    var saldo = 0
    var property costoOperacion = 20
    const depositoMaximo = 1000

    method saldo() = saldo

    method depositar(monto){
        if(monto > depositoMaximo)
            throw new AssertionException()
        saldo += monto - costoOperacion
    }

    method extraer(monto){
        saldo -= monto
    }
}