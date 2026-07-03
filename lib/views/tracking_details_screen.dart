import 'package:flutter/material.dart';

class TrackingDetailsScreen extends StatelessWidget {
  const TrackingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Color brandGreen =
        const Color(0xff257351);

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("متابعة الحالة"),
        backgroundColor: brandGreen,
        centerTitle: true,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // بيانات المستفيد
              _buildSectionTitle(
                "بيانات المستفيد",
                Icons.person,
                brandGreen,
              ),

              _buildCard([

                _buildInfoRow(
                  "اسم المستفيد",
                  "أحمد الشمري",
                ),

                _buildInfoRow(
                  "البرنامج",
                  "العلاج الطبيعي",
                ),

                _buildInfoRow(
                  "الجهة المنفذة",
                  "مركز ابن سينا الطبي",
                ),

              ]),

              const SizedBox(height: 20),

              // حالة التنفيذ
              _buildSectionTitle(
                "حالة التنفيذ",
                Icons.update,
                brandGreen,
              ),

              _buildCard([

                _buildInfoRow(
                  "الحالة الحالية",
                  "تحت التنفيذ",
                ),

                _buildInfoRow(
                  "نسبة الإنجاز",
                  "50%",
                ),

                _buildInfoRow(
                  "الجلسات المنجزة",
                  "6 جلسات",
                ),

              ]),

              const SizedBox(height: 20),

              // ملاحظات الجهة المنفذة
              _buildSectionTitle(
                "ملاحظات الجهة المنفذة",
                Icons.edit_note,
                brandGreen,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(18),

                  boxShadow: [

                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: const Text(
                  "تم تنفيذ 6 جلسات علاج طبيعي، والحالة مستقرة حالياً مع استمرار الخطة العلاجية.",

                  style: TextStyle(
                    fontSize: 14,
                    height: 1.8,
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

                  borderRadius:
                      BorderRadius.circular(18),

                  boxShadow: [

                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                      size: 45,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "تم رفع التقرير النهائي",

                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,

                      child: ElevatedButton.icon(

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              brandGreen,

                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),

                        onPressed: () {

                          ScaffoldMessenger.of(context)
                              .showSnackBar(

                            const SnackBar(
                              content: Text(
                                "فتح التقرير النهائي",
                              ),
                            ),
                          );
                        },

                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "عرض التقرير",

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold,
                          ),
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

          Icon(icon, color: color),

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

  Widget _buildCard(
    List<Widget> children,
  ) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [

          BoxShadow(
            color:
                Colors.grey.withOpacity(0.08),
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
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}