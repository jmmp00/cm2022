import 'dart:io';
import 'package:ex3/apolice.dart';
import 'package:ex3/data/seguradoras.dart';
import 'package:ex3/seguradora.dart';
import 'package:ex3/tipo_seguro.dart';
import 'package:ex3/tomadores.dart';

void main(List<String> arguments) {
  while (true) {
    print("\n");
    print(
        "-----------------------------------------------------------------------------");
    print("             Seguradora 'Surpresas Existem!'");
    print("\n");
    print(
        "------------------------Escolha uma das opções abaixo------------------------");
    print("1 - Quantidade de apólices ativas");
    print("2 - Quantidade de apólices inativas");
    print(
        "3 - Quantidade de apólices ativas e valor médio segurado por seguradora");
    print(
        "4 - Quantidade de apólices ativas e valor médio segurado por tipo de seguro");
    print("5 - Apólices ativas e valor do prémio a pagar por seguradora");
    print("6 - Apólices ativas e valor do prémio a pagar por tipo de seguro");
    print(
        "-----------------------------Sobre cada apólice------------------------------");
    print("7 - Seguradora");
    print("8 - Tomador");
    print("9 - Segurado");
    print("10 - Tipos de Seguros");
    print("11 - Apólices");
    print("12 -Inserir Apolice ");
    print("13 - Inserir Seguradora ");
    print("14 - Delete Seguradora");
    print("0 - Sair");
    print(
        "-----------------------------------------------------------------------------");
    print("\n");

    Seguradoras nelo = Seguradoras();

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
        bool ad = true;
        print("\n--Escreva o nome da Seguradora:--");
        seguradoras
            .forEach((element) => {print("- ${element.nomeSeguradora}")});
        print("- Prima 0 para voltar");
        print("-----------------------------------\n");
        var ler = stdin.readLineSync()!;
        if (ler == "0") {
          break;
        }

        double totalCobertura = 0.0;
        double mediaCobertura = 0.0;
        int count = 0;

        apolices
            .where((element) =>
                element.nomeSeguradora?.toUpperCase() == ler.toUpperCase())
            .forEach((element) => {
                  totalCobertura += element.cobertura,
                  count += 1,
                  ad = element.ativo,
                });
        if (ad == true) {
          mediaCobertura = totalCobertura / count;
          print(
              "A média da cobertura da seguradora é: $mediaCobertura€ em $count apólices ativas.\n");
        } else {
          print("Não existem apólices ativas para esta seguradora.\n");
        }
        break;

      case 4:
        bool ad = true;
        print("\n--Selecione o tipo de seguro:--");
        print("1- Saúde\n2- Automóvel\n3- Casa\n4- Viagem");
        print("0- Voltar");
        print("-------------------------------\n");
        var ler = stdin.readLineSync()!;
        var escolha = int.parse(ler);

        double totalCobertura = 0.0;
        double mediaCobertura = 0.0;
        int count = 0;

        switch (escolha) {
          case 1:
            apolices
                .where((element) =>
                    element.ativo == true && element.tipoSeguro.name == "saude")
                .forEach((element) => {
                      totalCobertura += element.cobertura,
                      count += 1,
                      ad = element.ativo,
                    });
            if (ad == true) {
              mediaCobertura = totalCobertura / count;
              print(
                  "A média da cobertura do Tipo de Seguro 'Saúde' é: $mediaCobertura€ em $count apólices ativas.\n");
            } else {
              print("Não existem apólices ativas para este tipo de seguro.\n");
            }

            break;

          case 2:
            apolices
                .where((element) =>
                    element.ativo == true &&
                    element.tipoSeguro.name == "automovel")
                .forEach((element) => {
                      totalCobertura += element.cobertura,
                      count += 1,
                      ad = element.ativo,
                    });
            if (ad == true) {
              mediaCobertura = totalCobertura / count;
              print(
                  "A média da cobertura do Tipo de Seguro 'Automóvel' é: $mediaCobertura€ em $count apólices ativas.\n");
            } else {
              print("Não existem apólices ativas para este tipo de seguro.\n");
            }
            break;

          case 3:
            apolices
                .where((element) =>
                    element.ativo == true && element.tipoSeguro.name == "casa")
                .forEach((element) => {
                      totalCobertura += element.cobertura,
                      count += 1,
                      ad = element.ativo,
                    });
            if (ad == true) {
              mediaCobertura = totalCobertura / count;
              print(
                  "A média da cobertura do Tipo de Seguro 'Casa' é: $mediaCobertura€ em $count apólices ativas.\n");
            } else {
              print("Não existem apólices ativas para este tipo de seguro.\n");
            }
            break;

          case 4:
            apolices
                .where((element) =>
                    element.ativo == true &&
                    element.tipoSeguro.name == "Viagem")
                .forEach((element) => {
                      totalCobertura += element.cobertura,
                      count += 1,
                      ad = element.ativo,
                    });
            if (ad == true) {
              mediaCobertura = totalCobertura / count;
              print(
                  "A média da cobertura do Tipo de Seguro 'Viagem' é: $mediaCobertura€ em $count apólices ativas.\n");
            } else {
              print("Não existem apólices ativas para este tipo de seguro.\n");
            }
            break;

          case 0:
            break;
        }
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

        apolices
            .where((element) => element.ativo == true)
            .forEach((element) => {
                  tomadores
                      .where((i) => i.nomeTomador == element.nomeTomador)
                      .forEach((i) {
                    print('''
              Tomador: ${element.nomeTomador},
              Seguradora: ${element.nomeSeguradora},
              Tipo de seguro: ${i.tipoSeguro.name},
              Segurado: ${i.nomesegurado}
              --------------------------------
              Morada do Tomador: ${i.moradaTomador},
              Idade do Tomador: ${i.idade} anos\n''');
                  })
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
      case 12:
        print("------------------------Apolice----------------");
        print("Insira o nome do Tomador:");
        String nome = stdin.readLineSync()!;
        print("Insira o nome da Seguradora ");
        String nomeSeguradora = stdin.readLineSync()!;
        print("Insira o tempo do Seguro");
        double tempoSeguro = double.parse(stdin.readLineSync()!);
        print("Insira o nome do Segurado");
        String segurado = stdin.readLineSync()!;
        print("Insira o valor da Cobertura");
        double cobertura = double.parse(stdin.readLineSync()!);
        print("Insira o Valor Anual");
        double valorAnual = double.parse(stdin.readLineSync()!);
        apolices.add(Apolice(nome, nomeSeguradora, TipoSeguro.automovel,
            tempoSeguro, segurado, cobertura, valorAnual, true));
        print("-----------------------------------------------------");
        break;
      case 13:
        print("-----------------------Seguradora---------------------");
        print("Insira o nome da Seguradora:");
        String nome = stdin.readLineSync()!;
        print("Insira a morada da Seguradora ");
        String morada = stdin.readLineSync()!;
        print("Insira o ano da Criação");
        int anoCriacao = int.parse(stdin.readLineSync()!);
        print("Insira o numero de Telefone");
        int numeroTelefone = int.parse(stdin.readLineSync()!);
        nelo.add(Seguradora(5, nome, morada, anoCriacao, numeroTelefone));
        print(nelo.list);
        print("-----------------------------------------------------");
        break;
      case 14:
        int id = int.parse(stdin.readLineSync()!);
        var index = nelo.list.indexWhere((i) => i.id == id);
        nelo.delete(nelo.list[0]);

        break;
      case 0:
        print("Até à próxima! :)");
        exit(2);
    }
  }
}
