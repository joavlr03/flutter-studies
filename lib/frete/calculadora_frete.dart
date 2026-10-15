import '../models/resultado_frete.dart';
import '../models/tipo_frete.dart';

class CalculadoraFrete {
  ResultadoFrete calcular({required TipoFrete tipo, required double peso}) {
    switch (tipo) {
      case TipoFrete.economico:
        return ResultadoFrete(valor: 10.0 + peso * 3.0, prazoDias: 5);

      case TipoFrete.expresso:
        return ResultadoFrete(valor: 20.0 + peso * 5.0, prazoDias: 2);

      case TipoFrete.retirada:
        return const ResultadoFrete(valor: 0.0, prazoDias: 1);
    }
  }
}
