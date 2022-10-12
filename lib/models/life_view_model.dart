class LifeView {
  LifeView({
    required this.title,
    required this.image,
    required this.id,
  });
  String title;
  String image;
  final int id;
}

List<LifeView> lifeViews = [
  LifeView(
    id: 1,
    title: "My gratitude list",
    image:
        "https://www.skipprichard.com/wp-content/uploads/2018/11/bigstock-Close-up-Of-Gratitude-Word-Wit-265169737.jpg",
  ),
  LifeView(
    id: 2,
    title: "My goals",
    image: 'https://miro.medium.com/max/686/0*9rzGQRKC2kLHrD1M.png',
  ),
  LifeView(
    id: 3,
    title: "My dreams",
    image: "https://miro.medium.com/max/500/1*lTVcNwigg8MEE-wHnHIYAQ.jpeg",
  ),
];
