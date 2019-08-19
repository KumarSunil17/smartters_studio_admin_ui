import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/contact.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';

class ContactDataSource extends DataTableSource {
  final List<Contact> _contacts;

  ContactDataSource(this._contacts);

  void _sort<T>(Comparable<T> getField(Contact d), bool ascending) {
    _contacts.sort((Contact a, Contact b) {
      if (!ascending) {
        final Contact c = a;
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
    if (index >= _contacts.length) {
      return null;
    }
    final Contact contact = _contacts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${contact.name}')),
        DataCell(Text('${contact.subject}')),
        DataCell(Text('${contact.message}')),
        DataCell(Text('${contact.ip}')),
        DataCell(Text('${contact.email}')),
        DataCell(Text('${contact.timestamp}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _contacts.length;

  @override
  int get selectedRowCount => 0;
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  ContactDataSource _contactDataSource;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void _sort<T>(
      Comparable<T> getField(Contact d), int columnIndex, bool ascending) {
    _contactDataSource._sort<T>(getField, ascending);
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
          future: getContacts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text(snapshot.error.toString()),
              ));
            }
            if (snapshot.hasData) {
              ContactList _contacts = snapshot.data;
              _contactDataSource = ContactDataSource(_contacts.data);

              return ListView(
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  PaginatedDataTable(
                    header: Text('Contacts entries'),
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (int value) {
                      setState(() {
                        _rowsPerPage = value;
                      });
                    },
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    source: _contactDataSource,
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text('Name'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (Contact d) => d.name, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: Text('Subject'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>((Contact d) => d.subject, columnIndex,
                                ascending),
                      ),
                      DataColumn(
                        label: Text('Message'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>((Contact d) => d.message, columnIndex,
                                ascending),
                      ),
                      DataColumn(
                        label: Text('IP'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (Contact d) => d.ip, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: Text('Email'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (Contact d) => d.email, columnIndex, ascending),
                      ),
                      DataColumn(
                        label: Text('Time'),
                        onSort: (int columnIndex, bool ascending) =>
                            _sort<String>(
                                (Contact d) => d.timestamp.toIso8601String(),
                                columnIndex,
                                ascending),
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
        ));
  }
}
