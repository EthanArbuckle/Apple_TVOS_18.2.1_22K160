@interface UpdatesManager_ObjC
+ (id)sharedManager;
- (NSArray)headboardProvisionedApps;
- (UpdatesManager_ObjC)init;
- (void)_handleAccountChangedNotification;
- (void)autoUpdateEnabled:(id)a3;
- (void)confirmAgentRequestedUpdateAll:(id)a3;
- (void)dropAllUpdatesIncludingVPP:(BOOL)a3;
- (void)getManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)getUpdateMetadataForBundleID:(id)a3 replyHandler:(id)a4;
- (void)getUpdatesWithContext:(id)a3;
- (void)getUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)hidePendingUpdatesBadge;
- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4;
- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4;
- (void)noteUpdatesStateChangedWithReason:(id)a3 logKey:(id)a4 completionBlock:(id)a5;
- (void)performBackgroundSoftwareUpdateCheck;
- (void)performPostRestoreUpdatesCheck;
- (void)postProcessBackgroundUpdateMetrics;
- (void)refreshUpdateCountWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)refreshUpdateForApp:(int64_t)a3 token:(id)a4 replyHandler:(id)a5;
- (void)reloadApplicationBadgeWithReason:(id)a3;
- (void)reloadFromServerInBackgroundWithToken:(id)a3 completionBlock:(id)a4;
- (void)reloadFromServerWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)reloadManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4;
- (void)reloadUpdatesWithContext:(id)a3;
- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4;
- (void)setHeadboardProvisionedApps:(id)a3;
- (void)setupFollowingMigration;
- (void)showPendingUpdatesBadge;
- (void)updateAllWithOrder:(id)a3 requestToken:(id)a4 replyHandler:(id)a5;
- (void)verifyAllPendingUpdates;
- (void)verifyPendingUpdates:(id)a3;
- (void)verifyUpdatesFollowingExternalAppInstall:(id)a3;
- (void)verifyUpdatesForRemovedBundleIDs:(id)a3;
@end

@implementation UpdatesManager_ObjC

+ (id)sharedManager
{
  if (qword_1004624E0 != -1) {
    dispatch_once(&qword_1004624E0, &stru_1003EFA68);
  }
  return (id)qword_1004624E8;
}

- (UpdatesManager_ObjC)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___UpdatesManager_ObjC;
  v2 = -[UpdatesManager_ObjC init](&v30, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.callout", v4);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appstored.dispatch", v8);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.appstored.badge", v12);
    badgeQueue = v2->_badgeQueue;
    v2->_badgeQueue = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSSet);
    tvProviderApps = v2->_tvProviderApps;
    v2->_tvProviderApps = v15;

    v17 = objc_opt_new(&OBJC_CLASS___NSRecursiveLock);
    DSIDLessAppsLock = v2->_DSIDLessAppsLock;
    v2->_DSIDLessAppsLock = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___TaskQueue);
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = v19;

    v21 = v2->_taskQueue;
    if (v21) {
      -[NSOperationQueue setName:]( v21->_operationQueue,  "setName:",  @"com.apple.appstored.UpdatesManager.taskQueue");
    }
    v22 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10027E840;
    block[3] = &unk_1003E9880;
    v23 = v2;
    v29 = v23;
    dispatch_async(v22, block);
    v24 = (dispatch_queue_s *)v2->_dispatchQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10027E90C;
    v26[3] = &unk_1003E9880;
    v27 = v23;
    dispatch_async(v24, v26);
  }

  return v2;
}

- (void)isTVProviderApp:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = 0LL;
  id v9 = v6;
  if (self && a3)
  {
    uint64_t v11 = 0LL;
    v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    char v14 = 0;
    DSIDLessAppsLock = self->_DSIDLessAppsLock;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100283810;
    v10[3] = &unk_1003EFD18;
    v10[5] = &v11;
    v10[6] = a3;
    v10[4] = self;
    sub_1002C11C4(DSIDLessAppsLock, v10);
    BOOL v7 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
    id v6 = v9;
  }

  (*((void (**)(id, BOOL))v6 + 2))(v6, v7);
}

- (void)autoUpdateEnabled:(id)a3
{
  id v5 = a3;
  BOOL v4 = sub_1002FA098((uint64_t)&OBJC_CLASS___AppDefaultsManager);
  (*((void (**)(id, BOOL))a3 + 2))(v5, v4);
}

- (void)confirmAgentRequestedUpdateAll:(id)a3
{
  BOOL agentRequestedUpdateAll = self->_agentRequestedUpdateAll;
  self->_BOOL agentRequestedUpdateAll = 0;
  (*((void (**)(id, BOOL))a3 + 2))(a3, agentRequestedUpdateAll);
}

- (void)dropAllUpdatesIncludingVPP:(BOOL)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027EBA4;
  v13[3] = &unk_1003EFA90;
  BOOL v15 = a3;
  id v7 = v4;
  id v14 = v7;
  [v6 readUsingSession:v13];

  id v8 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10027ED8C;
  v11[3] = &unk_1003EFAB8;
  id v12 = v7;
  id v10 = v7;
  [v9 modifyUsingTransaction:v11];
}

- (void)getManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027EE44;
  block[3] = &unk_1003E9FD0;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)getUpdatesWithContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027F204;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)getUpdateMetadataForBundleID:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027F2B8;
  block[3] = &unk_1003EA390;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)getUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027F4F0;
  block[3] = &unk_1003E9FD0;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)hidePendingUpdatesBadge
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027F620;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)noteUpdatesStateChanged:(id)a3 logKey:(id)a4
{
}

- (void)noteUpdatesStateChangedWithReason:(id)a3 logKey:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  LOBYTE(v16) = 0;
  uint64_t v11 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  v10,  0LL,  0LL,  0LL,  v16,  0LL);

  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027F754;
  block[3] = &unk_1003EA5C0;
  void block[4] = self;
  id v18 = v8;
  v19 = v11;
  id v20 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(dispatchQueue, block);
}

- (void)postProcessBackgroundUpdateMetrics
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027F8E4;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)performBackgroundSoftwareUpdateCheck
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027FA84;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)performPostRestoreUpdatesCheck
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027FBAC;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadApplicationBadgeWithReason:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10027FCBC;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)refreshUpdateCountWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10027FD80;
  block[3] = &unk_1003EA390;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)refreshUpdateForApp:(int64_t)a3 token:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10027FF9C;
  v13[3] = &unk_1003EEEE0;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)reloadFromServerInBackgroundWithToken:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100280144;
  block[3] = &unk_1003E9FD0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadFromServerWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100280254;
  block[3] = &unk_1003E9FD0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadManagedUpdatesWithRequestToken:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100280368;
  block[3] = &unk_1003E9FD0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)reloadUpdatesWithContext:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100280BAC;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(void))a4;
  uint64_t v6 = ASDLogHandleForCategory(40LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"disabled";
    if (v4) {
      id v8 = @"enabled";
    }
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting auto updates to %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  sub_1002FA23C((uint64_t)&OBJC_CLASS___AppDefaultsManager, v4);
  v5[2](v5);
}

- (void)setupFollowingMigration
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[KeepAlive keepAliveWithName:]( &OBJC_CLASS___KeepAlive,  "keepAliveWithName:",  @"com.apple.UpdateManager.setupFollowingMigration"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100280D34;
  v6[3] = &unk_1003E9DC0;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  dispatch_async(dispatchQueue, v6);
}

- (void)showPendingUpdatesBadge
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100280FAC;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)updateAllWithOrder:(id)a3 requestToken:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100281144;
  v15[3] = &unk_1003EA5E8;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)verifyAllPendingUpdates
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002816B4;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)verifyPendingUpdates:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002819DC;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)verifyUpdatesFollowingExternalAppInstall:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100281D34;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)verifyUpdatesForRemovedBundleIDs:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100281F7C;
  block[3] = &unk_1003E9880;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAccountChangedNotification
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10028351C;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSArray)headboardProvisionedApps
{
  return self->_headboardProvisionedApps;
}

- (void)setHeadboardProvisionedApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end