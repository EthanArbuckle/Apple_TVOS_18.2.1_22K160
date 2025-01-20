@interface ClientInterface
+ (id)_badgeQueue;
+ (id)allApprovedItemsByBundle;
+ (void)_updateBadgeCounts:(BOOL)a3 processTelemetry:(id)a4;
+ (void)refreshBadgesWithItems:(id)a3 forBundleIdentifier:(id)a4;
+ (void)updateBadgeCount:(unint64_t)a3 bundleID:(id)a4;
+ (void)updateBadgeCounts:(BOOL)a3;
- (ClientInterface)initWithXPCConnection:(id)a3;
- (NSString)uniqueIdentifier;
- (id)_predicateForClientIdentifier:(id)a3;
- (id)_telemetryProcessor;
- (id)itemsForClientIdentifier:(id)a3;
- (void)_didChangeFollowUpItems;
- (void)clearNotificationForItem:(id)a3 completion:(id)a4;
- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4;
- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5;
- (void)countOfPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4;
- (void)didActivateHSA2LoginNotificationNotification:(id)a3;
- (void)pendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4;
- (void)postFollowUpItem:(id)a3 completion:(id)a4;
- (void)postHSA2PasswordResetNotification:(id)a3 completion:(id)a4;
- (void)updateBadgesForTimer;
@end

@implementation ClientInterface

- (ClientInterface)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v6 = -[ClientInterface init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conn, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v9;
  }

  return v7;
}

+ (id)_badgeQueue
{
  if (qword_10001E388 != -1) {
    dispatch_once(&qword_10001E388, &stru_1000186A0);
  }
  return (id)qword_10001E380;
}

- (void)countOfPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[ClientInterface itemsForClientIdentifier:](self, "itemsForClientIdentifier:", a3));
    (*((void (**)(id, id, void))a4 + 2))(v7, [v8 count], 0);
  }

- (void)postFollowUpItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);

      if (v9) {
        goto LABEL_4;
      }
      uint64_t v30 = 1663LL;
    }

    else
    {
      uint64_t v30 = 1661LL;
    }

    uint64_t v33 = FLError(v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v7[2](v7, 0LL, v34);

    goto LABEL_23;
  }

- (void)pendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[ClientInterface itemsForClientIdentifier:](self, "itemsForClientIdentifier:", a3));
    (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0LL);
  }

- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v19 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientInterface itemsForClientIdentifier:](self, "itemsForClientIdentifier:", v6));
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 safeSelectFollowUpItemsWithUniqueIdentifiers:0]);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ClientInterface _telemetryProcessor](self, "_telemetryProcessor"));
        [v16 processItemRemoval:v15];

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
        [v17 deleteFollowUpItem:v15];

        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NotificationController sharedController]( &OBJC_CLASS___NotificationController,  "sharedController"));
        [v18 tearDownNotificationForItem:v15];
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  if ([v10 count]) {
    -[ClientInterface _didChangeFollowUpItems](self, "_didChangeFollowUpItems");
  }
  if (v7) {
    v7[2](v7, 1LL, 0LL);
  }
}

- (void)clearNotificationForItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);

  if (v7)
  {
    uint64_t v10 = _FLLogSystem(v8, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
      int v23 = 138412290;
      uint64_t v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Searching for matching item in store, using identifier: %@",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v13 = objc_alloc(&OBJC_CLASS___FLItemStoreDecorator);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 clientIdentifier]);
    uint64_t v15 = -[FLItemStoreDecorator initWithClientIdentifier:](v13, "initWithClientIdentifier:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator itemsMatchingIdentifier:](v15, "itemsMatchingIdentifier:", v16));

    if ([v17 count])
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NotificationController sharedController]( &OBJC_CLASS___NotificationController,  "sharedController"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);
      [v18 tearDownNotificationForItem:v19];

      v6[2](v6, 1LL, 0LL);
    }

    else
    {
      uint64_t v21 = FLError(1662LL);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0LL, v22);
    }
  }

  else
  {
    uint64_t v20 = FLError(1661LL);
    uint64_t v15 = (FLItemStoreDecorator *)objc_claimAutoreleasedReturnValue(v20);
    ((void (**)(id, uint64_t, FLItemStoreDecorator *))v6)[2](v6, 0LL, v15);
  }
}

- (void)updateBadgesForTimer
{
}

- (void)clearPendingFollowUpItemsForClientIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v20 = -[FLItemStoreDecorator initWithClientIdentifier:]( objc_alloc(&OBJC_CLASS___FLItemStoreDecorator),  "initWithClientIdentifier:",  v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator itemsMatchingIdentifiers:](v20, "itemsMatchingIdentifiers:", v9));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ClientInterface _telemetryProcessor](self, "_telemetryProcessor"));
        [v17 processItemRemoval:v16];

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
        [v18 deleteFollowUpItem:v16];

        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NotificationController sharedController]( &OBJC_CLASS___NotificationController,  "sharedController"));
        [v19 tearDownNotificationForItem:v16];
      }

      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  -[ClientInterface _didChangeFollowUpItems](self, "_didChangeFollowUpItems");
  if (v10) {
    v10[2](v10, 1LL, 0LL);
  }
}

- (id)itemsForClientIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _FLSignpostCreate();
  uint64_t v6 = v5;
  uint64_t v7 = _FLSignpostLogSystem();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000E718(v4, v8);
  }

  id v9 = -[FLItemStoreDecorator initWithClientIdentifier:]( objc_alloc(&OBJC_CLASS___FLItemStoreDecorator),  "initWithClientIdentifier:",  v3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator followUpItems](v9, "followUpItems"));
  unint64_t Nanoseconds = _FLSignpostGetNanoseconds(v4, v6);
  uint64_t v12 = _FLSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10000E688(Nanoseconds, v4, v13);
  }

  return v10;
}

- (id)_predicateForClientIdentifier:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000649C;
  v6[3] = &unk_1000186F0;
  id v7 = a3;
  id v3 = v7;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v6));

  return v4;
}

- (void)_didChangeFollowUpItems
{
  id v3 = (OS_os_transaction *)os_transaction_create("com.apple.followup.badge");
  transaction = self->_transaction;
  self->_transaction = v3;

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ClientInterface _telemetryProcessor](self, "_telemetryProcessor"));
  +[ClientInterface _updateBadgeCounts:processTelemetry:]( &OBJC_CLASS___ClientInterface,  "_updateBadgeCounts:processTelemetry:",  1LL,  v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  [v6 updateRepeatingActivityState];

  notify_post("com.apple.corefollowup.items_changed");
  id v7 = self->_transaction;
  self->_transaction = 0LL;
}

+ (void)updateBadgeCounts:(BOOL)a3
{
}

+ (void)_updateBadgeCounts:(BOOL)a3 processTelemetry:(id)a4
{
  id v6 = a4;
  id v7 = (void *)os_transaction_create("com.apple.followup.badge.refresh");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[FLEnvironment currentEnvironment](&OBJC_CLASS___FLEnvironment, "currentEnvironment"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 supportedBundleIdentifiers]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ClientInterface allApprovedItemsByBundle](&OBJC_CLASS___ClientInterface, "allApprovedItemsByBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v9));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100006818;
  v30[3] = &unk_100018718;
  id v22 = v7;
  id v31 = v22;
  id v12 = v11;
  id v32 = v12;
  BOOL v35 = a3;
  id v24 = v9;
  id v33 = v24;
  id v23 = v6;
  id v34 = v23;
  uint64_t v25 = v10;
  [v10 enumerateKeysAndObjectsUsingBlock:v30];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v14)
  {
    id v16 = v14;
    uint64_t v17 = *(void *)v27;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v18);
        uint64_t v20 = _FLLogSystem(v14, v15);
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v37 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No items found for bundle ID, %@, ensuring badge count is 0",  buf,  0xCu);
        }

        id v14 = objc_msgSend(a1, "refreshBadgesWithItems:forBundleIdentifier:", &__NSArray0__struct, v19, v22);
        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v38 count:16];
      id v16 = v14;
    }

    while (v14);
  }
}

+ (id)allApprovedItemsByBundle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allFollowUpItems]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fl_multiMap:", &stru_100018758));
  return v4;
}

+ (void)refreshBadgesWithItems:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v6);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (([v14 displayStyle] & 0x10) == 0
            && ![v14 isExpired])
          {
            ++v11;
          }
        }

        id v10 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v10);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    [a1 updateBadgeCount:v11 bundleID:v8];
  }

  else
  {
    uint64_t v15 = _FLLogSystem(0LL, v7);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No bundle identifier, nothing to badge...",  buf,  2u);
    }
  }
}

+ (void)updateBadgeCount:(unint64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  uint64_t v8 = _FLLogSystem(v6, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = (id)objc_opt_class(a1);
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 2112;
    id v25 = v6;
    id v10 = v21;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Badging (%lu, %@)", buf, 0x20u);
  }

  uint64_t v11 = (void *)os_transaction_create("com.apple.followup.badge");
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _badgeQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100006C78;
  v15[3] = &unk_100018780;
  unint64_t v18 = a3;
  id v19 = a1;
  id v16 = v6;
  id v17 = v11;
  id v13 = v11;
  id v14 = v6;
  dispatch_async(v12, v15);
}

- (void)didActivateHSA2LoginNotificationNotification:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NotificationController sharedController](&OBJC_CLASS___NotificationController, "sharedController"));
  [v4 didActivateHSA2LoginNotificationNotification:v3];
}

- (void)postHSA2PasswordResetNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___FLFollowUpNotification);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
  [v13 setTitle:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 informativeText]);
  [v13 setInformativeText:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  FLNotificationOptionNotificationCenter,  FLNotificationOptionForce,  0LL));
  [v13 setOptions:v10];

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___FLFollowUpItem);
  -[FLFollowUpItem setUniqueIdentifier:](v11, "setUniqueIdentifier:", @"com.apple.authkit.hsa2-password-reset");
  -[FLFollowUpItem setClientIdentifier:](v11, "setClientIdentifier:", @"com.apple.authkit");
  -[FLFollowUpItem setTargetBundleIdentifier:](v11, "setTargetBundleIdentifier:", 0LL);
  -[FLFollowUpItem setNotification:](v11, "setNotification:", v13);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 followUpItemUserInfo]);

  -[FLFollowUpItem setUserInfo:](v11, "setUserInfo:", v12);
  -[FLFollowUpItem setGroupIdentifier:](v11, "setGroupIdentifier:", FLGroupIdentifierAccount);
  -[ClientInterface postFollowUpItem:completion:](self, "postFollowUpItem:completion:", v11, v6);
}

- (id)_telemetryProcessor
{
  id v2 = objc_alloc(&OBJC_CLASS___FLTelemetryProcessor);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[FLTelemetryFactory sharedTelemetryController]( &OBJC_CLASS___FLTelemetryFactory,  "sharedTelemetryController"));
  id v4 = [v2 initWithController:v3];

  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
}

  ;
}

@end