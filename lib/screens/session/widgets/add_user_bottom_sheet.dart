import 'package:flutter/material.dart';
import 'package:partypay/screens/create_session/controller/create_session_controller.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/screens/session/controller/session_controller.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import '../../create_session/widget/cpf_add_form_field_widget.dart';

class AddUserBottomSheet extends StatefulWidget {
  final SessionController sessionController;

  const AddUserBottomSheet({Key? key, required this.sessionController})
      : super(key: key);

  @override
  _AddUserBottomSheetState createState() => _AddUserBottomSheetState();
}

class _AddUserBottomSheetState extends State<AddUserBottomSheet>
    with TickerProviderStateMixin {
  final cpfTextController = TextEditingController();
  final CreateSessionController _createSessionController =
      CreateSessionController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BottomSheet(
        animationController: BottomSheet.createAnimationController(this),
        onDragStart: (_) {
          Navigator.pop(context);
        },
        constraints: BoxConstraints.expand(height: size.height * .6),
        onClosing: () {},
        builder: (context) {
          return SizedBox(
            height: size.height * .6,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Add user to session',
                    style: TextStyle(fontSize: size.height * .03),
                  ),
                  CpfAddFormFieldWidget(
                    textController: cpfTextController,
                    onTap: () async {
                      var user = await _createSessionController.getUser(
                          context, cpfTextController.text);
                      if (user != null) {
                        setState(() {
                          _createSessionController.userCardList.add(
                            UserRoundCardWidget(
                              initials: user.getInitials(),
                              photo: user.photo,
                            ),
                          );
                        });
                      }
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.07,
                        width: size.width * 0.9,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _createSessionController.userCardList,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .08,
                    width: size.width * .7,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: size.height * .075,
                            width: size.width * .69,
                            color: AppColors.secondary,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Material(
                            color: AppColors.primary,
                            child: InkWell(
                              onTap: () async {
                                var sucess = await widget.sessionController
                                    .addUsers(context,
                                        _createSessionController.usersList);
                                if (sucess) {
                                  Navigator.pop(context);
                                }
                              },
                              highlightColor: AppColors.secondary,
                              splashColor: AppColors.secondary,
                              child: SizedBox(
                                height: size.height * .075,
                                width: size.width * .69,
                                child: Center(
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: size.height * .04,
                                        color: AppColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
