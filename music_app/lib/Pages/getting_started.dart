import 'package:flutter/material.dart';
import 'package:music_app/Pages/home_page.dart';
import '../theme.dart'; // Import the AppTheme

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({super.key});

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      setState(() {
        _currentPage = page.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor, // Arka plan rengi
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
            context,
            imageUrl: 'assets/images/podcast.png',
            title: 'Podkes',
            description: 'A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.',
            isLastPage: false,
          ),
          _buildPage(
            context,
            imageUrl: 'assets/images/podcast.png', // İkinci sayfa için görsel
            title: 'Discover More',
            description: 'Explore a variety of podcasts across different genres and topics.',
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, {
    required String imageUrl,
    required String title,
    required String description,
    required bool isLastPage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image container with rounded top edges
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
            child: Image.asset(
              imageUrl,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30.0),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: AppTheme.textColor, // Başlık rengi
            ),
          ),
          const SizedBox(height: 20.0),
          // Description text
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: AppTheme.subTextColor, // Açıklama metni rengi
            ),
          ),
          const SizedBox(height: 40.0),
          // Page indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2, // Sayfa sayısı
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: index == _currentPage ? AppTheme.subTextColor : Colors.white24, // Aktif sayfa göstergesi rengi
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          // Next button
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePageScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20.0),
                backgroundColor: AppTheme.cardColor, // Düğme arka plan rengi
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: AppTheme.subTextColor, // Düğme ikonu rengi
              ),
            ),
        ],
      ),
    );
  }
}
