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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        home: MyHomePage(), //nama halaman "MyHomePage"
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  //membuat variablebernama favorites untuk menyimpan data yg di like
   var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  } 
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
     var pair = appState.current;  
      IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
          children: [
             BigCard(pair: pair),
          
             Row(
              mainAxisSize: MainAxisSize.min,
               children: [
                 ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),

                 ElevatedButton(
                  onPressed: () {
                    print('button pressed!');
                     appState.getNext();  
                         
                  },
                  child: Text('Next'),
                             ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);  //menambahkan tema pada teks
     //membuat style untuk teks,diberi nama style,style warna mengikuti parent
      final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
       color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
         child: Text(pair.asLowerCase, style: style,
         semanticsLabel: "${pair.first} ${pair.second}"),
      ),
    );
  }
}