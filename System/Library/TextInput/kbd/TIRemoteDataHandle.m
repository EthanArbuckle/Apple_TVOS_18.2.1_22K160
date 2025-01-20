@interface TIRemoteDataHandle
+ (BOOL)shouldAcceptRequestForMeCardWithAuditToken:(id *)a3;
+ (id)localDictionaryPath;
+ (id)localizedStringForKey:(id)a3;
- (TITextCheckerExemptions)textCheckerExemptions;
- (id)notificationDetailsForType:(int64_t)a3;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)alternativesForText:(id)a3 completionHandler:(id)a4;
- (void)appendWordToTextCheckerLocalDictionary:(id)a3;
- (void)dismissDialogWithCompletionHandler:(id)a3;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)ingestSentence:(id)a3 language:(id)a4 phraseRanges:(id)a5;
- (void)launchDictationSettings;
- (void)launchKeyboardSettings;
- (void)launchPencilSettings;
- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4;
- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)removeAllDynamicDictionariesWithCompletionHandler:(id)a3;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4;
- (void)requestMeCardWithCompletionHandler:(id)a3;
- (void)requestMeContactWithCompletionHandler:(id)a3;
- (void)requestTextCheckerLocalDictionaryWithCompletionHandler:(id)a3;
- (void)string:(id)a3 isExemptFromTextCheckerWithCompletionHandler:(id)a4;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)updateForActiveLocaleIdentifiers:(id)a3;
- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4;
@end

@implementation TIRemoteDataHandle

+ (BOOL)shouldAcceptRequestForMeCardWithAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  *(void *)cf.val = 0LL;
  v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, @"com.apple.TextInput.rdt.me", (CFErrorRef *)&cf);
  if (v6)
  {
    v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }

  else
  {
    if (*(void *)cf.val)
    {
      if (TICanLogMessageAtLevel(0LL))
      {
        uint64_t v10 = TIOSLogFacility();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10000B4C4((uint64_t *)&cf);
        }
      }

      CFRelease(*(CFTypeRef *)cf.val);
    }

    BOOL v9 = 0;
  }

  CFRelease(v5);
  return v9;
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v7 start];

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v8 requestLinguisticAssetsForLanguage:v6 completion:v5];
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v16 start];

  id v17 = (id)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v17 addLinguisticAssetsAssertionForLanguage:v15 assertionID:v14 region:v13 clientID:v12 withHandler:v11];
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v10 removeLinguisticAssetsAssertionWithIdentifier:v9 forClientID:v8 withHandler:v7];
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v7 fetchAssetUpdateStatusForInputModeIdentifier:v6 callback:v5];
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[TILinguisticAssetDownloadServer sharedServer]( &OBJC_CLASS___TILinguisticAssetDownloadServer,  "sharedServer"));
  [v7 updateAssetForInputModeIdentifier:v6 callback:v5];
}

- (void)requestMeCardWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  unsigned __int8 v6 = +[TIRemoteDataHandle shouldAcceptRequestForMeCardWithAuditToken:]( &OBJC_CLASS___TIRemoteDataHandle,  "shouldAcceptRequestForMeCardWithAuditToken:",  v11);

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100009170;
    v9[3] = &unk_100014AB8;
    id v10 = v3;
    TIGetMeCardAsync(v9);
  }

  else
  {
    if (TICanLogMessageAtLevel(0LL))
    {
      uint64_t v7 = TIOSLogFacility();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10000B560();
      }
    }

    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

- (void)requestMeContactWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v5 = v4;
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  unsigned __int8 v6 = +[TIRemoteDataHandle shouldAcceptRequestForMeCardWithAuditToken:]( &OBJC_CLASS___TIRemoteDataHandle,  "shouldAcceptRequestForMeCardWithAuditToken:",  v11);

  if ((v6 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000093D4;
    v9[3] = &unk_100014AB8;
    id v10 = v3;
    TIGetMeCardAsync(v9);
  }

  else
  {
    if (TICanLogMessageAtLevel(0LL))
    {
      uint64_t v7 = TIOSLogFacility();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10000B618();
      }
    }

    (*((void (**)(id, void))v3 + 2))(v3, 0LL);
  }
}

- (void)launchKeyboardSettings
{
  sub_1000094B0(@"prefs:root=General&path=Keyboard", 0LL);
}

- (void)launchDictationSettings
{
  sub_1000094B0(@"prefs:root=General&path=Keyboard/DictationSettings", 0LL);
}

- (void)launchPencilSettings
{
  v3[0] = @"__UnlockDevice";
  v3[1] = @"__PromptUnlockDevice";
  v4[0] = &__kCFBooleanTrue;
  v4[1] = &__kCFBooleanTrue;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
  sub_1000094B0(@"prefs:root=Pencil", v2);
}

- (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2 object:self file:@"TIRemoteDataServer.m" lineNumber:410 description:@"Required completion handler is missing"];
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009708;
  v10[3] = &unk_100014AE0;
  v10[4] = self;
  id v11 = v7;
  int64_t v12 = a3;
  id v8 = v7;
  TIDispatchAsync(&_dispatch_main_q, v10);
}

- (id)notificationDetailsForType:(int64_t)a3
{
  id v5 = (void *)objc_opt_class(self);
  if (a3)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"EXTENSION_OPT_IN_TITLE"]);
    id v7 = [(id)objc_opt_class(self) localizedStringForKey:@"EXTENSION_OPT_IN_MESSAGE"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [(id)objc_opt_class(self) localizedStringForKey:@"EXTENSION_OPT_IN_ADD"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [(id)objc_opt_class(self) localizedStringForKey:@"DICTATION_OPT_IN_ABOUT"];
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = [(id)objc_opt_class(self) localizedStringForKey:@"DICTATION_OPT_IN_NOT_NOW"];
    id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  }

  else
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"DICTATION_OPT_IN_TITLE"]);
    id v15 = [(id)objc_opt_class(self) localizedStringForKey:@"DICTATION_OPT_IN_ABOUT"];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v42 = 0LL;
    v43 = &v42;
    uint64_t v44 = 0x2020000000LL;
    id v17 = (uint64_t (*)(void))off_10001E2D0;
    v45 = off_10001E2D0;
    if (!off_10001E2D0)
    {
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472LL;
      v39 = sub_10000A900;
      v40 = &unk_100014750;
      v41 = &v42;
      sub_10000A900((uint64_t)&v37);
      id v17 = (uint64_t (*)(void))v43[3];
    }

    _Block_object_dispose(&v42, 8);
    if (!v17) {
      sub_10000B754();
    }
    uint64_t v18 = v17();
    v19 = (void *)objc_opt_class(self);
    if (v18 == 10) {
      v20 = @"DICTATION_OPT_IN_MESSAGE_ON_DEVICE_DICTATION_CAPABLE";
    }
    else {
      v20 = @"DICTATION_OPT_IN_MESSAGE";
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v20]);
    uint64_t v42 = 0LL;
    v43 = &v42;
    uint64_t v44 = 0x2050000000LL;
    v21 = (void *)qword_10001E2E0;
    v45 = (void *)qword_10001E2E0;
    if (!qword_10001E2E0)
    {
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472LL;
      v39 = sub_10000A9D8;
      v40 = &unk_100014750;
      v41 = &v42;
      sub_10000A9D8((uint64_t)&v37);
      v21 = (void *)v43[3];
    }

    id v22 = v21;
    _Block_object_dispose(&v42, 8);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleWithIdentifier:@"com.apple.onboarding.siri"]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 privacyFlow]);
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 localizedButtonTitle]);
    v26 = (void *)v25;
    if (v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = v16;
    }
    id v14 = v27;

    id v28 = [(id)objc_opt_class(self) localizedStringForKey:@"DICTATION_OPT_IN_ENABLE"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v29 = [(id)objc_opt_class(self) localizedStringForKey:@"DICTATION_OPT_IN_NOT_NOW"];
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v29);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v30 setObject:v6 forKey:kCFUserNotificationAlertHeaderKey];
  [v30 setObject:v8 forKey:kCFUserNotificationAlertMessageKey];
  [v30 setObject:v14 forKey:kCFUserNotificationDefaultButtonTitleKey];
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v30 setObject:v31 forKey:@"DismissOnLock"];

  if (v12) {
    [v30 setObject:v12 forKey:kCFUserNotificationOtherButtonTitleKey];
  }
  if (v10) {
    [v30 setObject:v10 forKey:kCFUserNotificationAlternateButtonTitleKey];
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v30 setObject:v32 forKey:@"SBUserNotificationAllowMenuButtonDismissal"];

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v30 setObject:v33 forKey:@"SBUserNotificationForcesModalAlertAppearance"];

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v30 setObject:v34 forKey:@"SBUserNotificationDisplayActionButtonOnLockScreen"];

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v30 setObject:v35 forKey:kCFUserNotificationAlertTopMostKey];

  return v30;
}

- (void)dismissDialogWithCompletionHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_100009E8C;
  v4[3] = &unk_100014B08;
  id v5 = a3;
  id v3 = v5;
  TIDispatchAsync(&_dispatch_main_q, v4);
}

- (void)removeAllDynamicDictionariesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (TICanLogMessageAtLevel(0LL))
  {
    uint64_t v5 = TIOSLogFacility();
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10000B7C8();
    }
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000A024;
  v8[3] = &unk_1000147E8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  TIDispatchAsync(&_dispatch_main_q, v8);
}

- (TITextCheckerExemptions)textCheckerExemptions
{
  textCheckerExemptions = self->_textCheckerExemptions;
  if (!textCheckerExemptions)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___TITextCheckerExemptions);
    uint64_t v5 = self->_textCheckerExemptions;
    self->_textCheckerExemptions = v4;

    -[TITextCheckerExemptions setAssertsObservers:](self->_textCheckerExemptions, "setAssertsObservers:", 1LL);
    -[TITextCheckerExemptions setAssertsObservers:](self->_textCheckerExemptions, "setAssertsObservers:", 0LL);
    textCheckerExemptions = self->_textCheckerExemptions;
  }

  return textCheckerExemptions;
}

- (void)string:(id)a3 isExemptFromTextCheckerWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([v6 _looksLikeNumberInput])
  {
    id v8 = 0LL;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TIRemoteDataHandle textCheckerExemptions](self, "textCheckerExemptions"));
    id v8 = [v9 stringIsExemptFromChecker:v6];
  }

  if (TICanLogMessageAtLevel(2LL))
  {
    uint64_t v10 = TIOSLogFacility();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000B85C((char)v8, (uint64_t)v6, v11);
    }
  }

  v7[2](v7, v8);
}

+ (id)localDictionaryPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardInputManager keyboardUserDirectory]( &OBJC_CLASS___TIKeyboardInputManager,  "keyboardUserDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"LocalDictionary"]);

  return v3;
}

- (void)requestTextCheckerLocalDictionaryWithCompletionHandler:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  if (TICanLogMessageAtLevel(1LL))
  {
    uint64_t v4 = TIOSLogFacility();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000B92C();
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TIRemoteDataHandle localDictionaryPath](&OBJC_CLASS___TIRemoteDataHandle, "localDictionaryPath"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6));
  v3[2](v3, v7);
}

- (void)appendWordToTextCheckerLocalDictionary:(id)a3
{
  id v3 = a3;
  if (TICanLogMessageAtLevel(1LL))
  {
    uint64_t v4 = TIOSLogFacility();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000B9C0((uint64_t)v3);
    }
  }

  id v6 = v3;
  id v7 = (const char *)[v6 UTF8String];
  id v8 = objc_claimAutoreleasedReturnValue( +[TIRemoteDataHandle localDictionaryPath]( &OBJC_CLASS___TIRemoteDataHandle, "localDictionaryPath"));
  id v9 = fopen((const char *)[v8 fileSystemRepresentation], "a+");
  if (v9)
  {
    uint64_t v10 = v9;
    if (v6)
    {
      if (v7)
      {
        size_t v11 = strlen(v7);
        if (v11)
        {
          fwrite(v7, 1uLL, v11, v10);
          fwrite("\n", 1uLL, 1uLL, v10);
          fflush(v10);
          int v12 = fileno(v10);
          fsync(v12);
        }
      }
    }

    fclose(v10);
  }
}

+ (id)localizedStringForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TIAssistantSettings));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizations]);
  v16 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v7,  v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);
  size_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:v3 value:0 table:@"AssistantSettings" localization:v10]);
  int v12 = v11;
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v3 value:&stru_100014CC0 table:@"AssistantSettings"]);
  }
  id v14 = v13;

  return v14;
}

- (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[TIResponseKitTrainerImpl sharedTrainer](&OBJC_CLASS___TIResponseKitTrainerImpl, "sharedTrainer"));
  [v7 performTrainingForClient:v6 withCompletionHandler:v5];
}

- (void)updateForActiveLocaleIdentifiers:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_10000A6D0;
  v4[3] = &unk_1000148D0;
  id v5 = a3;
  id v3 = v5;
  TIDispatchAsync(&_dispatch_main_q, v4);
}

- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A790;
  v6[3] = &unk_100014B30;
  id v7 = a4;
  unint64_t v8 = a3;
  id v5 = v7;
  TIDispatchAsync(&_dispatch_main_q, v6);
}

- (void)alternativesForText:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000A86C;
  v7[3] = &unk_1000147E8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  TIDispatchAsync(&_dispatch_main_q, v7);
}

- (void)ingestSentence:(id)a3 language:(id)a4 phraseRanges:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000BA58();
  }
}

- (void).cxx_destruct
{
}

@end