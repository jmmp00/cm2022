import 'package:ex3/seguradora.dart';

import '../exceptions/already_existing_item_exception.dart';
import '../exceptions/doesnt_exist_on_list_exception.dart';

class Seguradoras {
  List<Seguradora> _seguradoras = [];

  List<Seguradora> get list => _seguradoras;

  void add(Seguradora seguradora) {
    if (_seguradoras.any((s) => s.id == seguradora.id)) {
      throw AlreadyExistingItemException(
          'data/seguradoras[_seguradoras list]', seguradora.id.toString());
    }
    // insert the student
    _seguradoras.add(seguradora);
    print(_seguradoras);
  }

  void delete(Seguradora seguradora) {
    _seguradoras.forEach((e) {
      print(e.id);
    });
    int index = _seguradoras.indexWhere((s) => s.id == seguradora.id);

    if (index == -1) {
      print(index);
      throw DoesntExistOnListException(
          'data/seguradoras[_seguradoras list]', seguradora.id.toString());
    }
    _seguradoras.removeAt(index);
  }
}
