@interface IMDLegacyLaunchAssistant
+ (void)logLaunchInfo;
- (BOOL)hasDeviceName;
- (void)postAliveNotification;
- (void)prewarmHSAAuthenticationServer;
- (void)registerForInternalCoreTelephonyNotifications;
@end

@implementation IMDLegacyLaunchAssistant

- (void)prewarmHSAAuthenticationServer
{
  id v2 = +[HSAAuthenticationServer sharedInstance](&OBJC_CLASS___HSAAuthenticationServer, "sharedInstance");
}

- (BOOL)hasDeviceName
{
  id v2 = (const void *)MGCopyAnswer(@"DeviceName", 0LL);
  v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0LL;
}

- (void)postAliveNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, kFZDaemonLaunchedDistNotification, 0LL, 0LL, 0LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", kFZDaemonFinishedLaunchingNotification, 0);
}

- (void)registerForInternalCoreTelephonyNotifications
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  [v2 _registerForInternalCoreTelephonyNotifications];
}

+ (void)logLaunchInfo
{
  if (IMOSLoggingEnabled(a1, a2))
  {
    uint64_t v2 = OSLogHandleForIMEventCategory("Daemon");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      v5 = (char *)objc_claimAutoreleasedReturnValue([v4 deviceInformationString]);
      int v12 = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "imagent launching (%@)", (uint8_t *)&v12, 0xCu);
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v7 = [v6 isInternalInstall];

  if (v7 && IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v10 = OSLogHandleForIMEventCategory("Daemon");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "Nov 10 2024";
      __int16 v14 = 2080;
      v15 = "03:21:49";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "imagent built %s %s", (uint8_t *)&v12, 0x16u);
    }
  }

@end