//a
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const GradientButtonDemo(),
      );
}

class GradientButtonDemo extends StatelessWidget {
  const GradientButtonDemo({super.key});

  void _showMsg(BuildContext context, String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Custom Gradient Buttons"),
          backgroundColor: Colors.purple[50],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientButton(icon: Icons.login, text: "Login",
                  onPressed: () => _showMsg(context, "Login Clicked")),
              GradientButton(icon: Icons.person_add, text: "Sign Up",
                  onPressed: () => _showMsg(context, "Sign Up Clicked")),
              GradientButton(icon: Icons.settings, text: "Settings",
                  onPressed: () => _showMsg(context, "Settings Clicked")),
            ],
          ),
        ),
      );
}

class GradientButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const GradientButton({required this.icon, required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton.icon(
          icon: Icon(icon),
          label: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
        ),
      );
}



///b.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = '';

  Widget myBtn(String text, IconData icon) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.green, Colors.lightGreen]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton.icon(
          onPressed: () => setState(() => msg = "$text Clicked"),
          icon: Icon(icon, color: Colors.white),
          label: Text(text, style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size(200, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Themes & Custom Styles', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 40),
              myBtn('Login', Icons.login),
              myBtn('Sign Up', Icons.person_add),
              myBtn('Settings', Icons.settings),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.purple.shade50,
          padding: const EdgeInsets.all(10),
          child: Text(msg, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black)),
        ),
      );
}
