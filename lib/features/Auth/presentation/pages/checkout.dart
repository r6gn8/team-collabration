import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/core/utils/appbar.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/bay.dart';

import '../../../../core/utils/colors.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,

        title: Text("My products"),
        actions: [
          ProductPrice()
        ],
      ),


      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 650,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: card.selectedProdects.length,

                  itemBuilder: (BuildContext context, int index) {
                    return  Card(
                      child: ListTile(
                        title: Text(card.selectedProdects[index].name),
                        subtitle: Text("${card.selectedProdects[index].price} - ${card.selectedProdects[index].location}"),
                        leading: CircleAvatar(backgroundImage:AssetImage(card.selectedProdects[index].imgpath)),
                        trailing: IconButton(
                            onPressed: () {
                              card.delete(card.selectedProdects[index]);
                            },
                            icon: Icon(Icons.remove)),
                      ),
                    );
                  }
                  ),
    ),
          ),
          SizedBox(
            height: 33,
          ),
          ElevatedButton(

            onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pay()),);

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(appbarGreen),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            ),
            child: Text("Pay \$ ${card.price.round()} ", style: TextStyle(fontSize: 19),),
          ),
        ],
      ),

        );
  }
}
