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
    as _i16;
import '../../data/datasources/remote/source/auth_data_source.dart' as _i19;
import '../../data/datasources/remote/source/cart_data_source.dart' as _i22;
import '../../data/datasources/remote/source/product_data_source.dart' as _i9;
import '../../data/datasources/remote/source/transaction_data_source.dart'
    as _i13;
import '../../data/repositories/auth_repository_impl.dart' as _i21;
import '../../data/repositories/cart_repository_impl.dart' as _i24;
import '../../data/repositories/product_repository_impl.dart' as _i11;
import '../../data/repositories/transaction_repository_impl.dart' as _i15;
import '../../data/repositories/user_credentials_repository_impl.dart' as _i18;
import '../../domain/repositories/auth_repository.dart' as _i20;
import '../../domain/repositories/cart_repository.dart' as _i23;
import '../../domain/repositories/product_repository.dart' as _i10;
import '../../domain/repositories/transaction_repository.dart' as _i14;
import '../../domain/repositories/user_credentials_repository.dart' as _i17;
import '../../domain/usescases/auth/login.dart' as _i25;
import '../../domain/usescases/auth/logout.dart' as _i26;
import '../../presentation/pages/cart/cart_notifier.dart' as _i4;
import '../../presentation/pages/detail/detail_notifier.dart' as _i6;
import '../../presentation/pages/home/home_notifier.dart' as _i7;
import '../../presentation/pages/login/login_notifier.dart' as _i8;
import '../../presentation/pages/profile/profile_notifier.dart' as _i12;
import '../router/router.dart' as _i3;
import 'register_module.dart' as _i27;

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
    gh.factory<_i7.HomeNotifier>(() => _i7.HomeNotifier());
    gh.factory<_i8.LoginNotifier>(() => _i8.LoginNotifier());
    gh.lazySingleton<_i9.ProductDataSource>(
        () => _i9.ProductDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i10.ProductRepository>(
        () => _i11.ProductRepositoryImpl(gh<_i9.ProductDataSource>()));
    gh.factory<_i12.ProfileNotifier>(() => _i12.ProfileNotifier());
    gh.lazySingleton<_i13.TransactionDataSource>(
        () => _i13.TransactionDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i14.TransactionRepository>(
        () => _i15.TransactionRepositoryImpl(gh<_i13.TransactionDataSource>()));
    gh.lazySingleton<_i16.UserCredentialsDataSource>(
        () => _i16.UserCredentialsDataSourceImpl());
    gh.lazySingleton<_i17.UserCredentialsRepository>(() =>
        _i18.UserCredentialsRepositoryImpl(
            gh<_i16.UserCredentialsDataSource>()));
    gh.lazySingleton<_i19.AuthDataSource>(
        () => _i19.AuthDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i20.AuthRepository>(
        () => _i21.AuthRepositoryImpl(gh<_i19.AuthDataSource>()));
    gh.lazySingleton<_i22.CartDataSource>(
        () => _i22.CartDataSourceImpl(gh<_i5.Client>()));
    gh.lazySingleton<_i23.CartRepository>(
        () => _i24.CartRepositoryImpl(gh<_i22.CartDataSource>()));
    gh.lazySingleton<_i25.LogIn>(() => _i25.LogIn(
          gh<_i20.AuthRepository>(),
          gh<_i17.UserCredentialsRepository>(),
        ));
    gh.lazySingleton<_i26.LogOut>(() => _i26.LogOut(
          gh<_i20.AuthRepository>(),
          gh<_i17.UserCredentialsRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}
