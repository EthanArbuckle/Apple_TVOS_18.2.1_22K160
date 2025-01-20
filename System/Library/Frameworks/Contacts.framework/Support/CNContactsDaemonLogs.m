@interface CNContactsDaemonLogs
+ (OS_os_log)accounts;
+ (OS_os_log)accountsCleanup;
+ (OS_os_log)backgroundColors;
+ (OS_os_log)backup;
+ (OS_os_log)exchange;
+ (OS_os_log)launchServices;
+ (OS_os_log)persistence;
+ (OS_os_log)purgeHistory;
+ (OS_os_log)settingsDefaultApps;
+ (OS_os_log)synchronizeContactProviders;
+ (OS_os_log)xpc;
@end

@implementation CNContactsDaemonLogs

+ (OS_os_log)xpc
{
  if (qword_10001F5D0 != -1) {
    dispatch_once(&qword_10001F5D0, &stru_100018B08);
  }
  return (OS_os_log *)(id)qword_10001F5D8;
}

+ (OS_os_log)backup
{
  if (qword_10001F5E0 != -1) {
    dispatch_once(&qword_10001F5E0, &stru_100018B28);
  }
  return (OS_os_log *)(id)qword_10001F5E8;
}

+ (OS_os_log)purgeHistory
{
  if (qword_10001F5F0 != -1) {
    dispatch_once(&qword_10001F5F0, &stru_100018B48);
  }
  return (OS_os_log *)(id)qword_10001F5F8;
}

+ (OS_os_log)launchServices
{
  if (qword_10001F600 != -1) {
    dispatch_once(&qword_10001F600, &stru_100018B68);
  }
  return (OS_os_log *)(id)qword_10001F608;
}

+ (OS_os_log)persistence
{
  if (qword_10001F610 != -1) {
    dispatch_once(&qword_10001F610, &stru_100018B88);
  }
  return (OS_os_log *)(id)qword_10001F618;
}

+ (OS_os_log)exchange
{
  if (qword_10001F620 != -1) {
    dispatch_once(&qword_10001F620, &stru_100018BA8);
  }
  return (OS_os_log *)(id)qword_10001F628;
}

+ (OS_os_log)accounts
{
  if (qword_10001F630 != -1) {
    dispatch_once(&qword_10001F630, &stru_100018BC8);
  }
  return (OS_os_log *)(id)qword_10001F638;
}

+ (OS_os_log)accountsCleanup
{
  if (qword_10001F640 != -1) {
    dispatch_once(&qword_10001F640, &stru_100018BE8);
  }
  return (OS_os_log *)(id)qword_10001F648;
}

+ (OS_os_log)synchronizeContactProviders
{
  if (qword_10001F650 != -1) {
    dispatch_once(&qword_10001F650, &stru_100018C08);
  }
  return (OS_os_log *)(id)qword_10001F658;
}

+ (OS_os_log)backgroundColors
{
  if (qword_10001F660 != -1) {
    dispatch_once(&qword_10001F660, &stru_100018C28);
  }
  return (OS_os_log *)(id)qword_10001F668;
}

+ (OS_os_log)settingsDefaultApps
{
  if (qword_10001F670 != -1) {
    dispatch_once(&qword_10001F670, &stru_100018C48);
  }
  return (OS_os_log *)(id)qword_10001F678;
}

@end