class Env {
  Env._();
  static const String pusherAppKey = 'ae04039e538cc2a64ea8';
  static const String pusherCluster = 'mt1';

  // channels
  static String notificationChannel(int userId) => "private-notifications.$userId";

}