import 'package:bookly_app/features/categories/data/models/category_model.dart';
import 'package:bookly_app/features/categories/data/repo/category_repo.dart';

class CategoryRepoImplem extends CategoryRepo {
  @override
  List<CategoryModel> categoriesData() {
    List<CategoryModel> data = [
      CategoryModel(
        categoryName: "Science",
        categoryImage: "assets/images/science.jpg",
      ),
      CategoryModel(
          categoryName: "Computer science",
          categoryImage: "assets/images/programming.jpg"),
      CategoryModel(
        categoryName: "Classic",
        categoryImage: "assets/images/classic.jpg",
      ),
      CategoryModel(
        categoryName: "History",
        categoryImage: "assets/images/history.jpg",
      ),
      CategoryModel(
        categoryName: "Fantasy",
        categoryImage: "assets/images/fantasy.jpg",
      ),
    ];
    return data;
  }
}
