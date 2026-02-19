import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart'; // Untuk buka kodingan HTML Bos

void main() {
  runApp(const DTXProject());
}

class DTXProject extends StatelessWidget {
  const DTXProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

// 1. LAYAR SPLASH (TAMPILAN DTX-Hum)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tunggu 3 detik baru masuk ke aplikasi utama
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPadApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF020617), // Warna gelap sesuai HTML Bos
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DTX-Hum",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF22C55E), // Warna Hijau sesuai tema
                letterSpacing: 8,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "PRO IBN MUHAMMAD",
              style: TextStyle(fontSize: 12, color: Colors.white54, letterSpacing: 2),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFF22C55E)),
          ],
        ),
      ),
    );
  }
}

// 2. LAYAR UTAMA (Membuka HTML Pad Bos)
class MainPadApp extends StatelessWidget {
  const MainPadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Pad Berhasil Dimuat!"), // Di sini nanti kita panggil index.html Bos
        ),
      ),
    );
  }
}
