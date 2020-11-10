import 'package:TamrielTrade/features/home/network/home_repository.dart';
import 'package:TamrielTrade/models/item.dart';
import 'package:TamrielTrade/models/filter_options.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeBloc extends ChangeNotifier {
  final BuildContext _context;
  final PanelController _controller;
  final repository = HomeRepository();

  List<Item> items = List();
  bool isWaiting = false;
  bool isError = false;
  int page = 1;
  String searchValue = "";
  FilterOptions filterOptions;

  HomeBloc(this._context, this._controller);

  void setSearch(String value) {
    searchValue = value;
    notifyListeners();
  }

  void restartSearch() {
    FocusScope.of(_context).unfocus();

    items.clear();
    page = 1;

    search();
  }

  void bottom() {
    if (items.isEmpty || items.length % 10 > 0) return;

    search();
  }

  void filter() {
    FocusScope.of(_context).unfocus();
    _controller.open();
  }

  void setFilterOptions(FilterOptions value) {
    filterOptions = value;
    _controller.close();
    restartSearch();
  }

  void search() async {
    if (isWaiting) return;
    if (searchValue.isEmpty) return;

    isError = false;
    isWaiting = true;
    notifyListeners();

    await repository
        .search(
      searchValue,
      page: page,
      minQuantity: filterOptions != null ? filterOptions.minQuantity : null,
      maxQuantity: filterOptions != null ? filterOptions.maxQuantity : null,
      minPrice: filterOptions != null ? filterOptions.minPrice : null,
      maxPrice: filterOptions != null ? filterOptions.maxPrice : null,
    )
        .then((value) {
      items.addAll(value);
      page++;
    }).catchError((error) {
      if (items.isEmpty) isError = true;
      isWaiting = false;
      notifyListeners();
    });

    isWaiting = false;
    notifyListeners();
  }
}
