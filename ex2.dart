import 'dart:io';
import 'dart:math';

int randomnumber(int min, int max) {
  return min + Random().nextInt((max + 1) - min);
}

void main(List<String> args) {
  List<int> numbers = [];
  List<int> impares = [];
  int numeros = randomnumber(90, 151);
  for (int i = 0; i < numeros; i++) {
    numbers.add(Random().nextInt(1000));
  }
  int menor = numbers[0];
  int maior = numbers[0];

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] < menor) {
      menor = numbers[i];
    }
    if (numbers[i] > maior) {
      maior = numbers[i];
    }
  }
  while (true) {
    print('1 - O maior e o menor elemento do conjunto');
    print('2 - A amplitude do conjunto');
    print('3 - Uma listagem dos numeros impares com ordenação decrescente');
    print('4 - Visualização do conjunto');
    int op = int.parse(stdin.readLineSync()!);
    switch (op) {
      case 1:
        print('O menor valor é = $menor e maior valor é = $maior');
        break;
      case 2:
        int amplitude = maior + menor;
        print('A amplitude é : $amplitude');
        break;
      case 3:
        for (int j in numbers) {
          if (j.isOdd) {
            impares.add(j);
          }
        }
        impares.sort((b, a) => a.compareTo(b));
        print(impares);

        break;
      case 4:
        print('$numbers');
        break;
    }
  }
}
