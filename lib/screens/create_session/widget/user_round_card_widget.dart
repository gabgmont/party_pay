import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

class UserRoundCardWidget extends StatelessWidget {
  final String? initials;
  final String? photo;

  const UserRoundCardWidget({Key? key, this.initials, this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: size.height * 0.06,
        width: size.height * 0.06,
        decoration: hasPhoto() ? photoDecoration : initialsDecoration,
        child: hasPhoto()
            ? null
            : Center(
                child: Text(
                  initials!,
                  style: const TextStyle(fontSize: 18, color: AppColors.white),
                ),
              ),
      ),
    );
  }

  bool hasPhoto() {
    if (photo == null) return false;
    if (photo!.isEmpty) return false;
    return true;
  }
}

var photoDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    border: const Border.fromBorderSide(
        BorderSide(width: 1, color: AppColors.primary)),
    image: const DecorationImage(image: AssetImage(AppImages.userPicture)));

var initialsDecoration = BoxDecoration(
    color: AppColors.secondary,
    borderRadius: BorderRadius.circular(100),
    border: const Border.fromBorderSide(
        BorderSide(width: 1, color: AppColors.primary)));
