import 'package:flutter/material.dart';

class BuildRichText extends StatelessWidget {
  const BuildRichText(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
          TextSpan(
            text: description,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

