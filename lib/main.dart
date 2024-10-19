import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF265DB3), // Background color for buttons
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle login logic here
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Launch Productivity'),
      // ),
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          padding: const EdgeInsets.all(25.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Launch Productivity',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  Text('Welcome back, let’s take your productivity to the next level!'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                height: 350,
                alignment: Alignment.center,
                child: const RiveAnimation.asset(
                  alignment: Alignment.center,
                  fit: BoxFit.fitWidth,
                  'assets/rive_animation/vpn_app_for_mobile_devices.riv',
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF265DB3), textStyle: TextStyle(color: Colors.white)),
                          onPressed: _login,
                          child: const Text('Login Now',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Create account now',
                        style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF265DB3)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
