import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/project.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';

class ProjectDataSource extends DataTableSource {
  final List<Project> projects;

  ProjectDataSource(this.projects);

  void _sort<T>(Comparable<T> getField(Project d), bool ascending) {
    projects.sort((Project a, Project b) {
      if (!ascending) {
        final Project c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    if (index >= projects.length) {
      return null;
    }
    final Project project = projects[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(project.photo),
            radius: 70.0,
            backgroundColor: Colors.blue,
          ),
        )),
        DataCell(Text(
          '${project.name}',
          textAlign: TextAlign.center,
        )),
        DataCell(Text('${project.description}')),
        DataCell(Text(
          '${project.techUsed}',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700),
        )),
        DataCell(Text('${project.startTime.toIso8601String()}')),
        DataCell(Text('${project.endTime.toIso8601String()}')),
        DataCell(Text('${project.link}'), onTap: () {}),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => projects.length;

  @override
  int get selectedRowCount => 0;
}

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  ProjectDataSource _projectDataSource;

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void _sort<T>(
      Comparable<T> getField(Project d), int columnIndex, bool ascending) {
    _projectDataSource._sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
        future: getProjects(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(snapshot.error.toString()),
            ));
          }
          if (snapshot.hasData) {
            Projects s = snapshot.data;
            _projectDataSource = ProjectDataSource(s.data);
            return ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                PaginatedDataTable(
                  header: Text('Subscribers'),
                  rowsPerPage: _rowsPerPage,
                  onRowsPerPageChanged: (int value) {
                    setState(() {
                      _rowsPerPage = value;
                    });
                  },
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  source: _projectDataSource,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Photo',
                        textAlign: TextAlign.center,
                      ),
//                      onSort: (int columnIndex, bool ascending) =>
//                          _sort<String>((Project d) => d.name, columnIndex,
//                              ascending),
                    ),
                    DataColumn(
                      label: Text(
                        'Name',
                        textAlign: TextAlign.center,
                      ),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Project d) => d.name, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: Text('Description'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>((Project d) => d.description,
                              columnIndex, ascending),
                    ),
                    DataColumn(
                      label: Text(
                        'Technology used',
                        textAlign: TextAlign.center,
                      ),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>((Project d) => d.techUsed, columnIndex,
                              ascending),
                    ),
                    DataColumn(
                      label: Text('Start time'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Project d) => d.startTime.toIso8601String(),
                              columnIndex,
                              ascending),
                    ),
                    DataColumn(
                      label: Text('End time'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Project d) => d.endTime.toIso8601String(),
                              columnIndex,
                              ascending),
                    ),
                    DataColumn(
                      label: Text('link'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Project d) => d.link, columnIndex, ascending),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
