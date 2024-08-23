import 'package:flutter/material.dart';
import 'package:music_app/Pages/explore.dart';
import 'package:music_app/Pages/home_page.dart';
import '../theme.dart'; // AppTheme'i import edin
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _page = 1; // Başlangıçta 1 (Profil sayfası) seçili
  int _selectedAvatarIndex = -1; // Seçili avatarın index'i, başlangıçta -1 (hiçbiri seçilmemiş)

  final List<String> _avatarOptions = [ // Kullanıcıya sunulacak avatar seçenekleri
    'assets/images/Avatars/cat.png',
    'assets/images/Avatars/dog.png',
    'assets/images/Avatars/dragon.png',
    'assets/images/Avatars/giraffe.png',
    'assets/images/Avatars/gorilla.png',
    'assets/images/Avatars/panda.png',
    'assets/images/Avatars/bear.png',
    'assets/images/Avatars/shark.png',
    'assets/images/Avatars/snake.png',
    'assets/images/Avatars/unicorn.png',
    'assets/images/Avatars/walrus.png',
    'assets/images/Avatars/monkey.png',
    'assets/images/Avatars/choose.png',
  ];

  @override
  void initState() {
    _loadSelectedAvatarIndex(); // Uygulama başladığında seçili avatarın index'ini yükle
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor, // Arka plan rengini AppTheme'den alın
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Yatay padding
        child: Column(
          children: [
            SizedBox(height: 30), // Yukarıdan boşluk bırakın
            GestureDetector(
              onTap: () {
                _openAvatarSelector(context); // Avatar seçim ekranını aç
              },
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.red, // Varsayılan arka plan rengi
                child: _selectedAvatarIndex != -1
                    ? Image.asset(
                  _avatarOptions[_selectedAvatarIndex], // Seçili avatarı göster
                  width: 200,
                  height: 200,
                )
                    : Image.asset(
                  'assets/images/Avatars/choose.png', // Hiç avatar seçilmediyse varsayılan avatarı göster
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            SizedBox(height: 20.0), // Avatar ile kullanıcı adı arasında boşluk bırakın
            Text(
              'Melih Demircan', // Kullanıcı adı
              style: TextStyle(
                fontSize: 29.0, // Yazı boyutu
                fontWeight: FontWeight.bold, // Yazı kalınlığı
                color: AppTheme.textColor, // Yazı rengini AppTheme'den alın
              ),
            ),
            SizedBox(height: 30.0), // Kullanıcı adı ile "Dinlemeye Devam Et" başlığı arasında boşluk bırakın
            Text(
              'Dinlemeye Devam Et', // Bölüm başlığı
              style: TextStyle(
                fontSize: 25.0, // Yazı boyutu
                fontWeight: FontWeight.bold, // Yazı kalınlığı
                color: AppTheme.textColor, // Yazı rengini AppTheme'den alın
              ),
            ),
            SizedBox(height: 20.0), // Bölüm başlığı ile podcast kartları arasında boşluk bırakın
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // Podcast kartlarını ortalamak için
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // İki podcast kartını yan yana ortalayın
                  children: [
                    PodcastProgressCard(
                      imageUrl: 'assets/images/podcasts/bad_friends.png', // Podcast görseli
                      progress: 0.5, // İlerleme durumu
                    ),
                    PodcastProgressCard(
                      imageUrl: 'assets/images/podcasts/prof_g_markets.png', // Podcast görseli
                      progress: 0.7, // İlerleme durumu
                    ),
                  ],
                ),
                SizedBox(height: 20.0), // İki satır arasındaki boşluk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // İki podcast kartını yan yana ortalayın
                  children: [
                    PodcastProgressCard(
                      imageUrl: 'assets/images/podcasts/ted_talks_daily.png', // Podcast görseli
                      progress: 0.3, // İlerleme durumu
                    ),
                    PodcastProgressCard(
                      imageUrl: 'assets/images/podcasts/lovely_english_stories.png', // Podcast görseli
                      progress: 0.9, // İlerleme durumu
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page, // Başlangıçta seçili sayfa (Profil sayfası)
        backgroundColor: AppTheme.backgroundColor, // Alt navigasyon arka plan rengi
        color: AppTheme.primaryColor, // İkonların bulunduğu alanın rengi
        buttonBackgroundColor: AppTheme.accentColor, // Seçili düğmenin arka plan rengi
        items: const <Widget>[
          Icon(FontAwesome.home, size: 30, color: Colors.white), // İkon renkleri
          Icon(FontAwesome.user_circle_o, size: 30, color: Colors.white),
          Icon(FontAwesome.search, size: 25, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index; // Seçilen sayfa index'ini güncelle
          });
          Future.delayed(const Duration(milliseconds: 500), () { // 500ms bekleyin
            switch (_page) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()), // Ana sayfaya yönlendirin
                );
                break;
              case 1:
              // ProfileScreen'de zaten olduğunuz için tekrar yüklenmesine gerek yok
                break;
              case 2:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ExploreScreen()), // Keşfet sayfasına yönlendirin
                );
                break;
            }
          });
        },
      ),
    );
  }

  void _openAvatarSelector(BuildContext context) { // Avatar seçim ekranını açmak için kullanılan yöntem
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4, // Ekranın %40'ı kadar yükseklik
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Çocukları yatay olarak doldur
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Her satırda 4 avatar göster
                  ),
                  itemCount: _avatarOptions.length, // Avatar sayısı
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAvatarIndex = index; // Seçilen avatarın index'ini güncelle
                          _saveSelectedAvatarIndex(index); // Seçimi kaydet
                          Navigator.pop(context); // Alt menüyü kapat
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0), // İçeriğin etrafına boşluk ekle
                        child: CircleAvatar(
                          backgroundImage: AssetImage(_avatarOptions[index]), // Avatar resmi
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveSelectedAvatarIndex(int index) async { // Seçili avatarın index'ini kaydetmek için kullanılan yöntem
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_avatar_index', index); // Index'i kaydedin
  }

  void _loadSelectedAvatarIndex() async { // Kaydedilmiş avatar index'ini yüklemek için kullanılan yöntem
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedAvatarIndex = prefs.getInt('selected_avatar_index') ?? -1; // Kaydedilmiş index'i yükleyin veya -1 kullanın
    });
  }
}

class PodcastProgressCard extends StatelessWidget { // Podcast ilerleme durumu için kart widget'ı
  final String imageUrl; // Podcast görselinin URL'si
  final double progress; // Podcast ilerleme durumu (0.0 - 1.0 arası bir değer)

  PodcastProgressCard({
    required this.imageUrl, // Gerekli parametreler
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Kartın genişliği
      height: 200, // Kartın yüksekliği
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Kartın kenarlarını yuvarlatın
        image: DecorationImage(
          image: AssetImage(imageUrl), // Podcast görselini yükleyin
          fit: BoxFit.cover, // Görseli kartın tamamına sığdırın
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // İlerleme çubuğunu kartın en altına yerleştirin
        children: [
          Container(
            width: double.infinity, // Çubuğun genişliği kart kadar olsun
            height: 5, // Çubuğun yüksekliği
            color: Colors.grey, // Arka plan rengi
            child: FractionallySizedBox(
              widthFactor: progress, // İlerleme oranına göre doluluk oranını belirleyin
              alignment: Alignment.centerLeft, // Çubuğu soldan başlatın
              child: Container(
                color: Colors.green, // İlerleme çubuğunun rengi
              ),
            ),
          ),
        ],
      ),
    );
  }
}
