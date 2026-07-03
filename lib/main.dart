import 'package:flutter/material.dart';
import 'views/intro_screen.dart';

void main() {
  runApp(const ZunnoonApp());
}

class ZunnoonApp extends StatelessWidget {
  const ZunnoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // يشيل علامة الديبق الحمراء
      title: 'نظام إحالة ذو النون',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily:
            'Tajawal', // إذا كنت محمل خط تجوال، أو بيستخدم الخط الافتراضي
      ),
      home: const IntroScreen(), // هنا نقطة البداية
    );
  }
}
