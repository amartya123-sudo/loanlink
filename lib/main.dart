import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loanlink/pages/signin_page.dart';
import 'package:loanlink/provider/authentication.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: true,
        home: SignInPage(),
        title: "LoanLink",
      ),
    );
  }
}