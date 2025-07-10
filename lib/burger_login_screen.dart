import 'package:flutter/material.dart';
import 'package:kendin_ye/animated_burger.dart';
import 'package:kendin_ye/sign_up_screen.dart';

class BurgerLoginScreen extends StatefulWidget {
  const BurgerLoginScreen({super.key});

  @override
  State<BurgerLoginScreen> createState() => _BurgerLoginScreenState();
}

class _BurgerLoginScreenState extends State<BurgerLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFFF7700), toolbarHeight: 0),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              //height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  // Orange header with logo and curve
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 320,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF7700),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(120),
                            bottomRight: Radius.circular(120),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 0,
                        child: Center(
                          child: Image.asset("assets/kendin_ye_logo2.png"),
                        ),
                      ),
                      Positioned(
                        bottom: -110, // adjust as needed
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 240,
                          width: 240,
                          child: AnimatedBurger(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 120),

                  // Username field
                  _buildInputField(
                    icon: Icons.person,
                    hint: "User Name",
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 12),

                  _buildInputField(
                    icon: Icons.lock,
                    hint: "Password",
                    obscure: true,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 20),

                  // Sign In button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF7700),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.grey),
                  ),

                  //const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );

                  if (result != null && result is Map<String, String>) {
                    setState(() {
                      _usernameController.text = result['username']!;
                      _passwordController.text = result['password']!;
                    });
                  }
                },

                child: Text(
                  "Create New Account",
                  style: TextStyle(
                    color: Color(0xFFFF7700),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required String hint,
    bool obscure = false,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFF7700), width: 2),
          ),
        ),
      ),
    );
  }
}
