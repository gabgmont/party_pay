import 'package:flutter/material.dart';
import 'package:partypay/model/session/session_resume_model.dart';

import '../widgets/group_user_resume_widget.dart';
import '../widgets/resume_header_widget.dart';

const groupResume = 'Resumo Geral';

class GroupResumePage extends StatelessWidget {
  final SessionResumeModel sesionResume;
  const GroupResumePage({Key? key, required this.sesionResume}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const ResumeHeaderWidget(label: groupResume),
        SizedBox(
          height: size.height * .611,
          child: ListView(
            children: getUsersResume(),
          ),
        )
      ],
    );
  }

  List<GroupUserResumeWidget> getUsersResume(){
    return sesionResume.userList.map((e) => GroupUserResumeWidget(sessionUserModel: e)).toList();
  }
}
