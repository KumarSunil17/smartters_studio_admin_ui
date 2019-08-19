import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: FutureBuilder(
            future: getStatistics(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(snapshot.error.toString()),
                ));
              }
              return Wrap(
                spacing: 50.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                children: <Widget>[
                  Wrap(
                    spacing: 15.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        "Blogs",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                      Material(
                        type: MaterialType.circle,
                        elevation: 6.0,
                        color: Theme.of(context).primaryColor,
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: snapshot.hasData
                                ? Text(
                                    '${snapshot.data.blog}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: Colors.white),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 15.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        "Team members",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                      Material(
                        type: MaterialType.circle,
                        elevation: 6.0,
                        color: Theme.of(context).primaryColor,
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: snapshot.hasData
                                ? Text(
                                    '${snapshot.data.member}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: Colors.white),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 15.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        "Subscribers",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                      Material(
                        type: MaterialType.circle,
                        elevation: 6.0,
                        color: Theme.of(context).primaryColor,
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: snapshot.hasData
                                ? Text(
                                    '${snapshot.data.subscriber}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: Colors.white),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 15.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        "Contact entries",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Theme.of(context).accentColor),
                      ),
                      Material(
                        type: MaterialType.circle,
                        elevation: 6.0,
                        color: Theme.of(context).primaryColor,
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12),
                            highlightColor: Colors.transparent,
                            child: snapshot.hasData
                                ? Text(
                                    '${snapshot.data.contact}',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .copyWith(color: Colors.white),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
