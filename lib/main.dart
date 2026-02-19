import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Paksa Fullscreen Landscape agar Pad terlihat besar
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false));
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DTXMainApp()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("DTX-Hum", style: TextStyle(fontSize: 50, color: Colors.green, fontWeight: FontWeight.bold, letterSpacing: 5)),
            SizedBox(height: 10),
            CircularProgressIndicator(color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class DTXMainApp extends StatefulWidget {
  const DTXMainApp({super.key});
  @override
  State<DTXMainApp> createState() => _DTXMainAppState();
}

class _DTXMainAppState extends State<DTXMainApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // AGAR MENU BISA DIKLIK
      ..setBackgroundColor(const Color(0xFF020617))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          // Hilangkan bounce scroll pada Android
          controller.runJavaScript("document.body.style.overflow = 'hidden'");
        },
      ))
      ..loadFlutterAsset('assets/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
