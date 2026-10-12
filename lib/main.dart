import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String portalUrl =
    'https://c1065.coresuz.ru/portal.html';

void main() {
  runApp(const Test24soatApp());
}

class Test24soatApp extends StatelessWidget {
  const Test24soatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test24soat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6554E8),
        ),
        useMaterial3: true,
      ),
      home: const PortalScreen(),
    );
  }
}

class PortalScreen extends StatefulWidget {
  const PortalScreen({super.key});

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(portalUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
