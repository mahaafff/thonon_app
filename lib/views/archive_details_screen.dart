import 'package:flutter/material.dart';

class ArchiveDetailsScreen extends StatelessWidget {
  final String caseNumber;
  final String beneficiaryName;
  final String programName;
  final String status;

  const ArchiveDetailsScreen({
    super.key,
    required this.caseNumber,
    required this.beneficiaryName,
    required this.programName,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text("تفاصيل الحالة"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("معلومات الحالة"),
            _buildInfoCard([
              _buildRow("رقم الحالة", caseNumber),
              _buildRow("اسم المستفيد", beneficiaryName),
              _buildRow("البرنامج", programName),
              _buildRow("الحالة", status),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle("بيانات المستفيد"),
            _buildInfoCard([
              _buildRow("رقم الهوية", "1029384756"),
              _buildRow("رقم الجوال", "05xxxxxxxx"),
              _buildRow("المدينة", "حائل"),
              _buildRow("العنوان", "حي الزبارة"),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle("بيانات الطبيب"),
            _buildInfoCard([
              _buildRow("اسم الطبيب", "د. محمد الشمري"),
              _buildRow("الجهة", "مستشفى الملك سلمان"),
              _buildRow("التخصص", "علاج طبيعي"),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle("تفاصيل الخدمة"),
            _buildInfoCard([
              _buildRow("عدد الجلسات", "10"),
              _buildRow("المنفذ", "شركة العلاج المتقدم"),
              _buildRow("تاريخ الإغلاق", "2026/05/10"),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle("المرفقات"),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildFileCard("الهوية"),
                _buildFileCard("التقرير الطبي"),
                _buildFileCard("العنوان الوطني"),
                _buildFileCard("إثبات الدخل"),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff257351),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                ),
                label: const Text(
                  "تصدير PDF",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xff257351),
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
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
      child: Column(children: children),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildFileCard(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.insert_drive_file,
            color: Color(0xff257351),
          ),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
