import 'dart:io';
import 'dart:math';
import '../lib/apolice.dart';
import '../lib/seguradora.dart';
import '../lib/tipo_seguro.dart';
import '../lib/tomadores.dart';

void main(List<String> arguments) {

  while (true){
  print("\n");
  print("-----------------------------------------------------------------------------");
  print("             Seguradora 'Surpresas Existem!'");
  print("\n");
  print("------------------------Escolha uma das opções abaixo------------------------");
  print("1 - Quantidade de apólices ativas");
  print("2 - Quantidade de apólices inativas");
  print("3 - Quantidade de apólices ativas e valor médio segurado por seguradora");
  print("4 - Quantidade de apólices ativas e valor médio segurado por tipo de seguro");
  print("5 - Apólices ativas e valor do prémio a pagar por seguradora");
  print("6 - Apólices ativas e valor do prémio a pagar por tipo de seguro");
  print("-----------------------------Sobre cada apólice------------------------------");
  print("7 - Seguradora");
  print("8 - Tomador");
  print("9 - Segurado");
  print("10 - Tipos de Seguros");
  print("11 - Apólices");
  print("0 - Sair");
  print("-----------------------------------------------------------------------------");
  print("\n");

  var input = stdin.readLineSync()!;
  var escolha = int.parse(input);
  switch (escolha) {
    case 1:
      stdout.write("Existem ");
      stdout.write(apolices
          .where((element) => element.ativo == true)
          .length); //mostra a quantidade de apolices quando o elemento "ativo" for "true"
      stdout.write(" apólices ativas.");
      //usa-se stdout.write para que seja tudo escrito na mesma linha
      break;

    case 2:
      stdout.write("Existem ");
      stdout.write(apolices
          .where((element) => element.ativo == false)
          .length); //mostra a quantidade de apolices quando o elemento "ativo" for "false"
      stdout.write(" apólices inativas.");
      break;

    case 3:
      int numero = 0;
      print("--Selecione a Seguradora:--");
      seguradoras.forEach((element) => {
        numero += numero,
        stdout.write(numero),
        stdout.write(" - "),
        stdout.write("${element.nomeSeguradora}")});

    break;
    
    case 4:
      double totalCobertura2 = 0.0;      
      double mediaCobertura2 = 0.0;
      apolices.where((e) => e.ativo == true).forEach((e) => { 
        tomadores.where((i) => i.tipoSeguro.name == e.tipoSeguro.name).forEach((i) => { 
          totalCobertura2 += e.cobertura
        }),
        mediaCobertura2 = totalCobertura2 / (seguradoras.where((element) => element.nomeSeguradora == e.nomeSeguradora).length),
        stdout.write("A média da cobertura do Tipo de seguro ${e.tipoSeguro.name} é: "),
        stdout.write(mediaCobertura2),
        stdout.write(" €.\n")
      });
    break;

    case 5: 

    break;

    case 6:
    
    break;
    
    case 7:
      print("-- Seguradoras --\n");
      seguradoras.forEach((element) {
        print('Nome: ${element.nomeSeguradora}\n'
            'Morada: ${element.moradaSeguradora}\n'
            'Ano de Fundação: ${element.anoCriacao}\n'
            'Contacto: ${element.numeroTelefone}\n');
      });
      break;

    case 8:
      print("-- Tomadores --\n");

      apolices.where((element) => element.ativo == true).forEach((element) => { 
        tomadores.where((i) => i.nomeTomador == element.nomeTomador).forEach((i) { 
          print('''
              Tomador: ${element.nomeTomador},
              Seguradora: ${element.nomeSeguradora},
              Tipo de seguro: ${i.tipoSeguro.name},
              Segurado: ${i.nomesegurado}
              --------------------------------
              Morada do Tomador: ${i.moradaTomador},
              Idade do Tomador: ${i.idade} anos\n''');})
      });
      break;

    case 9:
      print("--Seguradores --\n");
      apolices.forEach((e) {
        print('''
            Segurado: ${e.segurado}
            Tomador : ${e.nomeTomador}
            Nome Seguradora : ${e.nomeSeguradora}
            Tipo Seguradora : ${e.tipoSeguro.name}\n''');
      });
      break;

    case 10:
      print("-- Tipos de Seguros --\n");
      TipoSeguro.values.forEach((element) {
        print('${element.name}');
      });
      break;

    case 11:
      print("-- Apolices --\n");
      apolices.forEach((element) {
        print('Nome do Tomador: ${element.nomeTomador}\n'
            'Nome da Seguradora: ${element.nomeSeguradora}\n'
            'Tipo de Seguro: ${element.tipoSeguro.name}\n'
            'Tempo de Seguro: ${element.tempoDeSeguro} (anos)\n'
            'Cobertura: ${element.cobertura} (euros)\n'
            'Valor anual: ${element.valorAnual} (euros)\n'
            'Estado: ${element.ativo} (true=ativo; false=inativo)\n');
      });
      break;

    case 0:
      print("Até à próxima! :)");
      exit(0);
  }}
}
