import 'package:flutter_test/flutter_test.dart';

import 'package:simulador_frete/frete/calculadora_frete.dart';
import 'package:simulador_frete/models/tipo_frete.dart';

void main() {
  final calculadora = CalculadoraFrete();

  test('frete econômico deve calcular valor pelo peso', () {
    // Arrange
    const peso = 2.0;

    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
    );

    // Assert
    expect(resultado.valor, closeTo(16.0, 0.01));
  });

  test('frete expresso deve calcular valor pelo peso', () {
    final resultado = calculadora.calcular(tipo: TipoFrete.expresso, peso: 2.0);

    expect(resultado.valor, closeTo(30.0, 0.01));
  });


  test('retirada deve possuir frete gratuito', () {
    final resultado = calculadora.calcular(
      tipo: TipoFrete.retirada,
      peso: 10.0,
    );

    expect(resultado.valor, closeTo(0.0, 0.01));
  });

  test('frete econômico deve calcular valor pelo peso e distância', () {
    // Arrange
    const peso = 2.0;
    const distanciaKm = 100.0;

    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distanciaKm: distanciaKm,
    );

    // Assert
    expect(resultado.valor, closeTo(22.0, 0.01));
  });
}



