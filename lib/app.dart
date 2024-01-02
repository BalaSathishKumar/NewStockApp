import 'package:base_flutter_provider_project/common_widgets/Stock_widgets/TrendingStocks.dart';
import 'package:base_flutter_provider_project/constants/strings.dart';
import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:base_flutter_provider_project/ui/PortFolio/portfoliopage.dart';
import 'package:base_flutter_provider_project/ui/explore/exploreDetail.dart';
import 'package:base_flutter_provider_project/ui/explore/exploreFilter.dart';
import 'package:base_flutter_provider_project/ui/home/homepage.dart';
import 'package:base_flutter_provider_project/ui/Register/RegisterPage.dart';
import 'package:base_flutter_provider_project/ui/splash/splash.dart';
import 'package:base_flutter_provider_project/ui/welcome/welcome.dart';
import 'package:base_flutter_provider_project/utils/app_bar_theme.dart';
import 'package:base_flutter_provider_project/viewModel/AdvisorReview_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/ChatRoom_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/ChatUsers_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/CommonProvider.dart';
import 'package:base_flutter_provider_project/viewModel/Consultation_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/CreateList_ViewModel.dart';
import 'package:base_flutter_provider_project/viewModel/MyTransView_Model.dart';
import 'package:base_flutter_provider_project/viewModel/Reward_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/base_view_model/FAQunlisted_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/blogs_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/buy_Sell_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/cat_based_blogs_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/dashboard_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/explore_detail_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/explore_view_model.dart';

import 'package:base_flutter_provider_project/viewModel/latest_tips_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/login_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/notificationpage_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/onboard_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/otp_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/paymentPlan_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/performViewModel.dart';
import 'package:base_flutter_provider_project/viewModel/portfolio_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/profession_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/profile_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/register_viewmodel.dart';
import 'package:base_flutter_provider_project/viewModel/search_view_model.dart';
import 'package:base_flutter_provider_project/viewModel/social_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'common_widgets/Stock_widgets/StockSections.dart';
import 'common_widgets/tablayout/tab_with_border.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  final _appRouter = AppRouter();
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counterr>(
        create: (BuildContext ctx) => Counterr()),
        ChangeNotifierProvider<GoogleSignInProvider>(
        create: (BuildContext ctx) => GoogleSignInProvider()),
        ChangeNotifierProvider<DropOptions>(
            create: (BuildContext ctx) => DropOptions()),

        ChangeNotifierProvider<TrendingDropOptions>(
            create: (BuildContext ctx) => TrendingDropOptions()),

        ChangeNotifierProvider<TrendingDropOptions2>(
            create: (BuildContext ctx) => TrendingDropOptions2()),

        ChangeNotifierProvider<TrendingDropOptions3>(
            create: (BuildContext ctx) => TrendingDropOptions3()),

        ChangeNotifierProvider<exploreFiltervalues>(
            create: (BuildContext ctx) => exploreFiltervalues()),
        ChangeNotifierProvider<exploreFilterToBy>(
            create: (BuildContext ctx) => exploreFilterToBy()),

        ChangeNotifierProvider<exploreFilterSF>(
            create: (BuildContext ctx) => exploreFilterSF()),

        ChangeNotifierProvider<FilterPriceSelect>(
            create: (BuildContext ctx) => FilterPriceSelect()),

        ChangeNotifierProvider<FilterPriceSelect2>(
            create: (BuildContext ctx) => FilterPriceSelect2()),

        ChangeNotifierProvider<FilterPriceSelect3>(
            create: (BuildContext ctx) => FilterPriceSelect3()),

        ChangeNotifierProvider<FilterPriceSelect4>(
            create: (BuildContext ctx) => FilterPriceSelect4()),

        ChangeNotifierProvider<FilterPriceSelect5>(
            create: (BuildContext ctx) => FilterPriceSelect5()),

        ChangeNotifierProvider<FilterPriceSelect6>(
            create: (BuildContext ctx) => FilterPriceSelect6()),

        ChangeNotifierProvider<FilterPriceSelect7>(
            create: (BuildContext ctx) => FilterPriceSelect7()),

        ChangeNotifierProvider<buystockbutn>(
            create: (BuildContext ctx) => buystockbutn()),
        ChangeNotifierProvider<UserageProvider>(
            create: (BuildContext ctx) => UserageProvider()),
        ChangeNotifierProvider<UserNameProvider>(
            create: (BuildContext ctx) => UserNameProvider()),
        ChangeNotifierProvider<UserEmailProvider>(
            create: (BuildContext ctx) => UserEmailProvider()),

        ChangeNotifierProvider<portfolioBoolProvider>(
            create: (BuildContext ctx) => portfolioBoolProvider()),
        ChangeNotifierProvider<LoginViewModel>(
          create: (BuildContext ctx) => LoginViewModel(),),
        ChangeNotifierProvider<OtpViewModel>(
            create: (BuildContext ctx) => OtpViewModel()),
        ChangeNotifierProvider<RegisterViewModel>(
            create: (BuildContext ctx) => RegisterViewModel()),
        ChangeNotifierProvider<DashboardViewModel>(
            create: (BuildContext ctx) => DashboardViewModel()),
        ChangeNotifierProvider<ProfessionViewModel>(
            create: (BuildContext ctx) => ProfessionViewModel()),
        ChangeNotifierProvider<SocialViewModel>(
            create: (BuildContext ctx) => SocialViewModel()),
        ChangeNotifierProvider<SearchViewModel>(
            create: (BuildContext ctx) => SearchViewModel()),
        ChangeNotifierProvider<ExploreViewModel>(
            create: (BuildContext ctx) => ExploreViewModel()),
        ChangeNotifierProvider<PerformViewModel>(
            create: (BuildContext ctx) => PerformViewModel()),
        ChangeNotifierProvider<ExploreDetailViewModel>(
            create: (BuildContext ctx) => ExploreDetailViewModel()),
        ChangeNotifierProvider<LatestTipsViewModel>(
            create: (BuildContext ctx) => LatestTipsViewModel()),
        ChangeNotifierProvider<selectblogprovider>(
            create: (BuildContext ctx) => selectblogprovider()),
        ChangeNotifierProvider<BlogsViewModel>(
            create: (BuildContext ctx) => BlogsViewModel()),
        ChangeNotifierProvider<CatBasedBlogsViewModel>(
            create: (BuildContext ctx) => CatBasedBlogsViewModel()),
        ChangeNotifierProvider<ChatRoomViewModel>(
            create: (BuildContext ctx) => ChatRoomViewModel()),
        ChangeNotifierProvider<CommonProvider>(
            create: (BuildContext ctx) => CommonProvider()),
        ChangeNotifierProvider<ProfileViewModel>(
            create: (BuildContext ctx) => ProfileViewModel()),
        ChangeNotifierProvider<ChatUsersViewModel>(
            create: (BuildContext ctx) => ChatUsersViewModel()),
        ChangeNotifierProvider<CreateListViewModel>(
            create: (BuildContext ctx) => CreateListViewModel()),
        ChangeNotifierProvider<BuySellViewModel>(
            create: (BuildContext ctx) => BuySellViewModel()),
        ChangeNotifierProvider<MyTransViewModel>(
            create: (BuildContext ctx) => MyTransViewModel()),
        ChangeNotifierProvider<MyPortfolioViewModel>(
            create: (BuildContext ctx) => MyPortfolioViewModel()),
        ChangeNotifierProvider<RewardViewModel>(
            create: (BuildContext ctx) => RewardViewModel()),
        ChangeNotifierProvider<OnboardViewModel>(
            create: (BuildContext ctx) => OnboardViewModel()),
        ChangeNotifierProvider<PaymentPlanViewModel>(
            create: (BuildContext ctx) => PaymentPlanViewModel()),
        ChangeNotifierProvider<NotificationPageViewModel>(
            create: (BuildContext ctx) => NotificationPageViewModel()),
        ChangeNotifierProvider<AdvisorReviewViewModel>(
            create: (BuildContext ctx) => AdvisorReviewViewModel()),
        ChangeNotifierProvider<FAQunlistedViewModel>(
            create: (BuildContext ctx) => FAQunlistedViewModel()),
        ChangeNotifierProvider<ConsultationViewModel>(
            create: (BuildContext ctx) => ConsultationViewModel()),

      ],
      child: OverlaySupport(
        child: MaterialApp(
          title: Strings.appName,
        //  routeInformationParser: _appRouter.defaultRouteParser(),
     //   routerDelegate: _appRouter.delegate(
         //   initialRoutes: [const SplashRoute()],
     //   ),


          theme: ThemeData(
            primaryColor: ThemeColor.Primary,
            appBarTheme: appBarThemeData(),
          ),
         /* builder: (context, router){
            return ScreenUtilInit(
                builder: (BuildContext context, Widget? child) {
              return child!;
            },
            child: router);
          },*/
          home: Splash(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

//TODO add firebase analytics
// navigatorObservers: <NavigatorObserver>cons[
// FirebaseAnalyticsObserver(analytics: analytics),
// ],
