library currency_picker;

import 'package:flutter/material.dart';

import 'src/currency.dart';
import 'src/currency_list_bottom_sheet.dart' as currency_list;
import 'src/currency_picker_theme_data.dart';

export 'package:currency_picker/src/currency.dart';
export 'package:currency_picker/src/currency_picker_theme_data.dart';
export 'package:currency_picker/src/currency_service.dart';
export 'package:currency_picker/src/currency_utils.dart';

void showCurrencyPicker({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
  Map<String,String>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  bool showSearchField = true,
  bool showFlag = true,
  bool showCurrencyName = true,
  bool showCurrencyCode = true,
  ScrollPhysics? physics,
  CurrencyPickerThemeData? theme,
}) {
  assert(
    showCurrencyName || showCurrencyCode,
    'showCurrencyName and showCurrencyCode cannot be both false',
  );
  currency_list.showCurrencyListBottomSheet(
    context: context,
    onSelect: onSelect,
    showSearchField: showSearchField,
    searchHint: searchHint,
    showFlag: showFlag,
    showCurrencyName: showCurrencyName,
    showCurrencyCode: showCurrencyCode,
    favorite: favorite,
    currencyFilter: currencyFilter,
    theme: theme,
    physics: physics,
  );
}

@Deprecated(
  'Use showCurrencyPicker instead. '
  'This feature was deprecated after v1.0.2.',
)
void showCurrencyListBottomSheet({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
}) {
  showCurrencyPicker(
    context: context,
    onSelect: onSelect,
  );
}
