import 'package:flutter/material.dart';
import 'package:my_library/pages/search_pages/search_results_page.dart';
import 'package:my_library/utils/extension.dart';
import '../../constants/string.dart';

class SearchPageSearchBarView extends StatelessWidget {
  const SearchPageSearchBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:
      context.getSearchPageBlocInstance().getTextController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: kSearchPlayBooksText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      onChanged: (text) {
        if (text.isNotEmpty) {
          context.getSearchPageBlocInstance().getDebouncer.run(() {
            context
                .getSearchPageBlocInstance()
                .getSearchItemFromNetwork(text, isSubmitted: false);
            context
                .getSearchPageBlocInstance()
                .changeIsSearchingValue();
          });
        }
      },
      onSubmitted: (text) {
        if (text.isNotEmpty) {
          context.navigateToNextScreen(
              context,
              SearchResultsPage(
                searchTitle: text,
              ));
        }
      },
    );
  }
}