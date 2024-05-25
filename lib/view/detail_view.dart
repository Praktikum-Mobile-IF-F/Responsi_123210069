import 'dart:html';
import 'dart:ui';

import 'package:responsiprakmobile/model/coffee_model.dart';

class DetailScreen extends StatelessWidget {
  final JenisKopi jenisKopi;

  const DetailScreen({Key? key, required this.jenisKopi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text (
          jenisKopi.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontweight: FontWeight.bold,
            fontSize: 20;
          ),
        ),
        centerTitle: True;
      ),
      body: Center(
        child: Padding(
          padding: constEdgeInsets.all(16.0),

        )
      )
    )
  }
}
