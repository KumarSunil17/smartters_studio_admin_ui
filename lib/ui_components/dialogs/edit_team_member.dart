import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/team.dart';
import 'package:smartters_studio_admin_ui/utils/constants.dart';

class EditTeamDialog extends StatefulWidget {
  final TeamMember member;

  EditTeamDialog({this.member});

  @override
  _EditTeamDialogState createState() => _EditTeamDialogState();
}

class _EditTeamDialogState extends State<EditTeamDialog> {
  TextEditingController name,
      designation,
      fbLink,
      instaLink,
      linkedinLink,
      githubLink;

  bool _isLoading = false;

  _inputPicture() {
    return Material(
      color: Colors.transparent,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: Constants.getWidth(context) / 2.5,
          child: widget.member != null
              ? Image.network(widget.member.photo, fit: BoxFit.cover)
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
    );
  }

  @override
  void initState() {
    super.initState();
    name = TextEditingController(
        text: widget.member != null ? widget.member.name : '');
    designation = TextEditingController(
        text: widget.member != null ? widget.member.designation : '');
    fbLink = TextEditingController(
        text: widget.member != null ? widget.member.fbLink : '');
    instaLink = TextEditingController(
        text: widget.member != null ? widget.member.instaLink : '');
    linkedinLink = TextEditingController(
        text: widget.member != null ? widget.member.linkedinLink : '');
    githubLink = TextEditingController(
        text: widget.member != null ? widget.member.githubLink : '');
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    designation.dispose();
    fbLink.dispose();
    instaLink.dispose();
    linkedinLink.dispose();
    githubLink.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20.0),
      children: <Widget>[
        _inputPicture(),
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
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: designation,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Designation',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Facebook link',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Instagram link',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Twitter link',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Linkedln link',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Github link',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
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
                            onTap: () {},
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
