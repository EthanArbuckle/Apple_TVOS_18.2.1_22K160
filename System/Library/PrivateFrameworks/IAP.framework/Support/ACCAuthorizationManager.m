@interface ACCAuthorizationManager
+ (id)sharedManager;
+ (unint64_t)authorizationStatusForCertSerial:(id)a3;
+ (unint64_t)promptUserForAuthorizationOfAccessoryWithName:(id)a3 providesPower:(BOOL)a4 certSerial:(id)a5;
+ (void)forceRequestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6;
+ (void)requestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6;
- (ACCAuthorizationManager)init;
- (BOOL)bypassAuthorization;
- (NSMutableDictionary)notificationDictMutable;
- (void)setBypassAuthorization:(BOOL)a3;
- (void)setNotificationDictMutable:(id)a3;
@end

@implementation ACCAuthorizationManager

- (ACCAuthorizationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCAuthorizationManager;
  v2 = -[ACCAuthorizationManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notificationDictMutable = v2->_notificationDictMutable;
    v2->_notificationDictMutable = v3;
  }

  return v2;
}

- (BOOL)bypassAuthorization
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  if ([v2 BOOLForKey:@"EnableTrustDialog"])
  {
    if (qword_10011BC48 != -1) {
      dispatch_once(&qword_10011BC48, &stru_1001038C8);
    }
    if ((byte_10011BC40 & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
      unsigned __int8 v3 = [v4 BOOLForKey:@"BypassTrustDialog"];
    }

    else
    {
      unsigned __int8 v3 = 0;
    }
  }

  else
  {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028EFC;
  block[3] = &unk_100101CB8;
  block[4] = a1;
  if (qword_10011BC58 != -1) {
    dispatch_once(&qword_10011BC58, block);
  }
  return (id)qword_10011BC50;
}

+ (unint64_t)authorizationStatusForCertSerial:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  unsigned int v5 = [v4 bypassAuthorization];

  if (v5)
  {
    NSLog(@"Bypassing user authorization...");
    unint64_t v6 = 2LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "authorizationEntryForCertSerial:",  v3));
    v8 = v7;
    if (v7)
    {
      else {
        unint64_t v6 = 1LL;
      }
    }

    else
    {
      unint64_t v6 = 0LL;
    }
  }

  return v6;
}

+ (void)requestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, BOOL))a6;
  unint64_t v12 = +[ACCAuthorizationManager authorizationStatusForCertSerial:]( &OBJC_CLASS___ACCAuthorizationManager,  "authorizationStatusForCertSerial:",  v9);
  NSLog(@"authorizationStatus: %lu", v12);
  if (v12)
  {
    if (v11) {
      v11[2](v11, v12 == 2);
    }
    goto LABEL_6;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(global_queue);
  if (v14)
  {
    v15 = (dispatch_queue_s *)v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000290F4;
    block[3] = &unk_1001038F0;
    id v17 = v9;
    id v18 = v10;
    BOOL v20 = a5;
    v19 = v11;
    dispatch_async(v15, block);

LABEL_6:
    return;
  }

  __break(0x5510u);
}

+ (void)forceRequestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v9 = (__CFString *)a4;
  id v10 = (void (**)(id, BOOL))a6;
  unint64_t v11 = +[ACCAuthorizationManager promptUserForAuthorizationOfAccessoryWithName:providesPower:certSerial:]( &OBJC_CLASS___ACCAuthorizationManager,  "promptUserForAuthorizationOfAccessoryWithName:providesPower:certSerial:",  v9,  v7,  v14);
  if (v14 && [v14 length] && !v11)
  {
    unint64_t v12 = objc_alloc_init(&OBJC_CLASS___ACCAccessoryAuthorizationEntry);
    -[ACCAccessoryAuthorizationEntry setCertSerialString:](v12, "setCertSerialString:", v14);
    -[ACCAccessoryAuthorizationEntry setAuthorized:](v12, "setAuthorized:", 1LL);
    if (v9) {
      v13 = v9;
    }
    else {
      v13 = &stru_10010A828;
    }
    -[ACCAccessoryAuthorizationEntry setDisplayName:](v12, "setDisplayName:", v13);
    +[ACCAccessoryAuthorizationStore storeAccessory:]( &OBJC_CLASS___ACCAccessoryAuthorizationStore,  "storeAccessory:",  v12);
  }

  if (v10) {
    v10[2](v10, v11 == 0);
  }
}

+ (unint64_t)promptUserForAuthorizationOfAccessoryWithName:(id)a3 providesPower:(BOOL)a4 certSerial:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_100028CF8(@"ACC_AUTHORIZATION_NOTIFICATION_HEADER");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unint64_t v11 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v7, v11));

  id v13 = sub_100028CF8(@"ACC_AUTHORIZATION_NOTIFICATION_MESSAGE");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v15));

  v49 = v7;
  if (!v7 || ![v7 length])
  {
    id v17 = sub_100028CF8(@"ACC_AUTHORIZATION_NOTIFICATION_HEADER_NO_NAME");
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v19));

    id v21 = sub_100028CF8(@"ACC_AUTHORIZATION_NOTIFICATION_MESSAGE_NO_NAME");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v23));

    unint64_t v12 = (void *)v20;
    v16 = (void *)v24;
  }

  v52[0] = kCFUserNotificationAlertHeaderKey;
  v52[1] = kCFUserNotificationAlertMessageKey;
  v53[0] = v12;
  v53[1] = v16;
  v52[2] = kCFUserNotificationDefaultButtonTitleKey;
  id v25 = sub_100028CF8(@"ACC_AUTHORIZATION_NOTIFICATION_ALLOW");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v53[2] = v26;
  v52[3] = kCFUserNotificationAlternateButtonTitleKey;
  if (v6) {
    v27 = @"ACC_AUTHORIZATION_NOTIFICATION_CHARGE_ONLY";
  }
  else {
    v27 = @"ACC_AUTHORIZATION_NOTIFICATION_DONT_ALLOW";
  }
  id v28 = sub_100028CF8(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v53[3] = v29;
  v52[4] = kCFUserNotificationAlertTopMostKey;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v53[4] = v30;
  v52[5] = SBUserNotificationDismissOnLock;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v53[5] = v31;
  v52[6] = SBUserNotificationDontDismissOnUnlock;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v53[6] = v32;
  v52[7] = kCFUserNotificationIconURLKey;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/PreferencePanes/Security.prefPane/Contents/Resources/FileVault.icns"));
  v53[7] = v33;
  v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  8LL));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 notificationDictMutable]);
  v37 = (__CFUserNotification *)[v36 objectForKey:v8];

  if (v37) {
    CFUserNotificationCancel(v37);
  }
  SInt32 error = -1431655766;
  v38 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 notificationDictMutable]);
  [v40 setObject:v38 forKey:v8];

  CFOptionFlags responseFlags = 0xAAAAAAAAAAAAAAAALL;
  CFUserNotificationReceiveResponse(v38, 0.0, &responseFlags);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 notificationDictMutable]);
  int v43 = CFEqual([v42 objectForKey:v8], v38);

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 notificationDictMutable]);
    [v45 removeObjectForKey:v8];
  }

  CFRelease(v38);
  uint64_t v46 = 1LL;
  if (responseFlags != 1) {
    uint64_t v46 = 2LL;
  }
  if (responseFlags) {
    unint64_t v47 = v46;
  }
  else {
    unint64_t v47 = 0LL;
  }
  NSLog(@"promptResponse: %lu", v47);

  return v47;
}

- (void)setBypassAuthorization:(BOOL)a3
{
  self->_bypassAuthorization = a3;
}

- (NSMutableDictionary)notificationDictMutable
{
  return self->_notificationDictMutable;
}

- (void)setNotificationDictMutable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end