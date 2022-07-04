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
  Emotion(
      title: "Happy",
      image:
          "https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f60a.png",
      count: 0),
  Emotion(
      title: "Grateful",
      image: 'https://images.emojiterra.com/google/android-10/512px/1f91d.png',
      count: 0),
  Emotion(
      title: "Scared",
      image:
          "https://cdn.iconscout.com/icon/free/png-256/money-mouth-face-1645224-1395553.png",
      count: 0),
  Emotion(
      title: "Sad",
      image:
          "https://preview.redd.it/07eye2p1q0c51.png?auto=webp&s=332e74fdbda0454ff46035a2736e49dfadfa3f17",
      count: 0),
  Emotion(
      title: "Angry",
      image:
          "https://static8.depositphotos.com/1001911/974/v/950/depositphotos_9746784-stock-illustration-accusing-emoticon.jpg",
      count: 0),
  Emotion(
      title: "Surprised",
      image:
          'https://i.pinimg.com/originals/b1/13/6c/b1136c912e6cfa93b3e1463db47bb508.png',
      count: 0),
  Emotion(
      title: "Expectations",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpmfTtPHy34jf8GnCTb1Ng1zkDIiCbMsG392YncQRF8Nq93wvko2IF-S00F01mynwyf8s&usqp=CAU",
      count: 0),
  Emotion(
      title: "Rejected",
      image:
          "https://st2.depositphotos.com/1967477/6346/v/950/depositphotos_63464805-stock-illustration-talk-to-my-hand-gesture.jpg",
      count: 0),
];
