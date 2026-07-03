import 'package:flutter/material.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Color brandGreen =
        const Color(0xff257351);

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("تفاصيل الطلب"),
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
                  "رقم الهوية",
                  "1234567890",
                ),

                _buildInfoRow(
                  "رقم الجوال",
                  "0500000000",
                ),

                _buildInfoRow(
                  "المدينة",
                  "حائل",
                ),

              ]),

              const SizedBox(height: 20),

              // بيانات التحويل
              _buildSectionTitle(
                "بيانات التحويل",
                Icons.assignment,
                brandGreen,
              ),

              _buildCard([

                _buildInfoRow(
                  "البرنامج",
                  "العلاج الطبيعي",
                ),

                _buildInfoRow(
                  "التشخيص",
                  "جلطة دماغية",
                ),

                _buildInfoRow(
                  "الاحتياج",
                  "12 جلسة علاج طبيعي",
                ),

                _buildInfoRow(
                  "اسم الطبيب",
                  "د. خالد",
                ),

                _buildInfoRow(
                  "المستشفى",
                  "مستشفى الملك سلمان",
                ),

              ]),

              const SizedBox(height: 20),

              // ملاحظات الجمعية
              _buildSectionTitle(
                "ملاحظات الجمعية",
                Icons.edit_note,
                brandGreen,
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.08),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: const TextField(
                  maxLines: 4,

                  decoration: InputDecoration(
                    hintText:
                        "اكتب ملاحظاتك هنا...",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // الأزرار
              Row(
                children: [

                  Expanded(
                    child: ElevatedButton.icon(

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.green,

                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),

                      onPressed: () {

                        showDialog(
                          context: context,

                          builder: (context) {

                            String? selectedCompany;

                            return StatefulBuilder(

                              builder:
                                  (context, setState) {

                                return AlertDialog(

                                  shape:
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius
                                            .circular(20),
                                  ),

                                  title: const Text(
                                    "تحويل الحالة للجهة المنفذة",

                                    textAlign:
                                        TextAlign.center,
                                  ),

                                  content: Column(
                                    mainAxisSize:
                                        MainAxisSize.min,

                                    children: [

                                      DropdownButtonFormField<
                                          String>(

                                        value:
                                            selectedCompany,

                                        decoration:
                                            InputDecoration(

                                          border:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius
                                                    .circular(
                                                        15),
                                          ),
                                        ),

                                        hint: const Text(
                                          "اختر الجهة المنفذة",
                                        ),

                                        items: const [

                                          DropdownMenuItem(
                                            value:
                                                "مؤسسة كيما الطبية",

                                            child: Text(
                                              "مؤسسة كيما الطبية",
                                            ),
                                          ),

                                          DropdownMenuItem(
                                            value:
                                                "مركز ابن سينا الطبي",

                                            child: Text(
                                              "مركز ابن سينا الطبي",
                                            ),
                                          ),

                                          DropdownMenuItem(
                                            value:
                                                "مؤسسة رؤية الهضبة",

                                            child: Text(
                                              "مؤسسة رؤية الهضبة",
                                            ),
                                          ),

                                        ],

                                        onChanged: (value) {

                                          setState(() {
                                            selectedCompany =
                                                value;
                                          });
                                        },
                                      ),

                                      const SizedBox(
                                          height: 20),

                                      SizedBox(
                                        width:
                                            double.infinity,

                                        child:
                                            ElevatedButton(

                                          style:
                                              ElevatedButton
                                                  .styleFrom(
                                            backgroundColor:
                                                brandGreen,
                                          ),

                                          onPressed: () {

                                            Navigator.pop(
                                                context);

                                            ScaffoldMessenger
                                                    .of(
                                                        context)
                                                .showSnackBar(

                                              SnackBar(
                                                content:
                                                    Text(
                                                  "تم تحويل الحالة إلى $selectedCompany",
                                                ),
                                              ),
                                            );
                                          },

                                          child: const Text(
                                            "إرسال",

                                            style:
                                                TextStyle(
                                              color:
                                                  Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },

                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),

                      label: const Text(
                        "اعتماد الطلب",

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
                        backgroundColor: Colors.red,

                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),

                      onPressed: () {

                        ScaffoldMessenger.of(context)
                            .showSnackBar(

                          const SnackBar(
                            content: Text(
                              "تمت إعادة الطلب للمستشفى",
                            ),
                          ),
                        );
                      },

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
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {

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