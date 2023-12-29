import 'package:due_date_new/utils/app_colors.dart';
import 'package:due_date_new/utils/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdTrimester extends StatelessWidget {
  const ThirdTrimester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            AppVectors.dragHandle,
          ),
          const SizedBox(height: 25,),
          const Text(
            '3rd Trimester',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Manrope',
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w800),
          ),
          const Text(
            'Week 28 - Week 40',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Manrope',
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
