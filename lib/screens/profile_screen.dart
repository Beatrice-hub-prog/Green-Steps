import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/app_state.dart';
import '../app/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController contactNameCtrl = TextEditingController();
  final TextEditingController contactEmailCtrl = TextEditingController();
  final TextEditingController contactMsgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final nameCtrl = TextEditingController(text: app.profile['name']);
    final emailCtrl = TextEditingController(text: app.profile['email']);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Support')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // USER PROFILE SECTION
            const Text(
              'Your Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.lightGreen,
              child: Text(
                (app.profile['name'] ?? 'G')[0].toUpperCase(),
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await app.updateProfile({
                  'name': nameCtrl.text,
                  'email': emailCtrl.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile updated')),
                );
              },
              child: const Text('Save Profile'),
            ),

            const Divider(height: 32, thickness: 1),

            // ABOUT US SECTION
            const Text(
              'About GreenSteps',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'GreenSteps is a sustainability-focused prototype app designed to help users adopt eco-friendly habits through tracking, education, and community engagement. '
              'Our mission is to make sustainable living easier and more achievable by providing tools, insights, and tips that empower individuals to live responsibly and make a positive environmental impact.',
              style: TextStyle(fontSize: 15, height: 1.4),
            ),

            const Divider(height: 32, thickness: 1),

            // CONTACT US SECTION
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: contactNameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: contactEmailCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: contactMsgCtrl,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      contactNameCtrl.clear();
                      contactEmailCtrl.clear();
                      contactMsgCtrl.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Message sent successfully!')),
                      );
                    },
                    child: const Text('Submit Query'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
