import 'package:flutter/material.dart';

import '../widgets/individual_resume_item_widget.dart';
import '../widgets/resume_header_widget.dart';

class IndividualResumePage extends StatelessWidget {

  const IndividualResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ResumeHeaderWidget(
          label: 'Meu Resumo',
        ),
        SizedBox(
          height: size.height * .6,
          child: ListView(
            children: [
              IndividualResumeItem(),
              IndividualResumeItem(),
              IndividualResumeItem(),
              IndividualResumeItem(),
              IndividualResumeItem(),
            ],
          ),
        ),
      ],
    );
  }
}
