import 'package:flutter/material.dart';
import '/Models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();

}



class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget._cart.totalItems(),
              itemBuilder: (context, index) {
                return _buildItem(widget._cart.getCartItem(index));
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Total : ${getTotal()} €', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: () {
                print('Valider');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/pizzas/${cartItem.pizza.image}'),
          backgroundColor: Colors.amber,
        ),
        title: Text(cartItem.pizza.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prix : ${cartItem.pizza.price} €'),
            Text('Sous total : ${cartItem.pizza.price * cartItem.quantity} €'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => updateQuantity(cartItem, -1),
            ),
            Text('${cartItem.quantity}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => updateQuantity(cartItem, 1),
            ),
          ],
        ),
      ),
    );
  }



  double getTotal() {
    double total = 0.0;
    for (int i = 0; i < widget._cart.totalItems(); i++) {
      CartItem cartItem = widget._cart.getCartItem(i);
      total += cartItem.pizza.price * cartItem.quantity;
    }
    return total;
  }

  void updateQuantity(CartItem cartItem, int change) {
    setState(() {
      cartItem.quantity += change;
      if (cartItem.quantity <= 0) {
        widget._cart.removeProduct(cartItem.pizza);
      }
    });
  }

}