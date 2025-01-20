@interface GKDataRequestManager
+ (BOOL)allowSelfSignedCertForEnvironment:(int64_t)a3;
+ (id)clientQueue;
+ (id)pushQueue;
+ (id)ratingsQueue;
+ (id)sharedManager;
+ (id)statsQueue;
+ (id)syncQueue;
- (APSConnection)activePushConnection;
- (APSConnection)apsConnection;
- (APSConnection)pushConnectionDev;
- (APSConnection)pushConnectionProd;
- (BOOL)hasValidNATSettings;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pushUpdatesBusy;
- (BOOL)receivesMemoryWarnings;
- (GKApplicationStateMonitor)applicationStateMonitor;
- (GKDataRequestManager)init;
- (GKReachability)reachability;
- (NSCountedSet)transactionCounts;
- (NSData)pushToken;
- (NSDate)lastNATTypeCheckDate;
- (NSDate)nearbyQueryLastCheckDate;
- (NSDictionary)commonNATSettings;
- (NSMutableDictionary)transactionBag;
- (NSMutableSet)removedApp;
- (NSString)authenticatingWithSettingsBundleID;
- (double)nearbyQueryAllowance;
- (id)ampController;
- (id)pushConnectionForEnvironment:(int64_t)a3;
- (id)storeBag;
- (id)updateRequestWithPushToken:(id)a3;
- (int64_t)activePushEnvironment;
- (int64_t)currentEnvironment;
- (int64_t)preferredEnvironment;
- (unint64_t)natType;
- (void)_clearPushConnections;
- (void)_setActivePushEnvironment:(int64_t)a3;
- (void)_setPushToken:(id)a3;
- (void)_updateNotificationTopicsForcefully:(BOOL)a3;
- (void)_updatePushEnvironmentWithStoreBag:(id)a3;
- (void)appStateChanged:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)awaitNATSettingsAndUpdateIfNeededWithCompletionHandler:(id)a3;
- (void)beginTransaction:(id)a3;
- (void)beginTransaction:(id)a3 completion:(id)a4;
- (void)clearAllNearbyInvites;
- (void)clearPushEnvironment;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)credentialsDidChange:(id)a3;
- (void)dealloc;
- (void)endTransaction:(id)a3;
- (void)finishStartup;
- (void)gameCenterDidBecomeRestricted;
- (void)getValidNATTypeWithForceRelay:(BOOL)a3 withHandler:(id)a4;
- (void)handleNearbyInviteResponse:(id)a3;
- (void)iCloudAccountAvailabilityChanged:(id)a3;
- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4;
- (void)nearbyInviteWasCancelled:(id)a3;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
- (void)presentNearbyInvite:(id)a3;
- (void)processIncomingMessage:(id)a3;
- (void)processIncomingiMessageInvite:(id)a3;
- (void)reachabilityDidChange:(id)a3;
- (void)resetEnvironment;
- (void)resetEnvironmentWithHandler:(id)a3;
- (void)sendPushTokenWithReplyQueue:(id)a3;
- (void)sendPushTokenWithReplyQueue:(id)a3 completion:(id)a4;
- (void)setActivePushEnvironment:(int64_t)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setAuthenticatingWithSettingsBundleID:(id)a3;
- (void)setCommonNATSettings:(id)a3;
- (void)setLastNATTypeCheckDate:(id)a3;
- (void)setNatType:(unint64_t)a3;
- (void)setNearbyQueryAllowance:(double)a3;
- (void)setNearbyQueryLastCheckDate:(id)a3;
- (void)setPushConnectionDev:(id)a3;
- (void)setPushConnectionProd:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setPushUpdatesBusy:(BOOL)a3;
- (void)setReachability:(id)a3;
- (void)setReceivesMemoryWarnings:(BOOL)a3;
- (void)setRemovedApp:(id)a3;
- (void)setTransactionBag:(id)a3;
- (void)setTransactionCounts:(id)a3;
- (void)setUpCloudKitNotificationTopics;
- (void)storeBagChanged:(id)a3;
- (void)synchronizeBagWithPreferences;
- (void)terminate;
- (void)terminateClient:(id)a3;
- (void)updateActivePushEnvironment;
- (void)updateCachedNATSettingsIfNeededWithCompletionHandler:(id)a3;
- (void)updateNotificationTopicsForceFully:(BOOL)a3;
@end

@implementation GKDataRequestManager

- (id)updateRequestWithPushToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager pushToken](self, "pushToken"));
  if (v5)
  {
    id v6 = [v4 mutableCopy];
    [v6 setObject:v5 forKey:@"push-token"];
  }

  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)presentNearbyInvite:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  BOOL v8 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKDataRequestManager+Nearby: presentNearbyInvite",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v8);
  }
  v10 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "presenting nearby invite:%@", buf, 0xCu);
  }

  id v11 = -[GKDataRequestManager beginTransaction:](self, "beginTransaction:", @"presentNearbyInvite");
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  v13 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "begun presentNearbyInvite:", buf, 2u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000ECD40;
  v16[3] = &unk_100272160;
  v16[4] = self;
  id v17 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"bundleID"]);
  id v18 = v5;
  id v14 = v5;
  id v15 = v17;
  -[GKDataRequestManager loadLocalizedGameNameForBundleID:handler:]( self,  "loadLocalizedGameNameForBundleID:handler:",  v15,  v16);
}

- (void)nearbyInviteWasCancelled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: nearbyInviteWasCancelled",  buf,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"playerID"]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"deviceID"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"bundleID"]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[GKInviteInternal nearbyInviteIDForPlayerID:deviceID:bundleID:]( &OBJC_CLASS___GKInviteInternal,  "nearbyInviteIDForPlayerID:deviceID:bundleID:",  v7,  v8,  v9));
  id v11 = (void *)v10;
  if (v9 && v10)
  {
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v10);
    }
    v13 = (os_log_s *)os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: nearbyInviteWasCancelled - Telling Client",  v15,  2u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v9));
    [v14 cancelGameInvite:v11];
  }
}

- (void)handleNearbyInviteResponse:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKTrace;
  BOOL v7 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v7)
  {
    LOWORD(v27) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "GKDataRequestManager+Nearby: handleNearbyInviteResponse",  (uint8_t *)&v27,  2u);
  }

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v7);
  }
  id v9 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412290;
    v28 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "nearby invite NC response: %@",  (uint8_t *)&v27,  0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"inviteDictionary"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"bundleID"]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](&OBJC_CLASS___GKClientProxy, "clientForBundleID:", v11));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"buttonPressed"]);
    id v14 = [v13 integerValue];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"type"]);
    id v16 = [v15 integerValue];

    if (v16 == (id)1)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"inviteDictionary"]);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14 != 0LL));
      [v19 setObject:v20 forKey:@"accepted"];

      if (!v14)
      {
        if (v13) {
          uint64_t v21 = 1LL;
        }
        else {
          uint64_t v21 = 3LL;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v21));
        [v19 setObject:v22 forKey:@"declineReason"];
      }

      [v12 respondedToNearbyInvite:v19];
    }

    else
    {
      v25 = (os_log_s *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v26 = (id)GKOSLoggers(v17);
        v25 = (os_log_s *)os_log_GKGeneral;
      }

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_1000ED7C0((uint64_t)v4, (uint64_t)v16, v25);
      }
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers(0LL);
    }
    v24 = (os_log_s *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000ED74C((uint64_t)v4, v24);
    }
  }
}

- (void)clearAllNearbyInvites
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers(self);
  }
  id v3 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "GKDataRequestManager+Nearby: clearAllNearbyInvites",  buf,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](&OBJC_CLASS___GKBulletinController, "sharedController"));
  id v6 = objc_msgSend(v4, "getBulletinsOfType:", objc_opt_class(GKBulletinNearbyInvite, v5));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)]);
        [v4 withdrawBulletin:v12];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v9);
  }
}

+ (id)sharedManager
{
  return (id)qword_1002BB658;
}

+ (id)clientQueue
{
  return (id)qword_1002BB650;
}

+ (id)pushQueue
{
  if (qword_1002BB668 != -1) {
    dispatch_once(&qword_1002BB668, &stru_100272180);
  }
  return (id)qword_1002BB660;
}

+ (id)syncQueue
{
  if (qword_1002BB678 != -1) {
    dispatch_once(&qword_1002BB678, &stru_1002721A0);
  }
  return (id)qword_1002BB670;
}

- (void)performSync:(id)a3
{
  dispatch_block_t block = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "syncQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);

  if (v8 == v6)
  {
    label = dispatch_queue_get_label(v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the same queue(%s), would deadlock at %@",  "-[GKDataRequestManager performSync:]",  label,  v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    id v13 = objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]",  v11,  "-[GKDataRequestManager performSync:]",  [v13 UTF8String],  313));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v14);
  }

  dispatch_sync(v6, block);
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "syncQueue");
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_async(v7, v4);
}

- (GKDataRequestManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GKDataRequestManager;
  id v2 = -[GKDataRequestManager init](&v7, "init");
  id v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000EDCAC;
    v5[3] = &unk_10026B670;
    id v6 = v2;
    +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", @"gamed - init", v5);
  }

  return v3;
}

- (void)iCloudAccountAvailabilityChanged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKAccount;
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4A94(v6);
  }
  +[GKCloudKitMultiplayer updateUserWithHandler:](&OBJC_CLASS___GKCloudKitMultiplayer, "updateUserWithHandler:", 0LL);
}

- (void)reachabilityDidChange:(id)a3
{
  if (-[GKReachability _gkCurrentReachabilityStatus]( self->_reachability,  "_gkCurrentReachabilityStatus",  a3)) {
    +[GKClientProxy performDelayedRequestsForEnvironment:]( &OBJC_CLASS___GKClientProxy,  "performDelayedRequestsForEnvironment:",  self->_currentEnvironment);
  }
}

- (void)finishStartup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000EDF34;
  v2[3] = &unk_10026B670;
  v2[4] = self;
  +[GKActivity named:execute:](&OBJC_CLASS___GKActivity, "named:execute:", @"gamed - finishStartup", v2);
}

- (void)storeBagChanged:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  objc_super v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received store bag did change notification",  buf,  2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000EECB0;
  v9[3] = &unk_10026BDB0;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v9);
}

- (id)pushConnectionForEnvironment:(int64_t)a3
{
  uint64_t v3 = 9LL;
  if (a3 == 3) {
    uint64_t v3 = 10LL;
  }
  return (&self->super.isa)[v3];
}

- (APSConnection)activePushConnection
{
  return (APSConnection *)-[GKDataRequestManager pushConnectionForEnvironment:]( self,  "pushConnectionForEnvironment:",  -[GKDataRequestManager activePushEnvironment](self, "activePushEnvironment"));
}

- (void)_updateNotificationTopicsForcefully:(BOOL)a3
{
  id v5 = objc_msgSend((id)objc_opt_class(self, a2), "syncQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v9 = v8;
  if (v8 != v6)
  {
    label = dispatch_queue_get_label(v8);
    id v11 = dispatch_queue_get_label(v6);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKDataRequestManager _updateNotificationTopicsForcefully:]",  label,  v11,  v12));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    id v15 = objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == syncQueue)\n[%s (%s:%d)]",  v13,  "-[GKDataRequestManager _updateNotificationTopicsForcefully:]",  [v15 UTF8String],  576));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v16);
  }

  if (a3 || !-[GKDataRequestManager pushUpdatesBusy](self, "pushUpdatesBusy"))
  {
    -[GKDataRequestManager setPushUpdatesBusy:](self, "setPushUpdatesBusy:", 1LL);
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1000EF360;
    v47[3] = &unk_10026BDB0;
    v48 = v6;
    v49 = self;
    uint64_t v17 = objc_retainBlock(v47);
    if (!self->_activePushEnvironment)
    {
      -[GKDataRequestManager _clearPushConnections](self, "_clearPushConnections");
LABEL_38:
      ((void (*)(void *))v17[2])(v17);
      goto LABEL_39;
    }

    id v18 = (APSConnection *)objc_claimAutoreleasedReturnValue( -[GKDataRequestManager pushConnectionForEnvironment:]( self,  "pushConnectionForEnvironment:"));
    pushConnectionProd = self->_pushConnectionProd;
    if (v18 == pushConnectionProd) {
      pushConnectionProd = self->_pushConnectionDev;
    }
    v20 = pushConnectionProd;
    v46 = v20;
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers(v20);
    }
    v22 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      if (v46 == self->_pushConnectionProd) {
        id v23 = @"prod";
      }
      else {
        id v23 = @"dev";
      }
      *(_DWORD *)buf = 138412290;
      v53 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Clearing gamed topic for %@", buf, 0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v57 = @"com.apple.gamed";
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));
    -[APSConnection setEnabledTopics:ignoredTopics:](v46, "setEnabledTopics:ignoredTopics:", v24, v25);

    if (!os_log_GKGeneral) {
      id v27 = (id)GKOSLoggers(v26);
    }
    v28 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v29 = @"dev";
      if (v18 == self->_pushConnectionProd) {
        v29 = @"prod";
      }
      *(_DWORD *)buf = 138412290;
      v53 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Enabling gamed topic for %@", buf, 0xCu);
    }

    v56 = @"com.apple.gamed";
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[APSConnection setEnabledTopics:ignoredTopics:](v18, "setEnabledTopics:ignoredTopics:", v30, v31);

    if (!os_log_GKGeneral) {
      id v33 = (id)GKOSLoggers(v32);
    }
    v34 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v35 = self->_pushConnectionProd;
      *(_DWORD *)buf = 138412546;
      v53 = @"com.apple.gamed";
      __int16 v54 = 2112;
      v55 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Enabling topic (%@) for %@", buf, 0x16u);
    }

    v51 = @"com.apple.gamed";
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
    -[APSConnection _setEnabledTopics:](self->_pushConnectionProd, "_setEnabledTopics:", v36);

    if (!os_log_GKGeneral) {
      id v38 = (id)GKOSLoggers(v37);
    }
    v39 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      pushConnectionDev = self->_pushConnectionDev;
      *(_DWORD *)buf = 138412546;
      v53 = @"com.apple.gamed";
      __int16 v54 = 2112;
      v55 = pushConnectionDev;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Enabling topic (%@) for %@", buf, 0x16u);
    }

    v50 = @"com.apple.gamed";
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50, 1LL));
    -[APSConnection _setEnabledTopics:](self->_pushConnectionDev, "_setEnabledTopics:", v41);

    uint64_t v42 = objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](v18, "publicToken"));
    v43 = (void *)v42;
    v44 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v45 = (id)GKOSLoggers(v42);
      v44 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      sub_1000F4EA4();
      if (v43)
      {
LABEL_33:
        -[GKDataRequestManager _setPushToken:](self, "_setPushToken:", v43);
        if ([v43 length])
        {
          -[GKDataRequestManager sendPushTokenWithReplyQueue:completion:]( self,  "sendPushTokenWithReplyQueue:completion:",  0LL,  v17);

LABEL_39:
          goto LABEL_40;
        }
      }
    }

    else if (v43)
    {
      goto LABEL_33;
    }

    goto LABEL_38;
  }

- (void)setUpCloudKitNotificationTopics
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.gamed"]);
  if (!self->_apsConnection)
  {
    id v4 = objc_alloc(&OBJC_CLASS___APSConnection);
    uint64_t v5 = APSEnvironmentProduction;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    id v8 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v4,  "initWithEnvironmentName:namedDelegatePort:queue:",  v5,  @"com.apple.aps.gamed.CK",  v7);
    apsConnection = self->_apsConnection;
    self->_apsConnection = v8;

    -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", self);
  }

  id v11 = v3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  -[APSConnection _setEnabledTopics:](self->_apsConnection, "_setEnabledTopics:", v10);
}

- (void)credentialsDidChange:(id)a3
{
}

- (void)updateNotificationTopicsForceFully:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000EF618;
  v3[3] = &unk_10026C618;
  v3[4] = self;
  BOOL v4 = a3;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v3);
}

- (void)_clearPushConnections
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  BOOL v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushConnectionProd = self->_pushConnectionProd;
    int v10 = 138412290;
    id v11 = pushConnectionProd;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Clearing topics for prod %@",  (uint8_t *)&v10,  0xCu);
  }

  id v6 = -[APSConnection _setEnabledTopics:](self->_pushConnectionProd, "_setEnabledTopics:", &__NSArray0__struct);
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v6);
  }
  id v8 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushConnectionDev = self->_pushConnectionDev;
    int v10 = 138412290;
    id v11 = pushConnectionDev;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Clearing topics for dev %@", (uint8_t *)&v10, 0xCu);
  }

  -[APSConnection _setEnabledTopics:](self->_pushConnectionDev, "_setEnabledTopics:", &__NSArray0__struct);
}

- (void)clearPushEnvironment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000EF7C4;
  v2[3] = &unk_10026B670;
  v2[4] = self;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v2);
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[GKDataRequestManager setReceivesMemoryWarnings:](self, "setReceivesMemoryWarnings:", 0LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  [v4 setPreferencesDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GKDataRequestManager;
  -[GKDataRequestManager dealloc](&v5, "dealloc");
}

- (int64_t)preferredEnvironment
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v3 = [v2 environment];

  return (int64_t)v3;
}

+ (BOOL)allowSelfSignedCertForEnvironment:(int64_t)a3
{
  return ((unint64_t)a3 < 0xB) & (0x518u >> a3);
}

- (void)resetEnvironmentWithHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  id v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Resetting environment", buf, 2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
  int64_t v9 = -[GKDataRequestManager currentEnvironment](self, "currentEnvironment");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000EFA24;
  v11[3] = &unk_10026B2A0;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  [v8 removeAllCredentialsForEnvironment:v9 completionHandler:v11];
}

- (void)resetEnvironment
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  int64_t v9 = -[GKEntitlements initWithConnection:](objc_alloc(&OBJC_CLASS___GKEntitlements), "initWithConnection:", v7);
  id v10 = [v7 processIdentifier];
  if ((_DWORD)v10)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSBundle _gkBundleIdentifierFromConnection:]( &OBJC_CLASS___NSBundle,  "_gkBundleIdentifierFromConnection:",  v7));
    id v12 = v11;
    if (!v11) {
      goto LABEL_17;
    }
    id v13 = (os_log_s *)os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v14 = (id)GKOSLoggers(v11);
      id v13 = (os_log_s *)os_log_GKGeneral;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000F5018();
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy clientForBundleID:pid:createIfNecessary:]( &OBJC_CLASS___GKClientProxy,  "clientForBundleID:pid:createIfNecessary:",  v12,  v10,  1LL));
    id v11 = [v15 setOriginalBundleIdentifier:v12];
    if (v15)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___GKSpoofingClientProxy, v16);
      char isKindOfClass = objc_opt_isKindOfClass(v15, v17);
      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue(-[GKEntitlements grandfatheredEntitlementsForSpoofedApps](v9, "grandfatheredEntitlementsForSpoofedApps"));

        int64_t v9 = (GKEntitlements *)v19;
      }

      BOOL v20 = -[GKEntitlements hasAnyEntitlement](v9, "hasAnyEntitlement");
      if (v20)
      {
        if (!os_log_GKGeneral) {
          id v21 = (id)GKOSLoggers(v20);
        }
        v22 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          log = v22;
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v15 originalBundleIdentifier]);
          *(_DWORD *)buf = 67110146;
          int v55 = (int)v10;
          __int16 v56 = 2112;
          v57 = v23;
          __int16 v58 = 2112;
          v59 = v24;
          __int16 v60 = 1024;
          int v61 = isKindOfClass & 1;
          __int16 v62 = 2112;
          v63 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "accepted client connection (pid:%d, bundleID:%@, originalBundleIdentifier: %@, isSpoofing:%d, entitlements:%@)",  buf,  0x2Cu);
        }

        [v15 setEntitlements:v9];
        [v7 setExportedObject:v15];
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKDaemonInterface interface](&OBJC_CLASS___GKDaemonInterface, "interface"));
        [v7 setExportedInterface:v25];

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientInterface interface](&OBJC_CLASS___GKClientInterface, "interface"));
        [v7 setRemoteObjectInterface:v26];

        objc_initWeak(&location, v7);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_1000F01E0;
        v50[3] = &unk_100272290;
        objc_copyWeak(&v52, &location);
        id v27 = v15;
        id v51 = v27;
        [v7 setInterruptionHandler:v50];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_1000F02E0;
        v46[3] = &unk_1002722B8;
        objc_copyWeak(&v49, &location);
        id v28 = v27;
        id v47 = v28;
        v48 = self;
        [v7 setInvalidationHandler:v46];
        [v28 setPid:v10];
        [v28 setConnection:v7];
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 originalBundleIdentifier]);
        v30 = v29;
        if (v29) {
          id v31 = v29;
        }
        else {
          id v31 = (id)objc_claimAutoreleasedReturnValue([v28 bundleIdentifier]);
        }
        id v10 = v31;

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager applicationStateMonitor](self, "applicationStateMonitor"));
        if ([v40 startObservingStateChangesForBundleID:v10]
          && [v28 applicationState] == 8)
        {
          [v28 didEnterForeground];
        }

        id v41 = [v7 resume];
        if (!os_log_GKGeneral) {
          id v42 = (id)GKOSLoggers(v41);
        }
        v43 = (os_log_s *)os_log_GKPerf;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          double v44 = CFAbsoluteTimeGetCurrent();
          sub_1000F4FD4(buf, v44, Current);
        }

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v52);
        objc_destroyWeak(&location);

        LOBYTE(v10) = 1;
        goto LABEL_28;
      }

      if (!os_log_GKGeneral) {
        id v34 = (id)GKOSLoggers(v20);
      }
      v35 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v36 = v35;
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v15 originalBundleIdentifier]);
        *(_DWORD *)buf = 67109634;
        int v55 = (int)v10;
        __int16 v56 = 2112;
        v57 = v37;
        __int16 v58 = 2112;
        v59 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "rejected connection from client lacking any entitlement (pid:%d, bundleID:%@, originalBundleIdentifier: %@)",  buf,  0x1Cu);
      }
    }

    else
    {
LABEL_17:
      if (!os_log_GKGeneral) {
        id v32 = (id)GKOSLoggers(v11);
      }
      id v33 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v55 = (int)v10;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Could not get client for pid (%d)", buf, 8u);
      }

      NSLog(@"Could not get client for pid (%d)", v10);
    }

    LOBYTE(v10) = 0;
LABEL_28:
  }

  return (char)v10;
}

- (void)awaitNATSettingsAndUpdateIfNeededWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager commonNATSettings](self, "commonNATSettings"));

  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v6);
    }
    id v8 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[NAT] Has cached NAT settings. Returning.",  v9,  2u);
    }

    v4[2](v4);
  }

  else
  {
    -[GKDataRequestManager updateCachedNATSettingsIfNeededWithCompletionHandler:]( self,  "updateCachedNATSettingsIfNeededWithCompletionHandler:",  v4);
  }
}

- (void)updateCachedNATSettingsIfNeededWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  specific = (char *)dispatch_get_specific(&off_1002B7BB8);
  if (specific == "com.apple.GameKit.GKDataRequestManager.sync")
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(specific);
    }
    int64_t v9 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[NAT] Updating cached settings.", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKViceroyNATConfiguration settingsKeys](&OBJC_CLASS___GKViceroyNATConfiguration, "settingsKeys"));
      id v13 = objc_msgSend((id)objc_opt_class(self, v12), "syncQueue");
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000F0784;
      v17[3] = &unk_10026BF90;
      v17[4] = self;
      id v18 = v10;
      uint64_t v19 = v4;
      [v18 getValuesForKeys:v11 queue:v14 completion:v17];
    }

    else
    {
      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers(0LL);
      }
      uint64_t v16 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[NAT] No store bag, not updating NAT settings",  buf,  2u);
      }

      v4[2](v4);
    }
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers(specific);
    }
    id v7 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[NAT] Not on sync queue, switching to sync queue.",  buf,  2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000F0778;
    v20[3] = &unk_10026B310;
    v20[4] = self;
    id v21 = v4;
    -[GKDataRequestManager performAsync:](self, "performAsync:", v20);
  }
}

- (void)getValidNATTypeWithForceRelay:(BOOL)a3 withHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers(v6);
    }
    int64_t v9 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[NAT] Returning forced relay NAT type.", buf, 2u);
    }

    ((void (**)(void, id))v7)[2]( v7,  +[GKViceroyNATTypeHelper forceRelayNATType](&OBJC_CLASS___GKViceroyNATTypeHelper, "forceRelayNATType"));
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000F0B48;
    v10[3] = &unk_10026B310;
    v10[4] = self;
    id v11 = v6;
    -[GKDataRequestManager performAsync:](self, "performAsync:", v10);
  }
}

- (BOOL)hasValidNATSettings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager commonNATSettings](self, "commonNATSettings"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (int64_t)activePushEnvironment
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F158C;
  v4[3] = &unk_10026E058;
  v4[4] = self;
  v4[5] = &v5;
  -[GKDataRequestManager performSync:](self, "performSync:", v4);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_setActivePushEnvironment:(int64_t)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "syncQueue");
  int64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);

  if (v6 != v9)
  {
    label = dispatch_queue_get_label(v6);
    id v12 = objc_msgSend((id)objc_opt_class(self, v11), "syncQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = dispatch_queue_get_label(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKDataRequestManager _setActivePushEnvironment:]",  label,  v14,  v15));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]",  v16,  "-[GKDataRequestManager _setActivePushEnvironment:]",  [v18 UTF8String],  978));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v19);
  }

  else {
    int64_t v21 = a3;
  }
  if (v21 != self->_activePushEnvironment)
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers(v20);
    }
    id v23 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int64_t activePushEnvironment = self->_activePushEnvironment;
      *(_DWORD *)buf = 67109376;
      LODWORD(v36[0]) = activePushEnvironment;
      WORD2(v36[0]) = 1024;
      *(_DWORD *)((char *)v36 + 6) = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Changing push environment from %d to %d",  buf,  0xEu);
    }

    self->_int64_t activePushEnvironment = v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v25 setInteger:self->_activePushEnvironment forKey:GKPushEnvironmentKey];
    [v25 synchronize];
    if (self->_activePushEnvironment == 3 && !self->_pushConnectionDev)
    {
      uint64_t v26 = objc_alloc(&OBJC_CLASS___APSConnection);
      uint64_t v27 = APSEnvironmentDevelopment;
      id v28 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager pushQueue](&OBJC_CLASS___GKDataRequestManager, "pushQueue"));
      v29 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v26,  "initWithEnvironmentName:namedDelegatePort:queue:",  v27,  @"com.apple.gamed.apsdev",  v28);
      pushConnectionDev = self->_pushConnectionDev;
      self->_pushConnectionDev = v29;

      if (!os_log_GKGeneral) {
        id v32 = (id)GKOSLoggers(v31);
      }
      id v33 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        id v34 = self->_pushConnectionDev;
        *(_DWORD *)buf = 138412290;
        v36[0] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Created dev push connection: %@", buf, 0xCu);
      }

      -[APSConnection setDelegate:](self->_pushConnectionDev, "setDelegate:", self);
    }

    -[GKDataRequestManager _updateNotificationTopicsForcefully:](self, "_updateNotificationTopicsForcefully:", 1LL);
  }

- (void)setActivePushEnvironment:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000F1938;
  v3[3] = &unk_100270E78;
  v3[4] = self;
  void v3[5] = a3;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v3);
}

- (NSData)pushToken
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000F1A08;
  int64_t v9 = sub_1000F1A18;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F1A20;
  v4[3] = &unk_10026E058;
  v4[4] = self;
  v4[5] = &v5;
  -[GKDataRequestManager performSync:](self, "performSync:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

- (void)_setPushToken:(id)a3
{
  id v5 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "syncQueue");
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);

  if (v7 != v10)
  {
    id v30 = v5;
    label = dispatch_queue_get_label(v7);
    id v13 = objc_msgSend((id)objc_opt_class(self, v12), "syncQueue");
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = dispatch_queue_get_label(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKDataRequestManager _setPushToken:]",  label,  v15,  v16));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    id v19 = objc_claimAutoreleasedReturnValue([v18 lastPathComponent]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]",  v17,  "-[GKDataRequestManager _setPushToken:]",  [v19 UTF8String],  1024));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v20);
    id v5 = v30;
  }

  p_pushToken = &self->_pushToken;
  objc_storeStrong((id *)&self->_pushToken, a3);
  if (!os_log_GKGeneral) {
    id v23 = (id)GKOSLoggers(v22);
  }
  v24 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    pushToken = self->_pushToken;
    int64_t activePushEnvironment = self->_activePushEnvironment;
    *(_DWORD *)buf = 138412546;
    id v32 = pushToken;
    __int16 v33 = 1024;
    int v34 = activePushEnvironment;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "pushToken: %@ activePushEnvironment: %d",  buf,  0x12u);
  }

  uint64_t v27 = *p_pushToken;
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v29 = v28;
  if (v27) {
    [v28 setObject:*p_pushToken forKey:GKPushTokenKey];
  }
  else {
    [v28 removeObjectForKey:GKPushTokenKey];
  }
}

- (void)setPushToken:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000F1D38;
  v4[3] = &unk_10026BDB0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[GKDataRequestManager performAsync:](v5, "performAsync:", v4);
}

- (void)_updatePushEnvironmentWithStoreBag:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unint64_t v6 = (unint64_t)[v5 pushEnvironment];

  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v7);
  }
  id v9 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v14 = 67109120;
    LODWORD(v15) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "default pushEnvironment = %d", (uint8_t *)&v14, 8u);
  }

  if (v6 <= 1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"gk-apns-env"]);
    id v11 = [v10 isEqual:@"dev"];
    if ((_DWORD)v11) {
      unint64_t v6 = 3LL;
    }
    else {
      unint64_t v6 = 2LL;
    }
    if (!os_log_GKGeneral) {
      id v12 = (id)GKOSLoggers(v11);
    }
    id v13 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "using bag pushEnvironment %@ (%d)",  (uint8_t *)&v14,  0x12u);
    }
  }

  -[GKDataRequestManager _setActivePushEnvironment:](self, "_setActivePushEnvironment:", v6);
}

- (void)updateActivePushEnvironment
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "syncQueue");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F1F94;
  v8[3] = &unk_100272358;
  v8[4] = self;
  id v9 = v3;
  id v7 = v3;
  [v7 getValuesForKeys:&off_1002886B8 queue:v6 completion:v8];
}

- (void)sendPushTokenWithReplyQueue:(id)a3
{
}

- (void)sendPushTokenWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "syncQueue");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v10;
  if (!v6) {
    id v6 = v10;
  }
  int64_t currentEnvironment = self->_currentEnvironment;
  int64_t activePushEnvironment = self->_activePushEnvironment;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F22B8;
  v17[3] = &unk_1002723F0;
  int64_t v20 = currentEnvironment;
  int64_t v21 = activePushEnvironment;
  id v18 = v11;
  id v19 = v7;
  v17[4] = self;
  id v15 = v11;
  id v16 = v7;
  [v14 getValuesForKeys:&off_1002886D0 queue:v6 completion:v17];
}

- (id)ampController
{
  return +[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller");
}

- (void)synchronizeBagWithPreferences
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager storeBag](self, "storeBag"));
  v8[0] = GKMaxRecentPlayersCount;
  v8[1] = GKMaxRecentPlayersTime;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "syncQueue");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 getValuesForKeys:v4 queue:v7 completion:&stru_100272430];
}

- (void)terminateClient:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "syncQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);

  if (v6 != v9)
  {
    label = dispatch_queue_get_label(v6);
    id v12 = objc_msgSend((id)objc_opt_class(self, v11), "syncQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = dispatch_queue_get_label(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKDataRequestManager terminateClient:]",  label,  v14,  v15));
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKDataRequestManager.m"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 lastPathComponent]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == [[self class] syncQueue])\n[%s (%s:%d)]",  v16,  "-[GKDataRequestManager terminateClient:]",  [v18 UTF8String],  1209));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v19);
  }

  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers(v20);
  }
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5238();
  }
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKMultiplayerMatchService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v4,  0LL));
  [v22 cancelGameInviteWithHandler:&stru_100272450];

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKMultiplayerMatchService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v4,  0LL));
  [v23 cancelOutstandingMatchRequestWithHandler:&stru_100272470];

  -[GKDataRequestManager clearAllNearbyInvites](self, "clearAllNearbyInvites");
  [v4 clearDiscoveryInfo];
  +[GKClientProxy removeClient:](&OBJC_CLASS___GKClientProxy, "removeClient:", v4);
  [v4 terminateWithCompletionHandler:&stru_1002724B0];
}

- (void)appStateChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKApplicationStateKey]);
  id v6 = [v5 integerValue];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKApplicationStateDisplayIDKey]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:GKApplicationStatePIDKey]);
  id v9 = [v8 integerValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy clientForBundleID:pid:createIfNecessary:]( &OBJC_CLASS___GKClientProxy,  "clientForBundleID:pid:createIfNecessary:",  v7,  v9,  (_DWORD)v6 == 8));
  uint64_t v11 = v10;
  if (v10)
  {
    if (([v10 isUIService] & 1) == 0)
    {
      id v12 = [v11 isExtension];
      if ((v12 & 1) == 0)
      {
        if (!os_log_GKGeneral) {
          id v13 = (id)GKOSLoggers(v12);
        }
        int v14 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          id v15 = v14;
          *(_DWORD *)buf = 138413058;
          v39 = v11;
          __int16 v40 = 1024;
          unsigned int v41 = [v11 applicationState];
          __int16 v42 = 1024;
          int v43 = (int)v6;
          __int16 v44 = 2112;
          id v45 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "appState for client %@ changed from %d to %d -- userinfo = %@",  buf,  0x22u);
        }

        objc_msgSend(v11, "setPreviousApplicationState:", objc_msgSend(v11, "applicationState"));
        [v11 setApplicationState:v6];
        switch((int)v6)
        {
          case 1:
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
            id v23 = [v11 environment];
            v24 = (void *)objc_claimAutoreleasedReturnValue([v11 currentGame]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v22 primaryCredentialForEnvironment:v23 gameID:v25]);

            if (v26)
            {
              id v32 = _NSConcreteStackBlock;
              uint64_t v33 = 3221225472LL;
              int v34 = sub_1000F31EC;
              v35 = &unk_10026BDB0;
              v36 = self;
              id v37 = v11;
              -[GKDataRequestManager performSync:](self, "performSync:", &v32);
            }

            else
            {
              +[GKClientProxy removeClient:](&OBJC_CLASS___GKClientProxy, "removeClient:", v11);
            }

            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalBundleIdentifier", v32, v33, v34, v35, v36));
            id v28 = v27;
            if (v27) {
              id v29 = v27;
            }
            else {
              id v29 = (id)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
            }
            id v30 = v29;

            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager applicationStateMonitor](self, "applicationStateMonitor"));
            [v31 stopObservingStateChangesForBundleID:v30];

            break;
          case 2:
          case 4:
            if ([v11 isGameCenter]) {
              -[GKDataRequestManager setAuthenticatingWithSettingsBundleID:]( self,  "setAuthenticatingWithSettingsBundleID:",  0LL);
            }
            id v16 = (void *)objc_claimAutoreleasedReturnValue( +[GKPlayerCredentialController sharedController]( &OBJC_CLASS___GKPlayerCredentialController,  "sharedController"));
            id v17 = [v11 environment];
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 currentGame]);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 primaryCredentialForEnvironment:v17 gameID:v19]);

            if (v20) {
              [v11 backgroundWithCompletionHandler:0];
            }
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKMultiplayerMatchService,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v11,  0LL));
            [v21 cancelOutstandingMatchRequestWithHandler:&stru_1002724D0];

            -[GKDataRequestManager clearAllNearbyInvites](self, "clearAllNearbyInvites");
            break;
          case 8:
            [v11 didEnterForeground];
            break;
          default:
            break;
        }
      }
    }
  }
}

- (void)loadLocalizedGameNameForBundleID:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  id v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: loadLocalizedGameNameForBundleID",  buf,  2u);
  }

  if (v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v10,  0LL));
    id v17 = v5;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000F3398;
    v13[3] = &unk_10026C550;
    id v14 = v5;
    id v15 = v7;
    [v11 getGameMetadataForBundleIDs:v12 handler:v13];
  }
}

- (void)gameCenterDidBecomeRestricted
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: gameCenterDidBecomeRestricted",  v5,  2u);
  }

  -[GKDataRequestManager resetEnvironment](self, "resetEnvironment");
}

- (void)processIncomingiMessageInvite:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers(v3);
  }
  id v6 = (os_log_s *)os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Processing incoming Messages invite data dictionary: %@",  (uint8_t *)&v7,  0xCu);
  }

  +[GKBulletin bulletinsForPushNotification:withHandler:]( &OBJC_CLASS___GKBulletin,  "bulletinsForPushNotification:withHandler:",  v4,  &stru_100272510);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers(v7);
  }
  id v10 = (os_log_s *)os_log_GKTrace;
  BOOL v11 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: connection:didReceivePublicToken:",  buf,  2u);
  }

  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v11);
  }
  id v13 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "connection: %@ publicToken: %@", buf, 0x16u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000F38EC;
  v16[3] = &unk_10026BEA0;
  v16[4] = self;
  id v17 = v6;
  id v18 = v8;
  id v14 = v8;
  id v15 = v6;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v16);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
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
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: connection:didReceiveIncomingMessage:",  (uint8_t *)&v30,  2u);
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 topic]);
  id v13 = (void *)v12;
  if (!os_log_GKGeneral) {
    id v14 = (id)GKOSLoggers(v12);
  }
  id v15 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v30 = 138412290;
    uint64_t v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received push: %@", (uint8_t *)&v30, 0xCu);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](&OBJC_CLASS___GKReporter, "reporter"));
  [v16 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountAll];

  if (!os_log_GKGeneral) {
    id v18 = (id)GKOSLoggers(v17);
  }
  id v19 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    int v30 = 138412546;
    uint64_t v31 = v13;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "received push for topic %@, userInfo = %@",  (uint8_t *)&v30,  0x16u);
  }

  if ([v13 isEqualToString:@"com.apple.gamed"])
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
    unsigned __int8 v21 = [v20 isGameCenterDisabled];

    if ((v21 & 1) == 0) {
      -[GKDataRequestManager processIncomingMessage:](self, "processIncomingMessage:", v11);
    }
  }

  else
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.gamed"]);
    unsigned __int8 v23 = [v13 isEqualToString:v22];

    if ((v23 & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v25 = (id)GKOSLoggers(v24);
      }
      uint64_t v26 = (os_log_s *)os_log_GKTrace;
      BOOL v27 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
      if (v27)
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "GKDataRequestManager: PUSH FAILED: unknown topic",  (uint8_t *)&v30,  2u);
      }

      if (!os_log_GKGeneral) {
        id v28 = (id)GKOSLoggers(v27);
      }
      id v29 = (os_log_s *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412290;
        uint64_t v31 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "PUSH FAILED: Unknown topic (%@)",  (uint8_t *)&v30,  0xCu);
      }
    }
  }
}

- (void)processIncomingMessage:(id)a3
{
  id v4 = a3;
  -[GKDataRequestManager beginTransaction:](self, "beginTransaction:", @"processMessage");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3DAC;
  block[3] = &unk_10026B670;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(&_dispatch_main_q, block);
  -[GKDataRequestManager endTransaction:](self, "endTransaction:", @"processMessage");
}

- (void)endTransaction:(id)a3
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
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "GKDataRequestManager: endTransaction:", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F3FB8;
  v9[3] = &unk_10026BDB0;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v9);
}

- (void)beginTransaction:(id)a3
{
}

- (void)beginTransaction:(id)a3 completion:(id)a4
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKDataRequestManager: beginTransaction:", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F4164;
  v13[3] = &unk_10026B148;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v11 = v8;
  id v12 = v6;
  -[GKDataRequestManager performAsync:](self, "performAsync:", v13);
}

- (void)terminate
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKTrace;
  BOOL v5 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKDataRequestManager: Forced termination", buf, 2u);
  }

  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v5);
  }
  id v7 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Forced termination. Goodbye.", v8, 2u);
  }

  -[GKDataRequestManager performSync:](self, "performSync:", &stru_100272550);
}

+ (id)statsQueue
{
  if (qword_1002BB688 != -1) {
    dispatch_once(&qword_1002BB688, &stru_100272570);
  }
  return (id)qword_1002BB680;
}

+ (id)ratingsQueue
{
  if (qword_1002BB698 != -1) {
    dispatch_once(&qword_1002BB698, &stru_100272590);
  }
  return (id)qword_1002BB690;
}

- (id)storeBag
{
  return +[GKStoreBag storeBagForEnvironment:dataRequestManager:]( &OBJC_CLASS___GKStoreBag,  "storeBagForEnvironment:dataRequestManager:",  self->_currentEnvironment);
}

- (int64_t)currentEnvironment
{
  return self->_currentEnvironment;
}

- (BOOL)receivesMemoryWarnings
{
  return self->_receivesMemoryWarnings;
}

- (void)setReceivesMemoryWarnings:(BOOL)a3
{
  self->_receivesMemoryWarnings = a3;
}

- (NSDate)nearbyQueryLastCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setNearbyQueryLastCheckDate:(id)a3
{
}

- (double)nearbyQueryAllowance
{
  return self->_nearbyQueryAllowance;
}

- (void)setNearbyQueryAllowance:(double)a3
{
  self->_nearbyQueryAllowance = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (APSConnection)pushConnectionProd
{
  return self->_pushConnectionProd;
}

- (void)setPushConnectionProd:(id)a3
{
}

- (APSConnection)pushConnectionDev
{
  return self->_pushConnectionDev;
}

- (void)setPushConnectionDev:(id)a3
{
}

- (NSMutableDictionary)transactionBag
{
  return self->_transactionBag;
}

- (void)setTransactionBag:(id)a3
{
}

- (NSCountedSet)transactionCounts
{
  return self->_transactionCounts;
}

- (void)setTransactionCounts:(id)a3
{
}

- (GKApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (NSString)authenticatingWithSettingsBundleID
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setAuthenticatingWithSettingsBundleID:(id)a3
{
}

- (GKReachability)reachability
{
  return self->_reachability;
}

- (void)setReachability:(id)a3
{
}

- (BOOL)pushUpdatesBusy
{
  return self->_pushUpdatesBusy;
}

- (void)setPushUpdatesBusy:(BOOL)a3
{
  self->_pushUpdatesBusy = a3;
}

- (unint64_t)natType
{
  return self->_natType;
}

- (void)setNatType:(unint64_t)a3
{
  self->_natType = a3;
}

- (NSDate)lastNATTypeCheckDate
{
  return self->_lastNATTypeCheckDate;
}

- (void)setLastNATTypeCheckDate:(id)a3
{
}

- (NSDictionary)commonNATSettings
{
  return self->_commonNATSettings;
}

- (void)setCommonNATSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSMutableSet)removedApp
{
  return (NSMutableSet *)objc_getAssociatedObject(self, @"GK_REMOVED_APP_SET_KEY");
}

- (void)setRemovedApp:(id)a3
{
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v21 = self;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](self, "removedApp"));

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[GKDataRequestManager setRemovedApp:](self, "setRemovedApp:", v6);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = GKInfoPlistKeyFriendsAPIUsageDescription;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleURL]);

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleURL]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v15));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);

          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v11]);
          if (v18)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](v21, "removedApp"));
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
            [v19 addObject:v20];
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v9);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](self, "removedApp", a3));
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v6);
        id v8 = objc_opt_new(&OBJC_CLASS___GKGameSettingsInternal);
        -[GKGameSettingsInternal setBundleID:](v8, "setBundleID:", v7);
        -[GKGameSettingsInternal setAllowFriendListAccess:](v8, "setAllowFriendListAccess:", 3LL);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v9,  0LL));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameSettingsInternal bundleID](v8, "bundleID"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue( -[GKGameSettingsInternal serverAllowFriendListAccessValue]( v8,  "serverAllowFriendListAccessValue"));
        [v10 submitFriendListAccess:v11 value:v12 handler:&stru_1002725B0];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v4);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataRequestManager removedApp](self, "removedApp"));
  [v13 removeAllObjects];
}

@end