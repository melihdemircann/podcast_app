import 'package:flutter/material.dart';
import 'explore.dart';
import '../theme.dart'; // AppTheme dosyasını import eder

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor, // Arka plan rengini AppTheme'den alır
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor, // AppBar arka plan rengini AppTheme'den alır
        elevation: 0, // AppBar'ın gölgesini kaldırır
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.iconColor), // Geri dönme ikonunun rengi
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExploreScreen())); // Geri dönme işlevi
          },
        ),
        title: const Text(
          'Now Playing', // Başlık
          style: TextStyle(color: AppTheme.textColor), // Başlık rengini AppTheme'den alır
        ),
        centerTitle: true, // Başlığı ortalar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0), // Body'ye padding ekler
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column'un boyutunu en küçük haliyle ayarlar
          children: [
            // Albüm resmi
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Resmin köşelerini yuvarlatır
              child: Image.asset(
                'assets/images/ted_talks_daily.png', // Albüm resmi
                height: 250.0, // Resmin yüksekliği
                width: 250.0, // Resmin genişliği
                fit: BoxFit.cover, // Resmi kapsayıcı olarak ayarlar
              ),
            ),
            const SizedBox(height: 30.0), // Resim ile başlık arasında boşluk bırakır
            // Başlık
            const Text(
              'The Missing 96 Percent of the Universe', // Podcast başlığı
              style: TextStyle(
                fontSize: 24.0, // Başlık font boyutu
                fontWeight: FontWeight.bold, // Kalın yazı tipi
                color: AppTheme.textColor, // Başlık rengini AppTheme'den alır
              ),
              textAlign: TextAlign.center, // Başlığı ortalar
            ),
            const SizedBox(height: 8.0), // Başlık ile yazar adı arasında boşluk bırakır
            // Yazar
            const Text(
              'Claire Malone', // Podcast yazarının adı
              style: TextStyle(
                fontSize: 18.0, // Yazar adı font boyutu
                color: AppTheme.subTextColor, // Alt metin rengini AppTheme'den alır
              ),
            ),
            const SizedBox(height: 30.0), // Yazar adı ile ses dalgası arasında boşluk bırakır
            // Ses dalga formu ve zaman bilgisi
            Column(
              children: [
                // Ses dalgası
                SizedBox(
                  height: 100.0, // Ses dalgasının yüksekliği
                  width: double.infinity, // Ses dalgasının genişliği
                  child: Image.asset(
                    'assets/images/voice_wave.png', // Ses dalgası resmi
                    fit: BoxFit.contain, // Resmi kapsayıcı olarak ayarlar
                  ),
                ),
                const SizedBox(height: 12.0), // Ses dalgası ile zaman bilgisi arasında boşluk bırakır
                // Zaman bilgisi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Zaman bilgilerini yatayda ayırır
                  children: [
                    Text(
                      '24:32', // Geçen süre
                      style: TextStyle(
                        color: AppTheme.subTextColor, // Zaman metin rengini AppTheme'den alır
                        fontSize: 16.0, // Zaman metni font boyutu
                      ),
                    ),
                    Text(
                      '34:00', // Toplam süre
                      style: TextStyle(
                        color: AppTheme.subTextColor, // Zaman metin rengini AppTheme'den alır
                        fontSize: 16.0, // Zaman metni font boyutu
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40.0), // Zaman bilgisi ile kontrol düğmeleri arasında boşluk bırakır
            // Kontrol düğmeleri
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Düğmeleri yatayda ortalar
              children: [
                IconButton(
                  iconSize: 50.0, // İkon boyutu
                  icon: Icon(Icons.skip_previous), // Önceki şarkı ikonu
                  color: AppTheme.iconColor, // İkon rengini AppTheme'den alır
                  onPressed: () {
                    // Geri sarma fonksiyonu
                  },
                ),
                SizedBox(width: 30.0), // Düğmeler arasında boşluk bırakır
                IconButton(
                  iconSize: 70.0, // İkon boyutu
                  icon: Icon(Icons.play_circle_filled), // Oynatma duraklatma ikonu
                  color: AppTheme.iconColor, // İkon rengini AppTheme'den alır
                  onPressed: () {
                    // Oynatma duraklatma fonksiyonu
                  },
                ),
                SizedBox(width: 30.0), // Düğmeler arasında boşluk bırakır
                IconButton(
                  iconSize: 50.0, // İkon boyutu
                  icon: Icon(Icons.skip_next), // Sonraki şarkı ikonu
                  color: AppTheme.iconColor, // İkon rengini AppTheme'den alır
                  onPressed: () {
                    // İleri sarma fonksiyonu
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
