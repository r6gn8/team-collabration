import 'package:get/get.dart';

class MyLocale implements Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    "ar" : {

      "1" : "الصفحه الريسيه",
      "2" : "الدفع",
      "3" : "الورد",
      "4" : "المنتجات",
      "5" : "خروج",
      "6" : "الاسم",
      "7" : "لايميل",
      "8" : "كلمة السر",
      "9" : "نسيت كلمة السر",
      "10" : "تسجيل دخول",
      "11" : "ليس لدي حساب ",
      "12" : "انضم الان",
      "13" : "اشتراك",
      "14" : "انا عضو",
      "15" : "تسجيل الدخول",

    },
    "en" : {
      "1" : "home",
      "2" : "paying off",
      "3" : "flower",
      "4" : "products",
      "5" : "Logout",
      "6" : "Name",
      "7" : "Email",
      "8" : "Password",
      "9" : "Forget Password",
      "10" : "Log in",
      "11" : " Not a member",
      "12" : "Join now",
      "13" : "Sign Up",
      "14" : "I am member?Sign in",
      "15" : "Sign in",
    },
  };
}