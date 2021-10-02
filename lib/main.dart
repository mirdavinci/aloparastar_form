import 'package:crm_alo_parastar/providers/authentication.dart';
import 'package:crm_alo_parastar/providers/client.dart';
import 'package:crm_alo_parastar/views/crm_form.dart';
import 'package:crm_alo_parastar/views/main_page.dart';
import 'package:crm_alo_parastar/views/new_client.dart';
import 'package:crm_alo_parastar/views/signup.dart';
import 'package:crm_alo_parastar/widgets/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'helpers/custom_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
       providers: [
         ChangeNotifierProvider(create:(ctx) => Authentication()),
         ChangeNotifierProvider(create: (ctx) => ClientForm())
       ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary:Colors.lightGreen.shade400, secondary:  Colors.green.shade800),

          // pageTransitionsTheme: PageTransitionsTheme(builders: {
          //   ///builders => ye map migire. ye map az system amelaaye mokhtalef
          //   TargetPlatform.android : CustomPageTransitionBuilder(),
          //   TargetPlatform.iOS : CustomPageTransitionBuilder(),

          // }),


        ),
            home:NewClient() ,
       ),
    );
  }
}
