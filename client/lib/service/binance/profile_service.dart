import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_app/model/Profile.dart';

class ProfileService {
  Future<Profile> fetchProfile(String authToken) async {
    final url = 'http://localhost:8080/api/auth/profile';
    final headers = {
      'Authorization': 'Bearer $authToken',
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final profileData = jsonDecode(response.body);
      return Profile.fromJson(profileData);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}
