import 'package:flutter/material.dart';

class CreateReferralScreen extends StatefulWidget {
  const CreateReferralScreen({super.key});

  @override
  State<CreateReferralScreen> createState() => _CreateReferralScreenState();
}

class _CreateReferralScreenState extends State<CreateReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نموذج تحويل حالة"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // --- قسم بيانات الدكتور ---
            const Text("بيانات الطبيب المُحيل",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff257351))),
            const Divider(),
            const SizedBox(height: 10),
            _buildTextField("اسم الدكتور الثلاثي"),
            _buildTextField("القسم / التخصص"),
            _buildTextField("رقم الهوية الوطنية / الإقامة"),

            const SizedBox(height: 30),

            // --- قسم بيانات المريض ---
            const Text("بيانات المستفيد (المريض)",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff257351))),
            const Divider(),
            const SizedBox(height: 10),
            _buildTextField("اسم المريض"),
            _buildTextField("رقم السجل المدني للمريض"),
            _buildTextField("وصف الحالة الطبية", maxLines: 3),

            const SizedBox(height: 20),

            // --- قسم المرفقات ---
            const Text("المرفقات والشواهد",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {
                // هنا نبرمج اختيار الملفات لاحقاً
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("رفع التقارير الطبية (PDF/Images)"),
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
            ),

            const SizedBox(height: 40),

            // زر الإرسال
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // إرسال الحالة للجمعية
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff257351)),
                child: const Text("إرسال الطلب للجمعية",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت مساعد لإنشاء الحقول بسرعة
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        textAlign: TextAlign.right,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
