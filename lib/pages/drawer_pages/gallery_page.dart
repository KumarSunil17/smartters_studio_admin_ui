import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/gallery.dart';
import 'package:smartters_studio_admin_ui/ui_components/dialogs/edit_gallery_dialog.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';

class GalleryItem extends StatelessWidget {
  final Gallery gallery;

  GalleryItem(this.gallery);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GestureDetector(
        onTap: () {},
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(gallery.name),
          ),
          trailing: Wrap(
            spacing: 5.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              IconButton(
                tooltip: 'Edit photo',
                icon: Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EditGalleryDialog(
                          photo: gallery,
                        );
                      });
                },
                color: Colors.white,
              ),
              IconButton(
                tooltip: 'Delete photo',
                icon: Icon(Icons.delete),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      child: Hero(
        key: Key(gallery.id),
        tag: gallery.id,
        child: Image.asset(
          gallery.name,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<Gallery> photos = [
    Gallery(
      name: 'images/background.jpeg',
      id: '12345',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12346',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12347',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12348',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12349',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12351',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12352',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '123453',
    ),
    Gallery(
      name: 'images/background.jpeg',
      id: '12355',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPhotos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: EdgeInsets.all(10.0),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 1
                          : 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 1
                          : 1.3,
                ),
                itemBuilder: (context, position) {
                  return GalleryItem(photos[position]);
                },
                itemCount: photos.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add photo'),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return EditGalleryDialog();
              });
        },
        tooltip: 'Add a new photo',
      ),
    );
  }
}
