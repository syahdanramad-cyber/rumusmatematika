import 'package:flutter/material.dart';

void main() {
  runApp(AplikasiTegangan());
}

class AplikasiTegangan extends StatefulWidget {
  @override
  State<AplikasiTegangan> createState() => _AplikasiTeganganState();
}

class _AplikasiTeganganState extends State<AplikasiTegangan> {
  final TextEditingController arus = TextEditingController();
  final TextEditingController hambatan = TextEditingController();

  String hasil = "Hasil perhitungan akan muncul di sini";

  void hitungTegangan() {
    double i = double.tryParse(arus.text) ?? 0;
    double r = double.tryParse(hambatan.text) ?? 0;

    setState(() {
      double v = i * r;
      hasil = "Hasil Tegangan: $v Volt";
    });
  }

  @override
  void dispose() {
    arus.dispose();
    hambatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Kalkulator Tegangan"),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.electrical_services,
                size: 65,
                color: Colors.indigo,
              ),
              SizedBox(height: 15),
              Text(
                "Menghitung Tegangan Listrik",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Rumus: V = I × R",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 25),
              TextField(
                controller: arus,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: "Masukkan Arus",
                  hintText: "Contoh: 2",
                  prefixIcon: Icon(Icons.bolt),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: hambatan,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: "Masukkan Hambatan",
                  hintText: "Contoh: 5",
                  prefixIcon: Icon(Icons.electrical_services),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: hitungTegangan,
                icon: Icon(Icons.calculate),
                label: Text("Proses Perhitungan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  hasil,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
