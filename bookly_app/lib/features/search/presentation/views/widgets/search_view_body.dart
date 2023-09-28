import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_text_filed.dart';
import 'package:bookly_app/features/search/presentation/search_Book_cubit/search_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validate = AutovalidateMode.disabled;
  String? bookName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        autovalidateMode: validate,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormTextFiled(
              hintText: "Search",
              onSaved: (p0) {
                bookName = p0;
              },
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<SearchBookCubit>(context)
                      .getSearchedBook(bookNamed: bookName!);
                } else {
                  validate = AutovalidateMode.always;
                  setState(() {});
                }
              },
              icon: FontAwesomeIcons.magnifyingGlass,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Search result",
              style: Styles.textStyle18,
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: SearchViewItems(),
            )
          ],
        ),
      ),
    );
  }
}
