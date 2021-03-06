import 'package:flutter/material.dart';

import '../../../shared/utils/AppColors.dart';

class ResumeHeaderWidget extends StatelessWidget {
  final String label;

  const ResumeHeaderWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20, ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: AppColors.primary, fontSize: size.height * .05),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          indent: size.width * .1,
          endIndent: size.width * .1,
        ),
      ],
    );
  }
}
