import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  // FIX 12 — Image compression confirmation before OCR upload
  // Recommended options for image_picker: maxWidth: 1200, maxHeight: 1200, imageQuality: 82
  static Future<Map<String, dynamic>> scanByOcr(XFile image) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/api/v1/scan/ocr'));
    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('OCR scan failed with status code ${response.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> scanByText(String rawText) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/scan/text'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'raw_ingredient_text': rawText}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Text scan failed with status code ${response.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> scanByBarcode(String barcode) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/scan/barcode'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'barcode': barcode}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Barcode scan failed with status code ${response.statusCode}');
    }
  }
}
