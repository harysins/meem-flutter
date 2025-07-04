import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/bot/bot_screen.dart';
import '../screens/projects/projects_library_screen.dart';
import '../screens/projects/create_project_screen.dart';
import '../screens/feasibility/feasibility_questionnaire_screen.dart';
import '../screens/feasibility/feasibility_report_screen.dart';
import '../screens/marketing/marketing_dashboard_screen.dart';
import '../screens/marketing/ad_generator_screen.dart';
import '../screens/marketing/competitor_analysis_screen.dart';
import '../screens/marketing/social_share_screen.dart';
import '../screens/funding/funding_list_screen.dart';
import '../screens/funding/funding_details_screen.dart';
import '../screens/funding/internal_investment_screen.dart';
import '../screens/profile/user_profile_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/location/country_city_selection_screen.dart';

class AppRoutes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String botRoute = '/bot';
  static const String projectsLibraryRoute = '/projects_library';
  static const String createProjectRoute = '/create_project';
  static const String feasibilityQuestionnaireRoute = '/feasibility_questionnaire';
  static const String feasibilityReportRoute = '/feasibility_report';
  static const String marketingDashboardRoute = '/marketing_dashboard';
  static const String adGeneratorRoute = '/ad_generator';
  static const String competitorAnalysisRoute = '/competitor_analysis';
  static const String socialShareRoute = '/social_share';
  static const String fundingListRoute = '/funding_list';
  static const String fundingDetailsRoute = '/funding_details';
  static const String internalInvestmentRoute = '/internal_investment';
  static const String userProfileRoute = '/user_profile';
  static const String settingsRoute = '/settings';
  static const String notificationsRoute = '/notifications';
  static const String searchRoute = '/search';
  static const String countryCitySelectionRoute = '/country_city_selection';

  static Map<String, WidgetBuilder> routes = {
    splashRoute: (context) => SplashScreen(),
    loginRoute: (context) => LoginScreen(),
    registerRoute: (context) => RegisterScreen(),
    homeRoute: (context) => HomeScreen(),
    botRoute: (context) => BotScreen(),
    projectsLibraryRoute: (context) => ProjectsLibraryScreen(),
    createProjectRoute: (context) => CreateProjectScreen(),
    feasibilityQuestionnaireRoute: (context) => FeasibilityQuestionnaireScreen(),
    feasibilityReportRoute: (context) => FeasibilityReportScreen(),
    marketingDashboardRoute: (context) => MarketingDashboardScreen(),
    adGeneratorRoute: (context) => AdGeneratorScreen(),
    competitorAnalysisRoute: (context) => CompetitorAnalysisScreen(),
    socialShareRoute: (context) => SocialShareScreen(),
    fundingListRoute: (context) => FundingListScreen(),
    fundingDetailsRoute: (context) => FundingDetailsScreen(),
    internalInvestmentRoute: (context) => InternalInvestmentScreen(),
    userProfileRoute: (context) => UserProfileScreen(),
    settingsRoute: (context) => SettingsScreen(),
    notificationsRoute: (context) => NotificationsScreen(),
    searchRoute: (context) => SearchScreen(),
    countryCitySelectionRoute: (context) => CountryCitySelectionScreen(),
  };
}
