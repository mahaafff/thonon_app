import 'package:flutter/material.dart';

class ReferralFormScreen extends StatefulWidget {
  final String programName;
  final String userRole;

  const ReferralFormScreen({
    super.key,
    required this.programName,
    this.userRole = '',
  });

  @override
  State<ReferralFormScreen> createState() => _ReferralFormScreenState();
}

class _ReferralFormScreenState extends State<ReferralFormScreen> {
  // --- 1. تعريف المتغيرات ---
  int? _selectedSessions;
  String _selectedRegion = "حائل";

  // حالة المرفقات
  bool _hasId = false;
  bool _hasMedicalReport = false;
  bool _hasNationalAddress = false;
  bool _hasIncomeProof = false;

  // الموافقات
  bool _isPolicyAccepted = false;
  bool _isDeptApproved = false;
  bool _isHospitalApproved = false;

  final Color brandGreen = const Color(0xff257351);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.programName),
        backgroundColor: brandGreen,
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بيانات الطبيب (للمستشفى فقط)
              if (widget.userRole == 'hospital') ...[
                _buildHeader("بيانات الطبيب", Icons.person_search),
                _buildField("اسم الطبيب الثلاثي"),
                _buildField("التخصص"),
                const SizedBox(height: 15),
              ],

              // البيانات الأساسية للمستفيد
              _buildHeader("بيانات المستفيد الأساسية", Icons.assignment_ind),
              _buildField("الاسم كامل"),
              _buildField("رقم الهوية", keyboard: TextInputType.number),

              Row(
                children: [
                  Expanded(
                      child:
                          _buildField("العمر", keyboard: TextInputType.number)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedRegion,
                      decoration: _inputDeco("المنطقة"),
                      items: const [
                        DropdownMenuItem(value: "حائل", child: Text("حائل"))
                      ],
                      onChanged: (val) =>
                          setState(() => _selectedRegion = val!),
                    ),
                  ),
                ],
              ),
              _buildField("المدينة أو المحافظة (نص)"),
              _buildField("رقم الجوال", keyboard: TextInputType.phone),
              _buildField("رقم جوال آخر", keyboard: TextInputType.phone),

              const SizedBox(height: 20),

              // المرفقات
              _buildHeader("المرفقات المطلوبة", Icons.upload_file),
              _buildAttachmentGrid(),

              const SizedBox(height: 25),

              // تفاصيل البرنامج (المنطق الديناميكي المحدث)
              _buildHeader("تفاصيل الاحتياج", Icons.list_alt),
              _buildProgramLogic(),

              const SizedBox(height: 25),

              // الاعتمادات (تظهر للمستشفى فقط)
              if (widget.userRole == 'hospital') ...[
                const Divider(),
                _buildCheck("أوافق على سياسة الخصوصية", _isPolicyAccepted,
                    (v) => setState(() => _isPolicyAccepted = v!)),
                _buildCheck("اعتماد مدير القسم", _isDeptApproved,
                    (v) => setState(() => _isDeptApproved = v!)),
                _buildCheck("اعتماد مدير المستشفى", _isHospitalApproved,
                    (v) => setState(() => _isHospitalApproved = v!)),
              ],

              const SizedBox(height: 30),

              // زر الإرسال
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: brandGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    // منطق الإرسال يوضع هنا
                  },
                  child: const Text("إرسال الطلب",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- تحديث منطق عرض الحقول حسب البرنامج المختار ---
  Widget _buildProgramLogic() {
    // 1. برامج الجلسات (العلاج الطبيعي + علاج الجروح والتقرحات الفراشية)
    if (widget.programName == "العلاج الطبيعي" ||
        widget.programName == "علاج الجروح والتقرحات الفراشية") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.programName == "العلاج الطبيعي"
                ? "عدد جلسات العلاج المطلوبة (زوجي):"
                : "عدد جلسات الغيار والعلاج المطلوبة (زوجي):",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<int>(
            value: _selectedSessions,
            decoration: _inputDeco("اختر عدد الجلسات"),
            items: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
                .map((e) => DropdownMenuItem(value: e, child: Text("$e جلسة")))
                .toList(),
            onChanged: (val) => setState(() => _selectedSessions = val),
          ),
          const SizedBox(height: 12),
          _buildField("التشخيص الطبي وتفاصيل الحالة", lines: 3),
        ],
      );
    }

    // 2. برنامج العربة الطبية المتنقلة
    if (widget.programName == "العربة الطبية المتنقلة") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("تفاصيل طلب الخدمة (فحص عام):",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildField(
              "اكتب هنا تفاصيل طلب الفحص العام أو الخدمة المطلوبة من العربة...",
              lines: 4),
        ],
      );
    }

    // 3. بقية البرامج (أجهزة، مستلزمات، تهيئة منازل)
    String hint = "وصف الاحتياج...";
    if (widget.programName == "الأجهزة الطبية")
      hint = "اذكر نوع الجهاز المطلوب (كرسي، سرير، إلخ)";
    if (widget.programName == "تهيئة المنازل")
      hint = "التعديلات المطلوبة في المنزل (منحدرات، مقابض..)";
    if (widget.programName == "المستلزمات الطبية")
      hint = "قائمة المستلزمات الطبية المطلوبة وكمياتها";

    return _buildField(hint, lines: 4);
  }

  // --- ويدجت مساعدة لبناء الواجهة ---
  Widget _buildHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: brandGreen, size: 20),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(color: brandGreen, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  InputDecoration _inputDeco(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );

  Widget _buildField(String label,
      {int lines = 1, TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        maxLines: lines,
        keyboardType: keyboard,
        decoration: _inputDeco(label),
      ),
    );
  }

  Widget _buildAttachmentGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 2.8,
      children: [
        _buildFileBtn("صورة الهوية", _hasId, (v) => setState(() => _hasId = v)),
        _buildFileBtn("التقرير الطبي", _hasMedicalReport,
            (v) => setState(() => _hasMedicalReport = v)),
        _buildFileBtn("العنوان الوطني", _hasNationalAddress,
            (v) => setState(() => _hasNationalAddress = v)),
        _buildFileBtn("شاهد الدخل", _hasIncomeProof,
            (v) => setState(() => _hasIncomeProof = v)),
      ],
    );
  }

  Widget _buildFileBtn(String label, bool ok, Function(bool) on) {
    return InkWell(
      onTap: () => on(!ok),
      child: Container(
        decoration: BoxDecoration(
          color: ok ? Colors.green.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ok ? Colors.green : Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ok ? Icons.check_circle : Icons.upload_file,
                size: 16, color: ok ? Colors.green : Colors.grey),
            const SizedBox(width: 5),
            Text(label, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildCheck(String t, bool v, Function(bool?) on) {
    return CheckboxListTile(
      title: Text(t, style: const TextStyle(fontSize: 12)),
      value: v,
      onChanged: on,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      activeColor: brandGreen,
    );
  }
}
