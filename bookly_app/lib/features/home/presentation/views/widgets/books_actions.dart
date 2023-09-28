import 'package:bookly_app/core/helpers/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              text: "Free",
              fontWeigth: FontWeight.bold,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                customLaunchUrl(context, book.volumeInfo.previewLink);
              },
              text: book.volumeInfo.previewLink == null
                  ? "Not Avaliable"
                  : "Prview",
              backgroundColor: const Color(0xffEf8262),
              borderReduis: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              fontSize: 18,
              textColor: Colors.white,
              fontWeigth: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
