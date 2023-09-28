import 'package:bookly_app/features/categories/data/models/category_model.dart';

abstract class CategoryRepo {
  List<CategoryModel> categoriesData();
}
