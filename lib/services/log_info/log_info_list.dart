import 'package:shopping/services/log_info/log_info.dart';

class LogInfoList {
  static List<LogInfo> logInfos = [];


  void updateLogInfo(List<LogInfo> newLogs) {
    logInfos..addAll(newLogs);
  }

}
