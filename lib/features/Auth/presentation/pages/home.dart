import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/core/utils/appbar.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/domain/model/item.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/bay.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/details_screen.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/login/login.dart';
import 'checkout.dart';


class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);
          return Scaffold(
            body:  Padding(
              padding: const EdgeInsets.only(top: 22),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 33),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){ Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(product:items[index]),
                          ),
                        );
                        },
                        child: GridTile(
                            child: Stack(
                                children:[
                                  Positioned(
                                    top: -3,
                                    bottom: -9,
                                    right: 0,
                                    left: 0,

                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(55),
                                        child: Image.asset(items[index].imgpath)),

                                  ),
                                ]
                            ),
                            footer: Container(
                              margin: EdgeInsets.only(left: 27,right: 27),
                              color: Color(0xFFC5DBB3).withOpacity(0.7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("3".tr, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                               IconButton(
                                        color: Color.fromARGB(255, 62, 94, 70),
                                    onPressed: () {
                                      card.add(items[index]);
                                    },
                                    icon: Icon(Icons.add),
                                        )

                                ],
                              ),
                            )
                        )


                    );
                  }),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/13.jpg"),
                          fit: BoxFit.cover
                      ),
                    ),

                    currentAccountPicture: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage("assets/images/12.jpg")),

                    accountEmail: Text("Noof.Marwan@gmail.com", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    accountName: Text("Noof Marwan", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                    ),
                  ),
                  ListTile(
                      title: Text("1".tr),
                      leading: Icon(Icons.home,color: appbarGreen,),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),);
                      }
                  ),


                  ListTile(
                      title: Text("4".tr),
                      leading: Icon(Icons.add_shopping_cart,color: appbarGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckOut()),);
                      }
                  ),

                  ListTile(
                      title: Text("2".tr),
                      leading: Icon(Icons.payment,color: appbarGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Pay()),);

                      }
                  ),

                  ListTile(
                      title: Text("5".tr),
                      leading: Icon(Icons.exit_to_app,color: appbarGreen),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),);
                      }
                  ),
                ],
              ),

            ),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 76, 141, 95),
              title: Text("1".tr),
              actions: [

                ProductPrice()


                ],

            ),

          );

  }
}


