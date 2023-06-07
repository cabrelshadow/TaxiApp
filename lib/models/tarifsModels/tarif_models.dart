class Place {
  final String name;
  final String description;
  final int price;

  const Place({
    required this.name,
    required this.description,
    required this.price,
  });


}
final List<Place> places = [
  const Place(name: 'Business Class', description: 'Douala - Yaoundé', price: 15000),
  const Place(name: 'Master Class', description: 'Douala - Yaoundé', price: 20000),
  const Place(name: 'premuim', description: 'Douala - Yaoundé', price: 10000),
];