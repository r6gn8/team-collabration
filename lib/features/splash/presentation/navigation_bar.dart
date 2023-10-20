// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:the_project_flutter/features/Auth/presentation/manger/cubit/todo_cubit.dart';
// import 'package:the_project_flutter/features/Auth/presentation/manger/cubit/todo_state.dart';
//
// class NavigationBar extends StatelessWidget {
//   const NavigationBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LayoutCubit,LayouStates>(
//       listener:(context,state) {
//
//       },
//       builder: (context,state)
//         {
//           return Scaffold(
//               bottomNavigationBar: BottomNavigationBar(
//                 currentIndex: 0,
//                 items:
//                 const
//                 [
//                   BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
//                   BottomNavigationBarItem(icon: Icon(Icons.favorite),label:"Favorites"),
//                   BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"Cart"),
//                   BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
//
//                 ],
//               )
//           );
//         }
//
//     );
//   }
// }
