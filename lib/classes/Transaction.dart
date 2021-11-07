

class Transacition {


  int _idtrans;
  String _heure;
  String _day;
  int _montant;
String _description;


  //constarctor

  Transacition(this._idtrans, this._heure, this._day, this._montant, this._description);




  set idtrans(int value) {
    _idtrans = value;
  }

  set heure(String value) {
    _heure = value;
  }

  set day(String value) {
    _day = value;
  }

  set montant(int value) {
    _montant = value;
  }

  set description(String value) {
    _description = value;
  }






  // getters
  String get description => _description;

  int get montant => _montant;

  String get day => _day;

  String get heure => _heure;

  int get idtrans => _idtrans;




}