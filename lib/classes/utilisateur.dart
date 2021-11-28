
class utilisateur {


  String  _nom;
 String  _prenom;
  String  _adresse;
  String  _telephone;
String  _email;


  //constarctor

  Transacition(this._nom,this._prenom, this._adresse,this._telephone, this_email);




  set nom(int value) {
     _nom = value;
  }

  set prenom(String value) {
     _prenom = value;
  }

  set adresse(String value) {
     _adresse = value;
  }

  set telephone(int value) {
    _telephone = value;
  }

  set email(String value) {
    _email = value;
  }






  // getters
  String get nom => _nom;

  int get prenom => _prenom;

  String get adresse => _adresse;

  String get telephone => _telephone;

  int get email => _email;




}