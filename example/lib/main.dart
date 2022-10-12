import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo for currency picker package',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  List<String> favorite = ['USD'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo for currency picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showSearchField: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              onSelect: (Currency currency) {
                if(favorite.contains(currency.code)){
                  favorite.remove(currency.code);
                }
                else{
                  favorite.add(currency.code);
                };
              },
              favorite: favorite,
            );
          },
          child: const Text('Show currency picker'),
        ),
      ),
    );
  }
}
