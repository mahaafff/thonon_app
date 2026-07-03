import 'package:flutter/material.dart';
// استيراد الشاشات بناءً على ملفاتك في الصورة
import 'admin_main_dashboard.dart';
import 'hospital_main_dashboard.dart';
import 'partner_main_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color brandGreen = const Color(0xff257351);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: brandGreen),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Icon(Icons.lock_person_rounded, size: 70, color: brandGreen),
              const SizedBox(height: 20),
              const Text(
                "تسجيل الدخول",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // أزرار الدخول السريع للأدوار (بناءً على ملفاتك)
              const Text(
                "استعراض منظور الأدوار",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildRoleButton(context, "منظور الإدارة (Admin)",
                  Icons.admin_panel_settings, const AdminMainDashboard()),

              _buildRoleButton(context, "منظور المستشفى (Hospital)",
                  Icons.local_hospital, const HospitalDashboard()),

              _buildRoleButton(context, "منظور الشريك (Partner)",
                  Icons.handshake, const PartnerMainDashboard()),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),

              const Text("أو سجل الدخول بالطريقة التقليدية",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 20),

              TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  labelText: 'اسم المستخدم',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // أداة بناء زر الانتقال السريع
  Widget _buildRoleButton(
      BuildContext context, String title, IconData icon, Widget targetScreen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetScreen),
            );
          },
          icon: Icon(icon, color: brandGreen),
          label: Text(title,
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[100],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: brandGreen.withOpacity(0.3)),
            ),
          ),
        ),
      ),
    );
  }
}
