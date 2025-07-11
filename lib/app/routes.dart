import 'package:flutter/material.dart';
import 'package:karsome/screens/customer/cart/cart_screen.dart';
import 'package:karsome/screens/customer/customer_support/customer_support_screen.dart';
import 'package:karsome/screens/customer/order_history/order_history_details_rating_screen.dart';
import 'package:karsome/screens/customer/order_history/order_history_screen.dart';
import 'package:karsome/screens/main_page/widgets/customer_product_list_screen.dart';
import 'package:karsome/screens/main_page/widgets/order_payment.dart';
import 'package:karsome/screens/main_page/widgets/order_success.dart';
import 'package:karsome/screens/owner/owner_dashboard/owner_dashboard_screen.dart';
import 'package:karsome/screens/owner/view_detail_order/order_detail_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/main_page/main_page_screen.dart';
import '../screens/owner/add_product/add_product_screen.dart';
import '../screens/owner/edit_product/edit_product_screen.dart';
import '../screens/owner/owner_mainpage/owner_mainpage_screen.dart';
import '../screens/owner/view_product/view_product_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/reset_password/reset_password_screen.dart';
import '../screens/signin/sign_in_screen.dart';

class Routes {
  static const String homeRoute = '/home';
  static const String register = '/register';
  static const String signIn = '/signin';
  static const String selection = '/selection';
  static const String profile = '/profile';
  static const String main_page = '/mainpage';
  static const String reset = '/reset';
  static const String owner_mainpage = '/CookBox';
  static const String owner_addProduct = '/addProduct';
  static const String owner_editProduct = '/editProduct';
  static const String owner_viewProduct = '/owner_viewProduct';
  static const String customer_product_list = '/customer_product_list';
  static const String cartScreen = '/cart_screen';
  static const String order_summary = '/order_summary';
  static const String support_email = '/support_email';
  static const String customer_history = '/customer_history';
  static const String order_success = '/customer_order_success';
  static const String order_payment = '/customer_order_payment';
  static const String owner_dashboard = '/owner_dashboard';
  static const String customer_order_details_rating =
      '/customer_order_details_rating';

  static Route<dynamic>? createRoute(settings) {
    switch (settings.name) {
      case homeRoute:
        // if(something here to validate or protect our routes for example)
        return HomeScreen.route();
      case register:
        return RegisterScreen.route();
      case signIn:
        return SignInScreen.route();
      case profile:
        return ProfileScreen.route();
      case main_page:
        return MainPageScreen.route();
      case reset:
        return ResetPasswordScreen.route();
      case owner_mainpage:
        return OwnerMainPageScreen.route();
      case owner_addProduct:
        return OwnerAddProductScreen.route();
      case owner_editProduct:
        return OwnerEditProductScreen.route();
      case owner_viewProduct:
        return OwnerViewProductScreen.route();
      case customer_product_list:
        return CustomerViewProductsScreen.route();
      case cartScreen:
        return CartScreen.route();
      case order_summary:
        return OrderDetailScreen.route();
      case customer_history:
        return CustomerHistoryScreen.route();
      case order_success:
        return OrderSuccessPage.route();
      case order_payment:
        return OrderPaymentPage.route();
      case order_payment:
        return OrderDetailsRatingScreen.route();
      case owner_dashboard:
        return OwnerDashboardScreen.route();
      case support_email:
        return CustomerSupportScreen.route();
      default:
    }
    return null;
    // return Selection.route();
  }
}
