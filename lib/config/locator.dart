import 'package:base_flutter_provider_project/data/repositories/login_repo.dart';
import 'package:base_flutter_provider_project/utils/permission_handler.dart';
import 'package:base_flutter_provider_project/utils/secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/Blog_repo.dart';
import '../data/repositories/Consultation_repo.dart';
import '../data/repositories/Dashboard_repo.dart';
import '../data/repositories/PaymentPlan_repo.dart';
import '../data/repositories/StockBuySell_repo.dart';
import '../data/repositories/advisorReview_repo.dart';
import '../data/repositories/cat_based_blog_repo.dart';
import '../data/repositories/chatroom_repo.dart';
import '../data/repositories/chatusers_repo.dart';
import '../data/repositories/createlisting_repo.dart';
import '../data/repositories/explore_detail_repo.dart';
import '../data/repositories/explore_repo.dart';
import '../data/repositories/faqunlisted_repo.dart';
import '../data/repositories/latesttips_repo.dart';
import '../data/repositories/myTrans_repo.dart';
import '../data/repositories/notificationpage_repo.dart';
import '../data/repositories/onboard_repo.dart';
import '../data/repositories/otp_repo.dart';
import '../data/repositories/portfolio_repo.dart';
import '../data/repositories/profession_repo.dart';
import '../data/repositories/profile_repo.dart';
import '../data/repositories/register_repo.dart';
import '../data/repositories/reward_repo.dart';
import '../data/repositories/search_repo.dart';
import '../data/repositories/social_repo.dart';

final locator = GetIt.instance;

void setupLocator() async {
  //not using locator.registerLazySingleton(() => NavigationService.getInstance());
  locator.registerLazySingleton(() => SecureStorage.getInstance());
  locator.registerLazySingleton(() => PermissionHandler.getInstance());

  //repositories
  locator.registerFactory(() => LoginRepository());
  locator.registerFactory(() => OtpRepository());
  locator.registerFactory(() => RegisterRepository());
  locator.registerFactory(() => DashboardRepository());
  locator.registerFactory(() => SocialRepository());
  locator.registerFactory(() => SearchRepository());
  locator.registerFactory(() => ExploreRepository());
  locator.registerFactory(() => ExploreDetailRepository());
  locator.registerFactory(() => LatestTipsRepository());
  locator.registerFactory(() => BlogsRepository());
  locator.registerFactory(() => CatBasedBlogsRepository());
  locator.registerFactory(() => ChatRoomRepository());
  locator.registerFactory(() => ChatUsersRepository());
  locator.registerFactory(() => ProfileRepository());
  locator.registerFactory(() => ProfessionRepository());
  locator.registerFactory(() => CreateListRepository());
  locator.registerFactory(() => BuySellRepository());
  locator.registerFactory(() => MyTransRepository());
  locator.registerFactory(() => PortfolioRepository());
  locator.registerFactory(() => RewardRepository());
  locator.registerFactory(() => OnBoardRepository());
  locator.registerFactory(() => PaymentPlanRepository());
  locator.registerFactory(() => NotificationPageRepository());
  locator.registerFactory(() => AdvisorReviewRepository());
  locator.registerFactory(() => FAQunlistedRepository());
  locator.registerFactory(() => ConsultationRepository());

  // final SharedPrefs sharedPrefs = await SharedPrefs.getInstance();
  // locator.registerSingleton(sharedPrefs);
}
