import 'package:ex3/tipo_seguro.dart';

class Tomadores {
  String? nomeTomador;
  String? moradaTomador;
  int? idade;
  String? nomesegurado;
  TipoSeguro tipoSeguro;

  Tomadores(this.nomeTomador, this.moradaTomador, this.idade, this.nomesegurado,
      this.tipoSeguro);
  @override
  String toString() => '''Nome Tomador: $nomeTomador
      Morada Tomador: $moradaTomador
      Idade Tomador: $idade
      Nome do Segurado: $nomesegurado
      Tipo Seguro: $tipoSeguro
      ''';
}

List<Tomadores> tomadores = [
  Tomadores("Joana Pinheiro", "Rua Qnt Pedras, 261, Vila Nova de Gaia", 22, "Opel Corsa", TipoSeguro.automovel),
  Tomadores("Telmo Santos", "Rua da Casa Rosa, 123, Escapães", 22, "Dentário", TipoSeguro.saude),
  Tomadores("Gustavo Gomes", "Rua da Boa Nova, 38, Porto", 32, "Imobiliário", TipoSeguro.casa),
  Tomadores("Margarida Soares", "Avenida do Pombal, 291, Porto", 28, "Casa", TipoSeguro.casa),
  Tomadores("Ana Fernandes", "Rua Capitão Fausto, 52, Vila Nova de Gaia", 39, "Viagem", TipoSeguro.viagem),
  Tomadores("Filipe Antunes", "Travessa do fim, 287, Porto", 30, "Visão", TipoSeguro.saude),
];
