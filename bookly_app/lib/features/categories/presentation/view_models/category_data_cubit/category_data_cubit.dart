import 'package:bookly_app/features/categories/data/models/category_model.dart';
import 'package:bookly_app/features/categories/data/repo/category_repo_implem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_data_state.dart';

class CategoryDataCubit extends Cubit<CategoryDataState> {
  CategoryDataCubit(this.categoryRepo) : super(CategoryDataInitial());
  final CategoryRepoImplem categoryRepo;
  List<CategoryModel> categories = [];
  void getCategories() {
    categories = categoryRepo.categoriesData();
  }
}
