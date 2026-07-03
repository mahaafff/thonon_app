import 'package:flutter/material.dart';
import 'program_selection_screen.dart';
import 'hospital_cases_screen.dart';

class HospitalDashboard extends StatelessWidget {
  const HospitalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),

      appBar: AppBar(
        title: const Text("لوحة تحكم المستشفى"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
        elevation: 0,
      ),

      body: Directionality(
        textDirection: TextDirection.rtl,

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "مرحباً بكم",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff257351),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,

                  children: [

                    // إضافة مستفيد
                    _buildMenuCard(
                      context,
                      "إضافة مستفيد",
                      Icons.person_add,
                      Colors.green,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProgramSelectionScreen(
                              userRole: 'hospital',
                            ),
                          ),
                        );
                      },
                    ),

                    // الحالات المرسلة
                   _buildMenuCard(
  context,
  "الحالات المرسلة",
  Icons.folder_open,
  Colors.orange,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HospitalCasesScreen(),
      ),
    );
  },
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

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],

          border: Border.all(
            color: color.withOpacity(0.1),
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 45,
              color: color,
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

          ],
        ),
      ),
    );
  }
}