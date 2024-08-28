class Conta<T extends num> {
  T saldo;

  Conta(this.saldo);

  void depositar(T valor) {
    saldo = _add(saldo, valor);
  }

  void sacar(T valor) {
    saldo = _subtract(saldo, valor);
  }

  T consultarSaldo() {
    return saldo;
  }

  T _add(T a, T b) {
    if (a is int && b is int) {
      return (a + b) as T;
    } else if (a is double && b is double) {
      return (a + b) as T;
    } else {
      throw ArgumentError('Tipo não suportado para adição');
    }
  }

  T _subtract(T a, T b) {
    if (a is int && b is int) {
      return (a - b) as T;
    } else if (a is double && b is double) {
      return (a - b) as T;
    } else {
      throw ArgumentError('Tipo não suportado para subtração');
    }
  }
}