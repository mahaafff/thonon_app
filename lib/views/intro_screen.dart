import 'package:flutter/material.dart';
import 'login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // يطلع فوق الصوره شفاف
    final Color overlayColorTop = const Color(0xFFC4D5CB).withOpacity(0.6);
    final Color overlayColorBottom = const Color(0xFFAEBEB1).withOpacity(0.8);
    const Color brandGreen = Color(0xff257351); // أخضر ذو النون

    return Scaffold(
      body: Stack(
        children: [
          // 1. الصورة الخلفية (كامل الشاشة)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. طبقة التأثير اللوني (شفافة لتظهر الصورة)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  overlayColorTop,
                  overlayColorBottom,
                ],
              ),
            ),
          ),

          // 3. المحتوى (الشعار، العنوان، الزر) في الوسط
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // توسيط كل العناصر
                children: [
                  const Spacer(flex: 3),

                  // الشعار في الوسط
                  Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.volunteer_activism,
                        size: 80,
                        color: brandGreen),
                  ),

                  const SizedBox(height: 25),

                  // اسم الجمعية كامل
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "جمعية ذو النون للرعاية الصحية المنزلية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: brandGreen,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const Spacer(flex: 2),

                  // زر ابدأ في الأسفل قليلاً
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brandGreen,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 8,
                        ),
                        child: const Text(
                          "ابدأ الآن",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
