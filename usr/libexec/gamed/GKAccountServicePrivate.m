@interface GKAccountServicePrivate
+ (Class)interfaceClass;
+ (id)getAccountMatchingCredential:(id)a3 from:(id)a4;
+ (id)lastContactsIntegrationConsentVersionDisplayedForPlayerID:(id)a3;
+ (id)lastFriendSuggestionsVersionDisplayedForPlayerID:(id)a3;
+ (id)lastPersonalizationVersionDisplayedForPlayerID:(id)a3;
+ (id)lastProfilePrivacyVersionDisplayedForPlayerID:(id)a3;
+ (id)standardUserDefaults;
+ (int)getAccountAgeCategoryForCredential:(id)a3;
+ (int)getAgeCategoryFromIDMS:(id)a3 appleAccount:(id)a4;
+ (int)playerAgeCategoryForAccount:(id)a3;
+ (unint64_t)lastPrivacyNoticeVersionDisplayedForPlayerID:(id)a3;
+ (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:(id)a3;
+ (unint64_t)requiredEntitlements;
- (BOOL)requiresAuthenticationForSelector:(SEL)a3;
- (BOOL)shouldCadencedActivitySharingRepromptWithLimit:(int64_t)a3 minDaysBetween:(int64_t)a4;
- (BOOL)shouldSuppressFullscreenSignInSheet;
- (id)_authenticatedLocalPlayerWithUsername:(id)a3 inContext:(id)a4 isValid:(BOOL *)a5;
- (void)_addAchievementPointsEntryForGame:(id)a3 record:(id)a4 profile:(id)a5 moc:(id)a6;
- (void)_addGameListEntryForGame:(id)a3 profile:(id)a4 moc:(id)a5;
- (void)_appInitWithGroup:(id)a3;
- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 active:(BOOL)a7 handler:(id)a8;
- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 handler:(id)a7;
- (void)_constructAuthenticationResponseWithError:(id)a3 handler:(id)a4;
- (void)_continueAuthenticationWithHandler:(id)a3;
- (void)_continueAuthenticationWithLoginDisabled:(BOOL)a3 handler:(id)a4;
- (void)_fetchCredentialsForAltDSID:(id)a3 handler:(id)a4;
- (void)_fetchCredentialsForNonActivePlayerForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6;
- (void)_fetchCredentialsForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6;
- (void)_fetchLoginDisabledWithHandler:(id)a3;
- (void)_initGameForLaunchedApp:(BOOL)a3 withHandler:(id)a4;
- (void)_loadProfileWithGroup:(id)a3;
- (void)_notifyAllClientsPlayerAuthenticatedFromClient:(id)a3 withCredential:(id)a4 replyGroup:(id)a5;
- (void)_postLaunchEventsForGame:(id)a3 moc:(id)a4;
- (void)_preloadDataForGameCenterTabs;
- (void)_primeCacheWithGroup:(id)a3;
- (void)_syncPlayerOnboardingParametersInManagedObjectContext:(id)a3 withServerResult:(id)a4;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8;
- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7;
- (void)authenticateNonActivePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
- (void)checkActivitySharingRepromptWithCompletion:(id)a3;
- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)getAccountAuthTokenWithHandler:(id)a3;
- (void)getDevicePushTokenWithHandler:(id)a3;
- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)isICloudAvailableWithHandler:(id)a3;
- (void)notifyClient:(id)a3 authenticationDidChangeWithError:(id)a4 handler:(id)a5;
- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4;
- (void)notifyClient:(id)a3 playerAuthenticatedWithCredential:(id)a4 authenticatingBundleID:(id)a5;
- (void)renewAuthToken;
- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5;
- (void)setActivitySharingRepromptLastTriggerDate:(id)a3;
- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4;
- (void)setupAccountForParameters:(id)a3 handler:(id)a4;
- (void)switchLocalPlayerWithAltDSID:(id)a3 handler:(id)a4;
- (void)updateBadgeCounts;
- (void)updateClientSettings:(id)a3;
- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
@end

@implementation GKAccountServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKAccountServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x10000LL;
}

- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "getAccountAgeCategoryForPlayerID: %@",  (uint8_t *)&v14,  0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "credentialForPlayerID:environment:", v6, objc_msgSend(v12, "environment")));

  v8[2]( v8,  +[GKAccountServicePrivate getAccountAgeCategoryForCredential:]( &OBJC_CLASS___GKAccountServicePrivate,  "getAccountAgeCategoryForCredential:",  v13));
}

+ (int)getAccountAgeCategoryForCredential:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v28 = ACAccountTypeIdentifierIDMS;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  id v24 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accountsWithAccountTypeIdentifiers:v5 error:&v24]);
  id v7 = v24;

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers(v8);
    }
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_100020AE4();
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  uint64_t v27 = ACAccountTypeIdentifierAppleAccount;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  id v23 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 accountsWithAccountTypeIdentifiers:v11 error:&v23]);
  id v13 = v23;

  if (v13)
  {
    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers(v14);
    }
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_100020A84();
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKAccountServicePrivate getAccountMatchingCredential:from:]( &OBJC_CLASS___GKAccountServicePrivate,  "getAccountMatchingCredential:from:",  v3,  v6));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKAccountServicePrivate getAccountMatchingCredential:from:]( &OBJC_CLASS___GKAccountServicePrivate,  "getAccountMatchingCredential:from:",  v3,  v12));

  uint64_t v18 = +[GKAccountServicePrivate getAgeCategoryFromIDMS:appleAccount:]( &OBJC_CLASS___GKAccountServicePrivate,  "getAgeCategoryFromIDMS:appleAccount:",  v16,  v17);
  int v19 = v18;
  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers(v18);
  }
  v21 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "getAccountAgeCategoryForCredential: Returning GKPlayerAgeCategory(%d)",  buf,  8u);
  }

  return v19;
}

+ (id)getAccountMatchingCredential:(id)a3 from:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSIDForAccount:v12]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
        unsigned __int8 v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) != 0
          || (v16 = (void *)objc_claimAutoreleasedReturnValue([v12 username]),
              v17 = (void *)objc_claimAutoreleasedReturnValue([v5 accountName]),
              unsigned __int8 v18 = [v16 isEqualToString:v17],
              v17,
              v16,
              (v18 & 1) != 0))
        {
          id v19 = v12;

          goto LABEL_13;
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v19 = 0LL;
      if (v9) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v19 = 0LL;
  }

+ (int)getAgeCategoryFromIDMS:(id)a3 appleAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v8 = v7;
  if (v5)
  {
    id v9 = [v7 userUnderAgeForAccount:v5];
    if ((_DWORD)v9)
    {
      if (!os_log_GKGeneral) {
        id v10 = (id)GKOSLoggers(v9);
      }
      v11 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "getAccountAgeCategoryForPlayerID: IDMS account has isUnderage = 1, result = GKPlayerAgeCategoryChild",  (uint8_t *)&v31,  2u);
      }

      int v12 = 3;
      goto LABEL_32;
    }

    if (!v6
      || (uint64_t v13 = +[GKAccountServicePrivate playerAgeCategoryForAccount:]( &OBJC_CLASS___GKAccountServicePrivate,  "playerAgeCategoryForAccount:",  v6),  (v12 = v13) == 0))
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue([v8 birthYearForAccount:v5]);
      if (v16)
      {
        unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        id v20 = [v18 component:4 fromDate:v19];

        v21 = [v16 integerValue];
        uint64_t v22 = v20 - v21;
        if (v20 - v21 > 21) {
          int v12 = 1;
        }
        else {
          int v12 = 2;
        }
        if (!os_log_GKGeneral) {
          id v23 = (id)GKOSLoggers(v21);
        }
        __int128 v24 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          BOOL v25 = v22 > 21;
          int v26 = v24;
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v22));
          int v31 = 138413058;
          id v32 = v16;
          __int16 v33 = 2112;
          v34 = v27;
          __int16 v35 = 1024;
          BOOL v36 = v25;
          __int16 v37 = 1024;
          int v38 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "getAccountAgeCategoryForPlayerID: IDMS account has yob = %@, approximated age = %@, isAdult = %d, result = G KPlayerAgeCategory(%d)",  (uint8_t *)&v31,  0x22u);
        }
      }

      else
      {
        if (!os_log_GKGeneral) {
          id v28 = (id)GKOSLoggers(0LL);
        }
        v29 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          int v12 = 2;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "getAccountAgeCategoryForPlayerID: IDMS account has no yob, treat the player as GKPlayerAgeCategoryAdolescent",  (uint8_t *)&v31,  2u);
        }

        else
        {
          int v12 = 2;
        }
      }

      goto LABEL_31;
    }
  }

  else
  {
    if (!v6)
    {
      int v12 = 0;
      goto LABEL_32;
    }

    uint64_t v13 = +[GKAccountServicePrivate playerAgeCategoryForAccount:]( &OBJC_CLASS___GKAccountServicePrivate,  "playerAgeCategoryForAccount:",  v6);
    int v12 = v13;
    if (!(_DWORD)v13) {
      goto LABEL_32;
    }
  }

  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v13);
  }
  unsigned __int8 v15 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v6, "aa_ageCategory")));
    int v31 = 138412290;
    id v32 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_INFO,  "getAccountAgeCategoryForPlayerID: AppleAccount account has a populated ageCategory = %@",  (uint8_t *)&v31,  0xCu);

LABEL_31:
  }

+ (int)playerAgeCategoryForAccount:(id)a3
{
  id v3 = (char *)objc_msgSend(a3, "aa_ageCategory");
  else {
    return dword_1001F2E88[(void)(v3 - 1)];
  }
}

- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[GKPlayerInternalOnboarding initWithPlayerID:]( objc_alloc(&OBJC_CLASS___GKPlayerInternalOnboarding),  "initWithPlayerID:",  v7);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 replyQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000113C4;
  v13[3] = &unk_10026B030;
  id v14 = v8;
  id v15 = v6;
  v11 = v8;
  id v12 = v6;
  dispatch_async(v10, v13);
}

+ (id)standardUserDefaults
{
  return +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
}

+ (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayedForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkSHA256Hash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastWelcomeWhatsNewCopyVersionDisplayedForHashedPlayerID_%@",  v5));

  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 integerForKey:v6];

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  uint64_t v13 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    *(_DWORD *)buf = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "lastWelcomeWhatsNewCopyVersionDisplayedForPlayer (%@) -> %@",  buf,  0x16u);
  }

  return (unint64_t)v10;
}

+ (unint64_t)lastPrivacyNoticeVersionDisplayedForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkSHA256Hash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastPrivacyNoticeVersionDisplayedForHashedPlayerID_%@",  v5));

  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 integerForKey:v6];

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  uint64_t v13 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
    *(_DWORD *)buf = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "lastPrivacyNoticeVersionDisplayedForPlayer (%@) -> %@",  buf,  0x16u);
  }

  return (unint64_t)v10;
}

+ (id)lastPersonalizationVersionDisplayedForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkSHA256Hash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastPersonalizationVersionDisplayedForHashedPlayerID_%@",  v5));

  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringForKey:v6]);

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  uint64_t v13 = (os_log_s *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "lastPersonalizationVersionDisplayedForPlayer (%@) -> %@",  buf,  0x16u);
  }

  return v10;
}

+ (id)lastProfilePrivacyVersionDisplayedForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkSHA256Hash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastProfilePrivacyVersionDisplayedForHashedPlayerID_%@",  v5));

  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringForKey:v6]);

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  uint64_t v13 = (os_log_s *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "lastProfilePrivacyVersionDisplayedForPlayer (%@) -> %@",  buf,  0x16u);
  }

  return v10;
}

+ (id)lastFriendSuggestionsVersionDisplayedForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkSHA256Hash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastFriendSuggestionsVersionDisplayedForHashedPlayerID_%@",  v5));

  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringForKey:v6]);

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  uint64_t v13 = (os_log_s *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "lastFriendSuggestionsVersionDisplayedForPlayer (%@) -> %@",  buf,  0x16u);
  }

  return v10;
}

+ (id)lastContactsIntegrationConsentVersionDisplayedForPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _gkSHA256Hash]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GKLastContactsIntegrationConsentVersionDisplayedForHashedPlayerID_%@",  v5));

  id v8 = objc_msgSend((id)objc_opt_class(a1, v7), "standardUserDefaults");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringForKey:v6]);

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  uint64_t v13 = (os_log_s *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "lastContactsIntegrationConsentVersionDisplayedForPlayer (%@) -> %@",  buf,  0x16u);
  }

  return v10;
}

- (void)isICloudAvailableWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKAccountService isICloudAvailableWithHandler",  buf,  2u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100011D44;
  v16[3] = &unk_10026B170;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"isICloudAvailable"));
  id v17 = v8;
  id v18 = self;
  [v8 perform:v16];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 replyQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100011F08;
  v13[3] = &unk_10026B030;
  id v14 = v8;
  id v15 = v5;
  id v11 = v8;
  id v12 = v5;
  [v11 notifyOnQueue:v10 block:v13];
}

- (BOOL)requiresAuthenticationForSelector:(SEL)a3
{
  if (sel_isEqual("getAccountNameWithHandler:", a3)
    || sel_isEqual("getAuthenticatedPlayerIDWithHandler:", a3)
    || sel_isEqual("getAuthenticatedLocalPlayersWithStatus:handler:", a3))
  {
    return 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKAccountServicePrivate;
  return -[GKService requiresAuthenticationForSelector:](&v6, "requiresAuthenticationForSelector:", a3);
}

- (void)updateBadgeCounts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  812LL,  "-[GKAccountServicePrivate updateBadgeCounts]"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v4));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001216C;
  v13[3] = &unk_10026B5E0;
  void v13[4] = self;
  [v5 perform:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100012210;
  v11[3] = &unk_10026B608;
  v11[4] = self;
  id v12 = v5;
  id v6 = v5;
  [v6 performOnManagedObjectContext:v11];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 replyQueue]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100012500;
  v9[3] = &unk_10026B670;
  id v10 = v3;
  id v8 = v3;
  [v6 notifyOnQueue:v7 block:v9];
}

- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  859LL,  "-[GKAccountServicePrivate _authenticateUsername:password:altDSID:validateOnly:handler:]"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000126EC;
  v22[3] = &unk_10026B710;
  id v23 = v12;
  id v24 = v13;
  BOOL v28 = a6;
  id v25 = v14;
  int v26 = self;
  id v27 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v16, v22);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v21 reportEvent:GKReporterDomainLogin type:GKLoginSignIn];
}

- (void)_authenticateUsername:(id)a3 password:(id)a4 altDSID:(id)a5 validateOnly:(BOOL)a6 active:(BOOL)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1009LL,  "-[GKAccountServicePrivate _authenticateUsername:password:altDSID:validateOnly:active:handler:]"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000136A8;
  v24[3] = &unk_10026B7B0;
  id v25 = v14;
  id v26 = v15;
  BOOL v30 = a6;
  id v27 = v16;
  BOOL v28 = self;
  BOOL v31 = a7;
  id v29 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v18, v24);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v23 reportEvent:GKReporterDomainLogin type:GKLoginSignIn];
}

- (void)getAccountAuthTokenWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000146E4;
    v6[3] = &unk_10026B030;
    id v8 = v4;
    id v7 = v5;
    dispatch_async(&_dispatch_main_q, v6);
  }
}

- (void)getDevicePushTokenWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 pushToken]);
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)_constructAuthenticationResponseWithError:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1185LL,  "-[GKAccountServicePrivate _constructAuthenticationResponseWithError:handler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100014898;
  v11[3] = &unk_10026B148;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v8, v11);
}

- (void)_addGameListEntryForGame:(id)a3 profile:(id)a4 moc:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 gameList]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100014FF4;
    v14[3] = &unk_10026B8A0;
    id v11 = v10;
    id v15 = v11;
    id v12 = (GKGameListEntryCacheObject *)objc_claimAutoreleasedReturnValue([v8 findEntry:v14]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 mutableOrderedSetValueForKeyPath:@"entries"]);
    if (!v12)
    {
      id v12 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKGameListEntryCacheObject),  "initWithManagedObjectContext:",  v7);
      -[GKGameListEntryCacheObject setBundleID:](v12, "setBundleID:", v11);
      [v13 addObject:v12];
    }

    [v13 insertObject:v12 atIndex:0];
  }
}

- (void)_addAchievementPointsEntryForGame:(id)a3 record:(id)a4 profile:(id)a5 moc:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a5 achievementPointsList]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001517C;
    v17[3] = &unk_10026B8C8;
    id v14 = v13;
    id v18 = v14;
    id v15 = (GKAchievementPointsEntryCacheObject *)objc_claimAutoreleasedReturnValue([v11 findEntry:v17]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 mutableOrderedSetValueForKeyPath:@"entries"]);
    if (!v15)
    {
      id v15 = -[GKCacheObject initWithManagedObjectContext:]( objc_alloc(&OBJC_CLASS___GKAchievementPointsEntryCacheObject),  "initWithManagedObjectContext:",  v10);
      -[GKAchievementPointsEntryCacheObject setGameRecord:](v15, "setGameRecord:", v9);
      [v16 addObject:v15];
    }

    [v16 insertObject:v15 atIndex:0];
  }
}

- (void)_postLaunchEventsForGame:(id)a3 moc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v30) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAccountService _postLaunchEventsForGame:",  (uint8_t *)&v30,  2u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 launchEvent]);

  if (v12)
  {
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers(v13);
    }
    id v15 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      unsigned int v17 = [v12 eventType];
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 context]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      int v30 = 67109634;
      *(_DWORD *)BOOL v31 = v17;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = v18;
      __int16 v32 = 2112;
      __int16 v33 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Launch event(%d) context %@ for client %@",  (uint8_t *)&v30,  0x1Cu);
    }

    id v20 = (id)objc_claimAutoreleasedReturnValue([v12 context]);
    id v21 = [v12 eventType];
    if (v21 == (id)2)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___GKFriendRequestInternal, v22);
      objc_opt_isKindOfClass(v20, v27);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      [v24 friendRequestSelected:v20];
    }

    else if (v21 == (id)1)
    {
      uint64_t v28 = objc_opt_class(&OBJC_CLASS___GKChallengeInternal, v22);
      objc_opt_isKindOfClass(v20, v28);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      [v24 completedChallengeSelected:v20];
    }

    else
    {
      if (v21)
      {
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v23 = objc_opt_class(&OBJC_CLASS___GKChallengeInternal, v22);
      objc_opt_isKindOfClass(v20, v23);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      [v24 receivedChallengeSelected:v20];
    }

- (void)renewAuthToken
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKAccountService renewAuthToken", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015614;
  v7[3] = &unk_10026B910;
  v7[4] = self;
  [v5 issueRequest:0 bagKey:@"gk-renew-auth-token" clientProxy:v6 handler:v7];
}

- (void)_initGameForLaunchedApp:(BOOL)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v5);
  }
  id v8 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAccountService _initGame", buf, 2u);
  }

  *(void *)buf = 0LL;
  uint64_t v28 = buf;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1364LL,  "-[GKAccountServicePrivate _initGameForLaunchedApp:withHandler:]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v10));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100015A50;
  v21[3] = &unk_10026B988;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v22 = v12;
  uint64_t v23 = self;
  id v13 = v11;
  id v24 = v13;
  id v26 = buf;
  id v14 = v9;
  id v25 = v14;
  [v13 perform:v21];
  if (v6)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100016110;
    v17[3] = &unk_10026B9B0;
    id v19 = v6;
    id v18 = v13;
    id v20 = buf;
    [v18 notifyOnQueue:v15 block:v17];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v16 reportEvent:GKReporterDomainLogin type:GKLoginAppInit];

  _Block_object_dispose(buf, 8);
}

- (void)_syncPlayerOnboardingParametersInManagedObjectContext:(id)a3 withServerResult:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]( &OBJC_CLASS___GKPlayerProfileCacheObject,  "localPlayerInManagedObjectContext:",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 representedItem]);

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  id v10 = (void *)os_log_GKOnboarding;
  if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
  {
    log = v10;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned int v42 = [v46 forcePrivacyNotice];
    uint64_t v11 = GKAccountPrivacyNoticeVersionKey;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAccountPrivacyNoticeVersionKey]);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned int v41 = [v44 forceDefaultNickname];
    uint64_t v13 = GKAccountIsDefaultNicknameKey;
    v40 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAccountIsDefaultNicknameKey]);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned int v39 = [v43 forceDefaultPrivacy];
    uint64_t v14 = GKAccountHasPrivacySettingsKey;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAccountHasPrivacySettingsKey]);
    v47 = v6;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned int v17 = [v16 forceDefaultContactsIntegrationConsent];
    uint64_t v18 = GKContactsIntegrationConsentKey;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKContactsIntegrationConsentKey]);
    *(_DWORD *)buf = 67111938;
    unsigned int v51 = v42;
    __int16 v52 = 2112;
    uint64_t v53 = v11;
    __int16 v54 = 2112;
    v55 = v12;
    __int16 v56 = 1024;
    unsigned int v57 = v41;
    __int16 v58 = 2112;
    uint64_t v59 = v13;
    __int16 v60 = 2112;
    v61 = v40;
    __int16 v62 = 1024;
    unsigned int v63 = v39;
    __int16 v64 = 2112;
    uint64_t v65 = v14;
    __int16 v66 = 2112;
    v67 = v15;
    __int16 v68 = 1024;
    unsigned int v69 = v17;
    __int16 v70 = 2112;
    uint64_t v71 = v18;
    __int16 v72 = 2112;
    v73 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Updating onboarding parameters for the player:\n GKPreferences.shared.forcePrivacyNotice=%d, server has %@=%@\n GKPreferences.shared.forceDefaultNickname=%d, server has %@=%@\n GKPreferences.shared.forceDefaultPrivacy=%d, server has %@=%@\n GKPreferences.shared.forceDefaultContactsIntegrationConsent=%d, server has %@=%@",  buf,  0x6Au);

    id v6 = v47;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v21 = [v20 forcePrivacyNotice];

  if (v21)
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers(v22);
    }
    id v24 = (os_log_s *)os_log_GKOnboarding;
    if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Going to skip syncing the privacy notice version from the server because the test flag is set.",  buf,  2u);
    }
  }

  else
  {
    uint64_t v25 = GKAccountPrivacyNoticeVersionKey;
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAccountPrivacyNoticeVersionKey]);

    if (v26)
    {
      if (!os_log_GKGeneral) {
        id v28 = (id)GKOSLoggers(v27);
      }
      uint64_t v29 = (os_log_s *)os_log_GKOnboarding;
      if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "The server has a valid privacy notice version.",  buf,  2u);
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v25]);
      -[GKAccountService setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:]( self,  "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:",  [v30 unsignedIntegerValue]);
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v31 = (id)GKOSLoggers(v27);
      }
      __int16 v32 = (os_log_s *)os_log_GKOnboarding;
      if (os_log_type_enabled(os_log_GKOnboarding, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "The server doesn't have this player's privacy notice version.",  buf,  2u);
      }

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_100016720;
      v49[3] = &unk_10026B9F8;
      v49[4] = self;
      -[GKAccountService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]( self,  "getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:",  v49);
    }
  }

  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAccountIsDefaultNicknameKey]);
  if ([v33 BOOLValue])
  {
    [v6 setDefaultNickname:1];
  }

  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    objc_msgSend(v6, "setDefaultNickname:", objc_msgSend(v34, "forceDefaultNickname"));
  }

  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKAccountHasPrivacySettingsKey]);
  if ([v35 BOOLValue])
  {
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    objc_msgSend(v6, "setDefaultPrivacyVisibility:", objc_msgSend(v36, "forceDefaultPrivacy"));
  }

  else
  {
    [v6 setDefaultPrivacyVisibility:1];
  }

  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:GKContactsIntegrationConsentKey]);
  if ([v37 isEqualToString:GKContactsIntegrationConsentUndetermined])
  {
    [v6 setDefaultContactsIntegrationConsent:1];
  }

  else
  {
    int v38 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    objc_msgSend( v6,  "setDefaultContactsIntegrationConsent:",  objc_msgSend(v38, "forceDefaultContactsIntegrationConsent"));
  }
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
}

- (id)_authenticatedLocalPlayerWithUsername:(id)a3 inContext:(id)a4 isValid:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (username != ((void *)0))\n[%s (%s:%d)]",  v11,  "-[GKAccountServicePrivate _authenticatedLocalPlayerWithUsername:inContext:isValid:]",  [v13 UTF8String],  1523));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers(v9);
  }
  id v16 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "GKAccountService _authenticatedLocalPlayerWithUsername:",  buf,  2u);
  }

  *(void *)buf = 0LL;
  id v28 = buf;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_100014BE4;
  id v31 = sub_100014BF4;
  id v32 = 0LL;
  *a5 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000169C8;
  v21[3] = &unk_10026BA20;
  id v17 = v8;
  id v22 = v17;
  id v18 = v10;
  uint64_t v25 = buf;
  id v26 = a5;
  id v23 = v18;
  id v24 = self;
  [v18 performBlockAndWait:v21];
  id v19 = *((id *)v28 + 5);

  _Block_object_dispose(buf, 8);
  return v19;
}

- (void)_primeCacheWithGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKFriendServicePrivate, "serviceFromService:", self));
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_100016D44;
  uint64_t v14 = &unk_10026BA70;
  id v8 = v6;
  id v15 = v8;
  CFAbsoluteTime v16 = Current;
  [v4 perform:&v11];

  if ((objc_msgSend(v5, "isUIService", v11, v12, v13, v14) & 1) == 0
    && ([v5 isExtension] & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceFromService:]( &OBJC_CLASS___GKMultiplayerMatchService,  "serviceFromService:",  self));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 gameDescriptor]);
    [v9 getCompatibilityMatrix:v10 handler:0];
  }
}

- (void)_fetchCredentialsForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1586LL,  "-[GKAccountServicePrivate _fetchCredentialsForUsername:password:altDSID:handler:]"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100016FA8;
  v19[3] = &unk_10026B0A8;
  id v20 = v10;
  id v21 = v11;
  id v22 = self;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v14, v19);
}

- (void)_fetchCredentialsForAltDSID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1629LL,  "-[GKAccountServicePrivate _fetchCredentialsForAltDSID:handler:]"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017538;
  v11[3] = &unk_10026B148;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v8, v11);
}

- (void)_fetchCredentialsForNonActivePlayerForUsername:(id)a3 password:(id)a4 altDSID:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1638LL,  "-[GKAccountServicePrivate _fetchCredentialsForNonActivePlayerForUsername:password:altDSID:handler:]"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000177A4;
  v19[3] = &unk_10026B0A8;
  id v20 = v10;
  id v21 = v11;
  id v22 = self;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v14, v19);
}

- (void)_preloadDataForGameCenterTabs
{
  dispatch_time_t v3 = dispatch_time(0LL, 100000000LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 replyQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017CA4;
  block[3] = &unk_10026B670;
  block[4] = self;
  dispatch_after(v3, v5, block);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = v16;
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v16);
  }
  id v19 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "GKAccountService auth username:%@", buf, 0xCu);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1714LL,  "-[GKAccountServicePrivate authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:]"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100018074;
  v25[3] = &unk_10026B710;
  BOOL v30 = a6;
  v25[4] = self;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v17;
  id v21 = v17;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v20, v25);
}

- (void)switchLocalPlayerWithAltDSID:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKAccountService switching local player (current:%@):with altDSID player:%@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1810LL,  "-[GKAccountServicePrivate switchLocalPlayerWithAltDSID:handler:]"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000189C0;
  v14[3] = &unk_10026B148;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v12 = v8;
  id v13 = v6;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v11, v14);
}

- (void)authenticateNonActivePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = v14;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers(v14);
  }
  id v17 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "GKAccountService auth username for additional Game Center account:%@",  buf,  0xCu);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  1884LL,  "-[GKAccountServicePrivate authenticateNonActivePlayerWithUsername:password:altDSID:usingFastPath:handler:]"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000192C8;
  v23[3] = &unk_10026B0A8;
  v23[4] = self;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", v18, v23);
}

- (void)notifyClient:(id)a3 authenticationDidChangeWithError:(id)a4 handler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100019A1C;
  v9[3] = &unk_10026B148;
  void v9[4] = self;
  id v10 = a4;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  [a3 sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:0 completionHandler:v9];
}

- (void)_loadProfileWithGroup:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v5);
  }
  id v8 = (os_log_s *)os_log_GKTrace;
  BOOL v9 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAccountService _loadProfile", buf, 2u);
  }

  id v10 = (void *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = (id)GKOSLoggers(v9);
    id v10 = (void *)os_log_GKGeneral;
  }

  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000212FC(v10, (void *)a2);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100019C5C;
  v13[3] = &unk_10026B170;
  void v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v12 perform:v13];
}

- (void)_appInitWithGroup:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v5);
  }
  id v8 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAccountService _appInit", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100019F6C;
  v10[3] = &unk_10026BC60;
  id v11 = v6;
  SEL v12 = a2;
  v10[4] = self;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v9 = v6;
  [v9 perform:v10];
}

- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "notifyClient:playerAuthenticatedFromClient:",  buf,  2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001A768;
  v14[3] = &unk_10026BC88;
  id v15 = v6;
  id v16 = self;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v18 = v8;
  id v11 = v8;
  id v12 = v17;
  id v13 = v6;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v14);
}

- (void)notifyClient:(id)a3 playerAuthenticatedWithCredential:(id)a4 authenticatingBundleID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  int v11 = GKGetApplicationStateForBundleID(v10);

  if (v11 == 8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 transportWithCredential:v8]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:credential:]( &OBJC_CLASS___GKAccountServicePrivate,  "serviceWithTransport:forClient:credential:",  v12,  v7,  v8));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001A90C;
    v14[3] = &unk_10026BCF0;
    id v15 = v7;
    id v16 = v9;
    [v13 _initGameForLaunchedApp:0 withHandler:v14];
  }

  else
  {
    [v7 sendAuthenticationDidChangeNotificationWithAuthenticatingBundleID:v9 completionHandler:&stru_10026BD10];
  }
}

- (void)_notifyAllClientsPlayerAuthenticatedFromClient:(id)a3 withCredential:(id)a4 replyGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001AAC4;
  v13[3] = &unk_10026BC88;
  id v14 = v8;
  id v15 = a5;
  id v16 = self;
  id v17 = v9;
  id v10 = v9;
  id v11 = v15;
  id v12 = v8;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v13);
}

- (void)_fetchLoginDisabledWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___GKSignInVisibilityConfig);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 storeBag]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 storeBag]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:GKSignInBannerEnabled]);

    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0) {
      LOBYTE(v7) = [v10 BOOLValue];
    }
    else {
      LOBYTE(v7) = 0;
    }
  }

  BOOL v13 = -[GKAccountServicePrivate shouldSuppressFullscreenSignInSheet](self, "shouldSuppressFullscreenSignInSheet");
  BOOL v14 = v13;
  if (v13)
  {
    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers(v13);
    }
    id v16 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "GKAccountService _fetchLoginDisabledWithHandler: Suppressing full screen sign in sheet",  buf,  2u);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 storeBag]);
  if (!v18) {
    LOBYTE(v7) = 0;
  }

  if ((v7 & 1) != 0)
  {
    v37[0] = GKFullscreenSignInSheetLimit;
    v37[1] = GKFullscreenSignInSheetInitialLimit;
    v37[2] = GKFullscreenSignInSheetCooldown;
    v37[3] = GKFullscreenSignInSheetMinTimeBetween;
    v37[4] = GKFullscreenSignInSheetEnabled;
    v37[5] = GKSignInBannerLimit;
    v37[6] = GKSignInBannerInitialLimit;
    v37[7] = GKSignInBannerCooldown;
    v37[8] = GKSignInBannerMinTimeBetween;
    v37[9] = GKSignInBannerEnabled;
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 10LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 storeBag]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 replyQueue]);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10001B028;
    v29[3] = &unk_10026BD60;
    id v30 = v5;
    id v31 = v4;
    BOOL v32 = v14;
    id v24 = v4;
    [v21 getValuesForKeys:v19 queue:v23 completion:v29];
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 sheetConfig]);
    [v25 setLimit:3];

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 bannerConfig]);
    [v26 setEnabled:0];

    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 signInVisibilityManager]);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10001B010;
    v33[3] = &unk_10026BD38;
    id v34 = v4;
    BOOL v35 = v14;
    id v19 = v4;
    [v28 promptsDisabledWithConfig:v5 scope:1 handler:v33];

    id v24 = v34;
  }
}

- (BOOL)shouldSuppressFullscreenSignInSheet
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);

  if (v3) {
    unsigned __int8 v4 = +[GKGame isNewsApp:](&OBJC_CLASS___GKGame, "isNewsApp:", v3);
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_continueAuthenticationWithHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001B430;
  v4[3] = &unk_10026BD88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[GKAccountServicePrivate _fetchLoginDisabledWithHandler:](v5, "_fetchLoginDisabledWithHandler:", v4);
}

- (void)_continueAuthenticationWithLoginDisabled:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    uint64_t v11 = NSStringFromSelector(a2);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    *(_DWORD *)buf = 138412546;
    __int16 v64 = v12;
    __int16 v65 = 2112;
    __int16 v66 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ cred:%@", buf, 0x16u);
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountName]);

  if (!v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (credential.accountName)\n[%s (%s:%d)]",  v16,  "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]",  [v18 UTF8String],  2260));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v19);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 playerInternal]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 playerID]);

  if (!v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Assertion failed"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAccountService.m"));
    id v24 = objc_claimAutoreleasedReturnValue([v23 lastPathComponent]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (credential.playerInternal.playerID)\n[%s (%s:%d)]",  v22,  "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]",  [v24 UTF8String],  2261));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v25);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2264LL,  "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]"));
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v27));

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_10001B9FC;
  v62[3] = &unk_10026B670;
  v62[4] = self;
  -[GKAccountServicePrivate updateClientSettings:](self, "updateClientSettings:", v62);
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2272LL,  "-[GKAccountServicePrivate _continueAuthenticationWithLoginDisabled:handler:]"));
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v29));

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 context]);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_10001BA34;
  v59[3] = &unk_10026BDB0;
  id v32 = v14;
  id v60 = v32;
  id v33 = v30;
  id v61 = v33;
  [v31 performBlockAndWait:v59];

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (v32 && !a3)
  {
    -[GKAccountServicePrivate _loadProfileWithGroup:](self, "_loadProfileWithGroup:", v33);
    -[GKAccountServicePrivate _appInitWithGroup:](self, "_appInitWithGroup:", v33);
    -[GKAccountServicePrivate _primeCacheWithGroup:](self, "_primeCacheWithGroup:", v33);
  }

  BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([v26 replyQueue]);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10001BAD8;
  v51[3] = &unk_10026BE00;
  CFAbsoluteTime v57 = Current;
  id v36 = v28;
  id v52 = v36;
  id v37 = v33;
  id v53 = v37;
  __int16 v54 = self;
  id v38 = v32;
  id v55 = v38;
  SEL v58 = a2;
  id v39 = v26;
  id v56 = v39;
  [v36 join:v37 queue:v35 block:v51];

  if (v7)
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10001C268;
    v49[3] = &unk_10026B170;
    v49[4] = self;
    id v40 = v36;
    id v50 = v40;
    [v40 perform:v49];
    unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue([v39 replyQueue]);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10001C374;
    v43[3] = &unk_10026BE50;
    id v48 = v7;
    id v44 = v40;
    id v45 = v38;
    id v46 = v39;
    v47 = self;
    [v44 notifyOnQueue:v41 block:v43];
  }
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8
{
  BOOL v34 = a7;
  id v13 = a4;
  id v14 = a6;
  id v35 = a8;
  id v15 = a5;
  id v16 = a3;
  id v36 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredential internalRepresentation]( &OBJC_CLASS___GKPlayerCredential,  "internalRepresentation"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKLocalPlayerInternal internalRepresentation]( &OBJC_CLASS___GKLocalPlayerInternal,  "internalRepresentation"));
  [v18 setPlayerID:v13];
  [v18 setAlias:v14];
  [v17 setAccountName:v16];

  [v17 setAuthenticationToken:v15];
  [v17 setPlayerInternal:v18];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v17, "setEnvironment:", objc_msgSend(v19, "environment"));

  [v17 setScope:14];
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2416LL,  "-[GKAccountServicePrivate accountCreated:playerID:authenticationToken:alias:finished:handler:]"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v20));

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10001C884;
  v54[3] = &unk_10026B5E0;
  id v22 = v17;
  id v55 = v22;
  [v21 perform:v54];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_10001C9AC;
  v53[3] = &unk_10026B5E0;
  v53[4] = self;
  [v21 perform:v53];
  id v23 = objc_alloc_init(&OBJC_CLASS___GKAuthenticateResponse);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 context]);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10001CA34;
  v46[3] = &unk_10026BE78;
  id v25 = v13;
  id v47 = v25;
  id v26 = v21;
  id v48 = v26;
  v49 = self;
  id v27 = v14;
  id v50 = v27;
  id v28 = v23;
  id v51 = v28;
  id v29 = v22;
  id v52 = v29;
  [v24 performBlockAndWait:v46];

  if (v34)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10001CBA4;
    v44[3] = &unk_10026B170;
    v44[4] = self;
    id v45 = v26;
    [v45 perform:v44];
    id v30 = v45;
  }

  else
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v26 context]);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10001CC98;
    v40[3] = &unk_10026BEA0;
    id v41 = v26;
    unsigned int v42 = self;
    id v43 = v36;
    [v31 performBlockAndWait:v40];

    id v30 = v41;
  }

  if (v35)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 replyQueue]);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10001CEB4;
    v37[3] = &unk_10026B030;
    id v39 = v35;
    id v38 = v26;
    [v38 notifyOnQueue:v33 block:v37];
  }
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9
{
  BOOL v36 = a8;
  id v14 = a4;
  id v15 = a6;
  id v37 = a9;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  id v38 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](&OBJC_CLASS___GKDataRequestManager, "sharedManager"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredential internalRepresentation]( &OBJC_CLASS___GKPlayerCredential,  "internalRepresentation"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[GKLocalPlayerInternal internalRepresentation]( &OBJC_CLASS___GKLocalPlayerInternal,  "internalRepresentation"));
  [v20 setPlayerID:v14];
  [v20 setAlias:v15];
  [v19 setAccountName:v18];

  [v19 setAuthenticationToken:v17];
  [v19 setPlayerInternal:v20];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v19, "setEnvironment:", objc_msgSend(v21, "environment"));

  [v19 setScope:14];
  [v19 setAltDSID:v16];

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2514LL,  "-[GKAccountServicePrivate accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:]"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v22));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10001D310;
  v56[3] = &unk_10026B5E0;
  id v24 = v19;
  id v57 = v24;
  [v23 perform:v56];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_10001D438;
  v55[3] = &unk_10026B5E0;
  v55[4] = self;
  [v23 perform:v55];
  id v25 = objc_alloc_init(&OBJC_CLASS___GKAuthenticateResponse);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 context]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10001D4C0;
  v48[3] = &unk_10026BE78;
  id v27 = v14;
  id v49 = v27;
  id v28 = v23;
  id v50 = v28;
  id v51 = self;
  id v29 = v15;
  id v52 = v29;
  id v30 = v25;
  id v53 = v30;
  id v31 = v24;
  id v54 = v31;
  [v26 performBlockAndWait:v48];

  if (v36)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10001D630;
    v46[3] = &unk_10026B170;
    void v46[4] = self;
    id v47 = v28;
    [v47 perform:v46];
    id v32 = v47;
  }

  else
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v28 context]);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10001D724;
    v42[3] = &unk_10026BEA0;
    id v43 = v28;
    id v44 = self;
    id v45 = v38;
    [v33 performBlockAndWait:v42];

    id v32 = v43;
  }

  if (v37)
  {
    BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 replyQueue]);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10001D940;
    v39[3] = &unk_10026B030;
    id v41 = v37;
    id v40 = v28;
    [v40 notifyOnQueue:v35 block:v39];
  }
}

- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___GKAuthenticateResponse);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2593LL,  "-[GKAccountServicePrivate validateAccountWithUsername:password:handler:]"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v12));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001DB84;
  v26[3] = &unk_10026BEC8;
  v26[4] = self;
  id v27 = v8;
  id v28 = v9;
  id v14 = v13;
  id v29 = v14;
  id v15 = v9;
  id v16 = v8;
  [v14 perform:v26];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 replyQueue]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001DC60;
  v22[3] = &unk_10026BEF0;
  id v24 = v14;
  id v25 = v10;
  id v23 = v11;
  id v19 = v14;
  id v20 = v11;
  id v21 = v10;
  [v19 notifyOnQueue:v18 block:v22];
}

- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2611LL,  "-[GKAccountServicePrivate renewCredentialsForAccountWithUsername:ttl:withCompletion:]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v10));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001DE50;
  v21[3] = &unk_10026BF18;
  id v22 = v8;
  double v24 = a4;
  id v12 = v11;
  id v23 = v12;
  id v13 = v8;
  [v12 perform:v21];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyQueue]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001DF40;
  v18[3] = &unk_10026B030;
  id v19 = v12;
  id v20 = v9;
  id v16 = v12;
  id v17 = v9;
  [v16 notifyOnQueue:v15 block:v18];
}

- (void)setupAccountForParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "standardUserDefaults");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:GKOptedOutOfGameCenter]);
  unsigned int v12 = [v11 BOOLValue];

  if (v12)
  {
    id v14 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v15 = (id)GKOSLoggers(v13);
      id v14 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "GKAppleIDAuthenticationDelegate ignoring authentication response since user has opted out of game center.",  buf,  2u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  GKInternalErrorDomain,  100LL,  0LL));
    v7[2](v7, v16);
    goto LABEL_55;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  if ([v17 isAccountModificationRestricted])
  {

LABEL_10:
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers(v18);
    }
    id v22 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Game Center account will not be saved as accounts are restricted",  buf,  2u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:",  5000LL,  @"Game Center accounts are disabled"));
    if (v7) {
      v7[2](v7, v16);
    }
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKUtilityServicePrivate, "serviceFromService:", self));
    [v23 terminate];

    goto LABEL_55;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v20 = [v19 isGameCenterDisabled];

  if (v20) {
    goto LABEL_10;
  }
  double v24 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountName]);

  uint64_t v27 = objc_claimAutoreleasedReturnValue([v24 _gkAccountForAppleID:v26]);
  id v28 = (void *)v27;
  if (v26) {
    BOOL v29 = v27 == 0;
  }
  else {
    BOOL v29 = 1;
  }
  int v30 = v29;
  int v96 = v30;
  uint64_t v31 = objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v99 = (void *)v31;
  if (!os_log_GKGeneral) {
    id v32 = (id)GKOSLoggers(v31);
  }
  id v33 = v24;
  BOOL v34 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v120 = v6;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Account setup parameters: %@", buf, 0xCu);
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"player-id"]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"alias"]);
  v107 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"apple-id"]);
  v106 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"auth-token"]);
  v103 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"firstName"]);
  v102 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lastName"]);
  v101 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"altDSID"]);
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"dsid"]);
  uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSNumber, v37);
  v105 = v36;
  if ((objc_opt_isKindOfClass(v36, v38) & 1) != 0)
  {
    id v40 = (id)objc_claimAutoreleasedReturnValue([v36 stringValue]);
  }

  else
  {
    uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString, v39);
    if ((objc_opt_isKindOfClass(v36, v41) & 1) == 0)
    {
      v100 = 0LL;
      goto LABEL_33;
    }

    id v40 = v36;
  }

  v100 = v40;
LABEL_33:
  v97 = v26;
  unsigned int v42 = [v26 isEqualToString:v107];
  id v43 = [v35 length];
  id v44 = v33;
  v98 = v28;
  if (v43 && (id v43 = [v106 length]) != 0 && (id v43 = objc_msgSend(v107, "length")) != 0)
  {
    v94 = v35;
    v91 = v33;
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:GKEnvironmentKey]);
    id v92 = +[GKPreferences environmentForString:](&OBJC_CLASS___GKPreferences, "environmentForString:", v45);

    id v46 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v89 = [v46 environment];

    id v47 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredential internalRepresentation]( &OBJC_CLASS___GKPlayerCredential,  "internalRepresentation"));
    id v48 = (void *)objc_claimAutoreleasedReturnValue( +[GKLocalPlayerInternal internalRepresentation]( &OBJC_CLASS___GKLocalPlayerInternal,  "internalRepresentation"));
    id v49 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 authenticationToken]);
    unsigned __int8 v51 = [v50 isEqual:v106];

    v95 = v47;
    if (v96)
    {
      [v48 setPlayerID:v94];
      [v48 setAlias:v104];
      [v48 setFirstName:v103];
      [v48 setLastName:v102];
      id v54 = objc_msgSend((id)objc_opt_class(v48, v53), "compositeNameForFirstName:lastName:", v103, v102);
      id v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      [v48 setCompositeName:v55];

      [v47 setAccountName:v107];
      v90 = v48;
      [v47 setPlayerInternal:v48];
      [v47 setAuthenticationToken:v106];
      objc_msgSend(v47, "setEnvironment:");
      if (v100) {
        objc_msgSend(v47, "setDSID:");
      }
      id v44 = v91;
      id v56 = v105;
      if (v101) {
        objc_msgSend(v47, "setAltDSID:");
      }
      [v47 setScope:14];
      v88 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
      id v57 = [v88 setPrimaryCredential:v47 completionHandler:0];
      if (!os_log_GKGeneral) {
        id v58 = (id)GKOSLoggers(v57);
      }
      uint64_t v59 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v120 = v92;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "Account setup (No existing player): Switching environment(%ld) and recording player credentials, will terminate",  buf,  0xCu);
      }

      id v60 = (void *)objc_claimAutoreleasedReturnValue(+[GKStoreBag storeBagForEnvironment:](&OBJC_CLASS___GKStoreBag, "storeBagForEnvironment:", v92));
      id v61 = (void *)objc_claimAutoreleasedReturnValue( +[GKDataTransport transportWithBag:clientProxy:credential:]( &OBJC_CLASS___GKDataTransport,  "transportWithBag:clientProxy:credential:",  v60,  v99,  v47));
      -[GKService setTransport:](self, "setTransport:", v61);

      __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
      [v62 setEnvironment:v92];
      +[GKClientProxy removeAllCaches](&OBJC_CLASS___GKClientProxy, "removeAllCaches");
      unsigned int v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2747LL,  "-[GKAccountServicePrivate setupAccountForParameters:handler:]"));
      __int16 v64 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v63));

      __int16 v65 = (void *)objc_claimAutoreleasedReturnValue([v64 context]);
      v113[0] = _NSConcreteStackBlock;
      v113[1] = 3221225472LL;
      v113[2] = sub_10001ECB0;
      v113[3] = &unk_10026B938;
      id v114 = v94;
      id v115 = v64;
      id v116 = v104;
      id v117 = v103;
      id v118 = v102;
      id v66 = v64;
      [v65 performBlockAndWait:v113];

      id v35 = v94;
      -[GKAccountServicePrivate _loadProfileWithGroup:](self, "_loadProfileWithGroup:", v66);
      -[GKAccountServicePrivate _appInitWithGroup:](self, "_appInitWithGroup:", v66);
      -[GKAccountServicePrivate _primeCacheWithGroup:](self, "_primeCacheWithGroup:", v66);
      -[GKAccountServicePrivate updateBadgeCounts](self, "updateBadgeCounts");

      v67 = v106;
      id v48 = v90;
    }

    else
    {
      id v35 = v94;
      if (v89 == v92) {
        unsigned __int8 v73 = v51;
      }
      else {
        unsigned __int8 v73 = 0;
      }
      id v56 = v105;
      if ((v73 & 1) != 0 || ((v42 ^ 1) & 1) != 0)
      {
        id v44 = v91;
        v67 = v106;
        if (!os_log_GKGeneral) {
          id v86 = (id)GKOSLoggers(v52);
        }
        v87 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_INFO,  "Account setup not new and no change:",  buf,  2u);
        }
      }

      else
      {
        id v44 = v91;
        v67 = v106;
        if (!os_log_GKGeneral) {
          id v74 = (id)GKOSLoggers(v52);
        }
        v75 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v120 = v48;
          __int16 v121 = 2112;
          v122 = v95;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "Account setup (Player did not change): Recording new credentials and updating profile. Previous player:%@ credential:%@",  buf,  0x16u);
        }

        [v48 setPlayerID:v94];
        [v48 setAlias:v104];
        [v48 setFirstName:v103];
        [v48 setLastName:v102];
        id v77 = objc_msgSend((id)objc_opt_class(v48, v76), "compositeNameForFirstName:lastName:", v103, v102);
        v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        [v48 setCompositeName:v78];

        [v95 setAccountName:v107];
        [v95 setPlayerInternal:v48];
        [v95 setAuthenticationToken:v106];
        [v95 setEnvironment:v92];
        if (v100) {
          objc_msgSend(v95, "setDSID:");
        }
        if (v101) {
          objc_msgSend(v95, "setAltDSID:");
        }
        [v95 setScope:14];
        v93 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
        id v79 = [v93 setPrimaryCredential:v95 completionHandler:0];
        if (!os_log_GKGeneral) {
          id v80 = (id)GKOSLoggers(v79);
        }
        v81 = (os_log_s *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v120 = v95;
          _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_INFO,  "Account setup (Player did not change): saving the received credentials:%@",  buf,  0xCu);
        }

        v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2797LL,  "-[GKAccountServicePrivate setupAccountForParameters:handler:]"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v82));

        v84 = (void *)objc_claimAutoreleasedReturnValue([v83 context]);
        v108[0] = _NSConcreteStackBlock;
        v108[1] = 3221225472LL;
        v108[2] = sub_10001ED5C;
        v108[3] = &unk_10026BF40;
        id v109 = v83;
        id v110 = v104;
        id v111 = v103;
        id v112 = v102;
        id v85 = v83;
        [v84 performBlockAndWait:v108];

        id v35 = v94;
      }
    }

    id v16 = 0LL;
    int v70 = v96;
    if (!v7) {
      goto LABEL_52;
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v68 = (id)GKOSLoggers(v43);
    }
    unsigned int v69 = (os_log_s *)os_log_GKError;
    id v56 = v105;
    v67 = v106;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v120 = v35;
      __int16 v121 = 2112;
      v122 = v106;
      __int16 v123 = 2112;
      v124 = v107;
      _os_log_error_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_ERROR,  "SetupAccountForParameters: Missing expected account setup parameters playerID:%@ token:%@ accountName:%@",  buf,  0x20u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForServerCode:reason:]( &OBJC_CLASS___NSError,  "userErrorForServerCode:reason:",  5000LL,  @"Missing expected account setup parameters"));
    int v70 = 0;
    if (!v7) {
      goto LABEL_52;
    }
  }

  int v71 = v70;
  v7[2](v7, v16);
  int v70 = v71;
  id v56 = v105;
LABEL_52:
  if (v70)
  {
    __int16 v72 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKUtilityServicePrivate, "serviceFromService:", self));
    [v72 terminate];
  }

LABEL_55:
}

- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2832LL,  "-[GKAccountServicePrivate accountEdited:alias:firstName:lastName:handler:]"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v17));

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 context]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001F07C;
  v26[3] = &unk_10026BF68;
  id v27 = v18;
  id v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  id v25 = v18;
  [v19 performBlock:v26];
}

- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](self, "credential"));
  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 credential]);
  }

  id v10 = [v8 scope];
  unsigned int v11 = v10;
  if ((v4 & 4) != 0) {
    uint64_t v12 = v10 | 0xC;
  }
  else {
    uint64_t v12 = v10 & 0xFFFFFFF3 | v4 & 8;
  }
  if (!os_log_GKGeneral) {
    id v13 = (id)GKOSLoggers(v10);
  }
  id v14 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v8;
    __int16 v25 = 2048;
    uint64_t v26 = v12;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "setLoginStatus cred:(%@) new:%lX old:%lX",  buf,  0x20u);
  }

  [v8 setScope:v12];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_10001F3D8;
  id v20 = &unk_10026B2A0;
  id v21 = self;
  id v22 = v6;
  id v15 = v6;
  id v16 = objc_retainBlock(&v17);
  if ((v4 & 4) != 0) {
    objc_msgSend(v7, "setPrimaryCredential:completionHandler:", v8, v16, v17, v18, v19, v20, v21, v22);
  }
  else {
    objc_msgSend(v7, "setCredential:completionHandler:", v8, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)updateClientSettings:(id)a3
{
  id v20 = a3;
  char v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2924LL,  "-[GKAccountServicePrivate updateClientSettings:]"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 storeBag]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 isStoreDemoModeEnabled]));
  [v5 setObject:v9 forKeyedSubscript:@"storeDemoModeEnabled"];

  [v8 debugRequestTimeout];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v5 setObject:v10 forKeyedSubscript:@"GKDebugRequestTimeout"];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKLocalPlayerInternal archivedProfile](&OBJC_CLASS___GKLocalPlayerInternal, "archivedProfile"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"GKAllowNearbyMultiplayer",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 shouldAllowNearbyMultiplayer]));
  [v5 setObject:v14 forKeyedSubscript:v13];

  if (v7)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 shouldUseHTTPPipelining]));
    [v5 setObject:v15 forKeyedSubscript:@"GKHTTPPipelining"];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001F784;
    v24[3] = &unk_10026B080;
    id v25 = v7;
    uint64_t v26 = self;
    id v27 = v5;
    [v27 perform:v24];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001FA60;
  v21[3] = &unk_10026B148;
  void v21[4] = self;
  id v22 = v5;
  id v23 = v20;
  id v18 = v20;
  id v19 = v5;
  [v19 notifyOnQueue:v17 block:v21];
}

- (void)checkActivitySharingRepromptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "checkActivitySharingRepromptWithCompletion",  buf,  2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKAccountService.m",  2962LL,  "-[GKAccountServicePrivate checkActivitySharingRepromptWithCompletion:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001FC98;
  v18[3] = &unk_10026B170;
  void v18[4] = self;
  id v10 = v9;
  id v19 = v10;
  [v10 perform:v18];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 replyQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100020198;
  v15[3] = &unk_10026B030;
  id v16 = v10;
  id v17 = v5;
  id v13 = v10;
  id v14 = v5;
  [v13 notifyOnQueue:v12 block:v15];
}

- (BOOL)shouldCadencedActivitySharingRepromptWithLimit:(int64_t)a3 minDaysBetween:(int64_t)a4
{
  id v6 = objc_msgSend((id)objc_opt_class(self, a2), "standardUserDefaults");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"GKActivitySharingReprompt"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"totalTriggerCount"]);
  id v10 = [v9 integerValue];

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  id v13 = (os_log_s *)os_log_GKTrace;
  BOOL v14 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v14)
  {
    *(_DWORD *)buf = 134217984;
    int64_t v45 = (int64_t)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "shouldCadencedActivitySharingReprompt: totalTriggerCount=%ld",  buf,  0xCu);
  }

  if ((uint64_t)v10 < a3)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"lastTriggerDate"]);
    id v16 = (void *)v15;
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers(v15);
    }
    id v18 = (os_log_s *)os_log_GKTrace;
    BOOL v19 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      int64_t v45 = (int64_t)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "shouldCadencedActivitySharingReprompt: lastTriggerDate=%@",  buf,  0xCu);
    }

    if (!v16)
    {
      if (!os_log_GKGeneral) {
        id v38 = (id)GKOSLoggers(v19);
      }
      uint64_t v39 = (os_log_s *)os_log_GKTrace;
      BOOL v30 = 1;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "shouldCadencedActivitySharingReprompt: Yes, the reprompt has never been triggered before.",  buf,  2u);
      }

      goto LABEL_35;
    }

    int64_t v20 = a4;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    id v43 = (void *)v21;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 components:16 fromDate:v16 toDate:v21 options:0]);
    id v24 = [v23 day];
    int64_t v25 = (int64_t)v24;
    if (!os_log_GKGeneral) {
      id v26 = (id)GKOSLoggers(v24);
    }
    id v27 = (os_log_s *)os_log_GKTrace;
    BOOL v28 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
    if (v28)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v45 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "shouldCadencedActivitySharingReprompt: days diff=%ld",  buf,  0xCu);
    }

    BOOL v29 = v25 <= v20;
    BOOL v30 = v25 > v20;
    if (v29)
    {
      if (!os_log_GKGeneral) {
        id v40 = (id)GKOSLoggers(v28);
      }
      uint64_t v41 = (os_log_s *)os_log_GKTrace;
      if (!os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 134217984;
      int64_t v45 = v20;
      id v33 = "shouldCadencedActivitySharingReprompt: No, last trigger was under %ld days ago.";
      BOOL v34 = v41;
      uint32_t v35 = 12;
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v31 = (id)GKOSLoggers(v28);
      }
      id v32 = (os_log_s *)os_log_GKTrace;
      if (!os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      id v33 = "shouldCadencedActivitySharingReprompt: Yes, last trigger was a long time ago and it hasn't reached the limit.";
      BOOL v34 = v32;
      uint32_t v35 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, v33, buf, v35);
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }

  if (!os_log_GKGeneral) {
    id v36 = (id)GKOSLoggers(v14);
  }
  uint64_t v37 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v45 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "shouldCadencedActivitySharingReprompt: No, the reprompt has reached the limit of %ld.",  buf,  0xCu);
  }

  BOOL v30 = 0;
LABEL_36:

  return v30;
}

- (void)setActivitySharingRepromptLastTriggerDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  uint64_t v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "setActivitySharingRepromptLastTriggerDate: %@",  buf,  0xCu);
  }

  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "standardUserDefaults");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"GKActivitySharingReprompt"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"totalTriggerCount"]);
  unsigned int v13 = [v12 intValue];

  uint64_t v15 = v13 + 1;
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers(v14);
  }
  id v17 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "setActivitySharingRepromptLastTriggerDate: new count is %d",  buf,  8u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  v15,  @"lastTriggerDate",  @"totalTriggerCount",  v5));
  v21[1] = v18;
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  &v20,  2LL));
  [v10 setObject:v19 forKey:@"GKActivitySharingReprompt"];
}

@end