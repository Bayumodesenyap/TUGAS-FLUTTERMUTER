//memasukkan package yang dibutuhkan oleh aplikasi
import 'package:english_words/english_words.dart';//paket bahasa inggris
import 'package:flutter/material.dart';//paket untuk tampilan UI (material UI)
import 'package:provider/provider.dart';//paket untuk interaksi aplikasi

void main() {
  runApp(MyApp());
}

//membuat abstrak aplikasi dari statelesswidget (yang menjalankan seluruh aplikasi di dalam MyApp)
class MyApp extends StatelessWidget {
  const MyApp({super.key});//menunjukkan bahwa aplikasi akan tetap, tidak berubah setelah di-build

  @override //mengganti nilai lama yang sudah ada di tamplate,dengan nilai2 yang baru (replace/overwrite)
  Widget build(BuildContext context) {
    //fungsi yang membangun UI (mengatur posisi widget dst)
    //changenotifierprovider mendengarkan/mendeteksi semua interaksi yang terjadi di aplikasi
    return ChangeNotifierProvider(
      create: (context) => MyAppState(), //membuat satu state bernama MyAppState
      child: MaterialApp( //pada state ini,menggunakan desain material UI
        title: 'Namer App', //diberi judul namer app
        theme: ThemeData( //data tema aplikasi diberi warna deepOrange
          useMaterial3: true, //versi material UI yang dipakai versi 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(), //nama halaman "MyHomePage"
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
           ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}