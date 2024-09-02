import 'bloc_base.dart';

class BlocList<T extends dynamic> extends BlocBase<List<T>> {
  BlocList(super.initialData);

  T? getAt(int index) {
    try {
      return super.data[index];
    } catch (e) {
      return null;
    }
  }

  void add(T value) {
    super.data.add(value);
    updateWidget;
  }

  void addAll(List<T> value) {
    super.data.addAll(value);
    updateWidget;
  }

  void insert(int index, T value) {
    super.data.insert(index, value);
    updateWidget;
  }

  bool delete(T value) {
    if (value == null) return false;

    final index = _getIndex(value);
    if (index == -1) return false;
    return deleteAt(index);
  }

  bool deleteAt(int index) {
    try {
      super.data.removeAt(index);
    } catch (e) {
      return false;
    }
    return true;
  }

  bool updateAt(int index, T value) {
    try {
      super.data[index] = value;
    } catch (e) {
      return false;
    }
    return true;
  }

  bool isExist(T value) {
    return _getIndex(value) != -1;
  }

  int _getIndex(T value) {
    final index = super.data.indexWhere((element) => element == value);
    return index;
  }

  void clear() => super.data.clear();
}
