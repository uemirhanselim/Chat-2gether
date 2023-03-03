import 'package:chat_2gether/firebase_options.dart';
import 'package:chat_2gether/view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat2Gether',
      builder: (ctx, child) {
        ScreenUtil.init(ctx);
        return Theme(
          data: ThemeData.dark(),
          child: const HomeView(),
        );
      },
    );
  }
}
