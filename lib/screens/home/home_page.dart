import 'package:due_date_new/screens/home/home_page_controller.dart';
import 'package:due_date_new/screens/home/modal/first_trimester.dart';
import 'package:due_date_new/screens/home/modal/second_trimester.dart';
import 'package:due_date_new/screens/home/modal/third_trimester.dart';
import 'package:due_date_new/utils/app_colors.dart';
import 'package:due_date_new/utils/app_vectors.dart';
import 'package:due_date_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageController = Get.put<HomePageController>(HomePageController());

  @override
  Widget build(BuildContext context) {
    void showDialogHome() {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                backgroundColor: AppColors.backgroundColor,
                title: const Text(
                  'User information and legal notice',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Manrope',
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w700),
                ),
                content: const Text(
                  'All information contained herein is intended solely for educational or didactic purposes. Such information should in no way be used for the purpose of diagnosis, prevention, control, treatment or mitigation of a disease, Injury or disability. Thus, the information hereby provided is in no way intended to replace clinical judgment or decision-making about the specific care to be applied to patients When drug dosages are presented, these are calculated considering the "usual dosage according to the respective medication guide. For more information, please consult the respective medication guide.',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Manrope',
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w400),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      goBack(context);
                    },
                    child: const Text(
                      'Got it',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Manrope',
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ));
    }

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          actions: [
            InkWell(
                onTap: () {
                  showDialogHome();
                },
                child: SvgPicture.asset(
                  AppVectors.moreInfo,
                )),
            const SizedBox(
              width: 31,
            )
          ],
        ),
        body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.backgroundColor,
              child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              child:
                                  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'Last menstrual period',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Manrope',
                                          color: AppColors.primaryTextColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    homePageController.pickLMPDate();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: AppColors.transparent,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.5, color: AppColors.tertiaryTextColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10, bottom: 10, right: 10),
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                homePageController.getFormattedDate(
                                                    homePageController.lmpDate.value),
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Manrope',
                                                    color: AppColors.secondaryTextColor,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                AppVectors.calendar,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppVectors.dueDateIcon,
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          homePageController.getTrimester(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Manrope',
                                              color: AppColors.primaryTextColor,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          homePageController.getCountdownToDueDate(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Manrope',
                                              color: AppColors.secondaryTextColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 29,
                                ),
                                HomeCards(
                                  title: 'Estimated Due Date',
                                  titleBackgroundColor: AppColors.secondaryColor,
                                  backgroundColor: AppColors.primaryColor,
                                  duration: homePageController.getFormattedDueDate(),
                                  icon: AppVectors.pregWomanOne,
                                  showIcon: true,
                                  onTap: () {
                                    logDebug('Hello');
                                  },
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                HomeCards(
                                  title: 'Gestational age',
                                  titleBackgroundColor: AppColors.cardHeadOne,
                                  backgroundColor: AppColors.cardBodyOne,
                                  duration: homePageController.getGestationalAge(),
                                  icon: AppVectors.pregWomanTwo,
                                  showIcon: true,
                                  onTap: () {
                                    logDebug('Hello');
                                  },
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                HomeCards(
                                  title: 'Full term',
                                  titleBackgroundColor: AppColors.cardHeadTwo,
                                  backgroundColor: AppColors.cardBodyTwo,
                                  duration: homePageController.getFullTerm(),
                                  onTap: () {
                                    logDebug('Hello');
                                  },
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5, top: 4, bottom: 4),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                backgroundColor: AppColors.backgroundColor,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(15),
                                                  ),
                                                ),
                                                isScrollControlled: true,
                                                enableDrag: true,
                                                context: context,
                                                builder: (builder) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context).viewInsets.bottom,
                                                    ),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(maxHeight: 650),
                                                      child: const FirstTrimester(),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 2, top: 8, bottom: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: AppColors.firstTrimester,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Column(
                                              children: [
                                                Text(
                                                  '1st Trimester',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Manrope',
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  'Tap here',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Manrope',
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                backgroundColor: AppColors.backgroundColor,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(15),
                                                  ),
                                                ),
                                                isScrollControlled: true,
                                                enableDrag: true,
                                                context: context,
                                                builder: (builder) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context).viewInsets.bottom,
                                                    ),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(maxHeight: 650),
                                                      child: const SecondTrimester(),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 2, top: 8, bottom: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: AppColors.secondTrimester,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Column(
                                              children: [
                                                Text(
                                                  '2nd Trimester',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Manrope',
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  'Tap here',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Manrope',
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                backgroundColor: AppColors.backgroundColor,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.vertical(
                                                    top: Radius.circular(15),
                                                  ),
                                                ),
                                                isScrollControlled: true,
                                                enableDrag: true,
                                                context: context,
                                                builder: (builder) {
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context).viewInsets.bottom,
                                                    ),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(maxHeight: 650),
                                                      child: const ThirdTrimester(),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 2, top: 8, bottom: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: AppColors.thirdTrimester,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Column(
                                              children: [
                                                Text(
                                                  '3rd Trimester',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Manrope',
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                Text(
                                                  'Tap here',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Manrope',
                                                      color: AppColors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 21,
                                ),
                                TrimesterDuration(
                                  duration: homePageController.getFirstTrimesterDates(),
                                  color: AppColors.firstTrimester,
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                TrimesterDuration(
                                  duration: homePageController.getSecondTrimesterDates(),
                                  color: AppColors.secondTrimester,
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                TrimesterDuration(
                                  duration: homePageController.getThirdTrimesterDates(),
                                  color: AppColors.thirdTrimester,
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                              ])))
                    ],
                  ))),
        ),
      );
    });
  }
}

class TrimesterDuration extends StatelessWidget {
  final String duration;
  final Color color;

  const TrimesterDuration({
    Key? key,
    required this.duration,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Text(
          duration,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 13,
              fontFamily: 'Manrope',
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class HomeCards extends StatefulWidget {
  final String title;
  final Color titleBackgroundColor;
  final Color backgroundColor;
  final String duration;
  final String? icon;
  final Function() onTap;

  final bool? showIcon;

  const HomeCards(
      {super.key,
      required this.title,
      required this.titleBackgroundColor,
      required this.backgroundColor,
      required this.duration,
      this.icon,
      required this.onTap,
      this.showIcon = false});

  @override
  State<HomeCards> createState() {
    return _HomeCardsState();
  }
}

class _HomeCardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 10, bottom: 0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: widget.titleBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 0),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            color: AppColors.secondaryTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      widget.duration,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Manrope',
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              //const SizedBox(width: 14,),
              if (widget.showIcon!) ...[
                const Spacer(),
                SvgPicture.asset(
                  widget.icon ?? AppVectors.pregWomanTwo,
                ),
                const SizedBox(
                  width: 18,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
