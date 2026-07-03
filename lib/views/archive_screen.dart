import 'package:flutter/material.dart';
import 'archive_details_screen.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text("أرشيف الحالات"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildArchiveCard(
            context,
            "DN-2026-0001",
            "أحمد الحربي",
            "العلاج الطبيعي",
            "مكتملة",
          ),
          _buildArchiveCard(
            context,
            "DN-2026-0002",
            "نورة الشمري",
            "الأجهزة الطبية",
            "تم التسليم",
          ),
          _buildArchiveCard(
            context,
            "DN-2026-0003",
            "سارة العنزي",
            "تهيئة المنازل",
            "مغلقة",
          ),
        ],
      ),
    );
  }

  Widget _buildArchiveCard(
    BuildContext context,
    String caseNumber,
    String name,
    String program,
    String status,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArchiveDetailsScreen(
              caseNumber: caseNumber,
              beneficiaryName: name,
              programName: program,
              status: status,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caseNumber,
              style: const TextStyle(
                color: Color(0xff257351),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(program),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
