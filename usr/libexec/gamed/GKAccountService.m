@interface GKAccountService
+ (Class)interfaceClass;
+ (id)standardUserDefaults;
+ (unint64_t)requiredEntitlements;
- (id)ampController;
- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3;
- (void)didAcceptPrivacyNotice;
- (void)didShowFullscreenSignIn;
- (void)didShowSignInBanner;
- (void)fetchItemsForIdentityVerificationSignature:(id)a3;
- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3;
- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)isAppUnlistedAndDisallowed:(id)a3;
- (void)resetCredentialsWithHandler:(id)a3;
- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4;
@end

@implementation GKAccountService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKAccountServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 1LL;
}

- (void)isAppUnlistedAndDisallowed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 replyQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000D7C8;
  v8[3] = &unk_10026B310;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)ampController
{
  return +[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller");
}

+ (id)standardUserDefaults
{
  return +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
}

- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v5 authenticatePlayerWithUsername:0 password:0 handler:v4];
}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000D9DC;
  v8[3] = &unk_10026B4F8;
  id v9 = v4;
  id v7 = v4;
  [v5 issueRequest:&off_100288408 bagKey:@"gk-get-auth-token-for-third-party" clientProxy:v6 handler:v8];
}

- (void)fetchItemsForIdentityVerificationSignature:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000DAB4;
  v8[3] = &unk_10026B4F8;
  id v9 = v4;
  id v7 = v4;
  [v5 issueRequest:&off_100288430 bagKey:@"gk-get-auth-token-for-third-party" clientProxy:v6 handler:v8];
}

- (void)didShowSignInBanner
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 signInVisibilityManager]);
  [v2 didShowBanner];
}

- (void)didShowFullscreenSignIn
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 signInVisibilityManager]);
  [v2 didShowFullscreen];
}

- (void)resetCredentialsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v5 signOutPlayerWithOptOut:0 handler:v4];
}

- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (void *)os_log_GKDaemon;
  BOOL v10 = os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO);
  if (v10)
  {
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 alias]);
    *(_DWORD *)buf = 138412290;
    unint64_t v37 = (unint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "signOutPlayerWithOptOut:%@", buf, 0xCu);
  }

  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v10);
  }
  v15 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v37 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "GKAccountService signOutPlayerWithOptOut:%lu",  buf,  0xCu);
  }

  v34 = @"timestamp";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate _gkServerTimestamp](&OBJC_CLASS___NSDate, "_gkServerTimestamp"));
  v35 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  257LL,  "-[GKAccountService signOutPlayerWithOptOut:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v18));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000DED4;
  v29[3] = &unk_10026B548;
  id v30 = v17;
  v31 = self;
  id v20 = v19;
  id v32 = v20;
  BOOL v33 = v4;
  id v21 = v17;
  [v20 perform:v29];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000E690;
  v26[3] = &unk_10026B030;
  id v27 = v20;
  id v28 = v7;
  id v24 = v20;
  id v25 = v7;
  [v24 notifyOnQueue:v23 block:v26];
}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(self);
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerInternal]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerID]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer (%@) %@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkSHA256Hash]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastWelcomeWhatsNewCopyVersionDisplayedForHashedPlayerID_%@",  v15));

  id v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = v19;
  if (a3)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v20 setObject:v21 forKey:v16];
  }

  else
  {
    [v19 removeObjectForKey:v16];
  }

  [v20 synchronize];
}

- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  367LL,  "-[GKAccountService getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000EAA4;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000EC34;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(self);
  }
  id v6 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerInternal]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    *(_DWORD *)buf = 138412546;
    v34 = v10;
    __int16 v35 = 2112;
    v36 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer (%@) %@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkSHA256Hash]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastPrivacyNoticeVersionDisplayedForHashedPlayerID_%@",  v15));

  id v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v16]);
  id v21 = [v20 integerValue];

  if (v21 == (id)a3)
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers(v22);
    }
    __int16 v24 = (os_log_s *)os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v25 = "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer: Skipped because the values of current and new are the same.";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v25, buf, 2u);
    }
  }

  else if (a3 && v21 == (id)-1LL)
  {
    if (!os_log_GKGeneral) {
      id v26 = (id)GKOSLoggers(v22);
    }
    __int16 v24 = (os_log_s *)os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v25 = "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer: Skipped because the current value has been overridden for testing.";
      goto LABEL_16;
    }
  }

  else
  {
    if (a3)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      [v19 setObject:v27 forKey:v16];

      id v28 = -[GKAccountService didAcceptPrivacyNotice](self, "didAcceptPrivacyNotice");
    }

    else
    {
      id v28 = [v19 removeObjectForKey:v16];
    }

    if (!os_log_GKGeneral) {
      id v29 = (id)GKOSLoggers(v28);
    }
    id v30 = (void *)os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      *(_DWORD *)buf = 138412290;
      v34 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer: The value is set to %@",  buf,  0xCu);
    }

    -[GKAccountService notifyWidgetPlayerAuthenticationUpdated](self, "notifyWidgetPlayerAuthenticationUpdated");
  }
}

- (void)didAcceptPrivacyNotice
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  [v3 setForcePrivacyNotice:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKAccountService ampController](self, "ampController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeBag]);
  [v4 setupAsyncWithStoreBag:v6 withCompletion:&stru_10026B568];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKProfileServicePrivate, "serviceFromService:", self));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerInternal]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerID]);

  if (v10)
  {
    id v13 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v7 preloadInstalledGamesScopedPlayerIDs:v11 completion:0];
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKUtilityServicePrivate, "serviceFromService:", self));
  [v12 updateNotificationTopicsForcefully:1];
}

- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  434LL,  "-[GKAccountService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F340;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F4D0;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerInternal]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerID]);
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "setLastPersonalizationVersionDisplayedForSignedInPlayer (%@) %@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkSHA256Hash]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastPersonalizationVersionDisplayedForHashedPlayerID_%@",  v15));

  id v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if ([v5 length]) {
    [v19 setObject:v5 forKey:v16];
  }
  else {
    [v19 removeObjectForKey:v16];
  }
  [v19 synchronize];
}

- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  465LL,  "-[GKAccountService getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000F888;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000F9DC;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  482LL,  "-[GKAccountService getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000FBA0;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000FCF4;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerInternal]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerID]);
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "setLastProfilePrivacyVersionDisplayedForSignedInPlayer (%@) %@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkSHA256Hash]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastProfilePrivacyVersionDisplayedForHashedPlayerID_%@",  v15));

  id v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if ([v5 length]) {
    [v19 setObject:v5 forKey:v16];
  }
  else {
    [v19 removeObjectForKey:v16];
  }
  [v19 synchronize];
}

- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  513LL,  "-[GKAccountService getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001009C;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000101F0;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerInternal]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerID]);
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "setLastFriendSuggestionsVersionDisplayedForSignedInPlayer (%@) %@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkSHA256Hash]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastFriendSuggestionsVersionDisplayedForHashedPlayerID_%@",  v15));

  id v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if ([v5 length]) {
    [v19 setObject:v5 forKey:v16];
  }
  else {
    [v19 removeObjectForKey:v16];
  }
  [v19 synchronize];
}

- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  544LL,  "-[GKAccountService getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100010598;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000106EC;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerInternal]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerID]);
    *(_DWORD *)buf = 138412546;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer (%@) %@",  buf,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 playerInternal]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 playerID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _gkSHA256Hash]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastContactsIntegrationConsentVersionDisplayedForHashedPlayerID_%@",  v15));

  id v18 = objc_msgSend((id)objc_opt_class(self, v17), "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if ([v5 length]) {
    [v19 setObject:v5 forKey:v16];
  }
  else {
    [v19 removeObjectForKey:v16];
  }
  [v19 synchronize];
}

@end