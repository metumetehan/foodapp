import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class AnimatedBurger extends StatefulWidget {
  const AnimatedBurger({super.key});

  @override
  State<AnimatedBurger> createState() => _AnimatedBurgerState();
}

class _AnimatedBurgerState extends State<AnimatedBurger> {
  Artboard? _artboard;
  SMIBool? _tapInput;

  @override
  void initState() {
    super.initState();

    // Load Rive file
    rootBundle.load('assets/burgasm_interactive_design.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      final controller = StateMachineController.fromArtboard(
        artboard,
        'State Machine 1',
      );

      if (controller != null) {
        artboard.addController(controller);

        // Find the SMIBool input named "tap"
        final input = controller.findInput<bool>('tap');
        if (input is SMIBool) {
          _tapInput = input;
        }
      }

      setState(() => _artboard = artboard);
    });
  }

  void _onTap() {
    if (_tapInput != null) {
      _tapInput!.value = !_tapInput!.value; // toggle
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        width: 200,
        height: 200,
        child: _artboard == null
            ? const Center(child: CircularProgressIndicator())
            : Rive(artboard: _artboard!),
      ),
    );
  }
}
