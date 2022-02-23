import 'package:flutter/material.dart';

import '../../../shared/utils/AppColors.dart';

const moneyPrefix = 'R\$';

class MenuOrderWidget extends StatelessWidget {
  final String label;
  final String description;
  final double price;
  final VoidCallback onTap;

  const MenuOrderWidget(
      {Key? key,
      required this.label,
      required this.description,
      required this.price,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height * .01),
      child: SizedBox(
        height: size.height * .2,
        width: size.width * .9,
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: _MenuOrderShadow(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: _MenuOrderCard(
                label: label,
                description: description,
                price: price,
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuOrderShadow extends StatelessWidget {
  const _MenuOrderShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .192,
      width: size.width * .79,
      color: AppColors.secondary,
    );
  }
}

class _MenuOrderCard extends StatelessWidget {
  final String label;
  final String description;
  final double price;
  final VoidCallback onTap;

  const _MenuOrderCard(
      {Key? key,
      required this.price,
      required this.label,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        highlightColor: AppColors.secondary,
        splashColor: AppColors.secondary,
        child: SizedBox(
          height: size.height * .194,
          width: size.width * .79,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * .13,
                  width: size.height * .13,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * .02),
                    child: SizedBox(
                      width: size.width * .45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _MenuOrderNameDescription(
                            label: label,
                            description: description,
                          ),
                          _MenuOrderPrice(
                            price: price,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuOrderNameDescription extends StatelessWidget {
  final String label;
  final String description;

  const _MenuOrderNameDescription(
      {Key? key, required this.label, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * .03),
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: size.height * .08,
            child: Text.rich(
              TextSpan(
                text: '$label\n',
                style: TextStyle(fontSize: size.height * .023),
                children: [
                  TextSpan(
                    text: description,
                    style: TextStyle(
                        fontSize: size.height * .013,
                        overflow: TextOverflow.fade),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuOrderPrice extends StatelessWidget {
  final double price;

  const _MenuOrderPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: size.height * .05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  moneyPrefix,
                  style: TextStyle(fontSize: size.height * .016),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$price',
                style: TextStyle(fontSize: size.height * .045),
              ),
            )
          ],
        ),
      ),
    );
  }
}
