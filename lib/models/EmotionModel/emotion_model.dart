class Emotion {
  Emotion({
    required this.title,
    required this.count,
    required this.image,
  });
  String title;
  String count;
  String image;
}

List<Emotion> emotions = [
  Emotion(
      title: "Happy",
      image:
          "https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f60a.png",
      count: "1"),
  Emotion(
      title: "Angry",
      image:
          "https://i.pinimg.com/736x/6a/72/1f/6a721f82632d712bde8ade6c8712ef39.jpg",
      count: "34"),
  Emotion(
      title: "Sad",
      image:
          "https://toppng.com/uploads/preview/sad-face-emoji-download-heart-emoji-black-red-pink-depression-smiley-115629146667rhab5yyv9.png",
      count: "45"),
  Emotion(
      title: "Worried",
      image:
          "https://w7.pngwing.com/pngs/953/403/png-transparent-worry-anxiety-emotion-scalable-graphics-worried-smiley-face-orange-sadness.png",
      count: "56"),
];
