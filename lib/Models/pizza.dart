import "dart:ui";
import 'option_item.dart';

class Pizza {
  final int id;
  final String title;
  final String garniture;
  final String image;
  final double price;

  int pate = 0;
  int taille = 1;
  int sauce = 0;

  double get total {
    double total = price;

    total += pates[pate].supplement;
    total += tailles[taille].supplement;
    total += sauces[sauce].supplement;

    return total;
  }

  static final List<OptionItem> pates = [
    OptionItem(0, "Pate fine"),
    OptionItem(1, "Pate épaisse", supplement: 2),
  ];
  static final List<OptionItem> tailles = [
    OptionItem(0, "small", supplement: -1),
    OptionItem(1, "Médium"),
    OptionItem(2, "Large", supplement: 2),
    OptionItem(3, "Extra large", supplement: 4)
  ];
  static final List<OptionItem> sauces = [
    OptionItem(0, "Sauce tomate"),
    OptionItem(1, "Sauce samourai", supplement: 2),
  ];

  Pizza(this.id, this.title, this.garniture, this.image, this.price);
}