// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void incrementar() {
    counter++;
    setState(() {});
  }

  void decrementar() {
    counter--;
    setState(() {});
  }

  void resetear() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('HomeScreen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Número de Clicks', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingAction(
        incrementarFN: incrementar,
        decrementarFN: decrementar,
        resetearFN: resetear,
      ),
    );
  }
}

class CustomFloatingAction extends StatelessWidget {
  final Function incrementarFN;
  final Function decrementarFN;
  final Function resetearFN;

  const CustomFloatingAction(
      {super.key,
      required this.incrementarFN,
      required this.decrementarFN,
      required this.resetearFN});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => incrementarFN(),
          child: const Icon(Icons.exposure_plus_1_outlined),
          // onPressed: () => setState(() => counter++),
        ),
        FloatingActionButton(
          onPressed: () => resetearFN(),
          child: const Icon(Icons.refresh_outlined),
          // onPressed: () => setState(() => counter = 0),
        ),
        FloatingActionButton(
          onPressed: () => decrementarFN(),
          child: const Icon(Icons.exposure_minus_1_outlined),
          // onPressed: () => setState(() => counter--),
        ),
      ],
    );
  }
}
