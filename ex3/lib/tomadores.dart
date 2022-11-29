import 'apolice.dart';

class Tomadores {
  String? nome_tomador;
  String? morada_tomador;
  int? idade_tomador;
  String? nomesegurado;
  String? tiposegurado;

  Tomadores(this.nome_tomador, this.morada_tomador, this.idade_tomador,
      this.nomesegurado, this.tiposegurado);

  get tomadores => null;

  void apoliceTomador() {
    tomadores.where((i) => i.nome_tomador != null).forEach((i) => {
          print('O tomador ${i.nome_tomador} tem as apolices: '),
          apolices
              .where((e) => e.nomeTomador == i.nome_tomador && e.ativo == true)
              .forEach((e) => print('''Apolice...
      Tomador : ${e.nomeTomador}
      Cobertura: ${e.cobertura}
      Valor Anual: ${e.valorAnual}
      Seguradora: ${e.nomeSeguradora}'''))
        });
  }
}
