import 'package:dairy_calculator/logic/location/location_cubit.dart';
import 'package:dairy_calculator/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appRoutes = Routes();
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Dairy Calculator',
            routeInformationParser: appRoutes.router.routeInformationParser,
            routeInformationProvider: appRoutes.router.routeInformationProvider,
            routerDelegate: appRoutes.router.routerDelegate,
          );
        },
      ),
    );
  }
}
import 'package:baap_event/constants/app_colors.dart';
import 'package:baap_event/constants/app_sizes.dart';
import 'package:baap_event/logic/visitor_status/visitor_status_cubit.dart';
import 'package:baap_event/utils/app_utils/app_utils.dart';
import 'package:baap_event/utils/routes/routes.dart';
import 'package:baap_event/widgets/event_widgets/gate_pass_widget.dart';
import 'package:baap_event/widgets/in_app_web_view_screen.dart';
import 'package:baap_event/widgets/sizedbox_widget.dart';
import 'package:baap_event/widgets/text_widget.dart';
import 'package:baap_event/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<VisitorExistCubit, VisitorExistState>(
        builder: (context, state) {
          bool expoVisitorExists =
              state.visitorStatus?.expoVisitorExists ?? false;
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              bottomNavigationBar: Container(
                padding: EdgeInsets.only(
                  left: AppSizes.horizontalPadding15px,
                  bottom: AppSizes.horizontalPadding15px,
                  right: AppSizes.horizontalPadding15px,
                ),
                color: AppColors.backgroundDark,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBoxWidget(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Made in Paregaon LIVE with ",
                              color: Colors.grey,
                              fontSize: 13.sp,
                            ),
                            TextWidget(
                              text: "Pride",
                              color: const Color(0XFFE676A4),
                              fontSize: 12.sp,
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const InAppWebViewVidget(
                                    categoryName: 'Terms & Conditions',
                                    url:
                                        'https://content.baapmarket.com/policy');
                              },
                            );
                          },
                          child: TextWidget(
                            text: "Disclaimer ",
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              resizeToAvoidBottomInset: true,
              backgroundColor: AppColors.backgroundDark,
              appBar: AppBar(
                systemOverlayStyle: systemOverLayStyle,
                surfaceTintColor: Colors.white10,
                iconTheme: const IconThemeData(
                  color: AppColors.whiteColor,
                ),
                automaticallyImplyLeading: true,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.push(Routes.homePageScreen);
                  },
                ),
                backgroundColor: AppColors.backgroundDark,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextWidget(
                    text: "प्रतिसाद द्या",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                titleSpacing: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxWidget(
                        height: 10.h,
                      ),
                      Container(
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(
                                text:
                                    "ग्रामोन्नती मंडळ कृषी विज्ञान केंद्र, नारायणगाव आयोजित  ",
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              TextWidget(
                                text: "ग्लोबल कृषी महोत्सव, 2024",
                                color: const Color(0XFFC8E676),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const TextWidget(
                                text: "दिनांक - 8 ते 11 फेब्रुवारी 2024 ",
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBoxWidget(
                        height: 15.w,
                      ),
                      SizedBox(
                        height: 556.h,
                        child: _FeedbackFormWidget(),
                        
                        /*TabBarView(
                          children: [
                            expoVisitorExists
                                ? Center(
                                    child: InkWell(
                                    onTap: () {},
                                  ))
                                : _FeedbackFormWidget(),
                            expoVisitorExists
                                ? const GatePassWidget()
                                : Center(
                                    child: InkWell(
                                    onTap: () {},
                                  )),
                          ],
                        ),*/
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _FeedbackFormWidget() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                child: TextformFieldWidget(
                  fontSize: 18.sp,
                  hintText: 'प्रतिसाद टाइप करा',
                  controller: _textEditingController,
                  maxLine: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    height: 46.h,
                    width: 115.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.borderColor.withOpacity(0.5),
                    ),
                    child: const Center(
                      child: TextWidget(
                        text: 'प्रतिसाद द्या',
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
/feedback form