@interface UpdatesService
- (UpdatesService)init;
- (void)autoUpdateEnabled:(id)a3;
- (void)compatibilityUpdateForBundleIDs:(id)a3 userInitiated:(BOOL)a4 withReplyHandler:(id)a5;
- (void)getManagedUpdatesWithReplyHandler:(id)a3;
- (void)getMetricsWithReplyHandler:(id)a3;
- (void)getUpdateMetadataForBundleID:(id)a3 withReplyHandler:(id)a4;
- (void)getUpdateMetricsEventsWithReplyHandler:(id)a3;
- (void)getUpdatesIncludingMetricsWithReplyHandler:(id)a3;
- (void)getUpdatesWithReplyHandler:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)refreshUpdateCountWithReplyHandler:(id)a3;
- (void)refreshUpdateForApp:(int64_t)a3 reply:(id)a4;
- (void)reloadForSettingsFromServerWithReplyHandler:(id)a3;
- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3;
- (void)reloadFromServerWithReplyHandler:(id)a3;
- (void)reloadManagedUpdatesWithReplyHandler:(id)a3;
- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4;
- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4;
- (void)shouldUseModernUpdatesWithReplyHandler:(id)a3;
- (void)showApplicationBadgeForPendingUpdates;
- (void)updateAllGettingJobResultsWithReplyHandler:(id)a3;
- (void)updateAllWithOrder:(id)a3 replyHandler:(id)a4;
- (void)updateAllWithReplyHandler:(id)a3;
@end

@implementation UpdatesService

- (UpdatesService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UpdatesService;
  v2 = -[UpdatesService init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.UpdatesService", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
    updatesInterface = v2->_updatesInterface;
    v2->_updatesInterface = (UpdatesControllerInterface *)v7;
  }

  return v2;
}

- (void)autoUpdateEnabled:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002DF6EC;
  v7[3] = &unk_1003E9FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10022ED10(dispatchQueue, v7);
}

- (void)compatibilityUpdateForBundleIDs:(id)a3 userInitiated:(BOOL)a4 withReplyHandler:(id)a5
{
  dispatch_queue_t v5 = (void (**)(id, void *))a5;
  id v6 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = ASDLogHandleForCategory(40LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 processInfo]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    int v13 = 138543362;
    v14 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Compatibility updates not supported on this platform requested by client: %{public}@",  (uint8_t *)&v13,  0xCu);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  909LL,  0LL));
  v5[2](v5, v10);
}

- (void)getManagedUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002DF958;
  v10[3] = &unk_1003EA390;
  id v11 = v6;
  v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)getUpdateMetadataForBundleID:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002DFC80;
  v14[3] = &unk_1003EA5C0;
  id v15 = v9;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)getUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002DFF5C;
  v10[3] = &unk_1003EA390;
  id v11 = v6;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)refreshUpdateCountWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E0230;
  v10[3] = &unk_1003EA390;
  id v11 = v6;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)refreshUpdateForApp:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002E0588;
  v12[3] = &unk_1003EEEE0;
  id v13 = v8;
  v14 = self;
  id v15 = v6;
  int64_t v16 = a3;
  id v10 = v6;
  id v11 = v8;
  sub_10022ED10(dispatchQueue, v12);
}

- (void)reloadFromServerWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E0908;
  v10[3] = &unk_1003EA390;
  id v11 = v6;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)reloadManagedUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E0C60;
  v10[3] = &unk_1003EA390;
  id v11 = v6;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[LogKey initWithCode:](objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey), "initWithCode:", @"AUAT");
  uint64_t v10 = ASDLogHandleForCategory(40LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 processInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    int v18 = 138412802;
    v19 = v9;
    __int16 v20 = 2114;
    id v21 = v5;
    __int16 v22 = 2114;
    v23 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] requestAutomaticUpdateAuthorizationIfNecessaryForProcessHandle: %{public}@ for client: %{public}@",  (uint8_t *)&v18,  0x20u);
  }

  uint64_t v14 = ASDLogHandleForCategory(40LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138412290;
    v19 = v9;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%@] Error, this platform is not supported",  (uint8_t *)&v18,  0xCu);
  }

  uint64_t v16 = ASDErrorWithDescription(ASDErrorDomain, 909LL, @"This platform is unsupported");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v6[2](v6, v17);
}

- (void)setAutoUpdateEnabled:(BOOL)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  id v7 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  dispatchQueue = self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002E1148;
  v12[3] = &unk_1003F0A38;
  BOOL v15 = a3;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  sub_10022ED10(dispatchQueue, v12);
}

- (void)updateAllWithOrder:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002E13C8;
  v14[3] = &unk_1003EA5C0;
  id v15 = v9;
  uint64_t v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  sub_10022ED10(dispatchQueue, v14);
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E1734;
  v10[3] = &unk_1003E9FF8;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)shouldUseModernUpdatesWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E1A9C;
  v10[3] = &unk_1003E9FF8;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)getUpdateMetricsEventsWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_100316770((uint64_t)&OBJC_CLASS___XPCRequestToken);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatchQueue = self->_dispatchQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E1C58;
  v10[3] = &unk_1003E9FD0;
  id v12 = self;
  id v13 = v4;
  id v11 = v6;
  id v8 = v4;
  id v9 = v6;
  sub_10022ED10(dispatchQueue, v10);
}

- (void)getMetricsWithReplyHandler:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v19 = sub_1002E2230((uint64_t)self);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v20;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Get metrics with reply handler",  (uint8_t *)&buf,  0xCu);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___ASDSoftwareUpdateMetrics);
  [v7 setUsingModernUpdatesCheck:1];
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2050000000LL;
  id v8 = (void *)qword_100462640;
  uint64_t v28 = qword_100462640;
  if (!qword_100462640)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v31 = sub_1002E29D0;
    v32 = &unk_1003ECDF8;
    v33 = &v25;
    sub_1002E29D0((uint64_t)&buf);
    id v8 = (void *)v26[3];
  }

  id v9 = v8;
  _Block_object_dispose(&v25, 8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sharedScheduler]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 submittedActivities]);
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name", (void)v21));
        if ([v16 hasPrefix:@"com.apple.appstored.AutoUpdates"])
        {
          id v12 = (id)objc_claimAutoreleasedReturnValue([v15 predictedOptimalStartDate]);

          goto LABEL_15;
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

- (void)getUpdatesIncludingMetricsWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v12 = sub_1002E2230((uint64_t)self);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v16 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Get updates including metrics with reply handler",  buf,  0xCu);
  }

  LOBYTE(v14) = 0;
  id v7 = -[UpdatesContext initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:]( objc_alloc(&OBJC_CLASS____TtC9appstored14UpdatesContext),  "initWithReason:requestToken:logKey:callbackHandler:includeMetrics:isVPPLookup:userInitiated:targetedItemID:",  0LL,  0LL,  0LL,  v4,  1LL,  0LL,  v14,  0LL);

  uint64_t v8 = ASDLogHandleForCategory(40LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UpdatesContext logKey](v7, "logKey"));
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] Get updates including metrics with reply handler",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v11 getUpdatesWithContext:v7];
}

- (void)hideApplicationBadgeForPendingUpdates
{
  uint64_t v3 = ASDLogHandleForCategory(40LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v6 = sub_1002E2230((uint64_t)self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Hide application badge for pending updates",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v5 hidePendingUpdatesBadge];
}

- (void)reloadForSettingsFromServerWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v15 = sub_1002E2230((uint64_t)self);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    int v17 = 138543362;
    id v18 = v16;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Reload for settings from server with reply handler",  (uint8_t *)&v17,  0xCu);
  }

  id v7 = sub_100316A0C((uint64_t)&OBJC_CLASS___XPCRequestToken, 0);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = ASDLogHandleForCategory(40LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      id Property = objc_getProperty(v8, v11, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v13 = Property;
    int v17 = 138412290;
    id v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%@] Reload for settings from server with reply handler",  (uint8_t *)&v17,  0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v14 reloadFromServerInBackgroundWithToken:v8 completionBlock:v4];
}

- (void)showApplicationBadgeForPendingUpdates
{
  uint64_t v3 = ASDLogHandleForCategory(40LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v6 = sub_1002E2230((uint64_t)self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Show application badge for pending updates",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v5 showPendingUpdatesBadge];
}

- (void)updateAllWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v9 = sub_1002E2230((uint64_t)self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)__int128 buf = 138543362;
    uint64_t v14 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Update all with reply handler",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002E2894;
  v11[3] = &unk_1003F2098;
  id v12 = v4;
  id v8 = v4;
  [v7 updateAllWithOrder:&__NSArray0__struct requestToken:0 replyHandler:v11];
}

- (void)updateAllGettingJobResultsWithReplyHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ASDLogHandleForCategory(40LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v8 = sub_1002E2230((uint64_t)self);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138543362;
    id v11 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[%{public}@] Update all getting job results with reply handler",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UpdatesManager sharedManager](&OBJC_CLASS___UpdatesManager, "sharedManager"));
  [v7 updateAllWithOrder:&__NSArray0__struct requestToken:0 replyHandler:v4];
}

- (void).cxx_destruct
{
}

@end