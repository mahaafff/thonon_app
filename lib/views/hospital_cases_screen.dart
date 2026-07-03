import 'package:flutter/material.dart';

class HospitalCasesScreen extends StatelessWidget {
  const HospitalCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> cases = [

      {
        "name": "أحمد الشمري",
        "program": "العلاج الطبيعي",
        "status": "لم تتم المعاينة",
        "color": Colors.red,
        "date": "2026/05/25",
      },

      {
        "name": "سارة العنزي",
        "program": "الأجهزة الطبية",
        "status": "تمت المعاينة",
        "color": Colors.orange,
        "date": "2026/05/22",
      },

      {
        "name": "محمد القحطاني",
        "program": "تهيئة المنازل",
        "status": "تم اعتماد الطلب",
        "color": Colors.green,
        "date": "2026/05/20",
      },

    ];

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("الحالات المرسلة"),
        backgroundColor: const Color(0xff257351),
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
                borderRadius: BorderRadius.circular(18),

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
                                  .withOpacity(0.15),

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

                              const SizedBox(height: 5),

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
                            color:
                                item['color']
                                    .withOpacity(0.1),

                            borderRadius:
                                BorderRadius.circular(
                                    20),
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
                          Icons.calendar_today,
                          size: 18,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 8),

                        Text(
                          "تاريخ الإرسال: ${item['date']}",

                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),

                      ],
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