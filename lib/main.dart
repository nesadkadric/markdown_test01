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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MarkdownBody(
                data: "# Test \u00a9",
              ),
              SizedBox(
                height: 40,
              ),
              MarkdownBody(
                data: testString,
              ),
              SizedBox(
                height: 40,
              ),
              MarkdownBody(
                data: fileText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
