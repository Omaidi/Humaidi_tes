import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPadApp()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF020617),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("DTX-Hum", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF22C55E), letterSpacing: 8)),
            SizedBox(height: 10),
            Text("PRO IBN MUHAMMAD", style: TextStyle(fontSize: 12, color: Colors.white54, letterSpacing: 2)),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFF22C55E)),
          ],
        ),
      ),
    );
  }
}

class MainPadApp extends StatefulWidget {
  const MainPadApp({super.key});
  @override
  State<MainPadApp> createState() => _MainPadAppState();
}

class _MainPadAppState extends State<MainPadApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF020617))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          // Memastikan WebView transparan dan bersih
        },
      ))
      ..loadFlutterAsset('assets/index.html'); // Folder standar aset
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false, // Mencegah keluar aplikasi sembarangan
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
