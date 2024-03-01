import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:log_in/home.dart';
import 'package:log_in/l10n/l10n.dart';
import 'package:log_in/login.dart';
import 'package:log_in/register.dart';
import 'package:log_in/resetPassword.dart';
import 'package:log_in/auth_firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:log_in/ui_helper.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
      runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  initialRoute: 'login',
      
    
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
       'resetPassword':(context)=> ResetPasswordPage(),
    },

    supportedLocales: L10n.all,
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
  ));
}

  