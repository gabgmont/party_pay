import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/session/widgets/enter_button_widget.dart';
import 'package:partypay/screens/session/widgets/select_user_widget.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppStyles.dart';

import '../controller/session_controller.dart';

const selectUsersToShare = 'Dividir';

class AddOrderButtonBottomSheet extends StatefulWidget {
  final String orderName;
  final int orderId;
  final SessionController sessionController;
  final List<UserModel> userList;
  final VoidCallback onConfirmOrder;

  const AddOrderButtonBottomSheet({
    Key? key,
    required this.orderName,
    required this.orderId,
    required this.sessionController,
    required this.userList,
    required this.onConfirmOrder,
  }) : super(key: key);

  @override
  State<AddOrderButtonBottomSheet> createState() =>
      _AddOrderButtonBottomSheetState();
}

class _AddOrderButtonBottomSheetState extends State<AddOrderButtonBottomSheet>
    with TickerProviderStateMixin {
  List<SelectUserWidget> selectUserList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BottomSheet(
      animationController: BottomSheet.createAnimationController(this),
      onDragStart: (_) {
        Modular.to.pop();
      },
      constraints: BoxConstraints.expand(height: size.height * .32),
      onClosing: widget.onConfirmOrder,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: Stack(
                children: [
                  Container(
                    height: size.height * .065,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          offset: Offset.fromDirection(1),
                          blurRadius: .5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .06,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text.rich(
                          TextSpan(
                            text: '$selectUsersToShare: ',
                            style: AppStyles.orderName(color: AppColors.white),
                            children: [
                              TextSpan(
                                text: widget.orderName,
                                style: AppStyles.orderName(color: AppColors.white),
                              )
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .14,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * .014),
                child: SizedBox(
                  child: ListView.builder(
                      itemCount: widget.userList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final userContent = widget.userList[index];
                        selectUserList.add(
                          SelectUserWidget(
                            user: userContent,
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        );

                        return selectUserList[index];
                      }),
                ),
              ),
            ),
            EnterButtonWidget(
              onTap: () async {
                var selectedUsers = selectUserList
                    .where((userWidget) => userWidget.selected)
                    .map((userWidget) => userWidget.user)
                    .toList();

                if (selectedUsers.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.secondary,
                      content: Text(
                          'Escolha ao menos um usuário para dividir o pedido.'),
                    ),
                  );
                  return;
                }
                var sucess = await widget.sessionController
                    .addOrder(context, widget.orderId, selectedUsers);
                if (sucess) {
                  Modular.to.pop();
                  widget.onConfirmOrder();
                }
              },
            )
          ],
        );
      },
    );
  }
}
