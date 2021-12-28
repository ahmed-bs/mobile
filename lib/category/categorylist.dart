import 'package:flutter/material.dart';
import 'package:mobile/category/detailscat.dart';
import 'package:mobile/models/categories.dart';



class CategoryList extends StatelessWidget {

  final List<Categories> categories;
  CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: categories == null ? 0 : categories.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detailscat(categories[index])),
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(categories[index].nomcat),
                      
                    ),
                  )
              );
          });
  }

}