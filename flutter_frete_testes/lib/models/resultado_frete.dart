import 'package:simulador_frete/models/tipo_frete.dart';

class ResultadoFrete {
  final TipoFrete tipo,
  final double peso,
  final double distanciaKm,

  const ResultadoFrete({
    required TipoFrete tipo,
    required double peso,
    required double distanciaKm,
  });

  ResultadoFrete copyWith({double? valor, int? prazoDias}) {
    return ResultadoFrete(
      TipoFrete: TipoFrete ?? this.tipo,
      peso: peso ?? this.peso,
      distanciaKm: distanciaKm ?? this.distanciaKm
    );
  }
}
