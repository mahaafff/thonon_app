import 'package:flutter/material.dart';
import 'case_details_screen.dart';

class PartnerCasesScreen extends StatelessWidget {
  const PartnerCasesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> cases = [

      {
        "name": "أحمد الشمري",
        "program": "العلاج الطبيعي",
        "status": "تحت التنفيذ",
        "progress": "50%",
        "color": Colors.orange,
      },

      {
        "name": "سارة العنزي",
        "program": "تهيئة المنازل",
        "status": "مكتملة",
        "progress": "100%",
        "color": Colors.green,
      },

    ];

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("الحالات المسندة"),
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
                borderRadius:
                    BorderRadius.circular(20),

                boxShadow: [

                  BoxShadow(
                    color:
                        Colors.grey.withOpacity(0.08),
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
                            Icons.assignment,
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
                          Icons.bar_chart,
                          color: Colors.grey,
                          size: 18,
                        ),

                        const SizedBox(width: 8),

                        Text(
                          "نسبة الإنجاز: ${item['progress']}",
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
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
                              const Color(0xff257351),

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
                          "فتح تفاصيل الحالة",

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