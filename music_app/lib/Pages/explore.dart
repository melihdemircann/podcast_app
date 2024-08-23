import 'package:flutter/material.dart';
import 'package:music_app/Pages/home_page.dart'; // HomePageScreen sayfasını içe aktarıyoruz.
import 'package:music_app/Pages/now_playing.dart'; // NowPlayingScreen sayfasını içe aktarıyoruz.
import 'package:music_app/Pages/profile.dart'; // ProfileScreen sayfasını içe aktarıyoruz.
import '../data.dart'; // Uygulamanın veri kaynaklarını içe aktarıyoruz.
import '../theme.dart'; // Tema ayarlarını içe aktarıyoruz.
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Kavisli navigasyon çubuğu için gerekli paketi içe aktarıyoruz.
import 'package:flutter_vector_icons/flutter_vector_icons.dart'; // İkonlar için gerekli paketi içe aktarıyoruz.

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _page = 1; // Başlangıçta ExploreScreen'i göstermek için sayfa indeksi 1 olarak ayarlanır.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor, // Arka plan rengi temadan alınır.
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor, // AppBar arka plan rengi temadan alınır.
        elevation: 0, // AppBar'ın gölge efekti kaldırılır.
        leading: const Icon(Icons.menu, color: Colors.grey), // Menü ikonunu gösterir.
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0), // Bildirim ikonunun sağa hizalanması sağlanır.
            child: Icon(Icons.notifications_outlined),
          ),
        ],
        title: const Text(
          'Podcast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor, // Başlık rengi temadan alınır.
          ),
        ),
        centerTitle: true, // Başlığı ortalar.
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Sayfa kenarlarına boşluk bırakılır.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // İçerikler sola hizalanır.
          children: [
            // Arama çubuğu
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0), // Üst ve alt boşluklar eklenir.
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // İçerik yatayda hizalanır.
              decoration: BoxDecoration(
                color: AppTheme.cardColor, // Kart rengi temadan alınır.
                borderRadius: BorderRadius.circular(12.0), // Kenarlar yuvarlatılır.
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: AppTheme.subTextColor), // Arama ikonu ve rengi ayarlanır.
                  hintText: 'Search', // İpucu metni.
                  border: InputBorder.none, // Sınır çizgisi kaldırılır.
                  hintStyle: TextStyle(color: AppTheme.subTextColor), // İpucu metni rengi ayarlanır.
                ),
              ),
            ),
            // Filtre çipleri
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Çipler arası boşluk eşitlenir.
              children: const [
                FilterChip(label: 'All'), // Tüm kategoriler için filtre çipi.
                FilterChip(label: 'Life'), // 'Life' kategorisi için filtre çipi.
                FilterChip(label: 'Comedy'), // 'Comedy' kategorisi için filtre çipi.
                FilterChip(label: 'Tech'), // 'Tech' kategorisi için filtre çipi.
              ],
            ),
            const SizedBox(height: 16.0), // Üst ve alt içerikler arasında boşluk eklenir.
            // Trending başlığı
            const Text(
              'Trending',
              style: TextStyle(
                fontSize: 24.0, // Metin boyutu
                fontWeight: FontWeight.bold, // Metin kalınlığı
                color: AppTheme.textColor, // Metin rengi temadan alınır.
              ),
            ),
            const SizedBox(height: 16.0), // Üst ve alt içerikler arasında boşluk eklenir.
            // Trend olan podcastlerin grid görünümü
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Grid sütun sayısı
                  crossAxisSpacing: 16.0, // Sütunlar arası boşluk
                  mainAxisSpacing: 16.0, // Satırlar arası boşluk
                  childAspectRatio: 1.0, // Grid öğelerinin genişlik-yükseklik oranı
                ),
                itemCount: trendingPodcasts.length, // Podcast sayısı kadar grid öğesi oluşturur.
                itemBuilder: (context, index) {
                  final podcast = trendingPodcasts[index];
                  return PodcastCard(
                    imageUrl: podcast.imageUrl, // Podcast resmi
                    title: podcast.title, // Podcast başlığı
                    author: podcast.author, // Podcast yazar adı
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page, // Seçili sayfanın indexi
        backgroundColor: AppTheme.backgroundColor, // Arka plan rengi
        color: AppTheme.primaryColor, // İkonların bulunduğu alanın rengi
        buttonBackgroundColor: AppTheme.accentColor, // Seçili düğmenin arka plan rengi
        items: const <Widget>[
          Icon(FontAwesome.home, size: 30, color: Colors.white), // Anasayfa ikonu
          Icon(FontAwesome.user_circle_o, size: 30, color: Colors.white), // Profil ikonu
          Icon(FontAwesome.search, size: 25, color: Colors.white), // Arama ikonu
        ],
        onTap: (index) {
          setState(() {
            _page = index; // Seçilen sayfa indexi güncellenir.
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            // Seçilen sayfaya yönlendirme yapılır.
            switch (_page) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExploreScreen()),
                );
                break;
            }
          });
        },
      ),
    );
  }
}

// Filtre Çipleri için özel widget
class FilterChip extends StatelessWidget {
  final String label; // Çip etiketi
  const FilterChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: false, // Çip seçili değil olarak ayarlanır.
      onSelected: (selected) {},
      backgroundColor: AppTheme.cardColor, // Çip arka plan rengi temadan alınır.
      labelStyle: const TextStyle(color: AppTheme.textColor), // Çip etiket rengi temadan alınır.
    );
  }
}

// Podcast Kartı için özel widget
class PodcastCard extends StatelessWidget {
  final String imageUrl; // Podcast resmi
  final String title; // Podcast başlığı
  final String author; // Podcast yazarı

  const PodcastCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NowPlayingScreen())); // Kart tıklanınca NowPlayingScreen sayfasına yönlendirir.
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardColor, // Kart arka plan rengi temadan alınır.
          borderRadius: BorderRadius.circular(12.0), // Kart kenarları yuvarlatılır.
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // İçerikler sola hizalanır.
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)), // Resmin üst kenarları yuvarlatılır.
              child: Image.asset(
                imageUrl,
                height: 100.0, // Resim yüksekliği
                width: double.infinity, // Resim genişliği
                fit: BoxFit.cover, // Resmin kapsayıcıya sığacak şekilde ayarlanır.
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Kart içeriği için boşluk bırakılır.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // İçerikler sola hizalanır.
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14.0, // Başlık yazı boyutu
                      fontWeight: FontWeight.bold, // Başlık yazı kalınlığı
                      color: AppTheme.textColor, // Başlık yazı rengi temadan alınır.
                    ),
                    maxLines: 2, // Başlık maksimum 2 satırda gösterilir.
                    overflow: TextOverflow.ellipsis, // Metin taşarsa üç nokta ile kesilir.
                  ),
                  const SizedBox(height: 4.0), // Başlık ile yazar adı arasında boşluk eklenir.
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 12.0, // Yazar adı yazı boyutu
                      color: AppTheme.subTextColor, // Yazar adı yazı rengi temadan alınır.
                    ),
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
