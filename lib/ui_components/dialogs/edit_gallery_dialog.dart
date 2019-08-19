import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/gallery.dart';
import 'package:smartters_studio_admin_ui/utils/constants.dart';

class EditGalleryDialog extends StatefulWidget {
  final Gallery photo;

  EditGalleryDialog({this.photo});

  @override
  _EditGalleryDialogState createState() => _EditGalleryDialogState();
}

class _EditGalleryDialogState extends State<EditGalleryDialog> {
  bool _isLoading = false;
  TextEditingController name;

  @override
  void initState() {
    name = TextEditingController(
        text: widget.photo != null ? widget.photo.name : '');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20.0),
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: Constants.getWidth(context) / 2.5,
              child: widget.photo != null
                  ? Image.asset(widget.photo.name, fit: BoxFit.cover)
                  : Center(
                      child: Text(
                        'Please choose photo',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: RaisedButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                child: Icon(
                  Icons.add_a_photo,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: name,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0)),
          ),
        ),
        _isLoading
            ? CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: Constants.getWidth(context) / 4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: Constants.getWidth(context) / 4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
