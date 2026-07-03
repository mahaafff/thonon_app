import 'package:flutter/material.dart';

class CaseDetailsScreen extends StatelessWidget {
  const CaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Color brandGreen = const Color(0xff257351);

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("تفاصيل الحالة"),
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

              // بيانات المستفيد
              _buildSectionTitle(
                "بيانات المستفيد",
                Icons.person,
                brandGreen,
              ),

              _buildInfoCard([
                _buildInfoRow("الاسم", "أحمد الشمري"),
                _buildInfoRow("رقم الهوية", "1234567890"),
                _buildInfoRow("البرنامج", "العلاج الطبيعي"),
                _buildInfoRow("الحالة", "تحت التنفيذ"),
              ]),

              const SizedBox(height: 20),

              // تفاصيل الخدمة
              _buildSectionTitle(
                "تفاصيل الخدمة",
                Icons.medical_services,
                brandGreen,
              ),

              _buildInfoCard([
                _buildInfoRow(
                  "نوع الخدمة",
                  "خدمة علاج طبيعي منزلية",
                ),

                _buildInfoRow(
                  "تفاصيل الاحتياج",
                  "المستفيد يحتاج متابعة صحية منزلية حسب الخطة العلاجية",
                ),

                _buildInfoRow(
                  "الجهة المنفذة",
                  "مركز ابن سينا الطبي",
                ),
              ]),

              const SizedBox(height: 20),

              // تحديث الحالة
              _buildSectionTitle(
                "تحديث حالة التنفيذ",
                Icons.sync,
                brandGreen,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),

                        onPressed: () {

                          ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(
                              content: Text(
                                "تم تحديث الحالة إلى تحت التنفيذ",
                              ),
                            ),
                          );
                        },

                        icon: const Icon(
                          Icons.autorenew,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "تحديث إلى تحت التنفيذ",

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),

                        onPressed: () {

                          ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(
                              content: Text(
                                "تم إنهاء الحالة بنجاح",
                              ),
                            ),
                          );
                        },

                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "تحديث إلى مكتملة",

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

              const SizedBox(height: 20),

              // ملاحظات التنفيذ
              _buildSectionTitle(
                "ملاحظات التنفيذ",
                Icons.edit_note,
                brandGreen,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: const TextField(
                  maxLines: 4,

                  decoration: InputDecoration(
                    hintText:
                        "إضافة ملاحظات حول تنفيذ الخدمة...",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // التقرير النهائي
              _buildSectionTitle(
                "التقرير النهائي",
                Icons.picture_as_pdf,
                brandGreen,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    const Icon(
                      Icons.upload_file,
                      size: 40,
                      color: Colors.grey,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "رفع التقرير النهائي للحالة",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandGreen,
                      ),

                      onPressed: () {

                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(
                            content: Text(
                              "تم رفع التقرير بنجاح",
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        "رفع ملف PDF",

                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    IconData icon,
    Color color,
  ) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [

          Icon(
            icon,
            color: color,
          ),

          const SizedBox(width: 8),

          Text(
            title,

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: color,
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [

          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
          ),
        ],
      ),

      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildInfoRow(
    String title,
    String value,
  ) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,

            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.left,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}