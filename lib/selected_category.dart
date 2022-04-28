import 'package:flutter/material.dart';

class SelectedCategory extends StatelessWidget {
  Map <String, String> categories = {};
  Function setCategory;
  SelectedCategory(this.categories, this.setCategory, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column (    
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text('Wybierz kategorię', 
              style: TextStyle(fontSize: 40, color: Colors.white, decoration: TextDecoration.none), 
              textAlign: TextAlign.center
            ) 
          )
        ),
        Expanded(
          flex: 8,
          child: ListView.separated(
            padding: EdgeInsets.all(8.0),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              String key = categories.keys.elementAt(index);
              return ElevatedButton(
                onPressed: () {
                  setCategory(key);
                }, 
                child: Center(
                  child: Text(categories[key].toString())
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xfffca311))),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider()
          )
        ),
      ], 
    );
  }
}

