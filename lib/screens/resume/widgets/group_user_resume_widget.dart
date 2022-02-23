import 'package:flutter/material.dart';

import '../../../shared/utils/AppColors.dart';
import 'group_resume_item_widget.dart';

class GroupUserResumeWidget extends StatelessWidget {
  const GroupUserResumeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * .95,
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Usuario 1',
                        style: TextStyle(
                            color: AppColors.white, fontSize: 24),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 1,
                          height: 24,
                          color: AppColors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: SizedBox(
                            width: 40,
                            child: Icon(
                              Icons.person,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 24,
                          color: AppColors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0),
                          child: SizedBox(
                            width: 40,
                            child: Icon(
                              Icons.groups,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            GroupResumeItemWidget(),
            GroupResumeItemWidget(),
            GroupResumeItemWidget(),
            GroupResumeItemWidget(),
            GroupResumeItemWidget(),
            GroupResumeItemWidget(),
            GroupResumeItemWidget(),

          ],
        ),
      ),
    );
  }
}
