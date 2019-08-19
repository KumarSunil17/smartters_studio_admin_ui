import 'package:flutter_web/material.dart';
import 'package:smartters_studio_admin_ui/pojos/subscriber.dart';
import 'package:smartters_studio_admin_ui/utils/api_services.dart';

class SubscriberDataSource extends DataTableSource {
  final List<Subscriber> subcribers;
  int _selectedCount = 0;

  SubscriberDataSource(this.subcribers);

  void _sort<T>(Comparable<T> getField(Subscriber d), bool ascending) {
    subcribers.sort((Subscriber a, Subscriber b) {
      if (!ascending) {
        final Subscriber c = a;
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
    if (index >= subcribers.length) {
      return null;
    }
    final Subscriber contact = subcribers[index];
    return DataRow.byIndex(
      index: index,
      selected: contact.selected,
      onSelectChanged: (bool value) {
        if (contact.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          contact.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text('${contact.email}')),
        DataCell(Text('${contact.ip}')),
        DataCell(Text('${contact.timestamp.toLocal().toIso8601String()}')),
        DataCell(Icon(Icons.email, color: Colors.pink), onTap: () {}),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => subcribers.length;

  @override
  int get selectedRowCount => _selectedCount;

  void _selectAll(bool checked) {
    for (Subscriber sub in subcribers) {
      sub.selected = checked;
    }
    _selectedCount = checked ? subcribers.length : 0;
    notifyListeners();
  }
}

class SubscriberPage extends StatefulWidget {
  @override
  _SubscriberPageState createState() => _SubscriberPageState();
}

class _SubscriberPageState extends State<SubscriberPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending = true;
  SubscriberDataSource _subscriberDataSource;

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void _sort<T>(
      Comparable<T> getField(Subscriber d), int columnIndex, bool ascending) {
    _subscriberDataSource._sort<T>(getField, ascending);
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
        future: getSubscribers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(snapshot.error.toString()),
            ));
          }
          if (snapshot.hasData) {
            SubscriberList s = snapshot.data;
            _subscriberDataSource = SubscriberDataSource(s.data);
            return ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                PaginatedDataTable(
                  onSelectAll: _subscriberDataSource._selectAll,
                  header: Text('Subscribers'),
                  rowsPerPage: _rowsPerPage,
                  onRowsPerPageChanged: (int value) {
                    setState(() {
                      _rowsPerPage = value;
                    });
                  },
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.email,
                          color: Colors.pink,
                        ),
                        onPressed: () {})
                  ],
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  source: _subscriberDataSource,
                  columns: [
                    DataColumn(
                      label: Text('Email'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>((Subscriber d) => d.email, columnIndex,
                              ascending),
                    ),
                    DataColumn(
                      label: Text('IP Address'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Subscriber d) => d.ip, columnIndex, ascending),
                    ),
                    DataColumn(
                      label: Text('Time'),
                      onSort: (int columnIndex, bool ascending) =>
                          _sort<String>(
                              (Subscriber d) =>
                                  d.timestamp.toLocal().toIso8601String(),
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
      ),
    );
  }
}
