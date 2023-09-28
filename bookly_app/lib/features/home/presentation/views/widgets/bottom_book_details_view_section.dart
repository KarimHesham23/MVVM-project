import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/releated_books_list_view.dart';
import 'package:flutter/material.dart';

class BottomBookDetailsViewSection extends StatelessWidget {
  const BottomBookDetailsViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            "You can also like",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const ReleatedBooksListView(),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
