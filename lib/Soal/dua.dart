import 'package:flutter/material.dart';

class SoalDua extends StatefulWidget {
  const SoalDua({Key? key}) : super(key: key);

  @override
  State<SoalDua> createState() => _SoalDuaState();
}

class _SoalDuaState extends State<SoalDua> {
  final TextEditingController isiTeks = TextEditingController();
  String status = "";
  int jumlahVokal = 0;
  int jumlahKonsonan = 0;

  void cekTeks() {
    String teks = isiTeks.text;
    String teksBersih = teks.replaceAll(" ", "").toLowerCase();
    String balik = teksBersih.split('').reversed.join('');
    bool cocok = teksBersih == balik;
    List vokal = ['a', 'i', 'u', 'e', 'o'];
    jumlahVokal = 0;
    jumlahKonsonan = 0;
    for (var x in teksBersih.split('')) {
      if (RegExp(r'[a-z]').hasMatch(x)) {
        if (vokal.contains(x)) {
          jumlahVokal++;
        } else {
          jumlahKonsonan++;
        }
      }
    }
    setState(() {
      status = cocok ? "Palindrome" : "Bukan palindrome";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soal 2")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: isiTeks,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: cekTeks, child: const Text("Cek")),
            const SizedBox(height: 16),
            Text(
              status,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Konsonan: $jumlahKonsonan"),
            Text("Vokal: $jumlahVokal"),
          ],
        ),
      ),
    );
  }
}
