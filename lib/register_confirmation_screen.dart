import 'package:flutter/material.dart';

class RegisterConfirmationScreen extends StatelessWidget {
  const RegisterConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                      // Check icon
                      Positioned(
                        bottom: -50, // adjust as needed
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF7700),
                              border: Border.all(
                                color: Colors.white,
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),

                            child: const Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 120),

                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 300, // ✅ Set fixed width similar to the image
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 32,
                              horizontal: 16,
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  'Your account has\nbeen registered!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                        blurRadius: 0,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Welcome to\nKendin Ye',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          // Orange bottom button
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF7700),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            width:
                                double
                                    .infinity, // ✅ this now only expands to 300 width
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
