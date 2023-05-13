class Trajetmodel{
  String villeDepart;
  String villeArriver;
  String heurArriver;
  double Prix;
  String image;
  Trajetmodel({
    required this.villeDepart,
    required this.villeArriver,
    required this.heurArriver,
    required this.image,
    required this.Prix,
});

}

  List<Trajetmodel> trajetlistitem=[

      Trajetmodel(

          villeDepart: "yaoundé",
          villeArriver: "loum",
          heurArriver: "6h50",
          image:"assets/images/go.png",

        Prix: 5000,
      ),
    Trajetmodel(

      villeDepart: "douala",
      villeArriver: "NkonssambaMelon",
      heurArriver: "15h50",
      image:"assets/images/go.png",

      Prix: 7000,
    ),
    Trajetmodel(

      villeDepart: "pendja",
      villeArriver: "loum",
      heurArriver: "11h50",
      image:"assets/images/go.png",

      Prix: 4000,
    ),
    Trajetmodel(

      villeDepart: "bafang",
      villeArriver: "bana",
      heurArriver: "16h50",
      image:"assets/images/go.png",

      Prix: 3000,
    ),
    Trajetmodel(

      villeDepart: "bafang",
      villeArriver: "bana",
      heurArriver: "16h50",
      image:"assets/images/go.png",

      Prix: 3000,
    ),
    Trajetmodel(

      villeDepart: "bafang",
      villeArriver: "bana",
      heurArriver: "16h50",
      image:"assets/images/go.png",
      Prix: 3000,
    ),
    Trajetmodel(

      villeDepart: "bafang",
      villeArriver: "bana",
      heurArriver: "16h50",
      image:"assets/images/go.png",
      Prix: 3000,
    ),

  ];

 // static Item({required String villeDepart, required String villeArrive, required int prix, required String image, required String heurArrive}) {}
