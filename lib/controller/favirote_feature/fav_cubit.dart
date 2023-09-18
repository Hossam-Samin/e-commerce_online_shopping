import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/favirote_model/favirote_model.dart';
import 'db_helper.dart';
import 'fav_state.dart';

class FaviroteCubit extends Cubit<FaviroteState> {
  FaviroteCubit() : super(InitFav());

  static FaviroteCubit get(context) => BlocProvider.of(context);

  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  int _incAndDecCounter = 0;
  int get incAndDecCounter => _incAndDecCounter;

  late Future<List<FaviroteModel>> _cart;
  Future<List<FaviroteModel>> get cart => _cart;
  Future<List<FaviroteModel>> getData() async {
    _cart = dbHelper.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('counter', _counter);
    preferences.setDouble('totalPrice', _totalPrice);
    preferences.setInt('incAndDecCounter', _incAndDecCounter);
    emit(SetPref());
  }

  void _getPrefItems() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('counter') ?? 0;
    _totalPrice = preferences.getDouble('totalPrice') ?? 0.0;

    _incAndDecCounter = preferences.getInt('incAndDecCounter') ?? 0;
    emit(Getpref());
  }

  // Counter
  void addCounter() {
    _counter++;
    _setPrefItems();
    emit(state);
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    emit(state);
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    emit(state);
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;

    _setPrefItems();
    emit(state);
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addIncAndDecCounter() {
    _incAndDecCounter++;
    _setPrefItems();
    emit(state);
  }

  void removeIncAndDecCounter() {
    _incAndDecCounter--;
    _setPrefItems();
    emit(state);
  }

  int getIncAndDecCounter() {
    _getPrefItems();
    return _incAndDecCounter;
  }
}
