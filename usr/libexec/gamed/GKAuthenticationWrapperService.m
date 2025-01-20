@interface GKAuthenticationWrapperService
+ (id)authenticationWrapperForService:(id)a3;
+ (id)serviceForBundleID:(id)a3 player:(id)a4;
+ (id)serviceForClient:(id)a3 player:(id)a4;
- (GKAuthenticationWrapperService)initWithClient:(id)a3;
- (GKAuthenticationWrapperService)initWithService:(id)a3 queue:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_buildSignatureLookupForProtocol:(id)a3;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9;
- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8;
- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7;
- (void)authenticateNonActivePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7;
- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 usingFastPath:(BOOL)a5 displayAuthUI:(BOOL)a6 handler:(id)a7;
- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 isGame:(BOOL)a7 usingFastPath:(BOOL)a8 displayAuthUI:(BOOL)a9 handler:(id)a10;
- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 handler:(id)a6;
- (void)checkActivitySharingRepromptWithCompletion:(id)a3;
- (void)didShowFullscreenSignIn;
- (void)didShowSignInBanner;
- (void)fetchItemsForIdentityVerificationSignature:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3;
- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)getAccountAuthTokenWithHandler:(id)a3;
- (void)getDevicePushTokenWithHandler:(id)a3;
- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3;
- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4;
- (void)isAppUnlistedAndDisallowed:(id)a3;
- (void)isICloudAvailableWithHandler:(id)a3;
- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4;
- (void)notifyWidgetPlayerAuthenticationUpdated;
- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5;
- (void)resetCredentialsWithHandler:(id)a3;
- (void)setActivitySharingRepromptLastTriggerDate:(id)a3;
- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3;
- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3;
- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4;
- (void)setupAccountForParameters:(id)a3 handler:(id)a4;
- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4;
- (void)switchLocalPlayerWithAltDSID:(id)a3 handler:(id)a4;
- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5;
@end

@implementation GKAuthenticationWrapperService

- (GKAuthenticationWrapperService)initWithClient:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"initWithClient: is not the designated initialier for GKAuthenticationWrapperService, use initWithService:queue: instead."));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticati onWrapperService.m"));
  id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v4,  "-[GKAuthenticationWrapperService initWithClient:]",  [v6 UTF8String],  31));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v7);
  return 0LL;
}

- (void)_buildSignatureLookupForProtocol:(id)a3
{
  v4 = (Protocol *)a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int outCount = 0;
  id v6 = protocol_copyMethodDescriptionList(v4, 1, 1, &outCount);
  v7 = v6;
  if (outCount)
  {
    unsigned int v8 = 0;
    v9 = v6;
    do
    {
      v10 = NSStringFromSelector(v9->name);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  v9->types));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v11);

      ++v8;
      ++v9;
    }

    while (v8 < outCount);
  }

  free(v7);
  v13 = protocol_copyMethodDescriptionList(v4, 0, 1, &outCount);
  v14 = v13;
  if (outCount)
  {
    unsigned int v15 = 0;
    v16 = v13;
    do
    {
      v17 = NSStringFromSelector(v16->name);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  v16->types));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, v18);

      ++v15;
      ++v16;
    }

    while (v15 < outCount);
  }

  free(v14);
  signatureLookup = self->_signatureLookup;
  self->_signatureLookup = &v5->super;
}

- (GKAuthenticationWrapperService)initWithService:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 transport]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 clientProxy]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localPlayer]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 credential]);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GKAuthenticationWrapperService;
  v13 = -[GKService initWithTransport:forClient:localPlayer:credential:]( &v18,  "initWithTransport:forClient:localPlayer:credential:",  v9,  v10,  v11,  v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a3);
    objc_storeStrong((id *)&v13->_authQueue, a4);
    id v15 = objc_msgSend(objc_msgSend((id)objc_opt_class(v13->_service, v14), "interfaceClass"), "interfaceProtocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[GKAuthenticationWrapperService _buildSignatureLookupForProtocol:](v13, "_buildSignatureLookupForProtocol:", v16);
  }

  return v13;
}

+ (id)authenticationWrapperForService:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProxy]);

  if (v5)
  {
    id v7 = objc_alloc((Class)objc_opt_class(a1, v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProxy]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 authQueue]);
    id v10 = [v7 initWithService:v4 queue:v9];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)serviceForClient:(id)a3 player:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"serviceForClient: is not a valid factory for GKAuthenticationWrapperService, use authenticationWrapperForService:queue: instead.",  a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticati onWrapperService.m"));
  id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v4,  "+[GKAuthenticationWrapperService serviceForClient:player:]",  [v6 UTF8String],  85));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v7);
  return 0LL;
}

+ (id)serviceForBundleID:(id)a3 player:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"serviceForBundleID: is not a valid factory for GKAuthenticationWrapperService, use authenticationWrapperForService:queue: instead.",  a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticati onWrapperService.m"));
  id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (NO)\n[%s (%s:%d)]",  v4,  "+[GKAuthenticationWrapperService serviceForBundleID:player:]",  [v6 UTF8String],  91));

  +[NSException raise:format:](&OBJC_CLASS___NSException, "raise:format:", @"GameKit Exception", @"%@", v7);
  return 0LL;
}

- (void)isAppUnlistedAndDisallowed:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 replyQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008EEC0;
  v8[3] = &unk_10026B030;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService authenticatePlayerWithExistingCredentialsWithHandler:]",  [v8 UTF8String],  106));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[GKService transport](self->_service, "transport"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self->_service, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKAccountServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  v12,  v10,  0LL));
  -[GKAuthenticationWrapperService authenticateWithService:username:password:handler:]( self,  "authenticateWithService:username:password:handler:",  v11,  0LL,  0LL,  v5);
}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "wrapper generateIdentityVerificationSignatureWithCompletionHandler:",  buf,  2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v8,  "-[GKAuthenticationWrapperService generateIdentityVerificationSignatureWithCompletionHandler:]",  [v10 UTF8String],  113));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  authQueue = (dispatch_queue_s *)self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008F240;
  block[3] = &unk_10026B310;
  block[4] = self;
  id v15 = v5;
  id v13 = v5;
  dispatch_async(authQueue, block);
}

- (void)fetchItemsForIdentityVerificationSignature:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "wrapper fetchItemsForIdentityVerificationSignature:",  buf,  2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v8,  "-[GKAuthenticationWrapperService fetchItemsForIdentityVerificationSignature:]",  [v10 UTF8String],  130));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v11);
  }

  authQueue = (dispatch_queue_s *)self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008F500;
  block[3] = &unk_10026B310;
  block[4] = self;
  id v15 = v5;
  id v13 = v5;
  dispatch_async(authQueue, block);
}

- (void)didShowSignInBanner
{
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v3,  "-[GKAuthenticationWrapperService didShowSignInBanner]",  [v5 UTF8String],  146));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v6);
  }

  -[GKService didShowSignInBanner](self->_service, "didShowSignInBanner");
}

- (void)didShowFullscreenSignIn
{
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v3,  "-[GKAuthenticationWrapperService didShowFullscreenSignIn]",  [v5 UTF8String],  152));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v6);
  }

  -[GKService didShowFullscreenSignIn](self->_service, "didShowFullscreenSignIn");
}

- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "wrapper signOutPlayerWithOptOut:%lu", buf, 0xCu);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v10,  "-[GKAuthenticationWrapperService signOutPlayerWithOptOut:handler:]",  [v12 UTF8String],  159));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  authQueue = (dispatch_queue_s *)self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FA04;
  block[3] = &unk_10026F9E8;
  BOOL v18 = v4;
  block[4] = self;
  id v17 = v7;
  id v15 = v7;
  dispatch_barrier_async(authQueue, block);
}

- (void)setupAccountForParameters:(id)a3 handler:(id)a4
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
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "wrapper setupAccountForParameters:handler:",  buf,  2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v11,  "-[GKAuthenticationWrapperService setupAccountForParameters:handler:]",  [v13 UTF8String],  190));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  service = self->_service;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10008FE8C;
  v17[3] = &unk_10026BBE8;
  id v18 = v8;
  id v16 = v8;
  -[GKService setupAccountForParameters:handler:](service, "setupAccountForParameters:handler:", v6, v17);
}

- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 isGame:(BOOL)a7 usingFastPath:(BOOL)a8 displayAuthUI:(BOOL)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  v21 = v20;
  if (!os_log_GKGeneral) {
    id v22 = (id)GKOSLoggers(v20);
  }
  v23 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "wrapper authenticateWithService:", buf, 2u);
  }

  v24 = (GKAccountServicePrivate *)v16;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](v24, "credential"));

  v26 = v24;
  if (v25)
  {
    v27 = objc_alloc(&OBJC_CLASS___GKAccountServicePrivate);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26 = -[GKService initWithoutCredentialWithTransport:forClient:]( v27,  "initWithoutCredentialWithTransport:forClient:",  0LL,  v28);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  authQueue = (dispatch_queue_s *)self->_authQueue;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000900A8;
  v36[3] = &unk_10026FE58;
  v37 = v26;
  id v38 = v17;
  id v39 = v18;
  id v40 = v19;
  BOOL v44 = a7;
  BOOL v45 = a8;
  v41 = self;
  id v42 = v21;
  CFAbsoluteTime v43 = Current;
  id v31 = v21;
  id v32 = v19;
  id v33 = v18;
  id v34 = v17;
  v35 = v26;
  dispatch_barrier_async(authQueue, v36);
}

- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 handler:(id)a6
{
  LOBYTE(v6) = 0;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:]( self,  "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:",  a3,  a4,  a5,  0LL,  1LL,  0LL,  v6,  a6);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 usingFastPath:(BOOL)a5 displayAuthUI:(BOOL)a6 handler:(id)a7
{
  BOOL v9 = a5;
  id v19 = a3;
  id v12 = a4;
  id v13 = a7;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v16 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v14,  "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:usingFastPath:displayAuthUI:handler:]",  [v16 UTF8String],  330));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  LOBYTE(v18) = a6;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:]( self,  "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:",  self->_service,  v19,  v12,  0LL,  1LL,  v9,  v18,  v13);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8
{
  uint64_t v9 = a7;
  BOOL v10 = a6;
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    unsigned int v22 = v9;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v19 = objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v17,  "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:]",  [v19 UTF8String],  348));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v20);
    uint64_t v9 = v22;
  }

  LOBYTE(v21) = 0;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:]( self,  "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:",  self->_service,  v23,  v14,  v15,  v10,  v9,  v21,  v16);
}

- (void)authenticateNonActivePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v17 = objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v15,  "-[GKAuthenticationWrapperService authenticateNonActivePlayerWithUsername:password:altDSID:usingFastPath:handler:]",  [v17 UTF8String],  355));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v18);
  }

  LOBYTE(v19) = 0;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:]( self,  "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:",  self->_service,  v20,  v12,  v13,  1LL,  v8,  v19,  v14);
}

- (void)switchLocalPlayerWithAltDSID:(id)a3 handler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v7,  "-[GKAuthenticationWrapperService switchLocalPlayerWithAltDSID:handler:]",  [v9 UTF8String],  361));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  -[GKService switchLocalPlayerWithAltDSID:handler:](self->_service, "switchLocalPlayerWithAltDSID:handler:", v11, v6);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v10,  "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:handler:]",  [v12 UTF8String],  370));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  -[GKAuthenticationWrapperService authenticateWithService:username:password:handler:]( self,  "authenticateWithService:username:password:handler:",  self->_service,  v14,  v8,  v9);
}

- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v11,  "-[GKAuthenticationWrapperService validateAccountWithUsername:password:handler:]",  [v13 UTF8String],  378));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  service = self->_service;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100091048;
  v17[3] = &unk_10026BB98;
  id v18 = v10;
  id v16 = v10;
  -[GKService validateAccountWithUsername:password:handler:]( service,  "validateAccountWithUsername:password:handler:",  v8,  v9,  v17);
}

- (void)getAccountAuthTokenWithHandler:(id)a3
{
  id v8 = a3;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v4,  "-[GKAuthenticationWrapperService getAccountAuthTokenWithHandler:]",  [v6 UTF8String],  387));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v7);
  }

  -[GKService getAccountAuthTokenWithHandler:](self->_service, "getAccountAuthTokenWithHandler:", v8);
}

- (void)getDevicePushTokenWithHandler:(id)a3
{
  id v8 = a3;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v4,  "-[GKAuthenticationWrapperService getDevicePushTokenWithHandler:]",  [v6 UTF8String],  393));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v7);
  }

  -[GKService getDevicePushTokenWithHandler:](self->_service, "getDevicePushTokenWithHandler:", v8);
}

- (void)isICloudAvailableWithHandler:(id)a3
{
  id v8 = a3;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v6 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v4,  "-[GKAuthenticationWrapperService isICloudAvailableWithHandler:]",  [v6 UTF8String],  399));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v7);
  }

  -[GKService isICloudAvailableWithHandler:](self->_service, "isICloudAvailableWithHandler:", v8);
}

- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v9 = objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v7,  "-[GKAuthenticationWrapperService notifyClient:playerAuthenticatedFromClient:]",  [v9 UTF8String],  405));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v10);
  }

  -[GKService notifyClient:playerAuthenticatedFromClient:]( self->_service,  "notifyClient:playerAuthenticatedFromClient:",  v11,  v6);
}

- (void)resetCredentialsWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService resetCredentialsWithHandler:]",  [v8 UTF8String],  411));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 signOutPlayerWithOptOut:0 handler:v5];
}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v5,  "-[GKAuthenticationWrapperService setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:]",  [v7 UTF8String],  417));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v9 setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:a3];
}

- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:]",  [v8 UTF8String],  423));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v7 = objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v5,  "-[GKAuthenticationWrapperService setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:]",  [v7 UTF8String],  429));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v8);
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v9 setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:a3];
}

- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]",  [v8 UTF8String],  435));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService setLastPersonalizationVersionDisplayedForSignedInPlayer:]",  [v8 UTF8String],  441));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 setLastPersonalizationVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:]",  [v8 UTF8String],  447));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:]",  [v8 UTF8String],  453));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:]",  [v8 UTF8String],  459));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService setLastProfilePrivacyVersionDisplayedForSignedInPlayer:]",  [v8 UTF8String],  465));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 setLastProfilePrivacyVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:]",  [v8 UTF8String],  471));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:]",  [v8 UTF8String],  477));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:v5];
}

- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:]",  [v8 UTF8String],  483));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:v5];
}

- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4
{
  service = self->_service;
  id v7 = a4;
  id v8 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v9,  "-[GKAuthenticationWrapperService getOnboardingInfoForPlayerID:withCompletion:]",  [v11 UTF8String],  488));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v13 getOnboardingInfoForPlayerID:v8 withCompletion:v7];
}

- (void)notifyWidgetPlayerAuthenticationUpdated
{
  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v5 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v3,  "-[GKAuthenticationWrapperService notifyWidgetPlayerAuthenticationUpdated]",  [v5 UTF8String],  493));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v7 notifyWidgetPlayerAuthenticationUpdated];
}

- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4
{
  service = self->_service;
  id v7 = a4;
  id v8 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v9,  "-[GKAuthenticationWrapperService getAccountAgeCategoryForPlayerID:withCompletion:]",  [v11 UTF8String],  500));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v12);
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v13 getAccountAgeCategoryForPlayerID:v8 withCompletion:v7];
}

- (void)checkActivitySharingRepromptWithCompletion:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService checkActivitySharingRepromptWithCompletion:]",  [v8 UTF8String],  506));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 checkActivitySharingRepromptWithCompletion:v5];
}

- (void)setActivitySharingRepromptLastTriggerDate:(id)a3
{
  service = self->_service;
  id v5 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentica tionWrapperService.m"));
    id v8 = objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]",  v6,  "-[GKAuthenticationWrapperService setActivitySharingRepromptLastTriggerDate:]",  [v8 UTF8String],  511));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v10 setActivitySharingRepromptLastTriggerDate:v5];
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = v18;
  if (!os_log_GKGeneral) {
    id v20 = (id)GKOSLoggers(v18);
  }
  uint64_t v21 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "wrapper accountCreated:", buf, 2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    BOOL v32 = a7;
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v24 = objc_claimAutoreleasedReturnValue([v23 lastPathComponent]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v22,  "-[GKAuthenticationWrapperService accountCreated:playerID:authenticationToken:alias:finished:handler:]",  [v24 UTF8String],  524));

    a7 = v32;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v25);
  }

  authQueue = (dispatch_queue_s *)self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100092C80;
  block[3] = &unk_10026FE80;
  block[4] = self;
  id v34 = v14;
  id v35 = v15;
  id v36 = v16;
  BOOL v39 = a7;
  id v37 = v17;
  id v38 = v19;
  id v27 = v19;
  id v28 = v17;
  id v29 = v16;
  id v30 = v15;
  id v31 = v14;
  dispatch_barrier_async(authQueue, block);
}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  uint64_t v21 = v20;
  if (!os_log_GKGeneral) {
    id v22 = (id)GKOSLoggers(v20);
  }
  id v23 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "wrapper accountCreated:", buf, 2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v39 = v15;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v38 = v18;
    id v25 = v17;
    id v26 = v16;
    BOOL v27 = a8;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v29 = objc_claimAutoreleasedReturnValue([v28 lastPathComponent]);
    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v24,  "-[GKAuthenticationWrapperService accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:]",  [v29 UTF8String],  559));

    a8 = v27;
    id v16 = v26;
    id v17 = v25;
    id v18 = v38;

    id v15 = v39;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v30);
  }

  authQueue = (dispatch_queue_s *)self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000932C0;
  block[3] = &unk_10026FED0;
  block[4] = self;
  id v41 = v15;
  id v42 = v16;
  id v43 = v17;
  id v44 = v18;
  id v45 = v19;
  BOOL v47 = a8;
  id v46 = v21;
  id v32 = v21;
  id v33 = v19;
  id v34 = v18;
  id v35 = v17;
  id v36 = v16;
  id v37 = v15;
  dispatch_barrier_async(authQueue, block);
}

- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v16);
  }
  id v19 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "wrapper accountEdited:", buf, 2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v26 = v12;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v22 = objc_claimAutoreleasedReturnValue([v21 lastPathComponent]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v20,  "-[GKAuthenticationWrapperService accountEdited:alias:firstName:lastName:handler:]",  [v22 UTF8String],  592));

    id v12 = v26;
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v23);
  }

  service = self->_service;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10009389C;
  v27[3] = &unk_10026B120;
  id v28 = v17;
  id v25 = v17;
  -[GKService accountEdited:alias:firstName:lastName:handler:]( service,  "accountEdited:alias:firstName:lastName:handler:",  v12,  v13,  v14,  v15,  v27);
}

- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "wrapper setLoginStatus:", buf, 2u);
  }

  if ((-[GKService conformsToProtocol:]( self->_service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountServicePrivate protocol!"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v12 = objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v10,  "-[GKAuthenticationWrapperService setLoginStatus:handler:]",  [v12 UTF8String],  603));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v13);
  }

  service = self->_service;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100093A74;
  v16[3] = &unk_10026BBE8;
  id v17 = v7;
  id v15 = v7;
  -[GKService setLoginStatus:handler:](service, "setLoginStatus:handler:", a3, v16);
}

- (void)renewCredentialsForAccountWithUsername:(id)a3 ttl:(double)a4 withCompletion:(id)a5
{
  service = self->_service;
  id v9 = a5;
  id v10 = a3;
  if ((-[GKService conformsToProtocol:]( service,  "conformsToProtocol:",  &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Wrapped service must conform to the GKAccountService protocol!"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthentic ationWrapperService.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]",  v11,  "-[GKAuthenticationWrapperService renewCredentialsForAccountWithUsername:ttl:withCompletion:]",  [v13 UTF8String],  612));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](&OBJC_CLASS___GKAccountServicePrivate, "serviceFromService:", self));
  [v15 renewCredentialsForAccountWithUsername:v10 ttl:v9 withCompletion:a4];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GKAuthenticationWrapperService;
  id v5 = -[GKAuthenticationWrapperService methodSignatureForSelector:](&v16, "methodSignatureForSelector:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6) {
    return v6;
  }
  id v7 = NSStringFromSelector(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_signatureLookup, "objectForKeyedSubscript:", v8));
  if (v9)
  {
    id v6 = (void *)v9;

    return v6;
  }

  id v17 = @"selector";
  id v18 = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"GKNoSuchServiceException",  @"Attempted to dispatch a selector which is not recognized by any service",  v11));

  objc_exception_throw(v12);
  -[GKAuthenticationWrapperService forwardInvocation:](v13, v14, v15);
  return result;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (-[GKService requiresAuthenticationForSelector:]( self->_service,  "requiresAuthenticationForSelector:",  [v4 selector]))
  {
    [v4 retainArguments];
    authQueue = (dispatch_queue_s *)self->_authQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100093DD0;
    v6[3] = &unk_10026BDB0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(authQueue, v6);
  }

  else
  {
    [v4 invokeWithTarget:self->_service];
  }
}

- (void).cxx_destruct
{
}

@end