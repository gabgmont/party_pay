import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:partypay/partypay_module.dart';
import 'package:partypay/screens/resume/pages/individual_resume_page.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';
import 'package:partypay/screens/session/widgets/session_bottom_navigation_bar.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/group_resume_page.dart';

const myLabel = 'Meu';
const groupLabel = 'Geral';
const end = 'Finalizar';
const payment = 'Pagamento';

class ResumePage extends StatefulWidget {
  final SessionController sessionController;

  const ResumePage({Key? key, required this.sessionController})
      : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  Color leftButtonColor = AppColors.primary;
  Color rightButtonColor = AppColors.gray;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      IndividualResumePage(
        sessionOrderModel:
            widget.sessionController.sessionModel.sessionOrderList,
        sessionUserModel: widget.sessionController.sessionResume.userList
            .where((_sessionUser) =>
                _sessionUser.user == widget.sessionController.loggedUser)
            .first,
      ),
      GroupResumePage(
        sesionResume: widget.sessionController.sessionResume,
      )
    ];

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          payment,
          style: AppStyles.mainLabel(),
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
            Modular.to.pop();
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
              leftButtonLabel: myLabel,
              leftButtonIcon: Icons.person,
              leftButtonColor: leftButtonColor,
              onLeftButtonTap: () {
                setState(() {
                  leftButtonColor = AppColors.primary;
                  rightButtonColor = AppColors.gray;
                  index = 0;
                });
              },
              rightButtonLabel: groupLabel,
              rightButtonIcon: Icons.groups,
              rightButtonColor: rightButtonColor,
              onRightButtonTap: () {
                setState(() {
                  rightButtonColor = AppColors.primary;
                  leftButtonColor = AppColors.gray;
                  index = 1;
                });
              },
              centerButtonLabel: Text(
                end,
                style: AppStyles.mainLabel(),
              ),
              centerButtonTap: () async {
                var sucess =
                    await widget.sessionController.closeSession(context);

                if (sucess) {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.remove('session_id');

                  Modular.to.navigate(routeToHomePage,
                      arguments:
                          widget.sessionController.sessionModel.userList[0]);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
