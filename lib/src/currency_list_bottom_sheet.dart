import 'package:flutter/material.dart';

import 'currency.dart';
import 'currency_list_view.dart';
import 'currency_picker_theme_data.dart';

Future<dynamic> showCurrencyListBottomSheet({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
  // List<String>? favorite,
  Map<String,dynamic>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  bool showSearchField = true,
  bool showFlag = true,
  bool showCurrencyName = true,
  bool showCurrencyCode = false,
  ScrollPhysics? physics,
  CurrencyPickerThemeData? theme,
}) {
  final ShapeBorder shape = theme?.shape ??
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      );

    return showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    shape: shape,
    backgroundColor: theme?.backgroundColor,
    builder: (_) => _builder(
      context,
      onSelect,
      favorite,
      currencyFilter,
      searchHint,
      physics,
      showSearchField,
      showFlag,
      showCurrencyName,
      showCurrencyCode,
      theme,
    ),
  );
}

Widget _builder(
  BuildContext context,
  ValueChanged<Currency> onSelect,
  Map<String,dynamic>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  ScrollPhysics? physics,
  bool showSearchField,
  bool showFlag,
  bool showCurrencyName,
  bool showCurrencyCode,
  CurrencyPickerThemeData? theme,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = theme?.bottomSheetHeight ??
      device - (statusBarHeight + (kToolbarHeight / 1.5));
  return SizedBox(
    height: height,
    child: CurrencyListView(
      onSelect: onSelect,
      searchHint: searchHint,
      showSearchField: showSearchField,
      showFlag: showFlag,
      showCurrencyName: showCurrencyName,
      showCurrencyCode: showCurrencyCode,
      favorite: favorite,
      currencyFilter: currencyFilter,
      physics: physics,
      theme: theme,
    ),
  );
}
