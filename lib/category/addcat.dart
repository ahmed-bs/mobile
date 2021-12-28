import 'package:flutter/material.dart';
import 'package:mobile/models/categories.dart';
import 'package:mobile/service/api.dart';



class Addcat extends StatefulWidget {
  Addcat();

  @override
  _AddcatState createState() => _AddcatState();
}

class _AddcatState extends State<Addcat> {
  _AddcatState();

  final ApiServiceCat api = ApiServiceCat();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Catagory'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
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
                              Text('category'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'category',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter category';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
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
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createCase(Categories(nomcat: _nameController.text, id: ''));

                                    Navigator.pop(context) ;
                                  }
                                },
                                child: Text('Save', style: TextStyle(color: Colors.white)),
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
      ),
    );
  }
}