import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String data = '';

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/privacy-policy.txt');

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
        title: const Text('Privacy Policy'),
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
