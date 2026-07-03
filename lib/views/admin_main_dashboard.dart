import 'package:flutter/material.dart';

import 'program_selection_screen.dart';
import 'admin_requests_screen.dart';
import 'company_tracking_screen.dart';
import 'archive_screen.dart';
import 'user_management_screen.dart';
import 'admin_cases_screen.dart';

class AdminMainDashboard extends StatelessWidget {
  const AdminMainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        title: const Text("الرئيسية - إدارة الجمعية"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "مرحباً بك، جمعية ذو النون ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff257351),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                    // الطلبات الواردة
                    _buildMenuCard(
                      context,
                      "الطلبات الواردة",
                      Icons.inbox,
                      Colors.blue,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdminRequestsScreen(),
                          ),
                        );
                      },
                    ),

                     // ادارة الحالات 
                    _buildMenuCard(
  context,
  "إدارة الحالات",
  Icons.folder_open,
  Colors.orange,
  () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const AdminCasesScreen(),
      ),
    );
  },
),

                    // إضافة حالة جديدة
                    _buildMenuCard(
                      context,
                      "إضافة حالة جديدة",
                      Icons.person_add,
                      Colors.orange,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProgramSelectionScreen(
                              userRole: 'admin',
                            ),
                          ),
                        );
                      },
                    ),

                    // متابعة الشركات
                    _buildMenuCard(
                      context,
                      "متابعة الشركات",
                      Icons.local_shipping,
                      Colors.teal,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompanyTrackingScreen(),
                          ),
                        );
                      },
                    ),

                    // الأرشيف
                    _buildMenuCard(
                      context,
                      "الأرشيف",
                      Icons.archive,
                      Colors.purple,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArchiveScreen(),
                          ),
                        );
                      },
                    ),

                    // بمعنى اضافة جهة شريكه او مقدمه الخدمه  إدارة الجهات
                    _buildMenuCard(
                      context,
                      "إدارة الجهات",
                      Icons.business,
                      Colors.green,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserManagementScreen(),
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
            )
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
              size: 40,
              color: color,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
