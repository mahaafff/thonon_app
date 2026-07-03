import 'package:flutter/material.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  // هذه قائمة تجريبية للجهات المضافة حالياً
  final List<Map<String, String>> users = [
    {"name": "مستشفى الملك خالد", "type": "مستشفى", "user": "khalid_hosp"},
    {"name": "شركة كيما للأجهزة", "type": "شركة", "user": "keema_co"},
  ];

  final _nameController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String _selectedType = "مستشفى";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إدارة حسابات الجهات"),
        backgroundColor: const Color(0xff257351),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(height: 10),
            // زر لإضافة جهة جديدة
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff257351),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => _showAddUserDialog(),
                icon:
                    const Icon(Icons.add_business_rounded, color: Colors.white),
                label: const Text("إضافة جهة (مستشفى / شركة) جديدة",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("الحسابات المسجلة حالياً:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: users[index]['type'] == "مستشفى"
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.orange.withOpacity(0.1),
                        child: Icon(
                          users[index]['type'] == "مستشفى"
                              ? Icons.local_hospital
                              : Icons.local_shipping,
                          color: users[index]['type'] == "مستشفى"
                              ? Colors.blue
                              : Colors.orange,
                        ),
                      ),
                      title: Text(users[index]['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("اليوزر: ${users[index]['user']}"),
                      trailing: IconButton(
                        icon:
                            const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          setState(() => users.removeAt(index));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // نافذة الإضافة (Popup)
  void _showAddUserDialog() {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("إنشاء حساب جديد"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(
                    _nameController, "اسم الجهة (مثلاً: مستشفى بقعاء)"),
                const SizedBox(height: 15),
                _buildTextField(_userController, "اسم المستخدم للولوج (ID)"),
                const SizedBox(height: 15),
                _buildTextField(_passController, "كلمة المرور", isPass: true),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: InputDecoration(
                    labelText: "نوع الجهة",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  items: ["مستشفى", "شركة"]
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedType = val!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("إلغاء")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff257351)),
              onPressed: () {
                setState(() {
                  users.add({
                    "name": _nameController.text,
                    "type": _selectedType,
                    "user": _userController.text,
                  });
                });
                _nameController.clear();
                _userController.clear();
                _passController.clear();
                Navigator.pop(context);
              },
              child: const Text("تأكيد الإنشاء",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {bool isPass = false}) {
    return TextField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
