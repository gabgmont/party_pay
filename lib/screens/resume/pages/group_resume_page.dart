import 'package:flutter/material.dart';

import '../widgets/group_user_resume_widget.dart';
import '../widgets/resume_header_widget.dart';

const groupResume = 'Resumo Geral';

class GroupResumePage extends StatelessWidget {
  const GroupResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const ResumeHeaderWidget(label: groupResume),
        SizedBox(
          height: size.height * .616,
          child: ListView(
            children: [
              GroupUserResumeWidget(),
              GroupUserResumeWidget(),
            ],
          ),
        )
      ],
    );
  }
}
