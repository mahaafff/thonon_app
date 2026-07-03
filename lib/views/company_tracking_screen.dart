import 'package:flutter/material.dart';
import 'tracking_details_screen.dart';

class CompanyTrackingScreen extends StatelessWidget {
  const CompanyTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> companies = [

      {
        "company": "مركز ابن سينا الطبي",
        "beneficiary": "أحمد الشمري",
        "program": "العلاج الطبيعي",
        "status": "تحت التنفيذ",
        "progress": "50%",
        "color": Colors.orange,
      },

      {
        "company": "مؤسسة كيما الطبية",
        "beneficiary": "سارة العنزي",
        "program": "الأجهزة الطبية",
        "status": "مكتملة",
        "progress": "100%",
        "color": Colors.green,
      },

      {
        "company": "مؤسسة رؤية الهضبة",
        "beneficiary": "محمد القحطاني",
        "program": "تهيئة المنازل",
        "status": "بانتظار البدء",
        "progress": "0%",
        "color": Colors.red,
      },

    ];

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("متابعة الجهات المنفذة"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: companies.length,

          itemBuilder: (context, index) {

            final item = companies[index];

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
                            Icons.business,
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
                                item['company'],

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

                    _buildInfoRow(
                      Icons.person,
                      "المستفيد: ${item['beneficiary']}",
                    ),

                    const SizedBox(height: 10),

                    _buildInfoRow(
                      Icons.bar_chart,
                      "نسبة الإنجاز: ${item['progress']}",
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
                                  const TrackingDetailsScreen(),
                            ),
                          );
                        },

                        icon: const Icon(
                          Icons.visibility,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "متابعة الحالة",

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

  Widget _buildInfoRow(
    IconData icon,
    String text,
  ) {

    return Row(
      children: [

        Icon(
          icon,
          size: 18,
          color: Colors.grey,
        ),

        const SizedBox(width: 8),

        Text(
          text,

          style: const TextStyle(
            color: Colors.black87,
          ),
        ),

      ],
    );
  }
}