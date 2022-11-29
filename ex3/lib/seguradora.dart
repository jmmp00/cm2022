class Seguradora {
  int id;
  String? nomeSeguradora;
  String? moradaSeguradora;
  int? anoCriacao;
  int? numeroTelefone;

  Seguradora(this.id, this.nomeSeguradora, this.moradaSeguradora,
      this.anoCriacao, this.numeroTelefone);
  @override
  String toString() =>
      'Nome Seguradora: $nomeSeguradora --> Morada Seguradora: $moradaSeguradora --> ID: $id';
}

List<Seguradora> seguradoras = [
  Seguradora(0, 'ACE Europe', "Leopoldstraat 39, 2800 Mechelen, Bélgica", 1985,
      3215348884),
  Seguradora(
      1, 'Advance Care', "Alfredo Guisado 8, 1500-030 Lisboa", 1998, 213228000),
  Seguradora(
      2, 'Fidelidade', "Largo Calhariz 30, 1249-001 Lisboa", 2004, 217948800),
  Seguradora(3, 'Médis', "Praça Príncipe Perfeito 2, 1990-278 Lisboa", 1998,
      218458888),
  Seguradora(4, 'OK! Teleseguros', "Av. da Boavista 267 Piso 1, 4050-115 Porto",
      1998, 226052800),
];
