import 'package:flutter/material.dart';
import 'referral_form_screen.dart';

class ProgramSelectionScreen extends StatelessWidget {
  final String userRole;

  const ProgramSelectionScreen({
    super.key,
    this.userRole = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text("اختر البرنامج"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _buildProgramCard(
                context,
                "الأجهزة الطبية",
                Icons.wheelchair_pickup,
                Colors.blue,
              ),
              _buildProgramCard(
                context,
                "العلاج الطبيعي",
                Icons.accessibility_new,
                Colors.green,
              ),
              _buildProgramCard(
                context,
                "علاج الجروح والتقرحات الفراشية",
                Icons.healing,
                Colors.red,
              ),
              _buildProgramCard(
                context,
                "تهيئة المنازل",
                Icons.home_repair_service,
                Colors.orange,
              ),
              _buildProgramCard(
                context,
                "المستلزمات الطبية",
                Icons.medication,
                Colors.purple,
              ),
              _buildProgramCard(
                context,
                "الخدمات الطبية",
                Icons.local_hospital,
                Colors.teal,
              ),
              _buildProgramCard(
                context,
                "التمكين الصحي",
                Icons.volunteer_activism,
                Colors.indigo,
              ),
              _buildProgramCard(
                context,
                "العربة الطبية المتنقلة",
                Icons.medical_information,
                Colors.brown,
              ),
              _buildProgramCard(
                context,
                "أخرى",
                Icons.more_horiz,
                Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgramCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReferralFormScreen(
              programName: title,
              userRole: userRole,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: color,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
