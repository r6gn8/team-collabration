import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';


import '../../../../core/utils/colors.dart';
class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayStateState();
}

class _PayStateState extends State<Pay> {
  int type=1;
  void _handleRadio(Object? e) =>
      setState(() {
    type = e as int;
  });
   @override
   void initState(){
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);
     Size size =MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text("Paying Off"),
        actions: [

         // ProductPrice()


        ],

      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: type == 1
                        ? Border.all(width: 1,color:Color.fromARGB(255, 76, 141, 95))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: type,
                                onChanged: _handleRadio,
                                activeColor: Color.fromARGB(255, 76, 141, 95),
                              ),
                              Text("Amazon Pay",
                              style: type == 1? TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                  color: Colors.black) : TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)
                              ),

                            ],
                          ),
                          Image.asset("assets/images/amazon.jpg",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                SizedBox(height: 15,),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: type == 2
                        ? Border.all(width: 1,color:Color.fromARGB(255, 76, 141, 95))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 2,
                                groupValue: type,
                                onChanged: _handleRadio,
                                activeColor: Color.fromARGB(255, 76, 141, 95),
                              ),
                              Text("Credit Card",
                                  style: type == 2? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black) : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)
                              ),

                            ],
                          ),
                          Spacer(),
                          Image.asset("assets/images/R.png",
                            width: 35,
                            //height: 70,
                            //fit: BoxFit.cover,
                          ),
                          SizedBox(width: 8),
                          Image.asset("assets/images/mastercard.png",
                            width: 35,
                            //height: 70,
                            //fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),




                SizedBox(height: 15,),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: type == 3
                        ? Border.all(width: 1,color:Color.fromARGB(255, 76, 141, 95))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 3,
                                groupValue: type,
                                onChanged: _handleRadio,
                                activeColor:Color.fromARGB(255, 76, 141, 95),
                              ),
                              Text("Paypal",
                                  style: type == 3? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black) : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)
                              ),

                            ],
                          ),
                          Image.asset("assets/images/paypal-1.png",
                            width: 70,
                            height: 70,
                            //fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 15,),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: type == 4
                        ? Border.all(width: 1,color: Color.fromARGB(255, 76, 141, 95))
                        : Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 4,
                                groupValue: type,
                                onChanged: _handleRadio,
                                activeColor: Color.fromARGB(255, 76, 141, 95),
                              ),
                              Text("Googel Pay",
                                  style: type == 4? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black) : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)
                              ),

                            ],
                          ),
                          Image.asset("assets/images/OIP.jpg",
                            width: 70,
                            height: 70,
                            //fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 100,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub_Total",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:FontWeight.w500,
                      color: Colors.grey,
                    ),
                    ),
                    Text("Pay \$ ${card.price.round()}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:FontWeight.w500,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text("Shipping fee",
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     fontWeight:FontWeight.w500,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // Text("\$0",
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     fontWeight:FontWeight.w500,
                    //     color: Colors.grey,
                    //   ),
                    // )
                  ],
                ),

                Divider(
                  height: 30,
                  color: Colors.black,
                  thickness: 0.5,
                ),




                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Payment",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:FontWeight.w500,
                        color: Colors.black  ,
                      ),
                    ),
                    Text("Pay \$ ${card.price.round()}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),


                SizedBox(
                  height: 70,
                ),
                ElevatedButton(

                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appbarGreen),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text("Pay \$ ${card.price.round()} ", style: TextStyle(fontSize: 19),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
