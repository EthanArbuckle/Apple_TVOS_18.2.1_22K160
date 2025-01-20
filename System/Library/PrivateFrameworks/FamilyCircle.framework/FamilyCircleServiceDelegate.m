@interface FamilyCircleServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler;
- (FAMarqueeUpdateHandler)marqueeUpdateHandler;
- (FAQueueProvider)queueProvider;
- (FamilyCircleServiceDelegate)initWithQueueProvider:(id)a3;
- (id)_familyGrandSlamSignerWithAccountStore:(id)a3;
- (id)_fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 clientProcess:(id)a5 context:(id)a6 promptUserToResolveAuthenticatonFailure:(BOOL)a7;
- (id)_grandSlamAccountForAccountStore:(id)a3;
- (id)_grandSlamSignerWithAccountStore:(id)a3;
- (id)_networkService;
- (id)_primaryAccount;
- (void)cacheObjectSettings:(id)a3 dsid:(id)a4 options:(id)a5 replyBlock:(id)a6;
- (void)cancelChildTransferRequest:(id)a3 replyBlock:(id)a4;
- (void)cancelInvitationWith:(id)a3 familyID:(id)a4 options:(id)a5 replyBlock:(id)a6;
- (void)clearFamilyCircleCacheWithReplyBlock:(id)a3;
- (void)clearPhotoCacheWithReplyBlock:(id)a3;
- (void)didAddAccount:(id)a3 replyBlock:(id)a4;
- (void)didDeleteAccount:(id)a3 replyBlock:(id)a4;
- (void)didReceiveFamilyEventPushNotificationWithPayload:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)familyChecklistRankingConfigWithCachePolicy:(unint64_t)a3 replyBlock:(id)a4;
- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 context:(id)a5 options:(id)a6 replyBlock:(id)a7;
- (void)fetchFamilyMemberPhotoWithDSID:(id)a3 hashedDSID:(id)a4 size:(int64_t)a5 localFallback:(BOOL)a6 options:(id)a7 replyBlock:(id)a8;
- (void)fetchFollowupsWithAltDSID:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)fetchSettingsPresetsForAge:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6;
- (void)fetchSettingsPresetsForMemberWithAltDSID:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6;
- (void)handleContactsChanged;
- (void)launchICloudFamilySettingsWithOptions:(id)a3;
- (void)launchOutOfProcessFamilyWithOptions:(id)a3 completion:(id)a4;
- (void)registerPushToken:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)removeFamilyMemberWithDSID:(id)a3 options:(id)a4 replyBlock:(id)a5;
- (void)removeFamilyWithReplyBlock:(id)a3;
- (void)resendChildTransferRequest:(id)a3 replyBlock:(id)a4;
- (void)runHeartbeatWithOptions:(id)a3 replyBlock:(id)a4;
- (void)setFamilyRefreshActivityScheduler:(id)a3;
- (void)setMarqueeUpdateHandler:(id)a3;
- (void)updateFamilyInviteStatusWith:(int64_t)a3 inviteCode:(id)a4 options:(id)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7 replyBlock:(id)a8;
- (void)updateFamilyMemberFlagWithDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6 replyBlock:(id)a7;
- (void)updateFamilyMemberFlagsWithDSID:(id)a3 flags:(id)a4 replyBlock:(id)a5;
@end

@implementation FamilyCircleServiceDelegate

- (FamilyCircleServiceDelegate)initWithQueueProvider:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___FamilyCircleServiceDelegate;
  v6 = -[FamilyCircleServiceDelegate init](&v26, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queueProvider, a3);
    v8 = -[FAActivityManager initWithQueueProvider:]( objc_alloc(&OBJC_CLASS___FAActivityManager),  "initWithQueueProvider:",  v5);
    activityManager = v7->_activityManager;
    v7->_activityManager = v8;

    -[FAActivityManager checkinXPCActivities](v7->_activityManager, "checkinXPCActivities");
    objc_initWeak(&location, v7);
    v10 = objc_alloc_init(&OBJC_CLASS___FAMarqueeUpdateHandler);
    marqueeUpdateHandler = v7->_marqueeUpdateHandler;
    v7->_marqueeUpdateHandler = v10;

    v12 = objc_alloc(&OBJC_CLASS___FAFamilyFetchActivityScheduler);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100010298;
    v23[3] = &unk_100041B20;
    objc_copyWeak(&v24, &location);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100010398;
    v21[3] = &unk_100041B70;
    v13 = v7;
    v22 = v13;
    v14 = -[FAFamilyFetchActivityScheduler initWithFamilyCircleFetchBlock:cacheLoadBlock:]( v12,  "initWithFamilyCircleFetchBlock:cacheLoadBlock:",  v23,  v21);
    id v15 = v13[3];
    v13[3] = v14;

    [v13[3] reschedule];
    +[FAFamilyCFUScheduler scheduleWakeupIfNeeded](&OBJC_CLASS___FAFamilyCFUScheduler, "scheduleWakeupIfNeeded");
    v16 = objc_alloc(&OBJC_CLASS___FAXPCEventObserver);
    v17 = objc_alloc_init(&OBJC_CLASS____TtC13familycircled16XPCStreamHandler);
    v18 = -[FAXPCEventObserver initWithStream:delegate:](v16, "initWithStream:delegate:", v17, v13);
    id v19 = v13[2];
    v13[2] = v18;

    [v13[2] start];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)handleContactsChanged
{
  v2 = objc_alloc_init(&OBJC_CLASS___FAMarqueeUpdateHandler);
  -[FAMarqueeUpdateHandler updateMarqueeCache](v2, "updateMarqueeCache");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___FAServiceProtocol));
  [v6 setClass:objc_opt_class(FAScreentimeSettingsObjectCache) forSelector:"cacheObjectSettings:dsid:options:replyBlock:" argumentIndex:0 ofReply:0];
  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (id)_primaryAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));

  return v3;
}

- (id)_networkService
{
  v3 = objc_alloc_init(&OBJC_CLASS___FADeviceInfo);
  v4 = objc_alloc(&OBJC_CLASS___FANetworkService);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _primaryAccount](self, "_primaryAccount"));
  v6 = (void *)objc_opt_new(&OBJC_CLASS___FAURLConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLSession sharedSession](&OBJC_CLASS___AAURLSession, "sharedSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate familyRefreshActivityScheduler](self, "familyRefreshActivityScheduler"));
  v9 = -[FANetworkService initWithAccount:deviceInfo:urlProvider:urlSession:familyRefreshActivityScheduler:]( v4,  "initWithAccount:deviceInfo:urlProvider:urlSession:familyRefreshActivityScheduler:",  v5,  v3,  v6,  v7,  v8);

  return v9;
}

- (id)_fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 clientProcess:(id)a5 context:(id)a6 promptUserToResolveAuthenticatonFailure:(BOOL)a7
{
  BOOL v24 = a7;
  BOOL v8 = a4;
  id v10 = a6;
  id v11 = a5;
  v12 = objc_alloc(&OBJC_CLASS___FAFamilyCircleCache);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _primaryAccount](self, "_primaryAccount"));
  v14 = -[FAFamilyCircleCache initWithAccount:](v12, "initWithAccount:", v13);

  id v15 = objc_alloc_init(&OBJC_CLASS___FAMarqueeUpdateHandler);
  v16 = objc_alloc(&OBJC_CLASS___FAFetchFamilyCircleOperation);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _networkService](self, "_networkService"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FARequestCoalescer sharedInstance](&OBJC_CLASS___FARequestCoalescer, "sharedInstance"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate familyRefreshActivityScheduler](self, "familyRefreshActivityScheduler"));
  v20 = -[FAFetchFamilyCircleOperation initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:]( v16,  "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:",  v17,  v14,  v15,  v18,  v19);

  -[FAFetchFamilyCircleOperation setSignedInAccountShouldBeApprover:](v20, "setSignedInAccountShouldBeApprover:", v8);
  -[FAFetchFamilyCircleOperation setCachePolicy:](v20, "setCachePolicy:", a3);
  -[FAFetchFamilyCircleOperation setClientProcess:](v20, "setClientProcess:", v11);

  -[FAFetchFamilyCircleOperation setContext:](v20, "setContext:", v10);
  -[FAFetchFamilyCircleOperation setPromptUserToResolveAuthenticatonFailure:]( v20,  "setPromptUserToResolveAuthenticatonFailure:",  v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyCircleOperation fetchFamilyCircle](v20, "fetchFamilyCircle"));

  return v21;
}

- (void)fetchFamilyCircleWithCachePolicy:(unint64_t)a3 signedInAccountShouldBeApprover:(BOOL)a4 context:(id)a5 options:(id)a6 replyBlock:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 requestQueueWithOptions:v13]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000108E0;
  v20[3] = &unk_100041BC0;
  id v23 = v14;
  unint64_t v24 = a3;
  BOOL v25 = a4;
  v20[4] = self;
  id v21 = v13;
  id v22 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  dispatch_async(v16, v20);
}

- (void)removeFamilyMemberWithDSID:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 requestQueueWithOptions:v10]);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010B8C;
  block[3] = &unk_100041920;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)removeFamilyWithReplyBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 requestQueueWithOptions:0]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100010D74;
  v8[3] = &unk_100041620;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)fetchFamilyMemberPhotoWithDSID:(id)a3 hashedDSID:(id)a4 size:(int64_t)a5 localFallback:(BOOL)a6 options:(id)a7 replyBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 requestQueueWithOptions:v16]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010FC0;
  block[3] = &unk_100041C88;
  block[4] = self;
  id v25 = v14;
  BOOL v30 = a6;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  int64_t v29 = a5;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  dispatch_async(v19, block);
}

- (void)registerPushToken:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 requestQueueWithOptions:v10]);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011428;
  block[3] = &unk_100041920;
  block[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)clearFamilyCircleCacheWithReplyBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 requestQueueWithOptions:0]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000115B4;
  v8[3] = &unk_100041620;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)clearPhotoCacheWithReplyBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 requestQueueWithOptions:0]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001183C;
  block[3] = &unk_100041CB0;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (void)didReceiveFamilyEventPushNotificationWithPayload:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _networkService](self, "_networkService"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate familyRefreshActivityScheduler](self, "familyRefreshActivityScheduler"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100011A6C;
  v10[3] = &unk_100041B98;
  id v11 = v6;
  id v9 = v6;
  +[FAFamilyCircleDaemonChangeHandler handleDidReceivePushEventWithNetworkService:familyRefreshActivityScheduler:completion:]( &OBJC_CLASS___FAFamilyCircleDaemonChangeHandler,  "handleDidReceivePushEventWithNetworkService:familyRefreshActivityScheduler:completion:",  v7,  v8,  v10);
}

- (void)updateFamilyMemberFlagWithDSID:(id)a3 ephemeralAuthResults:(id)a4 flag:(id)a5 enabled:(BOOL)a6 replyBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 requestQueueWithOptions:0]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100011BA8;
  v22[3] = &unk_100041D00;
  id v23 = v13;
  unint64_t v24 = self;
  id v25 = v12;
  id v26 = v14;
  BOOL v28 = a6;
  id v27 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v12;
  id v21 = v13;
  dispatch_async(v17, v22);
}

- (void)updateFamilyMemberFlagsWithDSID:(id)a3 flags:(id)a4 replyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 requestQueueWithOptions:0]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100011EF4;
  v16[3] = &unk_1000419F0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (void)launchICloudFamilySettingsWithOptions:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"prefs:root=APPLE_ACCOUNT&path=FAMILY"));
  [v5 openSensitiveURL:v4 withOptions:v3];
}

- (void)launchOutOfProcessFamilyWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___FARemotePresenter);
  uint64_t v9 = _FALogSystem(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting remote user interface", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000121DC;
  v13[3] = &unk_100041D28;
  id v14 = v7;
  id v15 = v5;
  id v11 = v7;
  id v12 = v5;
  -[FARemotePresenter presentRemoteUserInterfaceWithOptions:completion:]( v11,  "presentRemoteUserInterfaceWithOptions:completion:",  v6,  v13);
}

- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000122C0;
  v10[3] = &unk_100041D50;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v14;
  -[FamilyCircleServiceDelegate fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:context:options:replyBlock:]( v11,  "fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:context:options:replyBlock:",  0LL,  0LL,  0LL,  0LL,  v10);
}

- (void)fetchFollowupsWithAltDSID:(id)a3 options:(id)a4 replyBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 requestQueueWithOptions:v8]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100012458;
  v12[3] = &unk_100041620;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, v12);
}

- (void)didAddAccount:(id)a3 replyBlock:(id)a4
{
  if (a3 && a4) {
    -[FAActivityManager handleAccountAddition:completion:](self->_activityManager, "handleAccountAddition:completion:");
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___FAURLConfiguration);
  [v6 fetchAAURLConfigurationWithCompletion:&stru_100041D90];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate marqueeUpdateHandler](self, "marqueeUpdateHandler"));
  [v5 updateMarqueeCache];
}

- (void)didDeleteAccount:(id)a3 replyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v7;
  if (v6 && v7) {
    id v7 = -[FAActivityManager handleAccountDeletion:completion:]( self->_activityManager,  "handleAccountDeletion:completion:",  v6,  v7);
  }
  uint64_t v10 = _FALogSystem(v7, v8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002AC9C();
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PDSRegistrarService sharedInstance](&OBJC_CLASS___PDSRegistrarService, "sharedInstance"));
  [v12 removeRegistrationFromPDS];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v13 removeObjectForKey:FAFamilySettingRowFamilyCountKey];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v14 removeObjectForKey:FAFamilySettingRowPendingInvitesKey];

  uint64_t v17 = _FALogSystem(v15, v16);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10002AC70();
  }

  id v19 = objc_alloc(&OBJC_CLASS___FLFollowUpController);
  id v20 = [v19 initWithClientIdentifier:FAFollowUpClientIdentifier];
  id v28 = 0LL;
  unsigned __int8 v21 = [v20 clearPendingFollowUpItems:&v28];
  id v22 = v28;
  unint64_t v24 = v22;
  if ((v21 & 1) == 0)
  {
    uint64_t v25 = _FALogSystem(v22, v23);
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10002ABE4(v24, v26);
    }
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate marqueeUpdateHandler](self, "marqueeUpdateHandler"));
  [v27 updateMarqueeCache];
}

- (id)_grandSlamAccountForAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _primaryAccount](self, "_primaryAccount"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_grandSlamAccountForiCloudAccount:", v5));

  return v6;
}

- (id)_grandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AAGrandSlamSigner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyCircleServiceDelegate _grandSlamAccountForAccountStore:]( self,  "_grandSlamAccountForAccountStore:",  v4));
  id v7 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]( v5,  "initWithAccountStore:grandSlamAccount:appTokenID:",  v4,  v6,  AAGrandSlamAppTokenIDiCloudSettings);

  return v7;
}

- (id)_familyGrandSlamSignerWithAccountStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AAGrandSlamSigner);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyCircleServiceDelegate _grandSlamAccountForAccountStore:]( self,  "_grandSlamAccountForAccountStore:",  v4));
  id v7 = -[AAGrandSlamSigner initWithAccountStore:grandSlamAccount:appTokenID:]( v5,  "initWithAccountStore:grandSlamAccount:appTokenID:",  v4,  v6,  AAGrandSlamAppTokenIDFamilySharing);

  -[AAGrandSlamSigner setHeaderFieldKey:](v7, "setHeaderFieldKey:", AAFamilyGrandSlamTokenHeaderKey);
  return v7;
}

- (void)runHeartbeatWithOptions:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 requestQueueWithOptions:v7]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001298C;
  v11[3] = &unk_100041620;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, v11);
}

- (void)fetchSettingsPresetsForMemberWithAltDSID:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 requestQueueWithOptions:v11]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012CF8;
  block[3] = &unk_100041DB8;
  void block[4] = self;
  id v19 = v11;
  BOOL v22 = a4;
  id v20 = v10;
  id v21 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  dispatch_async(v14, block);
}

- (void)fetchSettingsPresetsForAge:(id)a3 fromCache:(BOOL)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 requestQueueWithOptions:v12]);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012EFC;
  block[3] = &unk_100041E20;
  BOOL v20 = a4;
  id v18 = v10;
  id v19 = v11;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v14, block);
}

- (void)updateFamilyInviteStatusWith:(int64_t)a3 inviteCode:(id)a4 options:(id)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7 replyBlock:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a5;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 requestQueueWithOptions:v17]);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000130AC;
  v23[3] = &unk_100041E48;
  void v23[4] = self;
  id v24 = v14;
  int64_t v27 = a3;
  int64_t v28 = a6;
  id v25 = v15;
  id v26 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(v19, v23);
}

- (void)cancelInvitationWith:(id)a3 familyID:(id)a4 options:(id)a5 replyBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 requestQueueWithOptions:0]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000132C0;
  v17[3] = &unk_1000419F0;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, v17);
}

- (void)cacheObjectSettings:(id)a3 dsid:(id)a4 options:(id)a5 replyBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 requestQueueWithOptions:v13]);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001349C;
  block[3] = &unk_100041920;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v15, block);
}

- (void)resendChildTransferRequest:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v9 = objc_alloc(&OBJC_CLASS___FAResendChildTransferRequestOperation);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _networkService](self, "_networkService"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyCircleServiceDelegate _grandSlamSignerWithAccountStore:]( self,  "_grandSlamSignerWithAccountStore:",  v8));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyCircleServiceDelegate _familyGrandSlamSignerWithAccountStore:]( self,  "_familyGrandSlamSignerWithAccountStore:",  v8));
  id v13 = -[FAResendChildTransferRequestOperation initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:email:isResend:]( v9,  "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:email:isResend:",  v10,  v11,  v12,  v7,  1LL);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 requestQueueWithOptions:0]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100013704;
  v18[3] = &unk_100041620;
  id v19 = v13;
  id v20 = v6;
  id v16 = v6;
  id v17 = v13;
  dispatch_async(v15, v18);
}

- (void)cancelChildTransferRequest:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  id v9 = objc_alloc(&OBJC_CLASS___FAResendChildTransferRequestOperation);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate _networkService](self, "_networkService"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyCircleServiceDelegate _grandSlamSignerWithAccountStore:]( self,  "_grandSlamSignerWithAccountStore:",  v8));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyCircleServiceDelegate _familyGrandSlamSignerWithAccountStore:]( self,  "_familyGrandSlamSignerWithAccountStore:",  v8));
  id v13 = -[FAResendChildTransferRequestOperation initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:email:isResend:]( v9,  "initWithNetworkService:grandSlamSigner:familyGrandSlamSigner:email:isResend:",  v10,  v11,  v12,  v7,  1LL);

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 requestQueueWithOptions:0]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10001396C;
  v18[3] = &unk_100041620;
  id v19 = v13;
  id v20 = v6;
  id v16 = v6;
  id v17 = v13;
  dispatch_async(v15, v18);
}

- (void)familyChecklistRankingConfigWithCachePolicy:(unint64_t)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyCircleServiceDelegate queueProvider](self, "queueProvider"));
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 requestQueueWithOptions:0]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013B20;
  block[3] = &unk_100041E98;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (FAFamilyFetchActivityScheduler)familyRefreshActivityScheduler
{
  return self->_familyRefreshActivityScheduler;
}

- (void)setFamilyRefreshActivityScheduler:(id)a3
{
}

- (FAQueueProvider)queueProvider
{
  return self->_queueProvider;
}

- (FAMarqueeUpdateHandler)marqueeUpdateHandler
{
  return self->_marqueeUpdateHandler;
}

- (void)setMarqueeUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end