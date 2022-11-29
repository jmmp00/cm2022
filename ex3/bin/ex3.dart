import 'dart:io';
import 'dart:math';

import '../lib/apolice.dart';

import '../lib/seguradora.dart';
import '../lib/tipo_seguro.dart';

void main(List<String> arguments) {
  while (true) {
    print("\n");
    print("             Seguradora 'Surpresas Existem!'");
    print("\n");
    print("--------------Escolha uma das opções abaixo--------------");
    print("1 - Quantidade de apólices ativas");
    print("2 - Quantidade de apólices inativas");
    print(
        "3 - Quantidade de apólices ativas e valor médio segurado por seguradora");
    print(
        "4 - Quantidade de apólices inativas e valor médio segurado por seguradora");
    print("-------------------Sobre cada apólice--------------------");
    print("5 - Seguradora");
    print("6 - Tomador");
    print("7 - Segurado");
    print("8 - Tipos de Seguros");
    print("9 - Apólices");
    print("15 - Inserir Apolice");
    print("16 - Adicionar Seguradora");
    print("0 - Sair");
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
        break;
      case 4:
        break;
      case 5:
        print("-- Seguradoras --\n");
        seguradoras.forEach((element) {
          print('Nome: ${element.nomeSeguradora}\n'
              'Morada: ${element.moradaSeguradora}\n'
              'Ano de Fundação: ${element.anoCriacao}\n'
              'Contacto: ${element.numeroTelefone}\n');
        });
        break;

      case 6:
        print("-- Tomadores --\n");
        apolices.where((i) => i.nomeTomador != null).forEach((i) => {
              print('Tomador: ${i.nomeTomador} tem as apolices:'),
              apolices
                  .where(
                      (e) => e.nomeTomador == i.nomeTomador && e.ativo == true)
                  .forEach((e) => print('''
              Seguradora: ${e.nomeSeguradora},
'''))
            });
        break;

      case 7:
        print("--Seguradores --\n");
        apolices.forEach((e) {
          print('''
            Segurado: ${e.segurado}
            Tomador : ${e.nomeTomador}
            Nome Seguradora : ${e.nomeSeguradora}
            Tipo Seguradora : ${e.tipoSeguro}''');
        });
        break;

      case 8:
        print("-- Tipos de Seguros --\n");
        TipoSeguro.values.forEach((element) {
          print('${element.name}');
        });
        break;

      case 9:
        print("-- Apolices --\n");
        apolices.forEach((element) {
          print('Nome do Tomador: ${element.nomeTomador}\n'
              'Nome da Seguradora: ${element.nomeSeguradora}\n'
              'Tipo de Seguro: ${element.tipoSeguro.name}\n'
              'Tempo de Seguro: ${element.tempoDeSeguro} (anos)\n'
              'Segurado: ${element.segurado}\n'
              'Cobertura: ${element.cobertura} (euros)\n'
              'Valor anual: ${element.valorAnual} (euros)\n'
              'Estado: ${element.ativo} (true=ativo; false=inativo)\n');
        });
        break;
      case 15:
        print("------------------------Apolice----------------");
        print("Insira o nome do Tomador:");
        String? nome = stdin.readLineSync();
        print("Insira o nome da Seguradora ");
        String? nomeSeguradora = stdin.readLineSync();
        print("Insira o tempo do Seguro");
        String? tempoSeguro = stdin.readLineSync();
        double tp = double.parse(tempoSeguro!);
        print("Insira o nome do Segurado");
        String? segurado = stdin.readLineSync();
        print("Insira o valor da Cobertura");
        String? cobertura = stdin.readLineSync();
        double cover = double.parse(cobertura!);
        print("Insira o Valor Anual");
        String? valorAnual = stdin.readLineSync();
        double va = double.parse(valorAnual!);
        apolices.add(Apolice(nome, nomeSeguradora, TipoSeguro.automovel, tp,
            segurado, cover, va, true));
        print("-----------------------------------------------------");
        break;
      case 16:
        print("-----------------------Seguradora---------------------");
        print("Insira o nome da Seguradora:");
        String? nome = stdin.readLineSync();
        print("Insira a morada da Seguradora ");
        String? morada = stdin.readLineSync();
        print("Insira o ano da Criação");
        String? anoCriacao = stdin.readLineSync();
        int ac = int.parse(anoCriacao!);
        print("Insira o numero de Telefone");
        String? numeroTelefone = stdin.readLineSync();
        int nt = int.parse(numeroTelefone!);
        seguradoras.add(Seguradora(nome, morada, ac, nt));
        print("-----------------------------------------------------");
        break;

      case 0:
        print("Até à próxima! :)");
        exit(2);
    }
  }
}
