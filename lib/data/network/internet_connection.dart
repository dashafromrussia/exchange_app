import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@lazySingleton
class InternetConnectionService{
  final InternetConnection _connectivity;
  InternetConnectionService(this._connectivity);

  Stream<InternetStatus> get isConnection => _connectivity.onStatusChange;
  InternetConnection get internetConnection=> _connectivity;

}