import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:partypay/partypay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'partypay_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(ModularApp(module: PartyPayModule(), child: const PartyPayApp()));
}
