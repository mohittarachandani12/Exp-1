import 'package:flight_app_ui/screens/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/feild.dart';
import '../widgets/text.dart';
import '../auth.dart'; // Import your Auth class

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final Auth _auth = Auth(); // Initialize your Auth class

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to the home screen after successful login
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    } catch (e) {
      // Handle login errors here
      print('Login failed: $e');
      // Optionally show a snackbar or dialog to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Hero(
                      tag: "logo",
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          "assets/logo.png",
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                    ),
                  ),
                  Field(
                    controller: _emailController,
                    hinttext: "E-MAIL",
                    icon: Icons.alternate_email,
                  ),
                  const SizedBox(height: 20,),
                  Field(
                    controller: _passwordController,
                    hinttext: "PASSWORD",
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 25,),
                  GestureDetector(
                    onTap: _login, // Call _login function when tapped
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).indicatorColor,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: TextUtil(
                        text: "Log in",
                        weight: true,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  RichText(
                    text: TextSpan(
                      text: 'Not a member? ',
                      style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Join now',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).indicatorColor),
                          recognizer: TapGestureRecognizer()..onTap=(){

                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                  angle: 6,
                  child:const Icon(Icons.flight_takeoff,size: 100,color: Color(0xff3a5455),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
