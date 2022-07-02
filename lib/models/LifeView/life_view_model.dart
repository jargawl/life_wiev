class LifeView {
  LifeView({
    required this.title,
    required this.image,
  });
  String title;

  String image;
}

List<LifeView> lifeViews = [
  LifeView(
    title: "My gratitude list",
    image:
        "https://www.skipprichard.com/wp-content/uploads/2018/11/bigstock-Close-up-Of-Gratitude-Word-Wit-265169737.jpg",
  ),
  LifeView(
    title: "My goals",
    image: 'https://images-na.ssl-images-amazon.com/images/I/61SlCtyxoOL.jpg',
  ),
  LifeView(
    title: "My dreams",
    image: "https://miro.medium.com/max/500/1*lTVcNwigg8MEE-wHnHIYAQ.jpeg",
  ),
];
