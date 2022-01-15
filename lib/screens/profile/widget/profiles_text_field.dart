import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class IconTextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool hidden;
  final bool active;

  const IconTextFieldWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    this.hidden = false,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: size.height * 0.07,
        width: size.width * 0.9,
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: AppColors.primary,
            ),
            SizedBox(
              width: size.width * 0.80,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 7),
                      Container(
                        height: size.height * 0.055,
                        width: 1,
                        color: AppColors.gray,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 1,
                        width: size.width * 0.8,
                        color: AppColors.gray,
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width * 0.77,
                      height: size.height * 0.8,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        initialValue: value,
                        obscureText: hidden,
                        enabled: active,
                        style: TextStyle(
                            fontSize: 16,
                            color: active ? AppColors.black : AppColors.gray),
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: label,
                            labelStyle: const TextStyle(
                                color: AppColors.gray, fontSize: 16),
                            border: InputBorder.none),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
