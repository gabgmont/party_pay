import 'package:flutter/material.dart';
import 'package:partypay/screens/resume/pages/individual_resume_page.dart';
import 'package:partypay/screens/session/widgets/session_bottom_navigation_bar.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'pages/group_resume_page.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  Color leftButtonColor = AppColors.primary;
  Color rightButtonColor = AppColors.gray;
  final pages = [IndividualResumePage(), GroupResumePage()];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pagamento',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          splashColor: AppColors.secondary,
          highlightColor: AppColors.secondary,
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColors.white,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pages[index],
            SessionBottomNavigationBar(
              leftButtonLabel: 'Meu',
              leftButtonIcon: Icons.person,
              leftButtonColor: leftButtonColor,
              onLeftButtonTap: () {
                setState(() {
                  leftButtonColor = AppColors.primary;
                  rightButtonColor = AppColors.gray;
                  index = 0;
                });
              },
              rightButtonLabel: 'Geral',
              rightButtonIcon: Icons.groups,
              rightButtonColor: rightButtonColor,
              onRightButtonTap: () {
                setState(() {
                  rightButtonColor = AppColors.primary;
                  leftButtonColor = AppColors.gray;
                  index = 1;
                });
              },
              centerButtonLabel: const Text(
                'Pagar',
                style: TextStyle(color: AppColors.white, fontSize: 32),
              ),
              centerButtonTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
