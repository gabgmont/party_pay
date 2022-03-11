import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class UserRoundCardWidget extends StatelessWidget {
  final String? initials;
  final String? photo;
  final double? height;
  final double? width;
  final bool showInitials;

  const UserRoundCardWidget({Key? key, this.initials, this.photo, this.height, this.width, this.showInitials = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: height ?? size.height * 0.06,
            width: width  ?? size.height * 0.06,
            decoration: hasPhoto() ? photoDecoration(photo!) : initialsDecoration(),
            child: hasPhoto()
                ? null
                : Center(
                    child: Text(
                      initials ?? 'G',
                      style: TextStyle(fontSize: height == null ? size.height*.025 : height! *.45, color: AppColors.white),
                    ),
                  ),
          ),
          (hasPhoto() && showInitials) ? Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(child: Text(initials ?? 'G'),),
          ) : Container()
        ],
      ),
    );
  }

  bool hasPhoto() {
    if (photo == null) return false;
    if (photo!.isEmpty) return false;
    return true;
  }

  Decoration photoDecoration(String photo) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: const Border.fromBorderSide(
            BorderSide(width: 1, color: AppColors.secondary)),
        image: DecorationImage(image: NetworkImage(photo), fit: BoxFit.fill),
    boxShadow: [
        BoxShadow(
          offset: Offset.fromDirection(1, 1.5),
          blurRadius: 0.5,
          spreadRadius: 0.5,
          color: AppColors.shadow,
        ),
      ],
    );
  }

  Decoration initialsDecoration() {
    return BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(100),
        border: const Border.fromBorderSide(
            BorderSide(width: 1, color: AppColors.primary)),
    boxShadow: [
      BoxShadow(
          offset: Offset.fromDirection(1, 1.5),
          blurRadius: 0.5,
          spreadRadius: 0.5,
          color: AppColors.shadow,
        ),
      ],
    );
  }
}
