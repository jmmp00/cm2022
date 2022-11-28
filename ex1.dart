void main(){   
      List<int> array = []; //criação de um array list onde vamos inserir os números
      int soma = 0;
      double media = 0;
      for(int j=101; j<200 ;j++){ //vai ver os números primos entre ]100, 200[
        int i = checkPrime(j); //retorna os números do métudo abaixo
        if (i != 0) { //se o número returnado for diferente de zero
          array.add(i);// é adicionado no array list, ou seja, somente os números primos são adicionados ao array list
          soma = soma += array.last; //faz a soma de todos os números primos
        }  
      }
      media = (soma / array.length); //faz a média dos números primos
      print ("soma: "+ '$soma' + "; média: " + '$media');

}
checkPrime(int num){ // métudo que verifica se um número é primo ou não
   int i,m=0,flag=0;

   m=num~/2; //divide o numero por dois e arredonda à unidade mais proxima
  for(i = 2;i<=m;i++){ 
    if(num%i == 0){ //se o resto da divisão do número por i for = 0, flag = 1 e retorna 0
      flag=1;
      return (0);
    }
  }
  if(flag==0){ //se flag = 0, retorna o número (primo)
    return (num);
  }
  }