@interface BackupConfigurationService
+ (BOOL)checkBackupConfiguration;
+ (BOOL)checkBackupConfigurationWithFileManager:(id)a3 url:(id)a4 tccServices:(id)a5;
+ (BOOL)hasLocalContactsWithError:(id *)a3;
+ (const)activityIdentifier;
+ (void)run;
@end

@implementation BackupConfigurationService

+ (const)activityIdentifier
{
  return "com.apple.contactsd.BackupConfigurationService";
}

+ (void)run
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000E4D4(a1, v3);
  }

  if (([a1 checkBackupConfiguration] & 1) == 0)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000E43C(a1, v4);
    }
  }

+ (BOOL)checkBackupConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/AddressBook"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNTCCFactory defaultTCC](&OBJC_CLASS___CNTCCFactory, "defaultTCC"));
  LOBYTE(a1) = [a1 checkBackupConfigurationWithFileManager:v3 url:v4 tccServices:v5];

  return (char)a1;
}

+ (BOOL)checkBackupConfigurationWithFileManager:(id)a3 url:(id)a4 tccServices:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = (unint64_t)[a5 checkAuthorizationStatusOfCurrentProcess];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    unint64_t v23 = v9;
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "TCC access is not granted, CNTCC status is %@",  buf,  0xCu);
    }

    goto LABEL_13;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  unsigned __int8 v11 = [v7 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Database folder does not exist.", buf, 2u);
    }

+ (BOOL)hasLocalContactsWithError:(id *)a3
{
  CFErrorRef error = 0LL;
  ABAddressBookRef v4 = ABAddressBookCreateWithOptions(0LL, &error);
  if (v4)
  {
    v5 = v4;
    char HasLocalContent = ABAddressBookHasLocalContent();
    CFRelease(v5);
  }

  else
  {
    CFErrorRef v7 = error;
    if (a3) {
      *a3 = error;
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000E7B4((uint64_t)v7, v8, v9);
    }

    return 0;
  }

  return HasLocalContent;
}

@end