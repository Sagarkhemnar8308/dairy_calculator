import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Floating extends StatefulWidget {
  const Floating({super.key});

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  bool _isLoading = false;
  Uri uri = Uri.parse("https://youtube.com/");
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _appwebview(uri);
      },
      backgroundColor: Colors.white,
      child: const Icon(Icons.play_circle_outline_sharp, color: Colors.grey),
    );
  }

  _appwebview(uri) {
    return 
        InAppWebView(
          initialUrlRequest: URLRequest(
            url:uri,
          ),
          // ignore: deprecated_member_use
          initialOptions: InAppWebViewGroupOptions(
            // ignore: deprecated_member_use
            crossPlatform: InAppWebViewOptions(),
          ),
          onLoadStart: (controller, url) {
            setState(() {
              _isLoading = true;
            });
          },
          onProgressChanged: (controller, progress) async {
            await Future.delayed(Duration.zero);
            if (progress == 100) {
              setState(() {
                _isLoading = false;
              });
            }
          },
        );
     
     
  }
}
