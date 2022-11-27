import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'title': 'title',
          'changelang': 'Change Language',
          'Full Name': 'Full Name',
          'Email': 'Email',
          'Password': 'Password',
          'Enter your Email': 'Enter your Email',
          'Enter valid email': 'Enter valid email',
          'Enter your Password': 'Enter your Password',
          'Hello': 'Hello',
          'Welcome To Aman': 'Welcome To Aman',
          'Sign In': 'Sign In',
          'Register': 'Register'
        },
        //arabic LANGUAGE

        'ar_EG': {
          'title': 'عنوان',
          'changelang': 'تغير اللغة',
          'Full Name': 'الاسم الكامل',
          'Email': 'البريد الالكتروني',
          'Password': 'كلمه المرور',
          'Enter your Email': 'ادخل البريد الالكتروني',
          'Enter valid email': 'ادخل بريد الكتروني صحيح',
          'Enter your Password': 'ادخل كلمة المرور',
          'Hello': 'أهلا',
          'Welcome To Aman': 'مرحبا بك في أمان',
          'Sign In': 'تسجيل الدخول',
          'Register': 'أنشاء حساب'
        },
      };
}
