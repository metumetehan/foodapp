import 'package:flutter/material.dart';
import 'package:kendin_ye/register_confirmation_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _acceptTerms = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _telController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      // Submit form logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );
      //navigate logic here will go here

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterConfirmationScreen()),
      );

      // Registration confirmed → return credentials to login
      Navigator.pop(context, {
        'username': _usernameController.text,
        'password': _passwordController.text,
      });
    } else if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must accept the policy and terms.")),
      );
    }
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontStyle: FontStyle.italic),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const Spacer(),
                          const Text(
                            "Create New Account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF7700),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _usernameController,
                        decoration: _inputDecoration("User Name"),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? 'Please enter user name'
                                    : null,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: _inputDecoration("First Name"),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? 'Please enter first name'
                                    : null, //later check excistance of username
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: _inputDecoration("Last Name"),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? 'Please enter last name'
                                    : null,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _telController,
                        keyboardType: TextInputType.phone,
                        decoration: _inputDecoration("Tel. Number"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter phone number';
                          } else if (value.length < 10) {
                            return 'Phone number is too short';
                          } else if (value.length > 15) {
                            return 'Phone number is too long';
                          } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: _inputDecoration("Password"),
                        validator:
                            (value) =>
                                value != null && value.length >= 6
                                    ? null
                                    : 'Password must be at least 6 characters',
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: _inputDecoration("Confirm Password"),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Checkbox(
                            value: _acceptTerms,
                            onChanged: (value) {
                              setState(() => _acceptTerms = value!);
                            },
                          ),
                          const Expanded(
                            child: Text(
                              "I accept the policy and terms",
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _submit,

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
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
