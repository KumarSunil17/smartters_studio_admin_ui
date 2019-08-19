import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smartters\' Studio',
        theme: ThemeData(
          fontFamily: 'Comic Sans MS',
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF2F2FA2),
          primaryColorDark: Color(0xFF242582),
          primaryColorLight: Color(0xFF553D67),
          accentColor: Color(0xFFF64C72),
        ),
        home: LoginPage());
    //MyHomePage(), Scaffold(body: SizedBox.expand(child: RadialMenu())),
    //
  }
}
