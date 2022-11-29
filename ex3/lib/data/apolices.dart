import '../apolice.dart';
import '../exceptions/already_existing_item_exception.dart';
import '../exceptions/doesnt_exist_on_list_exception.dart';

class Apolices {
  List<Apolice> _apolices = [];

  List<Apolice> get list => _apolices;

  void add(Apolice apolice) {
    if (_apolices.any((a) => a.nomeSeguradora == apolice.nomeSeguradora)) {
      throw AlreadyExistingItemException(
          'data/apolices[_apolices list]', apolice.nomeSeguradora.toString());
    }
    // insert the student
    _apolices.add(apolice);
  }

  void delete(Apolice apolice) {
    int index =
        _apolices.indexWhere((s) => s.nomeSeguradora == apolice.nomeSeguradora);

    if (index == -1) {
      print(index);
      throw DoesntExistOnListException(
          'data/apolices[_apolices list]', apolice.nomeSeguradora.toString());
    }
    _apolices.removeAt(index);
  }
}
