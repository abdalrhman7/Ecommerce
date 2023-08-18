import 'package:flutter/material.dart';

import '../constants/app_value.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppPadding.p14),
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}