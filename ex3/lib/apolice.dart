import 'tipo_seguro.dart';

class Apolice {
  String? nomeTomador;
  String nomeSeguradora;
  TipoSeguro tipoSeguro;
  double tempoDeSeguro;
  String segurado;
  double cobertura;
  double valorAnual;
  bool ativo;

  Apolice(
      this.nomeTomador,
      this.nomeSeguradora,
      this.tipoSeguro,
      this.tempoDeSeguro,
      this.segurado,
      this.cobertura,
      this.valorAnual,
      this.ativo);
}

List<Apolice> apolices = [
  Apolice("Joana Pinheiro", "OK! Teleseguros", TipoSeguro.automovel, 10,
      "Opel Corsa", 325.5, 950, true),
  Apolice("Telmo Santos", "Médis", TipoSeguro.saude, 25, "Dentário", 453.8,
      1380, true),
  Apolice("Gustavo Gomes", "OK! Teleseguros", TipoSeguro.casa, 30, "Imobiliario", 304,
      963.7, true),
  Apolice("Margarida Soares", "Fidelidade", TipoSeguro.casa, 35, "Casa", 406,
      1204.2, true),
  Apolice("Ana Fernandes", "Fidelidade", TipoSeguro.viagem, 2, "Viagem", 300,
      876.4, false),
  Apolice("Filipe Antunes", "Advance Care", TipoSeguro.saude, 20, "Visão",
      349.4, 998.3, false),
];
