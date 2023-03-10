import 'package:http/http.dart' as http;
import 'dart:convert'; //  convert json

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    String urlString = url;

    Uri uri = Uri.parse(urlString);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      
    } else {
      print(response.statusCode);
    }
  }
}
