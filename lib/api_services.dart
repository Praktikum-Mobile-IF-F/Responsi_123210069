import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsiprakmobile/model/coffee_model.dart';

Future<List<JenisKopi>> fetchCoffee() async {
  final String apiUrl = 'https://fake-coffee-api.vercel.app/api';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => JenisKopi.fromJson(data)).toList();
  } else {
    throw Exception('Gagal memuat data');
  }
}
