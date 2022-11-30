import 'dart:io';
import 'package:ex3/apolice.dart';
import 'package:ex3/data/seguradoras.dart';
import 'package:ex3/seguradora.dart';
import 'package:ex3/tipo_seguro.dart';
import 'package:ex3/tomadores.dart';

void main(List<String> arguments) {
  while (true) {
    //menu principal - após qualquer escolha volta a aparecer, exceto se houver outro menu
    print("\n");
    print("|-----------------------------------------------------------------------------------------|");
    print("|                                    Surpresas Existem!                                   |");
    print("|-----------------------------------------------------------------------------------------|");
    print("|                                                                                         |");
    print("|------------------------------Escolha uma das opções abaixo------------------------------|");
    print("|                                                                                         |");
    print("| 1 - Quantidade de apólices ativas                                                       |");
    print("| 2 - Quantidade de apólices inativas                                                     |");
    print("| 3 - Quantidade de apólices ativas e valor médio segurado (cobertura) por seguradora     |");
    print("| 4 - Quantidade de apólices ativas e valor médio segurado (cobertura) por tipo de seguro |");
    print("| 5 - Apólices ativas e valor do prémio a pagar por seguradora                            |");
    print("| 6 - Apólices ativas e valor do prémio a pagar por tipo de seguro                        |");
    print("|                                                                                         |");
    print("|-----------------------------------Sobre cada apólice------------------------------------|");
    print("|                                                                                         |");
    print("| 7 - Seguradora                                                                          |");
    print("| 8 - Tomador                                                                             |");
    print("| 9 - Segurado                                                                            |");
    print("| 10 - Tipos de Seguros                                                                   |");
    print("| 11 - Apólices                                                                           |");
    print("| 12 - Inserir Apólice                                                                    |");
    print("| 13 - Inserir Seguradora                                                                 |");
    print("| 14 - Apagar Seguradora                                                                  |");
    print("| 0 - Sair                                                                                |");
    print("|                                                                                         |");
    print("|-----------------------------------------------------------------------------------------|");
    print("\n");

    Seguradoras nelo = Seguradoras(); //nova instância de seguradora

    // lê o input do utilizador
    var input = stdin.readLineSync()!;
    var escolha = int.parse(input);

    switch (escolha) {
      case 1:
        stdout.write("Existem ");
        print(apolices
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
        //criação de uma lista ss
        List<String> ss = [];
      
        //para cada apolice ativa adiciona o nome da seguradora à lista ss
        apolices.where((element) => element.ativo == true ).forEach((element) => {
          
        //se o nome da seguradora nao constar na lista, este é adicionado  
        if (ss.contains(element.nomeSeguradora) == false){
          ss.add(element.nomeSeguradora)
        }});

        //sub-menu das seguradoras
        print("\n---Escreva o nome da Seguradora:---");
        //para que os elementos da lista sejam mostrados sem ser na forma de array: [x;y;etc]
        ss.forEach((element) { 
          print("$element");
        });
        print("Prima 0 para voltar");
        print("-----------------------------------\n");
        //lê o input do utilizador e, caso seja 0, para
        var ler = stdin.readLineSync()!;
        if (ler == "0") {
          break;
        }

        //instanciar variáveis que vão ser usadas para calcular a média
        double totalCobertura = 0.0;
        double mediaCobertura = 0.0;
        int count = 0;
        
        //elementos de apolices que estão ativos e em que o nome de seguradora é igual ao input do utilizador - usado o toUpperCase para que quer que o utilizador utilize capitalização
        //ou não, seja possivel comparar
        apolices.where((element) => element.ativo == true && element.nomeSeguradora.toUpperCase() == ler.toUpperCase()).forEach((element) => {
          totalCobertura += element.cobertura,
          count += 1, //de cada vez que o forEach é percorrido, incrementa 1 no count
          });
          mediaCobertura = totalCobertura / count;
          print("A média da cobertura da seguradora é: $mediaCobertura€ em $count apólices ativas.\n");
        break;

      case 4:
        //criação de um bool para verificar se a apólice está ativa ou não
        bool ad = true;

        //sub-menu dos tipos de seguros
        print("\n--Selecione o tipo de seguro:--");
        print("1- Saúde\n2- Automóvel\n3- Casa\n4- Viagem");
        print("0- Voltar");
        print("-------------------------------\n");

        // lê o input do utilizador
        var ler = stdin.readLineSync()!;
        var escolha = int.parse(ler);

        //instanciar variáveis que vão ser usadas para calcular a média
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
                      count += 1, //de cada vez que o forEach é percorrido, incrementa 1 no count
                      ad = element.ativo, //o bool criado em cima vai ser true se a apólice estiver ativa
                    });
            //se a apólice estiver ativa dá mostra a média e a quantidade de apólices ativas
            if (ad == true) {
              mediaCobertura = totalCobertura / count;
              print(
                  "A média da cobertura do Tipo de Seguro 'Saúde' é: $mediaCobertura€ em $count apólices ativas.\n");
            } 
            //se a apólice não estiver ativa dá print a dizer isso mesmo
            else {
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
        //para cada elemento em seguradoras, mostra os valores
        seguradoras.forEach((element) {
          print('Nome: ${element.nomeSeguradora}\n'
              'Morada: ${element.moradaSeguradora}\n'
              'Ano de Fundação: ${element.anoCriacao}\n'
              'Contacto: ${element.numeroTelefone}\n');
        });
      break;

      case 8:
        print("-- Tomadores --\n");
        //para as apólices ativas e caso o nome do tomador em tomadores seja igual ao nome do tomador em apolices, mostra os valores
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
        print("--Segurados --\n");
        //para cada elemento em apolices, mostra os valores dos segurados
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
        //mostra os valores dos elementos de TipoSeguros
        TipoSeguro.values.forEach((element) {
          print('${element.name}');
        });
      break;

      case 11:
        print("-- Apolices --\n");
        //para cada elemento em apólices, mostra os valores
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
        //lê os inputs do utilizador, à medida que o programa vai pedindo, para inserir esses dados em apolices
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
        //lê os inputs do utilizador, à medida que o programa vai pedindo, para inserir esses dados nas seguradoras
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
        //apaga das seguradoras a seguradora com o id escolhido
        int id = int.parse(stdin.readLineSync()!);
        var index = nelo.list.indexWhere((i) => i.id == id);
        nelo.delete(nelo.list[0]);
      break;

      case 0:
        print("Até à próxima! :)");
      //sai do programa
      exit(0);
    }
  }
}
