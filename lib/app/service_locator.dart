import 'package:map_mvvm/service_locator.dart';
import 'package:karsome/services/user/user_service.dart';
import '../screens/main_page/main_page_viewmodel.dart';
import '../screens/owner/add_product/add_product_view_model.dart';
import '../screens/register/register_viewmodel.dart';
import '../screens/signin/sign_in_viewmodel.dart';
import '../services/initializer/service_initializer.dart';
import '../services/product/product_service.dart';
import '../services/services.dart';
import '../services/storage/storage_service.dart';
import '../screens/profile/profile_viewmodel.dart';

final locator = ServiceLocator.locator;

Future<void> initializeServiceLocator() async {
  // In case of using Firebase services, Firebase must be initialized first before the service locator,
  //  because viewmodels may need to access firebase during the creation of the objects.

  // To comply with Dependency Inversion, the Firebase.initializeApp() is called in a dedicated service file.
  //  So that, if you want to change to different services (other than Firebase), you can do so by simply
  //  defining another ServiceInitializer class.

  // await Firebase.initializeApp();

  // Register first and then run immediately
  locator.registerLazySingleton<ServiceInitializer>(
      () => ServiceInitializerFirebase());

  final serviceInitializer = locator<ServiceInitializer>();
  await serviceInitializer.init();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth();

  // Register Services
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
  locator.registerLazySingleton<UserService>(() => UserService());

  // Register Viewmodels
  locator.registerLazySingleton<RegisterViewModel>(() => RegisterViewModel());
  locator.registerLazySingleton<SignInViewModel>(() => SignInViewModel());
  locator.registerLazySingleton<MainPageViewModel>(() => MainPageViewModel());
  locator.registerLazySingleton<ProfileViewModel>(() => ProfileViewModel());
  locator
      .registerLazySingleton<AddProductViewModel>(() => AddProductViewModel());
}
