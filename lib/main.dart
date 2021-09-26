import 'package:crm_alo_parastar/providers/client.dart';
import 'package:crm_alo_parastar/views/crm_form.dart';
import 'package:crm_alo_parastar/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider(
      create: (ctx)=> ClientForm(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary:Colors.blue.withOpacity(0.6), secondary: Colors.white54.withOpacity(0.6)),

        ),
            home:Signup() ,
       ),
    );
  }
}
