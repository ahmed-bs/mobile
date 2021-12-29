import 'package:flutter/material.dart';
import 'package:mobile/models/transaction.dart';
import 'package:mobile/service/api_trans.dart';

enum Type { revenu, depence,transfert }

class Edittrans extends StatefulWidget {
  Edittrans(this.transaction);

  final Transaction transaction;

  @override
  _EdittransState createState() => _EdittransState();
}

class _EdittransState extends State<Edittrans> {
  _EdittransState();

  final ApiTrans api = ApiTrans();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  String day = '';
  final _montantController = TextEditingController();
  final _descriptionsController = TextEditingController();
//  final _typeController = TextEditingController();
  String type = 'revenu';
  Type _type = Type.revenu;
 
  

  @override
  void initState() {
    id = widget.transaction.id;
    _montantController.text = widget.transaction.montant;
   _descriptionsController.text = widget.transaction.descriptions;
  //_typeController.text = widget.transaction.type;
type = widget.transaction.type;
    if(widget.transaction.type == 'revenu') {
      _type = Type.revenu;
    } else if(widget.transaction.type == 'depence') {
      _type = Type.depence;
    } else {
      _type = Type.transfert;
    }
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit transaction'),
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
                              Text('montant'),
                              TextFormField(
                                controller: _montantController,
                                decoration: const InputDecoration(
                                  hintText: 'montant',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter montant ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ), Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('descriptions'),
                              TextFormField(
                                controller: _descriptionsController,
                                decoration: const InputDecoration(
                                  hintText: 'descriptions',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter descriptions';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
              /* Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('type'),
                              TextFormField(
                                controller: _typeController,
                                decoration: const InputDecoration(
                                  hintText: 'type',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter type';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                         */
                         Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('type'),
                              ListTile(
                                title: const Text('revenu'),
                                  leading: Radio(
                                  value: Type.revenu,
                                  groupValue: _type,
                                  onChanged: ( value) {
                                    setState(() {
                                      _type = Type.revenu;
                                      type = 'revenu';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('depence'),
                               leading: Radio(
                                  value: Type.depence,
                                  groupValue: _type,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = Type.depence;
                                      type = 'depence';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('transfert'),
                                leading: Radio(
                                value  : Type.transfert,
                                  groupValue: _type,
                                  onChanged: (value ) {
                                    setState(() {
                                      _type = Type.transfert;
                                      type = 'transfert';
                                    }
                                    );
                                  },
                                ),
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
                                    api.updateCases(id, Transaction(montant: _montantController.text,type: type ,descriptions: _descriptionsController.text ,day: '', id: ''));

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