import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pages/home_page.dart';
import 'package:smartters_studio_admin_ui/utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _obscureText = true;
  TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Container(
            color: Theme.of(context).primaryColor,
          )),
          Positioned(
              top: Constants.getHeight(context) / 4.5,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.white,
              )),
          Positioned.fill(
            child: Center(
              child: FadeTransition(
                opacity: animation,
                child: SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  contentPadding: EdgeInsets.all(40.0),
                  titlePadding: EdgeInsets.all(30.0),
                  title: Text(
                    'Admin login',
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[
                    Container(
                      width: Constants.getWidth(context) / 2.5,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontWeight: FontWeight.w700),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: _obscureText,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            dragStartBehavior: DragStartBehavior.down,
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: _obscureText
                                  ? 'show password'
                                  : 'hide password',
                            ),
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontWeight: FontWeight.w700),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20.0)),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()))
                                  .then((e) {});
//                              String email =
//                                  _emailController.text.toString().trim();
//                              String password =
//                                  _passwordController.text.toString().trim();
//                              if (email.isEmpty) {
//                                Constants.showSnackbar(
//                                    _scaffoldKey, 'Email is empty');
//                              } else if (password.isEmpty) {
//                                Constants.showSnackbar(
//                                    _scaffoldKey, 'Password is empty');
//                              } else {
//
//                              }
                            },
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
