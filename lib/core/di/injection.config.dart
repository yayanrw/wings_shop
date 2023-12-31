// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/local/source/user_credentials_data_source.dart'
    as _i5;
import '../../data/datasources/remote/source/auth_data_source.dart' as _i16;
import '../../data/datasources/remote/source/cart_data_source.dart' as _i19;
import '../../data/datasources/remote/source/product_data_source.dart' as _i9;
import '../../data/datasources/remote/source/transaction_data_source.dart'
    as _i13;
import '../../data/repositories/auth_repository_impl.dart' as _i18;
import '../../data/repositories/cart_repository_impl.dart' as _i21;
import '../../data/repositories/product_repository_impl.dart' as _i11;
import '../../data/repositories/transaction_repository_impl.dart' as _i15;
import '../../data/repositories/user_credentials_repository_impl.dart' as _i7;
import '../../domain/repositories/auth_repository.dart' as _i17;
import '../../domain/repositories/cart_repository.dart' as _i20;
import '../../domain/repositories/product_repository.dart' as _i10;
import '../../domain/repositories/transaction_repository.dart' as _i14;
import '../../domain/repositories/user_credentials_repository.dart' as _i6;
import '../../domain/usescases/auth/login.dart' as _i24;
import '../../domain/usescases/auth/logout.dart' as _i25;
import '../../domain/usescases/user_credentials/get_token.dart' as _i8;
import '../../presentation/pages/cart/cart_notifier.dart' as _i28;
import '../../presentation/pages/detail/detail_notifier.dart' as _i22;
import '../../presentation/pages/home/home_notifier.dart' as _i23;
import '../../presentation/pages/login/login_notifier.dart' as _i26;
import '../../presentation/pages/profile/profile_notifier.dart' as _i27;
import '../../presentation/pages/search/search_notifier.dart' as _i12;
import '../router/router.dart' as _i3;
import 'register_module.dart' as _i29;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(registerModule.appRouter);
    gh.lazySingleton<_i4.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i5.UserCredentialsDataSource>(
        () => _i5.UserCredentialsDataSourceImpl());
    gh.lazySingleton<_i6.UserCredentialsRepository>(() =>
        _i7.UserCredentialsRepositoryImpl(gh<_i5.UserCredentialsDataSource>()));
    gh.lazySingleton<_i8.GetToken>(
        () => _i8.GetToken(gh<_i6.UserCredentialsRepository>()));
    gh.lazySingleton<_i9.ProductDataSource>(() => _i9.ProductDataSourceImpl(
          gh<_i4.Client>(),
          gh<_i8.GetToken>(),
        ));
    gh.lazySingleton<_i10.ProductRepository>(
        () => _i11.ProductRepositoryImpl(gh<_i9.ProductDataSource>()));
    gh.factory<_i12.SearchNotifier>(
        () => _i12.SearchNotifier(gh<_i10.ProductRepository>()));
    gh.lazySingleton<_i13.TransactionDataSource>(
        () => _i13.TransactionDataSourceImpl(
              gh<_i4.Client>(),
              gh<_i8.GetToken>(),
            ));
    gh.lazySingleton<_i14.TransactionRepository>(
        () => _i15.TransactionRepositoryImpl(gh<_i13.TransactionDataSource>()));
    gh.lazySingleton<_i16.AuthDataSource>(() => _i16.AuthDataSourceImpl(
          gh<_i4.Client>(),
          gh<_i8.GetToken>(),
        ));
    gh.lazySingleton<_i17.AuthRepository>(
        () => _i18.AuthRepositoryImpl(gh<_i16.AuthDataSource>()));
    gh.lazySingleton<_i19.CartDataSource>(() => _i19.CartDataSourceImpl(
          gh<_i4.Client>(),
          gh<_i8.GetToken>(),
        ));
    gh.lazySingleton<_i20.CartRepository>(
        () => _i21.CartRepositoryImpl(gh<_i19.CartDataSource>()));
    gh.factory<_i22.DetailNotifier>(
        () => _i22.DetailNotifier(gh<_i20.CartRepository>()));
    gh.factory<_i23.HomeNotifier>(() => _i23.HomeNotifier(
          gh<_i10.ProductRepository>(),
          gh<_i8.GetToken>(),
        ));
    gh.lazySingleton<_i24.LogIn>(() => _i24.LogIn(
          gh<_i17.AuthRepository>(),
          gh<_i6.UserCredentialsRepository>(),
        ));
    gh.lazySingleton<_i25.LogOut>(() => _i25.LogOut(
          gh<_i17.AuthRepository>(),
          gh<_i6.UserCredentialsRepository>(),
        ));
    gh.factory<_i26.LoginNotifier>(() => _i26.LoginNotifier(
          gh<_i24.LogIn>(),
          gh<_i6.UserCredentialsRepository>(),
        ));
    gh.factory<_i27.ProfileNotifier>(() => _i27.ProfileNotifier(
          gh<_i6.UserCredentialsRepository>(),
          gh<_i25.LogOut>(),
        ));
    gh.factory<_i28.CartNotifier>(() => _i28.CartNotifier(
          gh<_i20.CartRepository>(),
          gh<_i14.TransactionRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i29.RegisterModule {}
