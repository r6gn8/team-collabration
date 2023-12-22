import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/core/utils/appbar.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/domain/model/item.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/bay.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/details_screen.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/profile_page.dart';
import 'package:the_project_flutter/features/Auth/presentation/pages/theme.dart';
import '../../../../core/widgets/user_img.dart';
import 'checkout.dart';


class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);

    final userr = FirebaseAuth.instance.currentUser!;
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
                              color: Color(0xFF0E0E0E).withOpacity(0.7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("flower",

                                    style: TextStyle(color: Colors.white),
                                  ),
                               IconButton(
                                        color: Color.fromARGB(255, 62, 94, 70),
                                    onPressed: () {
                                      card.add(items[index]);
                                    },
                                    icon: Icon(Icons.add,color: Colors.white,),
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

                          image: AssetImage("assets/images/User común aesthetic.jpeg"),

                          fit: BoxFit.cover
                      ),
                    ),

                    currentAccountPicture: imgUsers(),

                    accountEmail: Text(userr.email!, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    accountName: Text("Noof Marwan", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)
                    ),
                  ),
                  ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home,color: appbarGreen,),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),);
                      }
                  ),


                  ListTile(
                      title: Text("My products"),
                      leading: Icon(Icons.add_shopping_cart,color: appbarGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckOut()),);
                      }
                  ),

                  ListTile(
                      title: Text("Paying Off"),
                      leading: Icon(Icons.payment,color: appbarGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Pay()),);

                      }
                  ),


                  ListTile(
                      title: Text("Profile"),
                      leading: Icon(Icons.person,color: appbarGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),);
                      }
                  ),

                  ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.exit_to_app,color: appbarGreen),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      }
                  ),

                ],
              ),

            ),

            appBar: AppBar(
              backgroundColor: Color(0xFFF1D1B8).withOpacity(0.7),
              title: Text("Home"),
              actions: [

                ProductPrice(),


                // IconButton(
                //   icon: Icon(Icons.shield_moon),
                //     onPressed: (){
                //       Themeervice().changeTheme();
                //     },
                //
                // ),

                ],

            ),

          );

  }
}


