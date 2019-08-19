import 'dart:html' as html;
import 'dart:math';

import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/team.dart';
import 'package:vector_math/vector_math.dart' show radians;

class RadialMenu extends StatefulWidget {
  final Function onEdit, onDelete;
  final TeamMember member;

  RadialMenu({this.onEdit, this.onDelete, this.member});

  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(
      controller: controller,
      onEdit: widget.onEdit,
      onDelete: widget.onDelete,
      team: widget.member,
    );
  }
}

// The Animation
class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;
  final TeamMember team;
  final onEdit;
  final onDelete;

  RadialAnimation(
      {Key key, this.controller, this.team, this.onEdit, this.onDelete})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Transform.rotate(
            angle: radians(rotation.value),
            child: Stack(alignment: Alignment.center, children: [
              //menu
              _buildMenu(60,
                  color: Theme.of(context).accentColor,
                  icon: Icons.delete,
                  onPressed: onDelete),
              _buildMenu(115,
                  color: Theme.of(context).accentColor,
                  icon: Icons.edit,
                  onPressed: onEdit),

              //links
              _buildButton(0,
                  color: CupertinoColors.darkBackgroundGray,
                  logo: 'icon/facebook.png', onPressed: () {
                html.window.open(team.fbLink, 'Facebook');
              }),
              _buildButton(175.284,
                  color: CupertinoColors.darkBackgroundGray,
                  logo: 'icon/instagram.png',
                  onPressed: () {}),
              _buildButton(218.712,
                  color: CupertinoColors.darkBackgroundGray,
                  logo: 'icon/twitter.png',
                  onPressed: () {}),
              _buildButton(265.14,
                  color: CupertinoColors.darkBackgroundGray,
                  logo: 'icon/linkedIn.png',
                  onPressed: () {}),
              _buildButton(311.568,
                  color: CupertinoColors.darkBackgroundGray,
                  logo: 'icon/github.png',
                  onPressed: () {}),
              Transform.scale(
                scale: scale.value -
                    1.5, // subtract the beginning value to run the opposite animation
                child: FloatingActionButton(
                    child: Icon(Icons.close),
                    onPressed: _close,
                    backgroundColor: Colors.red),
              ),
              Transform.scale(
                scale: scale.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Material(
                      type: MaterialType.circle,
                      elevation: 6.0,
                      color: Colors.blue,
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        child: InkWell(
                          onTap: _open,
                          splashColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.11),
                          highlightColor: Colors.transparent,
                          child: Image.network(
                            team.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          team.name,
                          style: Theme.of(context).textTheme.headline.copyWith(
                              fontSize: 18.0,
                              color: Theme.of(context).accentColor),
                        ),
                        Text(team.designation,
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                  fontSize: 14.0,
                                )),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }

  _buildButton(double angle, {Color color, String logo, Function onPressed}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Image.asset(
              logo,
              alignment: Alignment.center,
            ),
            backgroundColor: color,
            onPressed: () {
              onPressed();
              _close();
            },
            elevation: 0));
  }

  _buildMenu(double angle, {Color color, IconData icon, onPressed}) {
    final double rad = radians(angle);
    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            backgroundColor: color,
            onPressed: () {
              onPressed();
              _close();
            },
            elevation: 0));
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
