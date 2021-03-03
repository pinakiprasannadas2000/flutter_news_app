import 'category_model.dart';

class CategoryModelsList {
  static List<CategoryModel> _categoryModelsList = [
    CategoryModel(
      categoryName: 'Business',
      categoryImageUrl: 'https://www.mesarya.university/wp-content/uploads/2020/05/1-5.jpg',
    ),
    CategoryModel(
      categoryName: 'Entertainment',
      categoryImageUrl: 'https://www.asmibanquet.com/wp-content/uploads/2017/10/Entertainment.jpg',
    ),
    CategoryModel(
      categoryName: 'General',
      categoryImageUrl: 'https://chessdailynews.com/wp-content/uploads/2015/03/general_news1.jpg',
    ),
    CategoryModel(
      categoryName: 'Health',
      categoryImageUrl: 'https://www.expatica.com/app/uploads/sites/6/2016/05/Health-Insurance-1920x1080.jpg',
    ),
    CategoryModel(
      categoryName: 'Science',
      categoryImageUrl: 'https://www.rmit.edu.au/content/dam/rmit/au/en/study-with-us/interest-areas/thumbnails/science-study-area-1220x732.jpg',
    ),
    CategoryModel(
      categoryName: 'Sports',
      categoryImageUrl: 'https://www.gadgetadda.com/wp-content/uploads/2020/06/gadgets-sports.jpg',
    ),
    CategoryModel(
      categoryName: 'Technology',
      categoryImageUrl: 'https://www.nato.int/nato_static_fl2014/assets/pictures/images_mfu/2020/5/stock/200504-AI1.jpg',
    ),
  ];

  static List<CategoryModel> get categoryModelsList {
    return _categoryModelsList;
  }
}
