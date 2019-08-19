import 'dart:html';

import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/blog.dart';
import 'package:smartters_studio_admin_ui/utils/constants.dart';

class EditBlogDialog extends StatefulWidget {
  final Blog blog;

  EditBlogDialog({this.blog});

  @override
  _EditBlogDialogState createState() => _EditBlogDialogState();
}

class _EditBlogDialogState extends State<EditBlogDialog> {
  bool _isLoading = false;
  TextEditingController title, description, link;

  @override
  void initState() {
    super.initState();
    title = TextEditingController(
        text: widget.blog != null ? widget.blog.title : '');
    description = TextEditingController(
        text: widget.blog != null ? widget.blog.description : '');
    link = TextEditingController(
        text: widget.blog != null ? widget.blog.blogLink : '');
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
    link.dispose();
  }

  _inputPicture() {
    return Material(
      color: Colors.transparent,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Container(
          width: MediaQuery.of(this.context).size.width,
          height: Constants.getWidth(this.context) / 2.5,
          child: widget.blog != null
              ? Image.network(widget.blog.photo, fit: BoxFit.cover)
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
            onPressed: () {
              InputElement uploadInput = FileUploadInputElement();
              uploadInput.click();

              uploadInput.onChange.listen((e) {
                // read file content as dataURL
                final files = uploadInput.files;
                if (files.length == 1) {
                  final file = files[0];
                  final reader = FileReader();

                  reader.onLoadEnd.listen((e) {
                    print("upload" + file.name);
                    //_handleResult(reader.result);
                  });
                  reader.readAsDataUrl(file);
                }
              });
//              var input = querySelector("#file_input");
//              input.click();
//              input.onChange.listen((e) {
//
//                showDialog(
//                    context: context,
//                    builder: (context) {
//                      return AlertDialog(
//                        title: Text('File input Message : ' + ),
//                      );
//                    });
//              });
            },
            color: Theme.of(this.context).primaryColor.withOpacity(0.7),
            child: Icon(
              Icons.add_a_photo,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }

//  Upload(File imageFile) async {
//    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//    var length = await imageFile.size;
//
//    var uri = Uri.parse("");
//
//    var request = http.MultipartRequest("POST", uri);
//    var multipartFile = http.MultipartFile('file', stream, length,
//        filename: basename(imageFile.relativePath));
//    //contentType: new MediaType('image', 'png'));
//
//    request.files.add(multipartFile);
//    var response = await request.send();
//    print(response.statusCode);
//    response.stream.transform(utf8.decoder).listen((value) {
//      print(value);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20.0),
      children: <Widget>[
        _inputPicture(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: title,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: description,
            maxLines: 3,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            keyboardType: TextInputType.url,
            controller: link,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Link',
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
            ),
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

//                                  widget.blog.title =
//                                      title.text.toString().trim();
//                                  widget.blog.description =
//                                      description.text.toString().trim();
//                                  widget.blog.link =
//                                      link.text.toString().trim();
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
