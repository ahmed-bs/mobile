
class Utilisateur {


  String  _nom;
 String  _prenom;
  String  _adresse;
  String  _telephone;
String  _email;


  //constarctor

  Utilisateur(this._nom,this._prenom, this._adresse,this._telephone, this._email);




  set nom(String value) {
     _nom = value;
  }

  set prenom(String value) {
     _prenom = value;
  }

  set adresse(String value) {
     _adresse = value;
  }

  set telephone(String value) {
    _telephone = value;
  }

  set email(String value) {
    _email = value;
  }






  // getters
  String get nom => _nom;

  String get prenom => _prenom;

  String get adresse => _adresse;

  String get telephone => _telephone;

  String get email => _email;




}