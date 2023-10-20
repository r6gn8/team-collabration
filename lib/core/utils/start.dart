import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/domain/model/item.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/checkout.dart';



class Sart extends StatelessWidget {
  const Sart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);
    return
      Row(
        children: [
          Icon(
            Icons.star,
            size: 26,
            color: Color.fromARGB(255, 255, 191, 0),
          ),
          Icon(
            Icons.star,
            size: 26,
            color: Color.fromARGB(255, 255, 191, 0),
          ),
          Icon(
            Icons.star,
            size: 26,
            color: Color.fromARGB(255, 255, 191, 0),
          ),
          Icon(
            Icons.star,
            size: 26,
            color: Color.fromARGB(255, 255, 191, 0),
          ),
          Icon(
            Icons.star,
            size: 26,
            color: Color.fromARGB(255, 255, 191, 0),
          ),
        ],

      );
  }

}



