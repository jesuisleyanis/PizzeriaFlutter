import 'package:flutter/material.dart';
import 'package:pizzeria/Models/cart.dart';
import '/Models/pizza.dart';


class BuyButtonWidget extends StatelessWidget {
  final Pizza _pizza;
  final Cart _cart;
  const BuyButtonWidget(this._pizza, this._cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade800)),
          child: Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 5),
              Text("commander"),
            ],
          ),
          onPressed: () {
            print("commander une pizza");
            _cart.addProduct(_pizza);
          },
        )
      ],
    );
  }
}
