import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto_app/view/auth/RegisterPage.dart';
import 'package:crypto_app/view/bottom_bar_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    var url = Uri.parse('http://localhost:8080/api/auth/signin');
    var body = json.encode({
      'username': _usernameController.text,
      'password': _passwordController.text,
    });
    var headers = {'Content-Type': 'application/json'};
    try {
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var token = responseData['accessToken'];

        // Store the token locally or use it for subsequent requests

        // Navigate to the home page or next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBarView(token: token,)),
        );
      } else {
        // Handle login failure
        _showSnackBar('Login Failed. Invalid credentials. Please try again.');
      }
    } catch (e) {
      // Handle network errors
      _showSnackBar('An error occurred. Please try again later.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/lodin.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Color(0xFFD183EF), BlendMode.darken)),
        ),// Setting the background color to black
         child: Center(
           child: Container(
              width: 450.0,
               height: 600.0,
              decoration: BoxDecoration(
             color: Color(0xFF200E45),
             borderRadius: BorderRadius.circular(16.0),
    ),
         padding: EdgeInsets.all(13.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Icon(
                Icons.person,
                size: 80.0,
                color: Color(0xFFD183EF),
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle:
                TextStyle(color: Colors.white), // Set label color to white
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Set border color to white when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Set border color to white when not focused
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle:
                TextStyle(color: Colors.white), // Set label color to white
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Set border color to white when focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .white), // Set border color to white when not focused
                ),
              ),
            ),
            SizedBox(height: 24.0),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              child: Text('Login',
                  style: TextStyle(
                      color: Colors
                          .white)), // Set button text color to white
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7c94f9), // Set button background color
              ),
              onPressed: _login,
            ),
            SizedBox(height: 16.0),
            TextButton(
              child: Text("Don't have an account? Sign Up",
                  style: TextStyle(
                      color: Colors.white)), // Set text color to white
              onPressed: _goToRegisterPage,
            ),
          ],
        ),
    ),),
      ),
    );
  }
}