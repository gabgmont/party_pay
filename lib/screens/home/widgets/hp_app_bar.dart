import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/create_session/widget/user_round_card_widget.dart';
import 'package:partypay/screens/home/controller/news_controller.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';
import 'package:partypay/shared/utils/AppStyles.dart';
import 'package:partypay/shared/utils/string_filter.dart';

import 'news_widget.dart';
import 'page_indicator_widget.dart';

const logo = 'Partypay!';
const welcome = 'Bem vindo,';

class HomePageAppBar extends StatefulWidget {
  final UserModel user;
  final VoidCallback onTap;

  const HomePageAppBar({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  final newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List news = [
      // NewsWidget(
      //   image: AppImages.siSenor,
      //   onTap: () {
      //     setState(() {
      //       newsController.currentPage = 1;
      //     });
      //   },
      // ),
      // NewsWidget(
      //   image: AppImages.cocoBambu,
      //   onTap: () {
      //     setState(() {
      //       newsController.currentPage = 2;
      //     });
      //   },
      // ),
      // NewsWidget(
      //   image: AppImages.paris6,
      //   onTap: () {
      //     setState(() {
      //       newsController.currentPage = 3;
      //     });
      //   },
      // ),
      // NewsWidget(
      //   image: AppImages.srShitake,
      //   onTap: () {
      //     setState(() {
      //       newsController.currentPage = 4;
      //     });
      //   },
      // ),
      // NewsWidget(
      //   image: AppImages.logo,
      //   onTap: () {
      //     setState(() {
      //       newsController.currentPage = 0;
      //     });
      //   },
      // )
    ];
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          logo,
                          style: AppStyles.logoLabel(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              welcome,
                              style: AppStyles.welcomeProfile(bold: true),
                            ),
                            Text(
                              StringFilter.getFirstName(widget.user.name),
                              style: AppStyles.welcomeProfile(),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * .05),
                          child: InkWell(
                              onTap: widget.onTap,
                              child: UserRoundCardWidget(
                                height: size.height * .09,
                                width: size.height * .09,
                                initials: widget.user.getInitials(),
                                photo: widget.user.photo,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.0813,
              width: size.width,
              color: AppColors.white,
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       news[newsController.currentPage],
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           // PageIndicatorWidget(
        //           //   color: newsController.currentPage == 0
        //           //       ? AppColors.secondary
        //           //       : AppColors.white,
        //           // ),
        //           // PageIndicatorWidget(
        //           //   color: newsController.currentPage == 1
        //           //       ? AppColors.secondary
        //           //       : AppColors.white,
        //           // ),
        //           // PageIndicatorWidget(
        //           //   color: newsController.currentPage == 2
        //           //       ? AppColors.secondary
        //           //       : AppColors.white,
        //           // ),
        //           // PageIndicatorWidget(
        //           //   color: newsController.currentPage == 3
        //           //       ? AppColors.secondary
        //           //       : AppColors.white,
        //           // ),
        //           PageIndicatorWidget(
        //             color: newsController.currentPage == 0
        //                 ? AppColors.secondary
        //                 : AppColors.white,
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
