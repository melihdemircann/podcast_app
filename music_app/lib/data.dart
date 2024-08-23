

class Podcast {
  final String imageUrl;
  final String title;
  final String author;

  Podcast({
    required this.imageUrl,
    required this.title,
    required this.author,
  });
}

List<Podcast> trendingPodcasts = [
  Podcast(
    imageUrl: 'assets/images/podcasts/lovely_english_stories.png',
    title: 'Lovely English Stories',
    author: 'Lovely English Stories',
  ),
  Podcast(
    imageUrl: 'assets/images/podcasts/global_news_podcast.png',
    title: 'BBC News',
    author: 'BBC World Service',
  ),
  Podcast(
    imageUrl: 'assets/images/podcasts/the_eating_me_podcast.png',
    title: 'The Eating Me Podcast',
    author: 'Alicia Christian',
  ),
  Podcast(
    imageUrl: 'assets/images/podcasts/the_mindset_advantage.png',
    title: 'The Mindset Advantage',
    author: 'Mindset Advantage',
  ),
  Podcast(
    imageUrl: 'assets/images/podcasts/prof_g_markets.png',
    title: 'Prof G Markets',
    author: 'Vox Media Podcast Network',
  ),
  Podcast(
    imageUrl: 'assets/images/podcasts/bad_friends.png',
    title: 'Bad Friends',
    author: 'Andrew Santino and Bobby Lee',
  ),
];

final List<Map<String, String>> friendsActivity = [
  {
    "name": "Ahmet",
    "podcast": "Girişimcilik 101",
    "imageUrl": "assets/images/Persons/ahmet.png",
  },
  {
    "name": "Zeynep",
    "podcast": "Teknoloji Gündemi",
    "imageUrl": "assets/images/Persons/zeynep.png",
  },
  {
    "name": "Mehmet",
    "podcast": "Spor Haberleri",
    "imageUrl": "assets/images/Persons/mehmet.png",
  },
  {
    "name": "Elif",
    "podcast": "Sanat ve Tasarım",
    "imageUrl": "assets/images/Persons/elif.png",
  },
  {
    "name": "Ali",
    "podcast": "Psikoloji Sohbetleri",
    "imageUrl": "assets/images/Persons/ali.png",
  },
];

class Categorie {
  final String imageUrl;
  final String name;

  Categorie({
    required this.imageUrl,
    required this.name,
  });
}

// Verileri Categorie sınıfı ile listeliyoruz.
final List<Categorie> categories = [
  Categorie(name: "Trends", imageUrl: "assets/images/categories/trends.png"),
  Categorie(name: "Documentary", imageUrl: "assets/images/categories/documentary.png"),
  Categorie(name: "Education", imageUrl: "assets/images/categories/education.png"),
  Categorie(name: "History", imageUrl: "assets/images/categories/history.png"),
  Categorie(name: "Language", imageUrl: "assets/images/categories/language.png"),
  Categorie(name: "Comedy", imageUrl: "assets/images/categories/comedy.png"),
];
