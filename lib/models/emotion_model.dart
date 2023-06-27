class Emotion {
  Emotion({
    required this.title,
    required this.count,
    required this.image,
  });
  String title;
  int count;
  String image;
}

List<Emotion> emotions = [
  Emotion(title: "Happy", image: "assets/Happy.png", count: 0),
  Emotion(title: "Grateful", image: "assets/Grateful.png", count: 0),
  Emotion(title: "Scared", image: "assets/Scared.png", count: 0),
  Emotion(title: "Sad", image: "assets/Sad.png", count: 0),
  Emotion(title: "Angry", image: "assets/Angry.png", count: 0),
  Emotion(title: "Surprised", image: "assets/Surprised.png", count: 0),
  Emotion(title: "Expectations", image: "assets/Expectations.png", count: 0),
  Emotion(title: "Rejected", image: "assets/Rejected.png", count: 0),
];
