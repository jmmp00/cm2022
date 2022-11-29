class DoesntExistOnListException implements Exception {
  final String _resource;
  final String _item;

  DoesntExistOnListException(this._resource, this._item);
  String errorMessage() => 'Item -$_item- doesnt exists on $_resource.';
}
