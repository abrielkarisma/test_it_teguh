import 'package:flutter/material.dart';

class SoalEmpat extends StatefulWidget {
  const SoalEmpat({Key? key}) : super(key: key);

  @override
  State<SoalEmpat> createState() => _SoalEmpatState();
}

class _SoalEmpatState extends State<SoalEmpat> {
  final TextEditingController isiAngka = TextEditingController();
  List hasil = [];

  void run() {
    int jumlah = int.tryParse(isiAngka.text) ?? 0;
    List tampung = [];
    int angka = 1;
    while (tampung.length < jumlah) {
      bool bagiTiga = angka % 3 == 0;
      bool adaTiga = angka.toString().contains("3");
      if (bagiTiga && adaTiga) {
        tampung.add("SEVEN");
      } else if (bagiTiga || adaTiga) {
        tampung.add("TRANS");
      } else {
        tampung.add(angka);
      }
      angka += 2;
    }
    setState(() {
      hasil = tampung;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soal 4")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Counter : ",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: isiAngka,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: run, child: const Text("Run")),
            const SizedBox(height: 16),
            Text(hasil.join("\n ")),
          ],
        ),
      ),
    );
  }
}
