import 'package:flutter/material.dart';
import 'case_details_screen.dart';

class AdminCasesScreen extends StatelessWidget {
  const AdminCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Color brandGreen = const Color(0xff257351);

    final List<Map<String, dynamic>> cases = [

      {
        "name": "أحمد الشمري",
        "program": "العلاج الطبيعي",
        "status": "تحت التنفيذ",
        "company": "شركة الرعاية الطبية",
        "color": Colors.orange,
      },

      {
        "name": "سارة العنزي",
        "program": "الأجهزة الطبية",
        "status": "مكتملة",
        "company": "مؤسسة العناية",
        "color": Colors.green,
      },

      {
        "name": "محمد العنزي",
        "program": "علاج الجروح والتقرحات",
        "status": "بانتظار الدعم",
        "company": "غير محدد",
        "color": Colors.red,
      },

    ];

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("إدارة الحالات"),
        backgroundColor: brandGreen,
        centerTitle: true,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: cases.length,

          itemBuilder: (context, index) {

            final item = cases[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 15),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 8,
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(
                      children: [

                        CircleAvatar(
                          radius: 28,

                          backgroundColor:
                              item['color']
                                  .withOpacity(0.1),

                          child: Icon(
                            Icons.folder_open,
                            color: item['color'],
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                item['name'],

                                style: const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                item['program'],

                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: item['color']
                                .withOpacity(0.1),

                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: Text(
                            item['status'],

                            style: TextStyle(
                              color: item['color'],
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [

                        const Icon(
                          Icons.business,
                          color: Colors.grey,
                          size: 18,
                        ),

                        const SizedBox(width: 8),

                        Text(
                          item['company'],

                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 20),

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

  Navigator.push(
    context,

    MaterialPageRoute(
      builder: (context) =>
          const CaseDetailsScreen(),
    ),
  );
},

                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "عرض الحالة",

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
            );
          },
        ),
      ),
    );
  }
}