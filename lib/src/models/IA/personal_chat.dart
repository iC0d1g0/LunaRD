import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPT {
 //Este metodo debuelve una cadena de caracteres en formato Json. Tambien puede debolver null. Espera un promt (texto)

  Future<String?> callAPI(String prompt) async {
    String endpoint='https://api.openai.com/v1/chat/completions';
    String apiKey= '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';
    final uri = Uri.parse(endpoint);

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'Actúa como una profecional (llamada Eva) especialista en el tema de la menstruación y la gestación humana.'},
          {'role': 'user', 'content': prompt},
        ],
      }),
    );

    if (response.statusCode == 200) {
       //final jsonResponse = json.decode(response.body); Este formato es si solo necesitas el codigo en Json
       final decodedResponse = utf8.decode(response.bodyBytes); // Decodificar la respuesta
      
      return decodedResponse;
    } else {
      //print('Failed to call ChatGPT API: ${response.statusCode} ${response.reasonPhrase}');
      //print(response.body);
      return null;
    }
  }
}