import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/home/news_controller.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';
import 'package:partypay/shared/utils/string_filter.dart';

import 'news_widget.dart';
import 'page_indicator_widget.dart';

const logo = 'Partypay!';
const welcome = 'Bem vindo,';

class HomePageAppBar extends StatefulWidget {
  final User user;

  const HomePageAppBar({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  final newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List news = [
      NewsWidget(
        image: AppImages.siSenor,
        onTap: () {
          setState(() {
            newsController.currentPage = 1;
          });
        },
      ),
      NewsWidget(
        image: AppImages.cocoBambu,
        onTap: () {
          setState(() {
            newsController.currentPage = 2;
          });
        },
      ),
      NewsWidget(
        image: AppImages.paris6,
        onTap: () {
          setState(() {
            newsController.currentPage = 3;
          });
        },
      ),
      NewsWidget(
        image: AppImages.srShitake,
        onTap: () {
          setState(() {
            newsController.currentPage = 4;
          });
        },
      ),
      NewsWidget(
        image: AppImages.paris6,
        onTap: () {
          setState(() {
            newsController.currentPage = 0;
          });
        },
      )
    ];
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              color: AppColors.secondary,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      logo,
                      style: TextStyle(color: AppColors.white, fontSize: 26),
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              welcome,
                              style: TextStyle(color: AppColors.white),
                            ),
                            Text(
                                StringFilter.getFirstName(widget.user.name),
                                style: TextStyle(color: AppColors.white))
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(
                                BorderSide(width: 0.5, color: AppColors.gray)),
                            image: DecorationImage(
                                image: AssetImage(AppImages.userPicture)),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.fromDirection(1, 1.5),
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                color: AppColors.shadow,
                              ),
                            ],
                          ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              news[newsController.currentPage],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageIndicatorWidget(
                    color: newsController.currentPage == 0
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                  PageIndicatorWidget(
                    color: newsController.currentPage == 1
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                  PageIndicatorWidget(
                    color: newsController.currentPage == 2
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                  PageIndicatorWidget(
                    color: newsController.currentPage == 3
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                  PageIndicatorWidget(
                    color: newsController.currentPage == 4
                        ? AppColors.secondary
                        : AppColors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
