import 'package:flutter/material.dart';
import 'request_details_screen.dart';

class AdminRequestsScreen extends StatelessWidget {
  const AdminRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> requests = [

      {
        "name": "أحمد الشمري",
        "program": "العلاج الطبيعي",
        "doctor": "د. خالد",
        "hospital": "مستشفى الملك سلمان",
        "date": "2026/05/23",
        "status": "جديد",
      },

      {
        "name": "سارة العنزي",
        "program": "الأجهزة الطبية",
        "doctor": "د. نورة",
        "hospital": "مستشفى الشملي",
        "date": "2026/05/22",
        "status": "جديد",
      },

    ];

    final Color brandGreen = const Color(0xff257351);

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("الطلبات الواردة"),
        backgroundColor: brandGreen,
        centerTitle: true,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: requests.length,

          itemBuilder: (context, index) {

            final item = requests[index];

            return InkWell(

              borderRadius: BorderRadius.circular(20),

              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                        const RequestDetailsScreen(),
                  ),
                );
              },

              child: Container(
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
                            backgroundColor:
                                brandGreen.withOpacity(0.1),

                            child: Icon(
                              Icons.person,
                              color: brandGreen,
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
                              color: Colors.orange
                                  .withOpacity(0.1),

                              borderRadius:
                                  BorderRadius.circular(20),
                            ),

                            child: const Text(
                              "جديد",

                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),

                      const SizedBox(height: 18),

                      _buildInfoRow(
                        Icons.local_hospital,
                        item['hospital'],
                      ),

                      const SizedBox(height: 10),

                      _buildInfoRow(
                        Icons.medical_services,
                        item['doctor'],
                      ),

                      const SizedBox(height: 10),

                      _buildInfoRow(
                        Icons.calendar_today,
                        item['date'],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [

                          Expanded(
                            child: ElevatedButton.icon(
                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.green,
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 14,
                                ),
                              ),

                              onPressed: () {},

                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),

                              label: const Text(
                                "اعتماد",

                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton.icon(
                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.red,
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 14,
                                ),
                              ),

                              onPressed: () {},

                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),

                              label: const Text(
                                "إعادة للمستشفى",

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

                    ],
                  ),
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