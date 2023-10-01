import "dart:ui";
import 'pizza.dart';

class PizzaData {
  static List<Pizza> buildList() {
    List<Pizza> list = [];
    list.add(Pizza(1, 'Barbecue', 'La garniture', 'pizza-bbq.jpg', 8));
    list.add(Pizza(2, 'Hawai', 'La Garniture', 'pizza-hawai.jpg', 9));
    list.add(Pizza(3, 'Epinard', 'La garniture', 'pizza-spinach.jpg', 7));
    list.add(Pizza(4, 'Vegetarienne', 'La garniture', 'pizza-vegetable.jpg', 10));
    return list;
  }
}