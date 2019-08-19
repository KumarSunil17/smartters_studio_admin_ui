import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/team.dart';
import 'package:smartters_studio_admin_ui/ui_components/dialogs/edit_team_member.dart';
import 'package:smartters_studio_admin_ui/ui_components/radial_menu.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';

class TeamItem extends StatelessWidget {
  final TeamMember member;

  TeamItem({@required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RadialMenu(
            member: member,
            onDelete: () {},
            onEdit: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EditTeamDialog(member: member);
                  });
            },
          ),
        ],
      ),
    );
  }
}

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
          future: getTeamMembers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              _scaffoldKey.currentState.showSnackBar(
                  SnackBar(content: Text(snapshot.error.toString())));
            }
            if (snapshot.hasData) {
              Teams teams = snapshot.data;
              return SafeArea(
                top: false,
                bottom: false,
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 1
                        : 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 1
                        : 1.3,
                  ),
                  itemBuilder: (context, position) {
                    return TeamItem(member: teams.data[position]);
                  },
                  itemCount: teams.data.length,
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add member'),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return EditTeamDialog();
              });
        },
        tooltip: 'Add a new team member',
      ),
    );
  }
}
