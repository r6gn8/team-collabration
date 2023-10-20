import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/domain/model/item.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/checkout.dart';



class ProductPrice extends StatelessWidget {
  const ProductPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);
    return  Row(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOut(),
                  ),
                );
              },

              icon: Icon(Icons.add_shopping_cart)),
            Positioned(
              child: Container(
                  child: Text(
                    "${card.itemCount}",
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color:  Color(0xFFC5DBB3),
                      shape: BoxShape.circle)),
            ),

          ],
        ),

        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text("\$ ${card.price}"),
        )
      ],
    );
  }
}
