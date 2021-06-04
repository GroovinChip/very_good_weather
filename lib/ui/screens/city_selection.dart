import 'package:flutter/material.dart';

class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context, _textController.text);
                  },
                  child: Text('SEARCH'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
