import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_app/model/Profile.dart';

class ProfileService {
  Future<Profile> fetchProfile() async {
    final url =
        'localhost:8080/api/auth/profile'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final profileData = jsonDecode(response.body);
      return Profile.fromJson(profileData);
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}
