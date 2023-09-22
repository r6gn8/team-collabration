import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_flutter/core/utils/size_config.dart';
import 'package:project_flutter/features/on%20Boarding/presentation/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) :super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  AnimationController? animationController;
  Animation<double>?  fadingAnimation;
  @override

  void initState(){
    super.initState();
    animationController=
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    fadingAnimation = Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();

  }

  @override
  void dispose() {
    animationController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          FadeTransition(
            opacity: fadingAnimation!,
            child: Text(
              'Fruit Market',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 51,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            ),
          ),
          //Spacer(),

          Image.asset('assets/images/splash_view_image.png'),
          // Adobe XD layer: 'mix_fruit_png_11' (shape)
        ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 3),(){
      Get.to(()=>OnBoardingView(), transition: Transition.fade);
    });
  }
}

