import 'package:flutter/material.dart';

// components
import '../components/each_category_tile.dart';

// screens


// models
import '../models/category_model.dart';
import '../models/category_models_list.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  List<CategoryModel> allCategories = CategoryModelsList.categoryModelsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your NEWS',
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return EachCategoryTile(
                      allCategories: allCategories,
                      index: index,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
