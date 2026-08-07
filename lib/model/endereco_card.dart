import 'package:flutter/material.dart';
import 'package:viacepserviceapp/components/endereco_card.dart';

class EnderecoCard extends StatelessWidget {
  final Endereco endereco;
  const EnderecoCard({super.key, required this.endereco});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 8),
                Text(
                  'Endereço encontrado',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            // AQUI SERÃO ADICIONADOS OS CAMPOS DO ENDEREÇO
            _EnderecoItem(titulo: 'CEP', valor: endereco.cep),
            _EnderecoItem(titulo: 'Logradouro', valor: endereco.logradouro),
            _EnderecoItem(titulo: 'Complemento', valor: endereco.complemento),
            _EnderecoItem(titulo: 'Bairro', valor: endereco.bairro),
            _EnderecoItem(titulo: 'Cidade', valor: endereco.localidade),
            _EnderecoItem(
              titulo: 'Estado',
              valor: '${endereco.estado} - ${endereco.uf}',
            ),
            _EnderecoItem(titulo: 'Região', valor: endereco.regiao),
            _EnderecoItem(titulo: 'DDD', valor: endereco.ddd)
          ],
        ),
      ),
    );
  }
}


class _EnderecoItem extends StatelessWidget {
  final String titulo;
  final String valor;
  const _EnderecoItem({required this.titulo, required this.valor});
  @override
  Widget build(BuildContext context) {
    final valorExibido = valor.trim().isEmpty ? 'Não informado' : valor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 4),
        Text(valorExibido, style: Theme.of(context).textTheme.bodyLarge),
      ],

      
    );
  }
}

