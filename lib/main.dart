import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String fileText;

  final String testString = """
# From code \u00a9
\u00a9
""";

  Future _loadAsset() async {
    String data = await rootBundle.loadString("assets/file_test.md");

    setState(() {
      fileText = data;
    });
  }

  @override
  void initState() {
    _loadAsset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MarkdownBody(
              data: testString,
            ),
            SizedBox(
              height: 20,
            ),
            MarkdownBody(
              data: fileText,
            ),
          ],
        ),
      ),
    );
  }
}
