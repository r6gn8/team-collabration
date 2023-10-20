

//data


import 'package:flutter/material.dart';
import 'package:the_project_flutter/features/Auth/domain/model/item.dart';

class Cart with ChangeNotifier
{
  List selectedProdects = [];

  double price = 0;


        add(Item product) {
          selectedProdects.add(product);

          price += product.price.round();
          notifyListeners();

        }

        delete(Item product){
          selectedProdects.remove(product);
          price -= product.price.round();
          notifyListeners();


        }

        get itemCount {
          return selectedProdects.length;
        }
}