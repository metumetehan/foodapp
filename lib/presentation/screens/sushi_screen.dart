import 'package:flutter/material.dart';
import 'package:kendin_ye/core/localization/app_localizations.dart';

class SushiScreen extends StatefulWidget {
  const SushiScreen({super.key});

  @override
  State<SushiScreen> createState() => _SushiScreenState();
}

class _SushiScreenState extends State<SushiScreen> {
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context).translate;
    final isTurkish = AppLocalizations.of(context).isTurkish;
    return const Placeholder();
  }
}
