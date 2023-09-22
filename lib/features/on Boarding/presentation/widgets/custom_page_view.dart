import 'package:flutter/cupertino.dart';
import 'package:project_flutter/features/on%20Boarding/presentation/widgets/page_view_item.dart';
//import 'package:flutter/material.dart';
//import 'package:project_1/features/on%20Boarding/presentation/widgets/page_view_item.dart';



class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key,@required this.pageController}) : super(key: key);
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:pageController ,
      children: [
       PageViewItem(
         image: 'assets/images/onboarding1.png',
         title: 'Shopping',
         subtitle: 'Explore top organic fruits & grab them',
       ),
        PageViewItem(
          image: 'assets/images/onboarding2.png',
          title: 'Delivery on the way',
          subtitle: 'Get your order by speed delivery',
        ),
        PageViewItem(
          image: 'assets/images/onboarding3.png',
          title: 'Delivery Arrived',
          subtitle: 'Order is arrived at your Place',
        ),
      ]
    );



  }
}
