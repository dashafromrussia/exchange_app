// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:untitled4/app_module_injectable.dart' as _i457;
import 'package:untitled4/data/network/api_exchange_client.dart' as _i13;
import 'package:untitled4/data/network/internet_connection.dart' as _i315;
import 'package:untitled4/data/repository/exchange_repository_impl.dart'
    as _i84;
import 'package:untitled4/data/service/exchange_service.dart' as _i25;
import 'package:untitled4/data/service/exchange_service_impl.dart' as _i791;
import 'package:untitled4/domain/repository/exchange_repository.dart' as _i673;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i161.InternetConnection>(() => appModule.connectivity);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i13.ApiExchangeClient>(
        () => _i13.ApiExchangeClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i315.InternetConnectionService>(
        () => _i315.InternetConnectionService(gh<_i161.InternetConnection>()));
    gh.lazySingleton<_i25.ExchangeService>(() => _i791.ExchangeServiceImpl(
          gh<_i13.ApiExchangeClient>(),
          gh<_i460.SharedPreferences>(),
          gh<_i315.InternetConnectionService>(),
        ));
    gh.lazySingleton<_i673.ExchangeRepository>(
        () => _i84.ExchangeRepositoryImpl(gh<_i25.ExchangeService>()));
    return this;
  }
}

class _$AppModule extends _i457.AppModule {}
