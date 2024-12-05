// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/gradient-white-monochrome-background_23-2149017048.jpg'), // Ganti dengan URL gambar Anda
                  fit: BoxFit.cover, // Agar gambar mengisi seluruh area
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/iky.jpg'), // Ganti dengan gambar avatar Anda
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rizky Dwi Susanto',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.house,
                color: Colors.blue,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Menutup Drawer
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
              title: const Text('WhatsApp'),
              onTap: () async {
                final Uri url =
                    Uri.parse('https://wa.me/6282120791879?text=Hello');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.instagram,
                color: Colors.purple,
              ),
              title: const Text('Instagram'),
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://www.instagram.com/aliiwithahoodie?igsh=MTc3cTR0MG41bnZo');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto Profil
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/iky.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Nama
                  const Text(
                    'Rizky Dwi Susanto',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Mobile Application Engineer',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 25),
                  // Deskripsi
                  const Text(
                    'Currently studying at ITB-STIKOM Ambon, in my 5th semester. I love learning new things and expanding my knowledge.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  // Info Card (Experience & Projects)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoCard('Semester', '5 th'),
                      _buildInfoCard('Projects', '5+'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Skills Section
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Skills & Expertise',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _SkillChip(label: 'Flutter'),
                      _SkillChip(label: 'Dart'),
                      _SkillChip(label: 'Git'),
                      _SkillChip(label: 'UI/UX'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk Info Card (Experience dan Projects)
  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.deepPurple.shade50,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }
}
