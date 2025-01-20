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
    if (systemInfo_isInternalBuild())
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
      unsigned __int8 v4 = [v3 BOOLForKey:@"BypassTrustDialog"];
    }

    else
    {
      unsigned __int8 v4 = 0;
    }
  }

  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __40__ACCAuthorizationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_7 != -1) {
    dispatch_once(&sharedManager_once_7, block);
  }
  return (id)sharedManager_sharedInstance_7;
}

void __40__ACCAuthorizationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance_7;
  sharedManager_sharedInstance_7 = (uint64_t)v1;
}

+ (unint64_t)authorizationStatusForCertSerial:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  unsigned int v5 = [v4 bypassAuthorization];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      unint64_t v6 = 2LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "[#AuthorizationManager] Bypassing user authorization...",  v10,  2u);
    }

    else
    {
      unint64_t v6 = 2LL;
    }
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
  id v11 = a6;
  uint64_t v12 = +[ACCAuthorizationManager authorizationStatusForCertSerial:]( &OBJC_CLASS___ACCAuthorizationManager,  "authorizationStatusForCertSerial:",  v9);
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = __102__ACCAuthorizationManager_requestAuthorizationForCertSerial_withName_providesPower_completionHandler___block_invoke;
    v22[3] = &unk_1001FD4E0;
    id v23 = v9;
    id v24 = v10;
    BOOL v26 = a5;
    id v25 = v11;
    dispatch_async(v21, v22);

    goto LABEL_7;
  }

  +[ACCAuthorizationManager requestAuthorizationForCertSerial:withName:providesPower:completionHandler:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
  if (!v12) {
    goto LABEL_6;
  }
LABEL_3:
  if (v11) {
    (*((void (**)(id, BOOL))v11 + 2))(v11, v12 == 2);
  }
LABEL_7:
}

id __102__ACCAuthorizationManager_requestAuthorizationForCertSerial_withName_providesPower_completionHandler___block_invoke( uint64_t a1)
{
  return +[ACCAuthorizationManager forceRequestAuthorizationForCertSerial:withName:providesPower:completionHandler:]( &OBJC_CLASS___ACCAuthorizationManager,  "forceRequestAuthorizationForCertSerial:withName:providesPower:completionHandler:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 48));
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
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___ACCAccessoryAuthorizationEntry);
    -[ACCAccessoryAuthorizationEntry setCertSerialString:](v12, "setCertSerialString:", v14);
    -[ACCAccessoryAuthorizationEntry setAuthorized:](v12, "setAuthorized:", 1LL);
    if (v9) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = &stru_100200A40;
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
  uint64_t v9 = acc_strings_bundle(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"“%@” Would Like to Communicate With Your %@" value:&stru_100200A40 table:0]);
  uint64_t v12 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v7, v12));

  uint64_t v15 = acc_strings_bundle(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"This accessory may access information from your %@ when connected." value:&stru_100200A40 table:0]);
  uint64_t v18 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v18));

  v68 = v7;
  if (!v7 || (id v20 = [v7 length]) == 0)
  {
    uint64_t v21 = acc_strings_bundle(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"An Accessory Would Like to Communicate With Your %@" value:&stru_100200A40 table:0]);
    id v24 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v24));

    uint64_t v27 = acc_strings_bundle(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"The attached accessory may access information from your %@ when connected." value:&stru_100200A40 table:0]);
    v30 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v29, v30));

    uint64_t v13 = (void *)v25;
    uint64_t v19 = (void *)v31;
  }

  v71[0] = kCFUserNotificationAlertHeaderKey;
  v71[1] = kCFUserNotificationAlertMessageKey;
  v66 = v19;
  v67 = v13;
  v72[0] = v13;
  v72[1] = v19;
  v71[2] = kCFUserNotificationDefaultButtonTitleKey;
  uint64_t v32 = acc_strings_bundle(v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 localizedStringForKey:@"Trust" value:&stru_100200A40 table:0]);
  v72[2] = v34;
  v71[3] = kCFUserNotificationAlternateButtonTitleKey;
  uint64_t v35 = acc_strings_bundle(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = v36;
  if (v6) {
    v38 = @"Charge Only";
  }
  else {
    v38 = @"Don’t Trust";
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue([v36 localizedStringForKey:v38 value:&stru_100200A40 table:0]);
  v72[3] = v39;
  v71[4] = kCFUserNotificationAlertTopMostKey;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v72[4] = v40;
  v71[5] = SBUserNotificationDismissOnLock;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v72[5] = v41;
  v71[6] = SBUserNotificationDontDismissOnUnlock;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v72[6] = v42;
  v71[7] = kCFUserNotificationIconURLKey;
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/PreferencePanes/Security.prefPane/Contents/Resources/FileVault.icns"));
  v72[7] = v43;
  v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  8LL));

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 notificationDictMutable]);
  v47 = (__CFUserNotification *)[v46 objectForKey:v8];

  if (v47) {
    CFUserNotificationCancel(v47);
  }
  SInt32 error = -1431655766;
  v48 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v44);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 notificationDictMutable]);
  [v50 setObject:v48 forKey:v8];

  CFOptionFlags responseFlags = 0xAAAAAAAAAAAAAAAALL;
  CFUserNotificationReceiveResponse(v48, 0.0, &responseFlags);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v51 notificationDictMutable]);
  int v53 = CFEqual([v52 objectForKey:v8], v48);

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAuthorizationManager sharedManager](&OBJC_CLASS___ACCAuthorizationManager, "sharedManager"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 notificationDictMutable]);
    [v55 removeObjectForKey:v8];
  }

  CFRelease(v48);
  uint64_t v56 = 1LL;
  if (responseFlags != 1) {
    uint64_t v56 = 2LL;
  }
  if (responseFlags) {
    unint64_t v57 = v56;
  }
  else {
    unint64_t v57 = 0LL;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    +[ACCAuthorizationManager promptUserForAuthorizationOfAccessoryWithName:providesPower:certSerial:].cold.1( v57,  v58,  v59,  v60,  v61,  v62,  v63,  v64);
  }

  return v57;
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

+ (void)requestAuthorizationForCertSerial:(uint64_t)a3 withName:(uint64_t)a4 providesPower:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)promptUserForAuthorizationOfAccessoryWithName:(uint64_t)a3 providesPower:(uint64_t)a4 certSerial:(uint64_t)a5 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end