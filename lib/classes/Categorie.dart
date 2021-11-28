class Categorie {


  int _idcat;
  String _nom;
String _description;


  //constarctor

  Categorie(this._idcat, this._nom, this._description);




  set idcat(int value) {
    _idcat = value;
  }

  set nom(String value) {
    _nom = value;
  }

 set description(String value) {
    _description = value;
  }






  // getters
  String get description => _description;

  String get nom => _nom;

  int get idcat => _idcat;




}