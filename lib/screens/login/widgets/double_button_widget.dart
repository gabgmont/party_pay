import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class DoubleButtonWidget extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const DoubleButtonWidget({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  State<DoubleButtonWidget> createState() => _DoubleButtonWidgetState();
}

class _DoubleButtonWidgetState extends State<DoubleButtonWidget> {
  Color mainColor = AppColors.white;
  Color secondaryColor = AppColors.secondary;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.5,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: size.height * 0.045,
              width: size.width * 0.49,
              color: secondaryColor,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: InkWell(
                onTap: widget.onTap,
                child: SizedBox(
                  height: size.height * 0.045,
                  width: size.width * 0.49,
                  // color: mainColor,
                  child: Center(
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                        fontSize: 22,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
