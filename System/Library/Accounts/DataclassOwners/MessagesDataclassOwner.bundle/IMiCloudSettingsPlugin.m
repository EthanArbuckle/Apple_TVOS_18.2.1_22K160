@interface IMiCloudSettingsPlugin
+ (id)dataclasses;
- (BOOL)checkEligibilityWithError:(id *)a3;
- (BOOL)eligibleToToggleMiCSwitch;
- (BOOL)hasSetupListener;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6 withError:(id *)a7;
- (BOOL)purchasedMaxQuotaTier;
- (BOOL)setCloudEnable:(BOOL)a3;
- (id)_deviceNameString;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5;
- (int64_t)_disablementOptionForUserNotificationResponse:(id)a3;
- (int64_t)_promptUserIfTheyWantToDisableOrCancel;
- (void)_setupIMListener;
- (void)didPerformAdditionalStorageRequiredCheck:(id)a3;
- (void)didPerformEligibilityCheck:(id)a3;
- (void)performAdditionalStorageRequiredCheck;
- (void)setEnabledDidReturned:(id)a3;
- (void)setHasSetupListener:(BOOL)a3;
@end

@implementation IMiCloudSettingsPlugin

+ (id)dataclasses
{
  if (IMOSLoggingEnabled(a1, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "dataclasses request: kAccountDataclassMessages", v5, 2u);
    }
  }

  uint64_t v6 = kAccountDataclassMessages;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v6,  1LL));
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return 0LL;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  v9 = (__CFString *)a4;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_INFO,  "actionsForDisablingDataclassOnAccount for dataclass: %@",  buf,  0xCu);
    }
  }

  int64_t v13 = -[IMiCloudSettingsPlugin _promptUserIfTheyWantToDisableOrCancel](self, "_promptUserIfTheyWantToDisableOrCancel");
  int64_t v15 = v13;
  if (v13 == 2)
  {
    if (IMOSLoggingEnabled(2LL, v14))
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "User indicated that they want to disable MiC on all devices via alert.",  buf,  2u);
      }
    }

    -[IMiCloudSettingsPlugin _setupIMListener](self, "_setupIMListener");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance"));
    [v18 tryToDisableAllDevices];
  }

  unint64_t v19 = v15 - 1;
  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = @"NO";
      if (v19 < 2) {
        v22 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v28 = v22;
      __int16 v29 = 2048;
      int64_t v30 = v15;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "User has chosen to disable Messages in iCloud: %@ disablement option: {%ld}",  buf,  0x16u);
    }
  }

  if (v19 > 1)
  {
    if (a5)
    {
      v24 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.messages",  0LL,  0LL));
      goto LABEL_23;
    }

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "actionsForEnablingDataclassOnAccount: %@", buf, 0xCu);
    }
  }

  id v13 = [v9 isEqualToString:kAccountDataclassMessages];
  if (!(_DWORD)v13) {
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "actionsForEnablingDataclassOnAccount", buf, 2u);
    }
  }

  if (-[IMiCloudSettingsPlugin checkEligibilityWithError:](self, "checkEligibilityWithError:", a5))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACDataclassAction actionWithType:](&OBJC_CLASS___ACDataclassAction, "actionWithType:", 5LL));
    uint64_t v20 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  }

  else
  {
LABEL_12:
    v18 = 0LL;
  }

  return v18;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412546;
      id v30 = v12;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "perform action: %@ for dataclass: %@", (uint8_t *)&v29, 0x16u);
    }
  }

  byte_C868 = 0;
  qword_C870 = 0LL;
  uint64_t v19 = kAccountDataclassMessages;
  if (![v15 isEqualToString:kAccountDataclassMessages]
    || [v12 type] != (char *)&dword_4 + 1)
  {
    goto LABEL_14;
  }

  if (IMOSLoggingEnabled(5LL, v20))
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v29) = 0;
      _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "ACDataclassActionMergeLocalDataIntoSyncData action was called, requesting to enable Message in iCloud",  (uint8_t *)&v29,  2u);
    }
  }

  if (-[IMiCloudSettingsPlugin checkEligibilityWithError:](self, "checkEligibilityWithError:", a7))
  {
    uint64_t v23 = 1LL;
  }

  else
  {
LABEL_14:
    if (![v15 isEqualToString:v19] || objc_msgSend(v12, "type") != (char *)&dword_0 + 2)
    {
      BOOL v27 = 0;
      goto LABEL_22;
    }

    if (IMOSLoggingEnabled(2LL, v24))
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "ACDataclassActionMergeSyncDataIntoLocalData action was called requesting to disable Message in iCloud",  (uint8_t *)&v29,  2u);
      }
    }

    uint64_t v23 = 0LL;
  }

  BOOL v27 = -[IMiCloudSettingsPlugin setCloudEnable:](self, "setCloudEnable:", v23);
LABEL_22:

  return v27;
}

- (id)_deviceNameString
{
  uint64_t v2 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport marketingNameForModel:](&OBJC_CLASS___IMDeviceSupport, "marketingNameForModel:", v2));

  return v3;
}

- (int64_t)_promptUserIfTheyWantToDisableOrCancel
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Prompting user to ensure they really want to disable", buf, 2u);
    }
  }

  v5 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___IMiCloudSettingsPlugin));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"DISABLE_MIC_MESSAGE_FORMAT" value:&stru_8260 table:@"IMiCloudSettingsPlugin"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMiCloudSettingsPlugin _deviceNameString](self, "_deviceNameString"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  id v11 = sub_3D58(@"DISABLE_MIC_TITLE");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = sub_3D58(@"DISABLE_MIC_CONFIRM");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = sub_3D58(@"DISABLE_MIC_CANCEL");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  v10,  v12,  v9,  v14,  v16,  0LL));

  *(void *)buf = 0LL;
  v38 = buf;
  uint64_t v39 = 0x2020000000LL;
  char v40 = 0;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  int64_t v18 = -1LL;
  uint64_t v36 = -1LL;
  if (v17)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_4A20;
    v32[3] = &unk_8218;
    v32[4] = self;
    v32[5] = &v33;
    v32[6] = buf;
    [v19 addUserNotification:v17 listener:0 completionHandler:v32];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    if (IMOSLoggingEnabled(v20, v21))
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v31 = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Spinning runloop until user makes a selection", v31, 2u);
      }
    }

    uint64_t v24 = IMRemoteObjectsRunLoopMode;
    do
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.5));
      [v20 runMode:v24 beforeDate:v25];
    }

    while (!v38[24]);
    if (IMOSLoggingEnabled(v26, v27))
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v31 = 0;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Finished Blocking, user has interacted with alert.", v31, 2u);
      }
    }

    int64_t v18 = v34[3];
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

- (BOOL)checkEligibilityWithError:(id *)a3
{
  BOOL v5 = -[IMiCloudSettingsPlugin eligibleToToggleMiCSwitch](self, "eligibleToToggleMiCSwitch");
  if (v5
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance")),
        unsigned __int8 v8 = [v7 mocAccountsMatch],
        v7,
        (v8 & 1) != 0))
  {
    -[IMiCloudSettingsPlugin performAdditionalStorageRequiredCheck](self, "performAdditionalStorageRequiredCheck");
    if (!qword_C870) {
      return 1;
    }
    BOOL v9 = -[IMiCloudSettingsPlugin purchasedMaxQuotaTier](self, "purchasedMaxQuotaTier");
    BOOL v10 = v9;
    int v12 = IMOSLoggingEnabled(v9, v11);
    if (v10)
    {
      if (v12)
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v30 = qword_C870;
          _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "User has already purchased max quota tier, additional storage required: %llu",  buf,  0xCu);
        }
      }

      uint64_t v27 = AADataclassActionUserInfoLibrarySize;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  qword_C870));
      uint64_t v28 = v15;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));

      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AADataclassActionErrorDomain,  2LL,  v16));
      }
    }

    else
    {
      if (v12)
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v30 = qword_C870;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Additional storage required: %llu", buf, 0xCu);
        }
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  qword_C870,  AADataclassActionUserInfoLibrarySize));
      uint64_t v26 = v23;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));

      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AADataclassActionErrorDomain,  0LL,  v24));
      }
    }
  }

  else
  {
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      int64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Not eligible as account does not support DeviceToDeviceEncryption, or iCloud & iMsg accounts do not match up",  buf,  2u);
      }
    }

    if (a3)
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AADataclassActionErrorDomain,  1LL,  0LL));
      BOOL result = 0;
      *a3 = v19;
      return result;
    }
  }

  return 0;
}

- (void)_setupIMListener
{
  if (!-[IMiCloudSettingsPlugin hasSetupListener](self, "hasSetupListener"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance"));
    [v3 setupIMCloudKitHooks];

    -[IMiCloudSettingsPlugin setHasSetupListener:](self, "setHasSetupListener:", 1LL);
  }

- (BOOL)setCloudEnable:(BOOL)a3
{
  BOOL v3 = a3;
  -[IMiCloudSettingsPlugin _setupIMListener](self, "_setupIMListener");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance"));
  unsigned int v6 = [v5 isEnabled];

  if (v6 != v3)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    BOOL v10 = (void *)qword_C878;
    qword_C878 = (uint64_t)v9;

    dispatch_time_t v11 = dispatch_time(0LL, 3000000000LL);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:self selector:"setEnabledDidReturned:" name:IMCloudKitHooksSetEnabledReturned object:0];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance"));
    [v13 setEnabled:v3];

    uint64_t v14 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_C878, v11);
    int v16 = IMOSLoggingEnabled(v14, v15);
    if (v14)
    {
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
        int64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v23 = 67109120;
          int v24 = byte_C868;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Timeout enable_semaphore, didSucceed: %d", (uint8_t *)&v23, 8u);
        }

- (void)performAdditionalStorageRequiredCheck
{
  id v3 = -[IMiCloudSettingsPlugin _setupIMListener](self, "_setupIMListener");
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "performAdditionalStorageRequiredCheck", (uint8_t *)&v18, 2u);
    }
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = (void *)qword_C880;
  qword_C880 = (uint64_t)v7;

  dispatch_time_t v9 = dispatch_time(0LL, 3000000000LL);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 addObserver:self selector:"didPerformAdditionalStorageRequiredCheck:" name:IMCloudKitHooksAdditionalStorageCheckReturned object:0];

  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance"));
  [v11 performAdditionalStorageRequiredCheck];

  uint64_t v12 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_C880, v9);
  LODWORD(v11) = v12 == 0;
  int v14 = IMOSLoggingEnabled(v12, v13);
  if ((_DWORD)v11)
  {
    if (!v14) {
      return;
    }
    uint64_t v17 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 134217984;
      uint64_t v19 = qword_C870;
      _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Signal has_storage_semaphore, additionalStorageRequired: %llu",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    if (!v14) {
      return;
    }
    uint64_t v15 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 134217984;
      uint64_t v19 = qword_C870;
      _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Timeout storage_semaphore, additionalStorageRequired: %llu",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (BOOL)eligibleToToggleMiCSwitch
{
  byte_C888 = IMCloudKitIsEligibleToToggleMiCSwitch(self, a2);
  if ((byte_C888 & 1) == 0)
  {
    -[IMiCloudSettingsPlugin _setupIMListener](self, "_setupIMListener");
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    uint64_t v4 = (void *)qword_C890;
    qword_C890 = (uint64_t)v3;

    dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory("IMiCloudSettingsPlugin");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "Since we are not eligible, fetching security level to check we are up to date",  (uint8_t *)&v21,  2u);
      }
    }

    dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v9 addObserver:self selector:"didPerformEligibilityCheck:" name:IMCloudKitHooksValuesChanged object:0];

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMCloudKitHooks sharedInstance](&OBJC_CLASS___IMCloudKitHooks, "sharedInstance"));
    [v10 fetchAccountStatusAndUpdateMiCSwitchEligibility];

    uint64_t v11 = dispatch_semaphore_wait((dispatch_semaphore_t)qword_C890, v5);
    if (v11)
    {
      uint64_t IsEligibleToToggleMiCSwitch = IMCloudKitIsEligibleToToggleMiCSwitch(v11, v12);
      byte_C888 = IsEligibleToToggleMiCSwitch;
      if (IMOSLoggingEnabled(IsEligibleToToggleMiCSwitch, v14))
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory("IMCloudSettingsPlugin");
        int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          if (byte_C888) {
            uint64_t v17 = @"YES";
          }
          else {
            uint64_t v17 = @"NO";
          }
          int v21 = 138412290;
          uint64_t v22 = v17;
          _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "Timeout eligible_semaphore, isEligible: %@",  (uint8_t *)&v21,  0xCu);
        }

- (void)didPerformEligibilityCheck:(id)a3
{
  id v4 = a3;
  uint64_t IsEligibleToToggleMiCSwitch = IMCloudKitIsEligibleToToggleMiCSwitch(v4, v5);
  byte_C888 = IsEligibleToToggleMiCSwitch;
  if (IMOSLoggingEnabled(IsEligibleToToggleMiCSwitch, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("IMiCloudSettingsPlugin");
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (byte_C888) {
        BOOL v10 = @"YES";
      }
      else {
        BOOL v10 = @"NO";
      }
      int v12 = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Updated eligibility to %@", (uint8_t *)&v12, 0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 removeObserver:self];

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C890);
}

- (void)didPerformAdditionalStorageRequiredCheck:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "didPerformAdditionalStorageRequiredCheck with userInfo: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IMCloudKitHooksResultAdditionalStorageRequiredUserInfoKey]);
  qword_C870 = (uint64_t)[v9 longLongValue];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 removeObserver:self];

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C880);
}

- (void)setEnabledDidReturned:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "setEnabledDidReturned with result: %@", (uint8_t *)&v11, 0xCu);
    }
  }

  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:IMCloudKitHooksResultSuccessUserInfoKey]);
  byte_C868 = [v9 BOOLValue];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v10 removeObserver:self];

  dispatch_semaphore_signal((dispatch_semaphore_t)qword_C878);
}

- (BOOL)purchasedMaxQuotaTier
{
  uint64_t v23 = 0LL;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  dispatch_time_t v3 = dispatch_time(0LL, 3000000000LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryAppleAccount"));

  id v6 = [[AAQuotaInfoRequest alloc] initDetailedRequestWithAccount:v5];
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "requestQuota %@", buf, 0xCu);
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_5CF4;
  v20[3] = &unk_8240;
  uint64_t v22 = &v23;
  BOOL v10 = v2;
  int v21 = v10;
  [v6 performRequestWithHandler:v20];
  uint64_t v11 = dispatch_semaphore_wait(v10, v3);
  if (v11)
  {
    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("CKiCloudSettingsPlugin");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = *((unsigned __int8 *)v24 + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v15;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Timeout has_max_tier_semaphore, hasMaxTier: %d", buf, 8u);
      }

- (int64_t)_disablementOptionForUserNotificationResponse:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 response];
  if (v3 > 3) {
    return -1LL;
  }
  else {
    return qword_6848[v3];
  }
}

- (BOOL)hasSetupListener
{
  return self->_hasSetupListener;
}

- (void)setHasSetupListener:(BOOL)a3
{
  self->_hasSetupListener = a3;
}

@end