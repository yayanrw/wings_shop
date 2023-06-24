// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/local/source/user_credentials_data_source.dart'
    as _i11;
import '../../data/datasources/remote/source/auth_data_source.dart' as _i14;
import '../../data/datasources/remote/source/cart_data_source.dart' as _i17;
import '../../data/datasources/remote/source/product_data_source.dart' as _i24;
import '../../data/datasources/remote/source/transaction_data_source.dart'
    as _i8;
import '../../data/repositories/auth_repository_impl.dart' as _i16;
import '../../data/repositories/cart_repository_impl.dart' as _i19;
import '../../data/repositories/product_repository_impl.dart' as _i26;
import '../../data/repositories/transaction_repository_impl.dart' as _i10;
import '../../data/repositories/user_credentials_repository_impl.dart' as _i13;
import '../../domain/repositories/auth_repository.dart' as _i15;
import '../../domain/repositories/cart_repository.dart' as _i18;
import '../../domain/repositories/product_repository.dart' as _i25;
import '../../domain/repositories/transaction_repository.dart' as _i9;
import '../../domain/repositories/user_credentials_repository.dart' as _i12;
import '../../domain/usescases/auth/login.dart' as _i21;
import '../../domain/usescases/auth/logout.dart' as _i22;
import '../../domain/usescases/user_credentials/get_token.dart' as _i20;
import '../../presentation/pages/cart/cart_notifier.dart' as _i4;
import '../../presentation/pages/detail/detail_notifier.dart' as _i6;
import '../../presentation/pages/home/home_notifier.dart' as _i27;
import '../../presentation/pages/login/login_notifier.dart' as _i23;
import '../../presentation/pages/profile/profile_notifier.dart' as _i7;
import '../router/router.dart' as _i3;
import 'register_module.dart' as _i28;

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
    gh.factory<_i4.CartNotifier>(() => _i4.CartNotifier());
    gh.lazySingleton<_i5.Client>(() => registerModule.httpClient);
    gh.factory<_i6.DetailNotifier>(() => _i6.DetailNotifier());
    gh.factory<_i7.ProfileNotifier>(() => _i7.ProfileNotifier());
    gh.lazySingleton<_i8.TransactionDataSource>(
        () => _i8.TransactionDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i9.TransactionRepository>(
        () => _i10.TransactionRepositoryImpl(gh<_i8.TransactionDataSource>()));
    gh.lazySingleton<_i11.UserCredentialsDataSource>(
        () => _i11.UserCredentialsDataSourceImpl());
    gh.lazySingleton<_i12.UserCredentialsRepository>(() =>
        _i13.UserCredentialsRepositoryImpl(
            gh<_i11.UserCredentialsDataSource>()));
    gh.lazySingleton<_i14.AuthDataSource>(
        () => _i14.AuthDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i15.AuthRepository>(
        () => _i16.AuthRepositoryImpl(gh<_i14.AuthDataSource>()));
    gh.lazySingleton<_i17.CartDataSource>(
        () => _i17.CartDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i18.CartRepository>(
        () => _i19.CartRepositoryImpl(gh<_i17.CartDataSource>()));
    gh.lazySingleton<_i20.GetToken>(
        () => _i20.GetToken(gh<_i12.UserCredentialsRepository>()));
    gh.lazySingleton<_i21.LogIn>(() => _i21.LogIn(
          gh<_i15.AuthRepository>(),
          gh<_i12.UserCredentialsRepository>(),
        ));
    gh.lazySingleton<_i22.LogOut>(() => _i22.LogOut(
          gh<_i15.AuthRepository>(),
          gh<_i12.UserCredentialsRepository>(),
        ));
    gh.factory<_i23.LoginNotifier>(() => _i23.LoginNotifier(
          gh<_i21.LogIn>(),
          gh<_i12.UserCredentialsRepository>(),
        ));
    gh.lazySingleton<_i24.ProductDataSource>(() => _i24.ProductDataSourceImpl(
          gh<_i5.Client>(),
          gh<_i20.GetToken>(),
        ));
    gh.lazySingleton<_i25.ProductRepository>(
        () => _i26.ProductRepositoryImpl(gh<_i24.ProductDataSource>()));
    gh.factory<_i27.HomeNotifier>(() => _i27.HomeNotifier(
          gh<_i25.ProductRepository>(),
          gh<_i20.GetToken>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i28.RegisterModule {}
