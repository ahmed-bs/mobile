import 'package:flutter/material.dart';
import 'package:mobile/category/afiichecat.dart';
import 'package:mobile/category/editcat.dart';
import 'package:mobile/models/categories.dart';
import 'package:mobile/service/api.dart';



class Detailscat extends StatefulWidget {
  Detailscat(this.categories);

  final Categories categories;

  @override
  _DetailscatState createState() => _DetailscatState();
}

class _DetailscatState extends State<Detailscat> {
  _DetailscatState();

  final ApiServiceCat api = ApiServiceCat();

  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Name:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.categories.nomcat, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                      
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Update Date:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
      
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              splashColor: Colors.red,
                              onPressed: () {
                                _navigateToEditScreen(context, widget.categories);
                              },
                              child: Text('Edit', style: TextStyle(color: Colors.white)),
                              color: Colors.blue,
                            ),
                            RaisedButton(
                              splashColor: Colors.red,
                              onPressed: () {
                                _confirmDialog();
                              },
                              child: Text('Delete', style: TextStyle(color: Colors.white)),
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              )
          ),
        ),
      ),
    );
  }

  _navigateToEditScreen (BuildContext context, Categories categories) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Editcat(categories)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                api.deleteCase(widget.categories.id);
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     AfficheCat(title: 'cat',)));
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}