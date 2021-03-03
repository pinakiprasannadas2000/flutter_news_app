import 'package:flutter/material.dart';

// screens
import '../screens/each_category.dart';

// models
import '../models/category_model.dart';

class EachCategoryTile extends StatelessWidget {
  final List<CategoryModel> allCategories;
  final int index;

  EachCategoryTile({@required this.allCategories, @required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EachCategory(title: allCategories[index].categoryName),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(5.0),
        height: 150,
        width: double.infinity,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                allCategories[index].categoryImageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black26,
              alignment: Alignment.center,
              child: Text(
                allCategories[index].categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}