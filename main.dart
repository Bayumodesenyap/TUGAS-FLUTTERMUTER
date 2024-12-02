import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Japanese food')),
        body: const PavlovaScreen(),
      ),
    );
  }
}

class PavlovaScreen extends StatelessWidget {
  const PavlovaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ramen Ichiraku',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 205, 30, 30)),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ramen Ichiraku (Ramen Ichiraku) adalah sebuah restoran kecil di Konohagakure, yang melayani ramen., '
                  ' Bar ini juga tempat favorit Naruto Uzumaki dan Iruka Umino untuk makan. Bar ini dijalankan oleh Teuchi dan putrinya Ayame.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.deepOrangeAccent[500]),
                    Icon(Icons.star, color: Colors.deepOrangeAccent[500]),
                    Icon(Icons.star, color: Colors.deepOrangeAccent[500]),
                    Icon(Icons.star, color: Colors.deepOrangeAccent[500]),
                    const Icon(Icons.star_half, color: Colors.deepOrangeAccent),
                    const SizedBox(width: 8),
                    const Text('9.000 Reviews'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconInfo(Icons.timer, 'PREP:', '25 min'),
                    _buildIconInfo(Icons.schedule, 'COOK:', '1 hr'),
                    _buildIconInfo(Icons.restaurant, 'FEEDS:', '4-6'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ908tWuyBRzXvaHPVaLlmbMIf2Z1UckJYsVQ&s', // Ganti dengan URL gambar pavlova Anda
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildIconInfo(IconData icon, String title, String subtitle) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepOrangeAccent[500]),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle),
      ],
    );
  }
}