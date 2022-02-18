import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';

import '../../../shared/utils/AppColors.dart';
import '../../create_session/widget/user_round_card_widget.dart';

class SelectUserWidget extends StatefulWidget {
  final UserModel user;
  final VoidCallback onTap;
  bool selected = false;

  SelectUserWidget({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  State<SelectUserWidget> createState() => _SelectUserWidgetState();
}

class _SelectUserWidgetState extends State<SelectUserWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Material(
        borderRadius: BorderRadius.circular(size.height),
        child: InkWell(
          borderRadius: BorderRadius.circular(size.height),
          onTap: () {
            setState(
              () {
                widget.selected = !widget.selected;
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserRoundCardWidget(
                  height: size.height * .07,
                  width: size.height * .07,
                  initials: widget.user.getInitials(),
                  photo: widget.user.photo,
                  showInitials: true,
                ),
                widget.selected
                    ? Container(
                        height: 4,
                        width: size.height * .08,
                        color: AppColors.secondary,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
