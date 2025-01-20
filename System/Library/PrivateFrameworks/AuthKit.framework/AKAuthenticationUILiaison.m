@interface AKAuthenticationUILiaison
+ (AKAuthenticationUILiaison)sharedInstance;
- (AKAuthenticationSurrogateManager)surrogateManager;
- (AKAuthenticationUILiaison)init;
- (BOOL)_isBackgroundClient:(id)a3 eligibleForForegroundAuthenticationWithContext:(id)a4;
- (BOOL)_isFullUICapabilityRequiredFor2FA;
- (id)_notificationDictionaryForClient:(id)a3 context:(id)a4 needFullUI:(BOOL)a5;
- (id)_optionsForCreatingUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 serviceType:(int64_t)a7;
- (id)_stringByAppendingBlameIfNecessary:(id)a3 withContext:(id)a4 client:(id)a5;
- (id)uiWorkQueue;
- (void)_performBlockWithClient:(id)a3 context:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 block:(id)a7;
- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)activateProximitySession:(id)a3 client:(id)a4 context:(id)a5 completion:(id)a6;
- (void)dismissBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissKeepUsingUIForContext:(id)a3 client:(id)a4 withCompletion:(id)a5;
- (void)dismissNativeRecoveryUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissProximityPairingUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)dismissServerProvidedUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)fetchUICapableContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 client:(id)a5 completion:(id)a6;
- (void)presentKeepUsingUIForContext:(id)a3 client:(id)a4 appleID:(id)a5 completion:(id)a6;
- (void)presentLoginAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8;
- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 client:(id)a5 completion:(id)a6;
- (void)presentProximityBroadcastUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 event:(id)a5 completion:(id)a6;
- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 verificationCode:(id)a5 completion:(id)a6;
- (void)presentProximityPinCodeUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentSecondFactorAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8;
- (void)presentSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)presentServerProvidedUIForContext:(id)a3 client:(id)a4 withConfiguration:(id)a5 completion:(id)a6;
- (void)promptForAppleIDSettingsRedirectWithContext:(id)a3 client:(id)a4 needFullUI:(BOOL)a5 completion:(id)a6;
- (void)showProximityErrorForContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthenticationUILiaison

+ (AKAuthenticationUILiaison)sharedInstance
{
  if (qword_10020F4A8 != -1) {
    dispatch_once(&qword_10020F4A8, &stru_1001C9560);
  }
  return (AKAuthenticationUILiaison *)(id)qword_10020F4A0;
}

- (AKAuthenticationUILiaison)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKAuthenticationUILiaison;
  v2 = -[AKAuthenticationUILiaison init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("AKUIWorkQueue", v6);
    clientUIWorkQueue = v2->_clientUIWorkQueue;
    v2->_clientUIWorkQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (AKAuthenticationSurrogateManager)surrogateManager
{
  return self->_surrogateManager;
}

- (void)fetchUICapableContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100075410;
  v9[3] = &unk_1001C9588;
  id v10 = a5;
  id v8 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  1LL,  1LL,  v9);
}

- (void)presentKeepUsingUIForContext:(id)a3 client:(id)a4 appleID:(id)a5 completion:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100075620;
  v12[3] = &unk_1001C95B0;
  id v13 = a5;
  id v14 = a6;
  id v10 = v13;
  id v11 = v14;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  1LL,  1LL,  v12);
}

- (void)dismissKeepUsingUIForContext:(id)a3 client:(id)a4 withCompletion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000757E8;
  v9[3] = &unk_1001C9588;
  id v10 = a5;
  id v8 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  1LL,  0LL,  v9);
}

- (void)presentBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  +[AKCAAuthPromptReporter reportPromptByClient:withContext:]( &OBJC_CLASS___AKCAAuthPromptReporter,  "reportPromptByClient:withContext:",  v9,  v8);
  if (+[AKAutoBugCapture shouldCapturePromptBugForContext:]( &OBJC_CLASS___AKAutoBugCapture,  "shouldCapturePromptBugForContext:",  v8))
  {
    uint64_t v11 = AKBugCaptureSubTypePasswordPrompt;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKAutoBugCapture userInfoFromContext:](&OBJC_CLASS___AKAutoBugCapture, "userInfoFromContext:", v8));
    +[AKAutoBugCapture triggerAutoBugCaptureWithSubType:andBundleID:userInfo:]( &OBJC_CLASS___AKAutoBugCapture,  "triggerAutoBugCaptureWithSubType:andBundleID:userInfo:",  v11,  v12,  v13);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100075A54;
  v15[3] = &unk_1001C95B0;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  v9,  v8,  0LL,  1LL,  v15);
}

- (void)dismissBasicLoginUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100075E0C;
  v9[3] = &unk_1001C9588;
  id v10 = a5;
  id v8 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  0LL,  0LL,  v9);
}

- (void)presentLoginAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100076100;
  v20[3] = &unk_1001C9650;
  id v23 = a7;
  id v24 = a8;
  v20[4] = self;
  id v21 = v14;
  id v22 = v15;
  id v16 = v23;
  id v17 = v15;
  id v18 = v14;
  id v19 = v24;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  0LL,  0LL,  v20);
}

- (void)presentSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = -[AKAuthenticationUILiaison _isFullUICapabilityRequiredFor2FA](self, "_isFullUICapabilityRequiredFor2FA");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100076508;
  v13[3] = &unk_1001C9588;
  id v14 = v8;
  id v12 = v8;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  v9,  v10,  v11,  1LL,  v13);
}

- (void)dismissSecondFactorUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = -[AKAuthenticationUILiaison _isFullUICapabilityRequiredFor2FA](self, "_isFullUICapabilityRequiredFor2FA");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100076700;
  v13[3] = &unk_1001C9588;
  id v14 = v8;
  id v12 = v8;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  v9,  v10,  v11,  0LL,  v13);
}

- (void)presentSecondFactorAlertForContext:(id)a3 client:(id)a4 withError:(id)a5 title:(id)a6 message:(id)a7 completion:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a4;
  id v19 = a3;
  BOOL v20 = -[AKAuthenticationUILiaison _isFullUICapabilityRequiredFor2FA](self, "_isFullUICapabilityRequiredFor2FA");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10007696C;
  v25[3] = &unk_1001C9678;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v17;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  v18,  v19,  v20,  0LL,  v25);
}

- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (!v5) {
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:kAAFDidSucceed];
  }
  [v7 populateUnderlyingErrorsStartingWithRootError:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v6 sendEvent:v7];
}

- (void)presentServerProvidedUIForContext:(id)a3 client:(id)a4 withConfiguration:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:client:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:client:eventName:error:",  v13,  v12,  @"com.apple.authkit.serverUIStart",  0LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v15 sendEvent:v14];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:client:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:client:eventName:error:",  v13,  v12,  @"com.apple.authkit.serverUIFinish",  0LL));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100076CF4;
  v25[3] = &unk_1001C96A0;
  void v25[4] = self;
  id v26 = v11;
  id v17 = v11;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100076D7C;
  v21[3] = &unk_1001C9718;
  id v23 = v10;
  id v24 = objc_retainBlock(v25);
  id v22 = v16;
  id v18 = v10;
  id v19 = v16;
  BOOL v20 = v24;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  v12,  v13,  1LL,  1LL,  v21);
}

- (void)dismissServerProvidedUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007708C;
  v9[3] = &unk_1001C9588;
  id v10 = a5;
  id v8 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  1LL,  0LL,  v9);
}

- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:client:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:client:eventName:error:",  v13,  v12,  @"com.apple.authkit.nativeRecoveryStart",  0LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v15 sendEvent:v14];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:client:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:client:eventName:error:",  v13,  v12,  @"com.apple.authkit.nativeRecoveryFinish",  0LL));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10007743C;
  v25[3] = &unk_1001C9740;
  void v25[4] = self;
  id v26 = v11;
  id v17 = v11;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000774B0;
  v21[3] = &unk_1001C9718;
  id v23 = v10;
  id v24 = objc_retainBlock(v25);
  id v22 = v16;
  id v18 = v10;
  id v19 = v16;
  BOOL v20 = v24;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  v12,  v13,  1LL,  1LL,  v21);
}

- (void)dismissNativeRecoveryUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007782C;
  v9[3] = &unk_1001C9588;
  id v10 = a5;
  id v8 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  1LL,  1LL,  v9);
}

- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100077AF4;
  v9[3] = &unk_1001C9588;
  id v10 = a5;
  id v8 = v10;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a4,  a3,  1LL,  1LL,  v9);
}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 client:(id)a5 completion:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100077CE8;
  v12[3] = &unk_1001C95B0;
  id v13 = a4;
  id v14 = a6;
  id v10 = v13;
  id v11 = v14;
  -[AKAuthenticationUILiaison _performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:]( self,  "_performBlockWithClient:context:requireFullUICapability:allowRedirectToSettings:block:",  a5,  a3,  1LL,  1LL,  v12);
}

- (void)presentProximityBroadcastUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100077EC0;
  v10[3] = &unk_1001C8648;
  id v11 = a5;
  id v7 = v11;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 proxyWithErrorHandler:v10]);
  [v9 presentProximityBroadcastUIForContext:v8 completion:v7];
}

- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 event:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = sub_10009A630(0LL);
  if (v13) {
    uint64_t v13 = (uint64_t)sub_10009AA64();
  }
  uint64_t v15 = objc_opt_class(v13, v14);
  id v16 = v9;
  if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0) {
    id v17 = v16;
  }
  else {
    id v17 = 0LL;
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100078064;
  v21[3] = &unk_1001C8648;
  id v22 = v10;
  id v18 = v10;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 proxyWithErrorHandler:v21]);

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v17 password]);
  [v19 presentProximityPairingUIForContext:v12 verificationCode:v20 completion:v18];
}

- (void)presentProximityPairingUIForContext:(id)a3 client:(id)a4 verificationCode:(id)a5 completion:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100078194;
  v13[3] = &unk_1001C8648;
  id v14 = a6;
  id v9 = v14;
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a4 proxyWithErrorHandler:v13]);
  [v12 presentProximityPairingUIForContext:v11 verificationCode:v10 completion:v9];
}

- (void)presentProximityPinCodeUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000782B0;
  v10[3] = &unk_1001C8648;
  id v11 = a5;
  id v7 = v11;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 proxyWithErrorHandler:v10]);
  [v9 presentProximityPinCodeUIForContext:v8 completion:v7];
}

- (void)dismissProximityPairingUIForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000783CC;
  v10[3] = &unk_1001C8648;
  id v11 = a5;
  id v7 = v11;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a4 proxyWithErrorHandler:v10]);
  [v9 dismissProximityPairingUIForContext:v8 completion:v7];
}

- (void)activateProximitySession:(id)a3 client:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue([a4 proxyWithErrorHandler:&stru_1001C9760]);
  [v12 activateProximitySession:v11 context:v10 completion:v9];
}

- (void)showProximityErrorForContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a4 proxyWithErrorHandler:&stru_1001C9780]);
  [v9 showProximityErrorForContext:v8 completion:v7];
}

- (void)_performBlockWithClient:(id)a3 context:(id)a4 requireFullUICapability:(BOOL)a5 allowRedirectToSettings:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  uint64_t v15 = getenv("__AKSYNCBUBBLE");
  if (v15)
  {
    uint64_t v16 = _AKLogSystem(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001393AC();
    }

    clientUIWorkQueue = (dispatch_queue_s *)self->_clientUIWorkQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100078BAC;
    block[3] = &unk_1001C78D0;
    id v69 = v14;
    dispatch_async(clientUIWorkQueue, block);
    id v19 = v69;
LABEL_45:

    goto LABEL_46;
  }

  id v20 = +[AAFDeviceInfo deviceIsAudioAccessory](&OBJC_CLASS___AAFDeviceInfo, "deviceIsAudioAccessory");
  if ((_DWORD)v20)
  {
    uint64_t v21 = _AKLogSystem(v20);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100139254();
    }

    id v23 = (dispatch_queue_s *)self->_clientUIWorkQueue;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_100078C04;
    v66[3] = &unk_1001C78D0;
    id v67 = v14;
    dispatch_async(v23, v66);
    id v19 = v67;
    goto LABEL_45;
  }

  if ([v13 authenticationType] == (id)1)
  {
    uint64_t v24 = _AKLogSystem(1LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100139280();
    }

    id v26 = (dispatch_queue_s *)self->_clientUIWorkQueue;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_100078C5C;
    v64[3] = &unk_1001C78D0;
    id v65 = v14;
    dispatch_async(v26, v64);
    id v19 = v65;
    goto LABEL_45;
  }

  id v27 = [v13 _capabilityForUIDisplay];
  id v28 = v27;
  if (v27 == (id)4 || v27 == (id)1)
  {
    uint64_t v32 = _AKLogSystem(v27);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Context cannot display full UI.", buf, 2u);
    }
  }

  else if (!v27)
  {
    uint64_t v29 = _AKLogSystem(0LL);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10013934C();
    }

    v31 = (dispatch_queue_s *)self->_clientUIWorkQueue;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_100078CB4;
    v62[3] = &unk_1001C78D0;
    id v63 = v14;
    dispatch_async(v31, v62);
    id v19 = v63;
    goto LABEL_45;
  }

  id v34 = [v13 _performUIOutOfProcess];
  if ((_DWORD)v34)
  {
    uint64_t v35 = _AKLogSystem(v34);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Context requires out-of-process UI.",  buf,  2u);
    }
  }

  if (v28 == (id)4 || v28 == (id)1)
  {
    LODWORD(v37) = [v13 _performUIOutOfProcess];
  }

  else
  {
    unsigned int v38 = [v13 _performUIOutOfProcess];
    id v37 = [v13 _performUIOutOfProcess];
    if (!v38)
    {
LABEL_42:
      uint64_t v51 = _AKLogSystem(v37);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Client is capable of displaying UI, no surrogate required...",  buf,  2u);
      }

      v53 = (dispatch_queue_s *)self->_clientUIWorkQueue;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_100078D0C;
      v57[3] = &unk_1001C97A8;
      id v60 = v14;
      id v58 = v12;
      id v59 = v13;
      dispatch_async(v53, v57);

      id v19 = v60;
      goto LABEL_45;
    }
  }

  int v39 = (int)v37;
  BOOL v40 = -[AKAuthenticationUILiaison _isBackgroundClient:eligibleForForegroundAuthenticationWithContext:]( self,  "_isBackgroundClient:eligibleForForegroundAuthenticationWithContext:",  v12,  v13);
  if (v40)
  {
    uint64_t v41 = _AKLogSystem(v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "[non-visionOS] Falling back to standard proxied foreground authentication",  buf,  2u);
    }

    uint64_t v44 = _AKLogSystem(v43);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      sub_1001392E0();
    }

    if (!v9) {
      goto LABEL_42;
    }
  }

  surrogateManager = self->_surrogateManager;
  if (!surrogateManager)
  {
    v47 = -[AKAuthenticationSurrogateManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___AKAuthenticationSurrogateManager),  "initWithDelegate:",  self);
    v48 = self->_surrogateManager;
    self->_surrogateManager = v47;

    v49 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthenticationTrafficController sharedInstance]( &OBJC_CLASS___AKAuthenticationTrafficController,  "sharedInstance"));
    [v49 setSurrogateManager:self->_surrogateManager];

    surrogateManager = self->_surrogateManager;
  }

  BOOL v50 = -[AKAuthenticationSurrogateManager hasRegisteredSurrogateForContext:]( surrogateManager,  "hasRegisteredSurrogateForContext:",  v13);
  if (v50)
  {
    -[AKAuthenticationSurrogateManager performUIWorkWithSurrogateContext:uiWorkBlock:]( self->_surrogateManager,  "performUIWorkWithSurrogateContext:uiWorkBlock:",  v13,  v14);
  }

  else
  {
    uint64_t v54 = _AKLogSystem(v50);
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
    if (v39)
    {
      if (v56)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Out-of-process auth, no registered UI surrogate yet...",  buf,  2u);
      }

      -[AKAuthenticationSurrogateManager waitForRemoteViewServiceWithContext:client:uiWorkBlock:]( self->_surrogateManager,  "waitForRemoteViewServiceWithContext:client:uiWorkBlock:",  v13,  v12,  v14);
    }

    else
    {
      if (v56)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Background auth, no registered UI surrogate yet...",  buf,  2u);
      }

      -[AKAuthenticationSurrogateManager waitForSettingsWithContext:client:requireFullUICapability:allowRedirectToSettings:uiWorkBlock:]( self->_surrogateManager,  "waitForSettingsWithContext:client:requireFullUICapability:allowRedirectToSettings:uiWorkBlock:",  v13,  v12,  v9,  v8,  v14);
    }
  }

- (BOOL)_isBackgroundClient:(id)a3 eligibleForForegroundAuthenticationWithContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v8 = [v7 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

  if (v8 == 2)
  {
    uint64_t v10 = _AKLogSystem(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001393D8();
    }
    goto LABEL_4;
  }

  if ([v6 _isForcedEligibleForForegroundAuthentication])
  {
    BOOL v12 = 1;
    goto LABEL_16;
  }

  if (![v6 _isProxyingForApp])
  {
    BOOL v12 = 0;
    goto LABEL_16;
  }

  id v13 = [v5 isPermittedToProxy];
  if ((v13 & 1) == 0)
  {
    uint64_t v19 = _AKLogSystem(v13);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100139438();
    }
    goto LABEL_19;
  }

  if (([v5 isPermittedToProxyInitialAuth] & 1) == 0)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 username]);
    if (!v14 || (v15 = (void *)v14, unsigned int v16 = [v6 isUsernameEditable], v15, v16))
    {
      uint64_t v17 = _AKLogSystem(v14);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = (os_log_s *)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client %@ cannot proxy without specifying an immutable Apple ID.",  (uint8_t *)&v23,  0xCu);
      }

- (id)_notificationDictionaryForClient:(id)a3 context:(id)a4 needFullUI:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 username]);
  unsigned int v11 = [v9 needsCredentialRecovery];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  id v13 = v12;
  v80 = v10;
  if (v11)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_RESET_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);

    uint64_t v14 = @"FORGOT_PASSWORD_ALERT_MESSAGE";
    unsigned __int8 v15 = [@"FORGOT_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
    if ((v15 & 1) != 0)
    {
      int v16 = 0;
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([v13 isAABrandingEnabled])
      {
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"FORGOT_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"]);
        int v16 = 1;
      }

      else
      {
        int v16 = 0;
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue( +[AKDevice deviceSpecificLocalizedStringWithKey:]( &OBJC_CLASS___AKDevice,  "deviceSpecificLocalizedStringWithKey:",  v14));
    if (v16) {

    }
    if ((v15 & 1) == 0) {
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    }
    v82 = (void *)objc_claimAutoreleasedReturnValue( [v34 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    v31 = (void *)objc_claimAutoreleasedReturnValue( [v35 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);

    uint64_t v10 = v80;
    goto LABEL_56;
  }

  uint64_t v17 = @"Localizable";
  v82 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"PASSWORD_ALERT_SETTINGS_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  v83 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);

  if (!v10)
  {
    int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v24 = @"PASSWORD_ALERT_TITLE";
    unsigned __int8 v25 = [@"PASSWORD_ALERT_TITLE" containsString:@"REBRAND"];
    if ((v25 & 1) != 0)
    {
      int v26 = 0;
    }

    else
    {
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if (-[__CFString isAABrandingEnabled](v17, "isAABrandingEnabled"))
      {
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue([@"PASSWORD_ALERT_TITLE" stringByAppendingString:@"_REBRAND"]);
        int v26 = 1;
      }

      else
      {
        int v26 = 0;
      }
    }

    uint64_t v78 = objc_claimAutoreleasedReturnValue([v23 localizedStringForKey:v24 value:&stru_1001D1450 table:@"Localizable"]);
    if (v26) {

    }
    if ((v25 & 1) == 0) {
    int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    }
    BOOL v40 = @"PASSWORD_ALERT_MESSAGE";
    unsigned __int8 v41 = [@"PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"];
    if ((v41 & 1) != 0)
    {
      int v42 = 0;
    }

    else
    {
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if (-[__CFString isAABrandingEnabled](v17, "isAABrandingEnabled"))
      {
        BOOL v40 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"]);
        int v42 = 1;
      }

      else
      {
        int v42 = 0;
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedStringForKey:v40 value:&stru_1001D1450 table:@"Localizable"]);
    if (v42) {

    }
    if ((v41 & 1) == 0) {
    uint64_t v10 = v80;
    }
LABEL_55:
    v31 = (void *)v78;
    goto LABEL_56;
  }

  if (!a5)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned int v28 = [v27 isMultiUserMode];

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    v30 = v29;
    if (v28)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue( [v29 localizedStringForKey:@"PASSCODE_ALERT_TITLE_WITH_USERNAME" value:&stru_1001D1450 table:@"Localizable"]);

      uint64_t v32 = AKSharedDevicePasscodePromptAlertMessageWithServiceType([v9 serviceType]);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      goto LABEL_56;
    }

    v36 = @"PASSWORD_ALERT_TITLE_WITH_USERNAME";
    unsigned __int8 v37 = [@"PASSWORD_ALERT_TITLE_WITH_USERNAME" containsString:@"REBRAND"];
    if ((v37 & 1) != 0)
    {
      int v38 = 0;
    }

    else
    {
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if (-[__CFString isAABrandingEnabled](v17, "isAABrandingEnabled"))
      {
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"PASSWORD_ALERT_TITLE_WITH_USERNAME" stringByAppendingString:@"_REBRAND"]);
        int v38 = 1;
      }

      else
      {
        int v38 = 0;
      }
    }

    uint64_t v78 = objc_claimAutoreleasedReturnValue([v30 localizedStringForKey:v36 value:&stru_1001D1450 table:@"Localizable"]);
    if (v38) {

    }
    if ((v37 & 1) == 0) {
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue( [v47 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_WITH_USERNAME" value:&stru_1001D1450 table:@"Localizable"]);
    uint64_t v10 = v80;
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[AKUsernameFormatter formattedUsernameFromUsername:]( &OBJC_CLASS___AKUsernameFormatter,  "formattedUsernameFromUsername:",  v80));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v48, v49));

    goto LABEL_55;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  BOOL v20 = @"CONTINUE_AUTH_ALERT_TITLE";
  unsigned __int8 v21 = [@"CONTINUE_AUTH_ALERT_TITLE" containsString:@"REBRAND"];
  v76 = self;
  if ((v21 & 1) != 0)
  {
    int v22 = 0;
  }

  else
  {
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
    if (-[__CFString isAABrandingEnabled](v17, "isAABrandingEnabled"))
    {
      BOOL v20 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"CONTINUE_AUTH_ALERT_TITLE" stringByAppendingString:@"_REBRAND"]);
      int v22 = 1;
    }

    else
    {
      int v22 = 0;
    }
  }

  uint64_t v43 = objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v20 value:&stru_1001D1450 table:@"Localizable"]);
  if (v22) {

  }
  if ((v21 & 1) == 0) {
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue( [v44 localizedStringForKey:@"CONTINUE_AUTH_ALERT_MESSAGE" value:&stru_1001D1450 table:@"Localizable"]);
  uint64_t v10 = v80;
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[AKUsernameFormatter formattedUsernameFromUsername:]( &OBJC_CLASS___AKUsernameFormatter,  "formattedUsernameFromUsername:",  v80));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v45, v46));

  v31 = (void *)v43;
  self = v76;
LABEL_56:
  BOOL v50 = (void *)objc_claimAutoreleasedReturnValue([v9 _proxiedAppBundleID]);

  uint64_t v52 = _AKLogSystem(v51);
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
  if (v50)
  {
    if (!v54) {
      goto LABEL_62;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue([v9 _proxiedAppBundleID]);
    BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    *(_DWORD *)buf = 138543618;
    v85 = v55;
    __int16 v86 = 2114;
    v87 = v56;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ requested authentication (via %{public}@).",  buf,  0x16u);
  }

  else
  {
    if (!v54) {
      goto LABEL_62;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    *(_DWORD *)buf = 138543362;
    v85 = v55;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ requested authentication.",  buf,  0xCu);
  }

LABEL_62:
  v57 = v9;
  id v58 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationUILiaison _stringByAppendingBlameIfNecessary:withContext:client:]( self,  "_stringByAppendingBlameIfNecessary:withContext:client:",  v33,  v9,  v8));

  v81 = v57;
  id v59 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationUILiaison _optionsForCreatingUserNotificationWithTitle:message:defaultButton:alternateButton:serviceType:]( self,  "_optionsForCreatingUserNotificationWithTitle:message:defaultButton:alternateButton:serviceType:",  v31,  v58,  v82,  v83,  [v57 serviceType]));
  if (v10)
  {
    id v60 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned int v61 = [v60 isMultiUserMode];

    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v63 = v62;
    id v77 = v8;
    v79 = v31;
    if (v61)
    {
      id v64 = v8;
      id v65 = (void *)objc_claimAutoreleasedReturnValue( [v62 localizedStringForKey:@"PASSCODE_ALERT_TITLE_LOCKSCREEN" value:&stru_1001D1450 table:@"Localizable"]);

      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      v31 = (void *)objc_claimAutoreleasedReturnValue( [v66 localizedStringForKey:@"PASSCODE_ALERT_MESSAGE_LOCKSCREEN" value:&stru_1001D1450 table:@"Localizable"]);
      id v67 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationUILiaison _stringByAppendingBlameIfNecessary:withContext:client:]( self,  "_stringByAppendingBlameIfNecessary:withContext:client:",  v31,  v81,  v64));
    }

    else
    {
      v68 = @"PASSWORD_ALERT_TITLE_LOCKSCREEN";
      unsigned __int8 v69 = [@"PASSWORD_ALERT_TITLE_LOCKSCREEN" containsString:@"REBRAND"];
      if ((v69 & 1) != 0)
      {
        int v70 = 0;
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
        if ([v31 isAABrandingEnabled])
        {
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"PASSWORD_ALERT_TITLE_LOCKSCREEN" stringByAppendingString:@"_REBRAND"]);
          int v70 = 1;
        }

        else
        {
          int v70 = 0;
        }
      }

      id v65 = (void *)objc_claimAutoreleasedReturnValue( [v63 localizedStringForKey:v68 value:&stru_1001D1450 table:@"Localizable"]);
      if (v70) {

      }
      if ((v69 & 1) == 0) {
      v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      }
      v71 = @"PASSWORD_ALERT_MESSAGE_LOCKSCREEN";
      unsigned __int8 v72 = [@"PASSWORD_ALERT_MESSAGE_LOCKSCREEN" containsString:@"REBRAND"];
      if ((v72 & 1) != 0)
      {
        int v73 = 0;
      }

      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
        if ([v31 isAABrandingEnabled])
        {
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"PASSWORD_ALERT_MESSAGE_LOCKSCREEN" stringByAppendingString:@"_REBRAND"]);
          int v73 = 1;
        }

        else
        {
          int v73 = 0;
        }
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue( [v66 localizedStringForKey:v71 value:&stru_1001D1450 table:@"Localizable"]);
      id v67 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthenticationUILiaison _stringByAppendingBlameIfNecessary:withContext:client:]( self,  "_stringByAppendingBlameIfNecessary:withContext:client:",  v74,  v81,  v77));

      if (v73) {
      if ((v72 & 1) != 0)
      }
        goto LABEL_83;
    }

LABEL_83:
    [v59 setObject:v65 forKeyedSubscript:SBUserNotificationLockScreenAlertHeaderKey];
    [v59 setObject:v67 forKeyedSubscript:SBUserNotificationLockScreenAlertMessageKey];

    id v8 = v77;
    v31 = v79;
    uint64_t v10 = v80;
  }

  return v59;
}

- (id)_optionsForCreatingUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 serviceType:(int64_t)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AKAlertHandler sharedInstance](&OBJC_CLASS___AKAlertHandler, "sharedInstance"));
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 notificationDictionaryWithTitle:v13 message:v12 defaultButton:v11 alternateButton:v10]);

  return v15;
}

- (id)_stringByAppendingBlameIfNecessary:(id)a3 withContext:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v11 = [v10 isInternalBuild];

  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 _proxiedAppName]);

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v14 = v13;
    if (v12)
    {
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_PROXY_INTERNAL_BLAME" value:&stru_1001D1450 table:@"Localizable"]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v8 _proxiedAppName]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v16, v17));
    }

    else
    {
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"PASSWORD_ALERT_MESSAGE_INTERNAL_BLAME" value:&stru_1001D1450 table:@"Localizable"]);
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, v16));
    }

    id v19 = (id)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v18]);
  }

  else
  {
    id v19 = v7;
  }

  return v19;
}

- (BOOL)_isFullUICapabilityRequiredFor2FA
{
  return 1;
}

- (id)uiWorkQueue
{
  return self->_clientUIWorkQueue;
}

- (void)promptForAppleIDSettingsRedirectWithContext:(id)a3 client:(id)a4 needFullUI:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, uint64_t, void))a6;
  id v13 = [v10 shouldSkipSettingsLaunchAlert];
  if ((_DWORD)v13)
  {
    uint64_t v14 = _AKLogSystem(v13);
    unsigned __int8 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Will not prompt user about redirect per auth context configuration.",  buf,  2u);
    }

    v12[2](v12, 1LL, 0LL);
  }

  else
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned __int8 v17 = [v16 isBuddyFinished];

    if ((v17 & 1) != 0)
    {
      uint64_t v19 = AKBugCaptureSubTypeSettingsRedirect;
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[AKAutoBugCapture userInfoFromContext:]( &OBJC_CLASS___AKAutoBugCapture,  "userInfoFromContext:",  v10));
      +[AKAutoBugCapture triggerAutoBugCaptureWithSubType:andBundleID:userInfo:]( &OBJC_CLASS___AKAutoBugCapture,  "triggerAutoBugCaptureWithSubType:andBundleID:userInfo:",  v19,  v20,  v21);

      int v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKAuthenticationTrafficController sharedInstance]( &OBJC_CLASS___AKAuthenticationTrafficController,  "sharedInstance"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100079EF4;
      v26[3] = &unk_1001C97F8;
      v30 = v12;
      id v27 = v10;
      unsigned int v28 = self;
      id v29 = v11;
      BOOL v31 = a5;
      [v22 uplevelAuthenticationForUIWithContext:v27 client:v29 completion:v26];
    }

    else
    {
      uint64_t v23 = _AKLogSystem(v18);
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100139498();
      }

      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7014LL));
      ((void (**)(id, uint64_t, void *))v12)[2](v12, 0LL, v25);
    }
  }
}

- (void).cxx_destruct
{
}

@end