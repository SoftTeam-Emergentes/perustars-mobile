import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TermsAndConditionsPage extends StatefulWidget {
  TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  String data = '';

  fetchFileData() async {
    String responseText;
    responseText =
        await rootBundle.loadString('assets/terms-and-conditions.txt');

    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            data,
            style: TextStyle(fontSize: 18, color: Colors.black45),
          ),
        )),
      ),
    );
  }
}
