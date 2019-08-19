import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/blog.dart';
import 'package:smartters_studio_admin_ui/ui_components/dialogs/edit_blog_dialog.dart';
import 'package:smartters_studio_admin_ui/ui_components/viewers/blog_viewer.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';
import 'package:smartters_studio_admin_ui/utils/constants.dart';

class BlogItem extends StatelessWidget {
  final Blog blog;
  BlogItem({@required this.blog});

  void showBlog(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text(blog.title),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => EditBlogDialog(
                            blog: blog,
                          ));
                },
                icon: Icon(Icons.edit),
                tooltip: 'Edit blog',
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
                tooltip: 'Delete blog',
              ),
            ],
          ),
          body: MediaQuery.of(context).orientation == Orientation.portrait
              ? Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: BlogViewer(
                        blog: blog,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: Constants.getHeight(context) / 5,
                          maxHeight: Constants.getHeight(context) / 3,
                        ),
                        width: Constants.getWidth(context),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white70,
                            Colors.blue.withOpacity(0.4)
                          ],
                        )),
                        alignment: Alignment.center,
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                              child: Text(
                                blog.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                blog.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                              child: Text(
                                blog.timestamp.toIso8601String(),
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  blog.blogLink,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: BlogViewer(
                        blog: blog,
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      top: 0.0,
                      right: 0.0,
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: Constants.getWidth(context) / 4,
                          maxWidth: Constants.getWidth(context) / 2,
                        ),
                        height: Constants.getHeight(context),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white70,
                            Colors.blue.withOpacity(0.4)
                          ],
                        )),
                        alignment: Alignment.center,
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                              child: Text(
                                blog.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                blog.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                              child: Text(
                                blog.timestamp.toIso8601String(),
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  blog.blogLink,
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showBlog(context),
      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
      highlightColor: Colors.transparent,
      child: Hero(
        key: Key(blog.id.toString()),
        tag: blog.id,
        child: Card(
          elevation: 3.0,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width / 5
                        : MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Ink.image(
                        image: NetworkImage(blog.photo),
                        fit: BoxFit.cover,
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          blog.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subhead,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // three line description
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          blog.description,
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                      Text(blog.timestamp.toIso8601String()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
          future: getBlogs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              _scaffoldKey.currentState.showSnackBar(
                  SnackBar(content: Text(snapshot.error.toString())));
            }
            if (snapshot.hasData) {
              Blogs blogs = snapshot.data;
              return SafeArea(
                top: false,
                bottom: false,
                child: GridView.builder(
                  padding: EdgeInsets.all(15.0),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 3,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 1
                        : 1.5,
                  ),
                  itemBuilder: (context, position) {
                    return BlogItem(blog: blogs.data[position]);
                  },
                  itemCount: blogs.data.length,
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add blog'),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return EditBlogDialog();
              });
        },
        tooltip: 'Add blog',
      ),
    );
  }
}
