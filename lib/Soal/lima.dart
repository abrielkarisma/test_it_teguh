import 'package:flutter/material.dart';

class SoalLima extends StatefulWidget {
  const SoalLima({Key? key}) : super(key: key);

  @override
  State<SoalLima> createState() => _SoalLimaState();
}
class _SoalLimaState extends State<SoalLima> {
  final TextEditingController isiTeks = TextEditingController();
  String hasil = "";
  String encrypt(String teks) {
    List vokal = ['a', 'i', 'u', 'e', 'o'];
    List<int> prima = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47];
    String hasil = "";
    int k = 0;

    for (var x in teks.split("")) {
      String y = x.toLowerCase();
      if (vokal.contains(y)) {
        int idx = vokal.indexOf(y);
        int pindah = idx + prima[k];
        while (pindah > 4) {
          pindah = pindah - 5;
        }
        hasil += vokal[pindah];
        k++;
        if (k == prima.length) k = 0;
      } else {
        hasil += x;
      }
    }
    return hasil;
  }
  String decrypt(String teks) {
    List vokal = ['a', 'i', 'u', 'e', 'o'];
    List<int> prima = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47];
    String hasil = "";
    int k = 0;

    for (var x in teks.split("")) {
      String y = x.toLowerCase();
      if (vokal.contains(y)) {
        int idx = vokal.indexOf(y);
        int pindah = idx - prima[k];
        while (pindah < 0) {
          pindah = pindah + 5;
        }
        hasil += vokal[pindah];
        k++;
        if (k == prima.length) k = 0;
      } else {
        hasil += x;
      }
    }
    return hasil;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soal 5")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: isiTeks,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasil = encrypt(isiTeks.text);
                      });
                    },
                    child: const Text("Encrypt"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasil = decrypt(isiTeks.text);
                      });
                    },
                    child: const Text("Decrypt"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                hasil,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
