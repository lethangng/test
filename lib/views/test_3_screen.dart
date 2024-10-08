import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test3Screen extends StatelessWidget {
  Test3Screen({super.key});

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    // ..setNavigationDelegate(
    //   NavigationDelegate(
    //     onProgress: (int progress) {
    //       // Update loading bar.
    //     },
    //     onPageStarted: (String url) {},
    //     onPageFinished: (String url) {},
    //     onWebResourceError: (WebResourceError error) {},
    //     onNavigationRequest: (NavigationRequest request) {
    //       if (request.url.startsWith('https://www.youtube.com/')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //     },
    //   ),
    // )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
