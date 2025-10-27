import 'package:flutter/material.dart';

class SoalSatu extends StatefulWidget {
  const SoalSatu({Key? key}) : super(key: key);

  @override
  State<SoalSatu> createState() => _SoalSatuState();
}

class _SoalSatuState extends State<SoalSatu> {
  final TextEditingController _controller = TextEditingController();
  List<int> genap = [];
  List<int> prima = [];
  List<int> fibonacci = [];

  bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= n ~/ 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void Deret() {
    int n = int.tryParse(_controller.text) ?? 0;
    List<int> genapList = [];
    List<int> primaList = [];
    List<int> fiboList = [];
    int g = 2;
    while (genapList.length < n) {
      genapList.add(g);
      g += 2;
    }
    int p = 2;
    while (primaList.length < n) {
      if (isPrime(p)) primaList.add(p);
      p++;
    }
    int a = 0, b = 1;
    for (int i = 0; i < n; i++) {
      fiboList.add(a);
      int next = a + b;
      a = b;
      b = next;
    }
    setState(() {
      genap = genapList;
      prima = primaList;
      fibonacci = fiboList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soal 1")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Counter :"),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: Deret,
              child: const Text("Tampilkan Deret"),
            ),
            const SizedBox(height: 16),
            Text("Genap: ${genap.join(", ")}"),
            Text("Prima: ${prima.join(", ")}"),
            Text("Fibonacci: ${fibonacci.join(", ")}"),
          ],
        ),
      ),
    );
  }
}
