import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class CpfAddFormFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onTap;

  const CpfAddFormFieldWidget({Key? key, required this.onTap, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: Row(
        children: [
          Icon(
            Icons.pin,
            size: 28,
            color: AppColors.primary,
          ),
          SizedBox(
            width: size.width * 0.6,
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
                      width: size.width * 0.5,
                      color: AppColors.gray,
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: size.width * 0.77,
                      height: size.height * 0.8,
                      child: TextFormField(
                        controller: textController,
                        keyboardType: TextInputType.name,
                        style: TextStyle(fontSize: 16, color: AppColors.gray),
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'CPF',
                            labelStyle: const TextStyle(
                                color: AppColors.gray, fontSize: 16),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(Icons.add_circle),
            padding: EdgeInsets.zero,
            color: AppColors.primary,
            iconSize: 48,
            splashRadius: 30,
          )
        ],
      ),
    );
  }
}
