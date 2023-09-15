import 'package:flutter/material.dart';
import 'package:mirror_wall/controller/webPage_controller.dart';
import 'package:mirror_wall/utils/color_utils.dart';
import 'package:mirror_wall/utils/route_utils.dart';
import 'package:mirror_wall/views/screens/bookMarkListPage.dart';
import 'package:mirror_wall/views/screens/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WebPageController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: MyColor.theme1,
      ),
      initialRoute: MyRoute.homePage,
      routes: {
        MyRoute.homePage: (context) => const HomePage(),
        MyRoute.bookMarkPage: (context) => const BookMarkPage(),
      },
    );
  }
}
