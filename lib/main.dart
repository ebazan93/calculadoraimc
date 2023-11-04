import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMbdfbC',
      home: CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  double altura = 170.0;
  double peso = 70.0;
  double imc = 0.0;
  String mensaje = '';
  String mensaje2 = '';

  void calcularIMC() {
    setState(() {
      imc = peso / ((altura / 100) * (altura / 100));

      if (imc < 18.5) {
        mensaje = 'Delgadez o bajo peso';
      } else if (imc >= 18.5 && imc < 25.0) {
        mensaje = 'Peso saludable';
      } else if (imc >= 25.0 && imc < 30.0) {
        mensaje = 'Sobrepeso';
      } else {
        mensaje = 'Obesidad';
      }

      switch (mensaje) {
        case 'Delgadez o bajo peso':
          mensaje2 = 'Debería de comer más proteinas';
          break;
        case 'Peso saludable':
          mensaje2 = 'Continue así, haga más deporte';
          break;
        case 'Sobrepeso':
          mensaje2 = 'Debería de comer más saludable';
          break;
        case 'Obesidad':
          mensaje2 = 'Debe ir a un nutricionista con urgencia';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculadora de IMCs')),
        backgroundColor: const Color.fromARGB(255, 91, 27, 102),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'Altura',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${altura.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' cm',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Slider(
              value: altura,
              min: 100.0,
              max: 210.0,
              onChanged: (value) {
                setState(() {
                  altura = value;
                });
              },
            ),
            SizedBox(height: 10),
            Text(
              'Peso',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${peso.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' kg',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Slider(
              value: peso,
              min: 40.0,
              max: 180.0,
              onChanged: (value) {
                setState(() {
                  peso = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: calcularIMC,
                child: Text(
                  'Calcular IMC',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Text(
              '${imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '$mensaje',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 91, 27, 102)),
            ),
            SizedBox(height: 5),
            Text('$mensaje2'),
            SizedBox(height: 5),
            Expanded(
              child: Image.asset('assets/images/imagen.png'),
            ),
          ],
        ),
      ),
    );
  }
}
