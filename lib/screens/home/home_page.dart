import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.28),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * 0.26,
                    width: size.width,
                    color: AppColors.secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Partypay!',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 36),
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [Text('Welcome,'), Text('Gabriel!')],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.circular(15)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.04,
                    width: size.width,
                    color: AppColors.white,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: size.height * 0.12,
                        width: size.width * 0.9,
                        color: AppColors.primary,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: AppColors.gray,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: AppColors.gray,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: AppColors.gray,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: AppColors.gray,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: AppColors.gray,
                                    blurStyle: BlurStyle.outer,
                                  )
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: AppColors.red,
        ));
  }
}
