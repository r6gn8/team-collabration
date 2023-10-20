import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_project_flutter/core/utils/appbar.dart';
import 'package:the_project_flutter/core/utils/colors.dart';
import 'package:the_project_flutter/core/utils/start.dart';
import 'package:the_project_flutter/features/Auth/data/provider/card.dart';
import 'package:the_project_flutter/features/Auth/domain/model/item.dart';

class Details extends StatefulWidget {
  Item product;
  Details({required this.product});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [

            ProductPrice()

          ],
          backgroundColor: appbarGreen,
          title: Text("Details screen"),
        ),


        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.product.imgpath),

              SizedBox(
                height: 11,
              ),


              Text("\$ ${widget.product.price}",
                style: TextStyle(fontSize: 20),
              ),



              SizedBox(
                height: 16,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.all(2),
                      child: Text(
                        "New",
                        style: TextStyle(fontSize: 15),
                      ),
                      decoration: BoxDecoration(
                        color:Color.fromARGB(168, 3, 65, 27),
                        borderRadius: BorderRadius.circular(4),
                      )),


                  SizedBox(
                    width: 8,
                  ),



                  Row(
                    children: [
                      Sart(),
                      // Icon(
                      //   Icons.star,
                      //   size: 26,
                      //   color: Color.fromARGB(255, 255, 191, 0),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   size: 26,
                      //   color: Color.fromARGB(255, 255, 191, 0),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   size: 26,
                      //   color: Color.fromARGB(255, 255, 191, 0),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   size: 26,
                      //   color: Color.fromARGB(255, 255, 191, 0),
                      // ),
                      // Icon(
                      //   Icons.star,
                      //   size: 26,
                      //   color: Color.fromARGB(255, 255, 191, 0),
                      // ),
                    ],
                  ),


                  SizedBox(
                    width: 66,
                  ),


                  Row(
                    children: [
                      Icon(
                        Icons.edit_location,
                        size: 26,
                        color: Color.fromARGB(168, 3, 65, 27),
                      ),


                      SizedBox(
                        width: 3,
                      ),


                      Text(
                        widget.product.location,
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 16,
              ),

              SizedBox(
                width: double.infinity,
                child: Text(
                  "Details : ",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
              ),


              SizedBox(
                height: 16,
              ),


              Text(
                "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). The biological function of a flower is to facilitate reproduction, usually by providing a mechanism for the union of sperm with eggs. Flowers may facilitate outcrossing (fusion of sperm and eggs from different individuals in a population) resulting from cross-pollination or allow selfing (fusion of sperm and egg from the same flower) when self-pollination occurs.",
                style: TextStyle(
                  fontSize: 18,
                ),
                maxLines: isShowMore ? 3 : null,
                overflow: TextOverflow.fade,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isShowMore = !isShowMore;
                    });
                  },
                  child: Text(
                    isShowMore ? "Show more" : "Show less",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ))
            ],
          ),
        ));
  }
}
