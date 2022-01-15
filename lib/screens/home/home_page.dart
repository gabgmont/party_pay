import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/home/widgets/double_big_button_widget.dart';
import 'package:partypay/screens/home/widgets/hp_app_bar.dart';
import 'package:partypay/shared/utils/AppColors.dart';
import 'package:partypay/shared/utils/AppImages.dart';

import 'widgets/double_big_button_wlist_widget.dart';
import 'widgets/round_restaurant_card_widget.dart';

const recentActivity = 'Atividade Recente';
const restaurants = 'Restaurantes';
const newSession = 'Start new Session';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.28),
        child: HomePageAppBar(
          user: user,
          onTap: () {
            Navigator.pushNamed(context, '/profile_page', arguments: user);
          },
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  RoundRestaurantCardWidget(
                    image: AppImages.smallSrShitake,
                  ),
                  RoundRestaurantCardWidget(
                    image: AppImages.smallCocoBambu,
                  ),
                  RoundRestaurantCardWidget(
                    image: AppImages.smallSiSenor,
                  ),
                  RoundRestaurantCardWidget(
                    image: AppImages.smallOutback,
                  ),
                  RoundRestaurantCardWidget(
                    image: AppImages.smallHardRock,
                  ),
                  RoundRestaurantCardWidget(
                    image: AppImages.smallMadero,
                  ),
                  RoundRestaurantCardWidget(
                    image: AppImages.smallParis6,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DoubleBigButtonWListWidget(
                  label: recentActivity, onTap: () {}),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DoubleBigButtonWidget(label: restaurants, onTap: () {}),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DoubleBigButtonWidget(label: newSession, onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
