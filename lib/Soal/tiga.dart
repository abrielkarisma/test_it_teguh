import 'package:flutter/material.dart';

class SoalTiga extends StatefulWidget {
  const SoalTiga({Key? key}) : super(key: key);

  @override
  State<SoalTiga> createState() => _SoalTigaState();
}

class _SoalTigaState extends State<SoalTiga> {
  final TextEditingController isiAngka = TextEditingController();
  List<List<int>> hasil = [];
  void run() {
    int jumlah = int.tryParse(isiAngka.text) ?? 0;
    List<List<int>> tampung = [];
    int a = 1, b = 1;
    for (int i = 0; i < jumlah; i++) {
      List<int> baris = [];
      for (int j = 0; j <= i; j++) {
        baris.add(a);
        int next = a + b;
        a = b;
        b = next;
      }
      tampung.add(baris);
    }
    setState(() {
      hasil = tampung;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soal 3")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: isiAngka,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: run, child: const Text("Run")),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: hasil.length,
                separatorBuilder: (context, i) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Text(
                        hasil[i].join(" "),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
