import 'package:flutter/material.dart';
import 'package:music_app/Pages/explore.dart';
import 'package:music_app/Pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../data.dart';
import '../theme.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Scaffold için global key tanımlanır
  int _page = 0; // Başlangıçta 0 (Ana sayfa) seçili

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Scaffold'a key atanır
      backgroundColor: AppTheme.backgroundColor, // Arka plan rengini AppTheme'den alır
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor, // AppBar arka plan rengini AppTheme'den alır
        elevation: 0, // AppBar'ın gölgesini kaldırır
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey), // Menü ikonunu tanımlar
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Sol drawer'ı açar
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.grey), // Profil ikonunu tanımlar
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer(); // Sağ drawer'ı açar
            },
          ),
        ],
        title: const Text(
          'Podcast App', // AppBar başlığı
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor, // Başlık metninin rengini AppTheme'den alır
          ),
        ),
        centerTitle: true, // Başlığı ortalar
      ),
      endDrawer: Drawer(
        child: Container(
          color: AppTheme.backgroundColor, // Drawer'ın arka plan rengini AppTheme'den alır
          child: Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor, // DrawerHeader arka plan rengini AppTheme'den alır
                ),
                child: Text(
                  'Arkadaşlar', // DrawerHeader başlığı
                  style: TextStyle(
                    color: AppTheme.textColor, // Başlık metninin rengini AppTheme'den alır
                    fontSize: 35,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: friendsActivity.length, // Liste öğe sayısını belirler
                  itemBuilder: (context, index) {
                    final friend = friendsActivity[index]; // Arkadaş verisini alır
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(friend['imageUrl']!), // Arkadaş resmini gösterir
                      ),
                      title: Text(
                        friend['name']!, // Arkadaş adını gösterir
                        style: TextStyle(color: AppTheme.textColor),
                      ),
                      subtitle: Text(
                        'Dinlediği Podcast: ${friend['podcast']}', // Arkadaşın dinlediği podcast'i gösterir
                        style: TextStyle(color: AppTheme.subTextColor),
                      ),
                      tileColor: AppTheme.cardColor, // ListTile kart rengini AppTheme'den alır
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Body içeriğine yatay padding ekler
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // İçeriği soldan hizalar
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0), // Container etrafında dikey boşluk bırakır
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // İçerisine yatay padding ekler
              decoration: BoxDecoration(
                color: AppTheme.cardColor, // Container arka plan rengini AppTheme'den alır
                borderRadius: BorderRadius.circular(12.0), // Köşeleri yuvarlatır
              ),
            ),
            const Text(
              'Podcasts', // Başlık
              style: TextStyle(
                fontSize: 24.0, // Yazı boyutu
                fontWeight: FontWeight.bold, // Kalın yazı tipi
                color: AppTheme.textColor, // Metin rengini AppTheme'den alır
              ),
            ),
            const SizedBox(height: 16.0), // Başlık ile grid arasında boşluk bırakır
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 sütunlu grid oluşturur
                  crossAxisSpacing: 12.0, // Sütunlar arasındaki boşluğu 12.0 olarak ayarlar
                  mainAxisSpacing: 20.0, // Satırlar arasındaki boşluğu 20.0 olarak ayarlar
                  childAspectRatio: 0.7, // Her öğenin boyut oranını ayarlar (genişlik/yükseklik)
                ),
                itemCount: categories.length, // Verilerin uzunluğunu kullanarak öğe sayısını belirler
                itemBuilder: (context, index) {
                  final category = categories[index]; // Kategori verisini alır
                  return PodcastCard(
                    imageUrl: category.imageUrl, // Podcast kartı için görsel
                    title: category.name, // Podcast adı
                    author: "", // Burada author için bir değer sağlıyoruz
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: AppTheme.backgroundColor, // Arka plan rengi
        color: AppTheme.primaryColor, // İkonların bulunduğu alanın rengi
        buttonBackgroundColor: AppTheme.accentColor, // Seçili düğmenin arka plan rengi
        items: const <Widget>[
          Icon(FontAwesome.home, size: 30, color: Colors.white), // Ana sayfa ikonu
          Icon(FontAwesome.user_circle_o, size: 30, color: Colors.white), // Profil ikonu
          Icon(FontAwesome.search, size: 25, color: Colors.white), // Arama ikonu
        ],
        onTap: (index) {
          setState(() {
            _page = index; // Seçilen sayfa index'ini günceller
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            switch (_page) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomePageScreen()), // Ana sayfaya yönlendirir
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProfileScreen()), // Profil sayfasına yönlendirir
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ExploreScreen()), // Keşfet sayfasına yönlendirir
                );
                break;
            }
          });
        },
      ),
    );
  }
}
