import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team 5',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.tealAccent.shade700),
        useMaterial3: true,
        fontFamily: 'Anta',
      ),
      home: const MyHomePage(title: 'Team 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _desafio2(int valueA, int valueB, int valueC) {
    int sum = valueA + valueB;
    setState(() {
      _result =
          'A soma de $valueA + $valueB é $sum, esse número ${sum > valueC ? 'é maior que' : 'não é maior que'} $valueC';
    });
  }

  void _desafio12(List<int> numbers) {
    List<int> square = [];
    for (int number in numbers) {
      square.add(number * number);
    }
    setState(() {
      _result = 'entrada = $numbers \n saída = $square';
    });
  }  

  void _desafio14(List<int> numbers) {
    int menor = numbers[0];
    int maior = numbers[0];

    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] < menor) {
        menor = numbers[i];
      }
      if (numbers[i] > maior) {
        maior = numbers[i];
      }
    }
    setState(() {
      _result =
          'Entrada: $numbers maior numero é $maior, o numero menor é $menor ';
    });
  }

  void _desafio4(int number) {
    String evenOrOdd = number % 2 == 0 ? 'par' : 'ímpar';
    String positiveOrNegative = number > 0 ? 'positivo' : 'negativo';

    setState(() {
      _result = '$number é $evenOrOdd e $positiveOrNegative';
    });
  }

  void _desafio06(int numero) {
    int antecessor = numero - 1;
    int sucessor = numero + 1;

    setState(() {
      _result =
          'O antecessor de $numero é $antecessor, e o sucessor é $sucessor.';
    });
  }

  void _desafio16(String text) {
    String textReversed = text.split('').reversed.join('');
    bool isPalindrom = text.toLowerCase() == textReversed.toLowerCase();

    setState(() {
      _result =
          '$text | $textReversed - ${isPalindrom ? 'é um palíndromo' : 'não é um palíndromo'}';
    });
  }

  void _desafio11(int number) async {
    List<int> table = [];
    for (int contador = 1; contador <= 10; contador++) {
      table.add(number * contador);
    }
    setState(() {
      _result = table.join(', ');
    });
  }

  void _desafio7(double userSalary, double minimumSalary) {
    double salaryMultiplier = userSalary / minimumSalary;
    setState(() {
      _result =
          'O usuário recebe um salário igual a ${salaryMultiplier.toStringAsFixed(2)} vezes o salário mínimo.';
    });
  }

  void _desafio8(valueA, valueB, valueC) {
    List<int> listNumber = [valueA, valueB, valueC];

    String list = 'A lista de números é: $listNumber ';
    listNumber.sort((a, b) => -a.compareTo(b));
    String descending = 'e a ordem decrescente da lista fica: $listNumber';

    setState(() {
      _result = list.toString() + descending.toString();
    });
  }

  void _desafio09(List<double> notas) {
    double soma = notas.reduce((a, b) => a + b);
    double media = soma / notas.length;
    String mediaString = media.toStringAsFixed(2);
    String resultado;
    if (media >= 7) {
      resultado = 'aprovado';
    } else {
      resultado = 'reprovado';
    }
    setState(() {
      _result = 'Média $mediaString, aluno $resultado';
    });
  }

  void _desafio15(int valueA) {
    List<int> numbers = [];
    for (int i = 0; i <= valueA; i++) {
      numbers.add(i);
    }
    setState(() {
      _result = numbers.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: Text(widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/bongo-cat-button.gif'),
            ),
            ButtonCalculate(
              callChallenge: () {
               // _desafio2(2, 5, 10);
               _desafio12([2,4,6]);
                // _desafio2(2, 5, 10);
                //_desafio4(-7);
                _desafio06(27);

                _desafio16('Arara');
                _desafio11(5);

                _desafio7(1871, 1417);
              },
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              const Text(
                'Resultado:',
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonCalculate extends StatelessWidget {
  final Function() callChallenge;
  const ButtonCalculate({
    super.key,
    required this.callChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: callChallenge,
          child: const Text(
            'calcular',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
