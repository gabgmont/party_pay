import 'package:flutter/material.dart';

import '../../../shared/utils/AppColors.dart';
import 'menu_order_widget.dart';

class CategoryDropDown extends StatefulWidget {
  final String label;
  final List<MenuOrderWidget> orderItemList;
  final VoidCallback opTap;

  const CategoryDropDown({
    Key? key,
    required this.label,
    required this.orderItemList,
    required this.opTap,
  }) : super(key: key);

  @override
  State<CategoryDropDown> createState() => CategoryDropDownState();
}

class CategoryDropDownState extends State<CategoryDropDown> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.height * .1,
      color: AppColors.primary,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.opTap();
                open = !open;
              });
            },
            child: Row(
              children: [
                Icon(
                  open
                      ? Icons.keyboard_arrow_up_sharp
                      : Icons.keyboard_arrow_down_sharp,
                  color: AppColors.white,
                  size: size.height * .05,
                ),
                Center(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                        color: AppColors.white, fontSize: size.height * .03),
                  ),
                )
              ],
            ),
          ),
          open
              ? Container(
                  color: AppColors.white,
                  child: Column(
                    children: widget.orderItemList,
                  ),
                )
              : Container(height: 2, width: double.maxFinite,color: AppColors.secondary,)
        ],
      ),
    );
  }
}
