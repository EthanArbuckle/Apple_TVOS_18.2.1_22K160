@interface SDNotificationManager
+ (id)sharedManager;
- (NSSet)activeTVAutoFillPrompts;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDNotificationManager)init;
- (id)attachmentFromURL:(id)a3;
- (id)homePodHandoffContentForDevice:(id)a3 info:(id)a4;
- (id)riServerContentForDevice:(id)a3 backgroundAction:(BOOL)a4;
- (id)watchKeyboardContentForDevice:(id)a3;
- (void)_activate;
- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5;
- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5 isHomePodMini:(BOOL)a6;
- (void)_homePodEnsureStarted:(BOOL)a3 completion:(id)a4;
- (void)_homePodHandleResponse:(id)a3 completion:(id)a4;
- (void)_homePodHandoffPostIfNeeded:(id)a3 info:(id)a4;
- (void)_homePodHandoffRemove:(id)a3 reason:(int64_t)a4;
- (void)_homePodHandoffRemoveAll;
- (void)_homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4;
- (void)_invalidate;
- (void)_riServerEnsureStarted:(BOOL)a3 completion:(id)a4;
- (void)_riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4;
- (void)_riServerRemove:(id)a3;
- (void)_riServerRemoveAll;
- (void)_riServerUpdate:(id)a3 info:(id)a4;
- (void)_riServerUpdate:(id)a3 rtiData:(id)a4;
- (void)_tvAutoFillPostIfNeeded:(id)a3;
- (void)_tvAutoFillRemove:(id)a3;
- (void)_tvAutoFillRemoveAll;
- (void)_tvHandleResponse:(id)a3 completion:(id)a4;
- (void)_update;
- (void)_watchEnsureStarted:(BOOL)a3 completion:(id)a4;
- (void)_watchHandleResponse:(id)a3 completion:(id)a4;
- (void)_watchKeyboardPostIfNeeded:(id)a3;
- (void)_watchKeyboardRemove:(id)a3;
- (void)_watchKeyboardRemoveAll;
- (void)_watchKeyboardUpdate:(id)a3 info:(id)a4;
- (void)_watchKeyboardUpdate:(id)a3 rtiData:(id)a4;
- (void)activate;
- (void)homePodHandoffPostIfNeeded:(id)a3 info:(id)a4;
- (void)homePodHandoffRemove:(id)a3 reason:(int64_t)a4;
- (void)homePodHandoffRemoveAll;
- (void)homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4;
- (void)invalidate;
- (void)riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4;
- (void)riServerRemove:(id)a3;
- (void)riServerRemoveAll;
- (void)riServerUpdate:(id)a3 info:(id)a4;
- (void)riServerUpdate:(id)a3 rtiData:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)testAutoFillRemove;
- (void)testAutofillPost;
- (void)testHandoffPost;
- (void)testKeyboardPost;
- (void)testKeyboardPostAutoFill;
- (void)testKeyboardRemove;
- (void)testKeyboardUpdate;
- (void)testPost:(id)a3;
- (void)testPostBasic;
- (void)testWatchKeyboard;
- (void)testWatchKeyboardAutoFill;
- (void)tvAutoFillPostIfNeeded:(id)a3;
- (void)tvAutoFillRemove:(id)a3;
- (void)tvAutoFillRemoveAll;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)watchKeyboardPostIfNeeded:(id)a3;
- (void)watchKeyboardRemove:(id)a3;
- (void)watchKeyboardRemoveAll;
- (void)watchKeyboardUpdate:(id)a3 info:(id)a4;
- (void)watchKeyboardUpdate:(id)a3 rtiData:(id)a4;
@end

@implementation SDNotificationManager

+ (id)sharedManager
{
  if (qword_100657078 != -1) {
    dispatch_once(&qword_100657078, &stru_1005CE1B0);
  }
  return (id)qword_100657080;
}

- (SDNotificationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDNotificationManager;
  v2 = -[SDNotificationManager init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (NSString)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"-- SDNotificationManager --\n");
  if (self->_activated) {
    -[NSMutableString appendString:](v3, "appendString:", @"activated ");
  }
  if (self->_homePodNotifGranted) {
    -[NSMutableString appendString:](v3, "appendString:", @"HomePod granted ");
  }
  if (self->_tvNotifGranted) {
    -[NSMutableString appendString:](v3, "appendString:", @"TV granted ");
  }
  if (self->_watchNotifGranted) {
    -[NSMutableString appendString:](v3, "appendString:", @"Watch granted ");
  }
  if (self->_autoFillRequests)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"AutoFill requests:\n");
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_autoFillRequests, "allKeys"));
    id v5 = [v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v38;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(v4);
          }
          -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" - %@\n",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)i));
        }

        id v6 = [v4 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }

      while (v6);
    }
  }

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  if (self->_homePodRequests)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"HomePod requests:\n");
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_homePodRequests, "allKeys"));
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (j = 0LL; j != v11; j = (char *)j + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" - %@\n",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)j));
        }

        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }

      while (v11);
    }
  }

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  if (self->_tvKeyboardRequests)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"TVKeyboard requests:\n");
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_tvKeyboardRequests, "allKeys"));
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (k = 0LL; k != v16; k = (char *)k + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" - %@\n",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)k));
        }

        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
      }

      while (v16);
    }
  }

  -[NSMutableString appendString:](v3, "appendString:", @"\n");
  if (self->_watchKeyboardRequests)
  {
    -[NSMutableString appendString:](v3, "appendString:", @"WatchKeyboard requests:\n");
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_watchKeyboardRequests, "allKeys"));
    id v20 = [v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (m = 0LL; m != v21; m = (char *)m + 1)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" - %@\n",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)m));
        }

        id v21 = [v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
      }

      while (v21);
    }
  }

  return (NSString *)v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE534;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (!self->_activated)
  {
    if (dword_100643408 <= 30
      && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
    {
      LogPrintF(&dword_100643408, "-[SDNotificationManager _activate]", 30LL, "Activate\n");
    }

    self->_activated = 1;
    -[SDNotificationManager prefsChanged](self, "prefsChanged");
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000EE628;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
}

- (void)_update
{
  if (self->_activated)
  {
    -[SDNotificationManager _homePodEnsureStarted:completion:](self, "_homePodEnsureStarted:completion:", 0LL, 0LL);
    -[SDNotificationManager _riServerEnsureStarted:completion:](self, "_riServerEnsureStarted:completion:", 0LL, 0LL);
    -[SDNotificationManager _watchEnsureStarted:completion:](self, "_watchEnsureStarted:completion:", 0LL, 0LL);
  }

- (void)_riServerEnsureStarted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (self->_tvNotifCenter)
  {
LABEL_2:
    if (v6) {
      v6[2](v6);
    }
    goto LABEL_12;
  }

  if (a3)
  {
    CFPrefs_SetValue(@"com.apple.Sharing", @"riClientTriggered", kCFBooleanTrue);
  }

  else if (!CFPrefs_GetInt64(@"com.apple.Sharing", @"riClientTriggered", 0LL))
  {
    goto LABEL_2;
  }

  notify_post("com.apple.ContinuityKeyBoard.enabled");
  uint64_t v7 = (UNUserNotificationCenter *)[objc_alloc(off_100643478()) initWithBundleIdentifier:@"com.apple.Sharing.TVRemoteNotifications"];
  tvNotifCenter = self->_tvNotifCenter;
  self->_tvNotifCenter = v7;

  -[UNUserNotificationCenter setDelegate:](self->_tvNotifCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_tvNotifCenter,  "setWantsNotificationResponsesDelivered");
  v9 = self->_tvNotifCenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000EE87C;
  v10[3] = &unk_1005CE200;
  v10[4] = self;
  id v11 = v6;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v9,  "getNotificationSettingsWithCompletionHandler:",  v10);

LABEL_12:
}

- (void)_watchEnsureStarted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (self->_watchNotifCenter)
  {
LABEL_2:
    if (v6) {
      v6[2](v6);
    }
    goto LABEL_12;
  }

  if (a3)
  {
    CFPrefs_SetValue(@"com.apple.Sharing", @"watchKBTriggered", kCFBooleanTrue);
  }

  else if (!CFPrefs_GetInt64(@"com.apple.Sharing", @"watchKBTriggered", 0LL))
  {
    goto LABEL_2;
  }

  uint64_t v7 = (UNUserNotificationCenter *)[objc_alloc(off_100643478()) initWithBundleIdentifier:@"com.apple.Sharing.WatchRemoteNotifications"];
  watchNotifCenter = self->_watchNotifCenter;
  self->_watchNotifCenter = v7;

  -[UNUserNotificationCenter setDelegate:](self->_watchNotifCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_watchNotifCenter,  "setWantsNotificationResponsesDelivered");
  v9 = self->_watchNotifCenter;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000EEC3C;
  v10[3] = &unk_1005CE200;
  v10[4] = self;
  id v11 = v6;
  -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v9,  "getNotificationSettingsWithCompletionHandler:",  v10);

LABEL_12:
}

- (void)_homePodEnsureStarted:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if (a3)
  {
    CFPrefs_SetValue(@"com.apple.Sharing", @"hhNotifTriggered", kCFBooleanTrue);
LABEL_4:
    uint64_t v7 = dispatch_group_create();
    if (!self->_homePodNotifCenter)
    {
      if (dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodEnsureStarted:completion:]",  30LL,  "Starting HomePod\n");
      }

      v8 = (UNUserNotificationCenter *)[objc_alloc(off_100643478()) initWithBundleIdentifier:@"com.apple.Sharing.HomePodRemoteNotifications"];
      homePodNotifCenter = self->_homePodNotifCenter;
      self->_homePodNotifCenter = v8;

      -[UNUserNotificationCenter setDelegate:](self->_homePodNotifCenter, "setDelegate:", self);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_homePodNotifCenter,  "setWantsNotificationResponsesDelivered");
      dispatch_group_enter(v7);
      id v10 = self->_homePodNotifCenter;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000EF13C;
      v19[3] = &unk_1005CE250;
      v19[4] = self;
      id v20 = v7;
      -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v10,  "getNotificationSettingsWithCompletionHandler:",  v19);
    }

    if (!self->_homePodMiniNotificationCenter)
    {
      if (dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodEnsureStarted:completion:]",  30LL,  "Starting HomePod mini\n");
      }

      id v11 = (UNUserNotificationCenter *)[objc_alloc(off_100643478()) initWithBundleIdentifier:@"com.apple.Sharing.b7ce1794a1c8766816fc7b7500742862"];
      homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
      self->_homePodMiniNotificationCenter = v11;

      -[UNUserNotificationCenter setDelegate:](self->_homePodMiniNotificationCenter, "setDelegate:", self);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_homePodMiniNotificationCenter,  "setWantsNotificationResponsesDelivered");
      dispatch_group_enter(v7);
      v13 = self->_homePodMiniNotificationCenter;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000EF368;
      v17[3] = &unk_1005CE250;
      v17[4] = self;
      v18 = v7;
      -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:]( v13,  "getNotificationSettingsWithCompletionHandler:",  v17);
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000EF594;
    block[3] = &unk_1005CE278;
    id v16 = v6;
    dispatch_group_notify(v7, dispatchQueue, block);

    goto LABEL_19;
  }

  if (CFPrefs_GetInt64(@"com.apple.Sharing", @"hhNotifTriggered", 0LL)) {
    goto LABEL_4;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_19:
}

- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5
{
}

- (void)_addRequestWithID:(id)a3 content:(id)a4 type:(unsigned int)a5 isHomePodMini:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = -[objc_class requestWithIdentifier:content:trigger:]( off_100643480(),  "requestWithIdentifier:content:trigger:",  v10,  v11,  0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  unsigned int v14 = a5 - 2;
  switch(a5)
  {
    case 2u:
    case 3u:
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_homePodRequests,  "objectForKeyedSubscript:",  v10));

      if (v15
        && dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]",  30LL,  "Duplicate HomePod Handoff request\n");
      }

      homePodRequests = self->_homePodRequests;
      if (!homePodRequests)
      {
        id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v21 = self->_homePodRequests;
        self->_homePodRequests = v20;

        homePodRequests = self->_homePodRequests;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](homePodRequests, "setObject:forKeyedSubscript:", v13, v10);
      uint64_t v22 = self->_homePodNotifCenter;
      if (v6)
      {
        v23 = self->_homePodMiniNotificationCenter;

        uint64_t v22 = v23;
      }

      goto LABEL_41;
    case 4u:
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_autoFillRequests,  "objectForKeyedSubscript:",  v10));

      if (v16
        && dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]",  30LL,  "Duplicate TV autofill request\n");
      }

      autoFillRequests = self->_autoFillRequests;
      if (!autoFillRequests)
      {
        __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v26 = self->_autoFillRequests;
        self->_autoFillRequests = v25;

        autoFillRequests = self->_autoFillRequests;
      }

      goto LABEL_35;
    case 5u:
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tvKeyboardRequests,  "objectForKeyedSubscript:",  v10));

      if (v17
        && dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _addRequestWithID:content:type:isHomePodMini:]",  30LL,  "Duplicate TV needsKeyboard request\n");
      }

      autoFillRequests = self->_tvKeyboardRequests;
      if (!autoFillRequests)
      {
        __int128 v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        tvKeyboardRequests = self->_tvKeyboardRequests;
        self->_tvKeyboardRequests = v27;

        autoFillRequests = self->_tvKeyboardRequests;
      }

- (id)attachmentFromURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v5 = off_100643490();
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (v6)
    {
      id v7 = off_100643490();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      [v4 setObject:kUTTypePNG forKey:v8];
    }

    id v9 = off_100643498();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      id v12 = off_100643498();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      [v4 setObject:v11 forKey:v13];
    }

    Class v14 = off_1006434A0();
    id v15 = [v4 copy];
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class attachmentWithIdentifier:URL:options:error:]( v14,  "attachmentWithIdentifier:URL:options:error:",  &stru_1005E3958,  v3,  v15,  0LL));

    if (!v16
      && dword_100643408 <= 90
      && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 90LL)))
    {
      LogPrintF( &dword_100643408,  "-[SDNotificationManager attachmentFromURL:]",  90LL,  "### Failed to create attachment from URL %@\n",  v3);
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (void)_tvHandleResponse:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000F03A8;
  v33[3] = &unk_1005CE278;
  id v6 = a4;
  id v34 = v6;
  id v7 = objc_retainBlock(v33);
  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager _tvHandleResponse:completion:]",  30LL,  "Handle TV response: %@\n",  v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 notification]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  if (v10)
  {
    id v11 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    if (!v11)
    {
      if (dword_100643408 <= 90
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 90LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _tvHandleResponse:completion:]",  90LL,  "### No device ID?\n");
      }

      goto LABEL_50;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 actionIdentifier]);
    id v13 = off_1006434A8();
    Class v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v12;
    id v16 = v14;
    uint64_t v17 = v16;
    if (v15 == v16)
    {
      unsigned int v18 = 1;
    }

    else if ((v15 == 0LL) == (v16 != 0LL))
    {
      unsigned int v18 = 0;
    }

    else
    {
      unsigned int v18 = [v15 isEqual:v16];
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 actionIdentifier]);
    id v20 = off_1006434B0();
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v22 = v19;
    id v23 = v21;
    v24 = v23;
    if (v22 == v23)
    {
      unsigned int v25 = 1;
    }

    else if ((v22 == 0LL) == (v23 != 0LL))
    {
      unsigned int v25 = 0;
    }

    else
    {
      unsigned int v25 = [v22 isEqual:v23];
    }

    __int128 v26 = objc_alloc_init(&OBJC_CLASS___SFDevice);
    -[SFDevice setIdentifier:](v26, "setIdentifier:", v11);
    if (v25)
    {
      if (dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF(&dword_100643408, "-[SDNotificationManager _tvHandleResponse:completion:]", 30LL, "Handling dismiss");
      }

      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_autoFillRequests, "allKeys"));
      unsigned int v29 = [v28 containsObject:v10];

      if (v29)
      {
        -[SDNotificationManager tvAutoFillRemove:](self, "tvAutoFillRemove:", v26);
      }

      else
      {
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_tvKeyboardRequests, "allKeys"));
        unsigned int v31 = [v30 containsObject:v10];

        if (v31)
        {
          -[SDNotificationManager riServerRemove:](self, "riServerRemove:", v26);
        }

        else if (dword_100643408 <= 60 {
               && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 60LL)))
        }
        {
          LogPrintF( &dword_100643408,  "-[SDNotificationManager _tvHandleResponse:completion:]",  60LL,  "### Remove of unrecognized notification?\n");
        }
      }

      goto LABEL_49;
    }

    if (v18)
    {
      if (dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        LogPrintF(&dword_100643408, "-[SDNotificationManager _tvHandleResponse:completion:]", 30LL, "Handling default");
      }

      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDRemoteInteractionAgent sharedAgent](&OBJC_CLASS___SDRemoteInteractionAgent, "sharedAgent"));
      [v27 clientUserDidTapNotification:v11];
    }

    else
    {
      if (dword_100643408 > 90
        || dword_100643408 == -1 && !_LogCategory_Initialize(&dword_100643408, 90LL))
      {
        goto LABEL_49;
      }

      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v5 actionIdentifier]);
      LogPrintF( &dword_100643408,  "-[SDNotificationManager _tvHandleResponse:completion:]",  90LL,  "### Unrecognized action: %@\n",  v27);
    }

LABEL_49:
LABEL_50:

    goto LABEL_51;
  }

  if (dword_100643408 <= 90 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 90LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager _tvHandleResponse:completion:]",  90LL,  "### No notification ID?\n");
  }
LABEL_51:

  ((void (*)(void *))v7[2])(v7);
}

- (id)riServerContentForDevice:(id)a3 backgroundAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v8 = (void *)v7;
  id v9 = 0LL;
  id v10 = 0LL;
  id v11 = 0LL;
  id v12 = 0LL;
  if (v6 && v7)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);

    unsigned int v14 = [v5 deviceActionType];
    id v15 = @"REMOTE_BULLETIN_MESSAGE";
    if (v14 == 19)
    {
      id v15 = @"REMOTE_BULLETIN_MESSAGE_AUTOFILL";
      id v16 = @"REMOTE_BULLETIN_SUBTITLE_AUTOFILL";
    }

    else
    {
      id v16 = @"REMOTE_BULLETIN_SUBTITLE";
    }

    id v10 = v15;
    id v12 = v16;
    id v9 = objc_alloc_init(off_1006434B8());
    uint64_t v18 = SFLocalizedStringForKey(v10, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v9 setBody:v19];

    [v9 setCategoryIdentifier:@"continuityRemoteCategory"];
    [v9 setShouldHideTime:1];
    [v9 setShouldHideDate:1];
    [v9 setShouldIgnoreDoNotDisturb:1];
    id v20 = -[objc_class soundWithAlertType:](off_1006434C0(), "soundWithAlertType:", 23LL);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    [v9 setSound:v21];

    uint64_t v23 = SFLocalizedStringForKey(v12, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v9 setSubtitle:v24];

    v28[0] = @"deviceIdentifier";
    v28[1] = @"sessionID";
    v29[0] = v8;
    v29[1] = v11;
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL));
    [v9 setUserInfo:v25];

    if (v4) {
      [v9 setShouldBackgroundDefaultAction:1];
    }
    else {
      [v9 setShouldSuppressDefaultAction:1];
    }
  }

  id v26 = v9;

  return v26;
}

- (void)riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0698;
  block[3] = &unk_1005CBF80;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerPostIfNeeded:(id)a3 backgroundAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[SDNotificationManager riServerContentForDevice:backgroundAction:]( self,  "riServerContentForDevice:backgroundAction:",  v6,  v4));
    id v10 = (void *)v9;
    if (v9)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000F0780;
      v11[3] = &unk_1005CE2F0;
      BOOL v12 = v4;
      v11[4] = v8;
      v11[5] = self;
      v11[6] = v9;
      -[SDNotificationManager _riServerEnsureStarted:completion:](self, "_riServerEnsureStarted:completion:", 1LL, v11);
    }
  }
}

- (void)riServerRemove:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F08A0;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_riServerRemove:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tvKeyboardRequests,  "objectForKeyedSubscript:",  v5));

      if (v6)
      {
        if (dword_100643408 <= 30
          && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
        {
          LogPrintF(&dword_100643408, "-[SDNotificationManager _riServerRemove:]", 30LL, "TV KBRemove %@\n", v5);
        }

        tvNotifCenter = self->_tvNotifCenter;
        uint64_t v9 = v5;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( tvNotifCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v8);

        -[NSMutableDictionary removeObjectForKey:](self->_tvKeyboardRequests, "removeObjectForKey:", v5);
      }
    }
  }
}

- (void)riServerRemoveAll
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0A48;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerRemoveAll
{
}

- (void)riServerUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0B78;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerUpdate:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDNotificationManager riServerContentForDevice:backgroundAction:]( self,  "riServerContentForDevice:backgroundAction:",  v7,  0LL));
  id v9 = [v8 mutableCopy];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_tvNotifCenter && v10 && v11 && v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tvKeyboardRequests,  "objectForKeyedSubscript:",  v11));

    if (v12)
    {
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 prompt]);
      if (v14)
      {
        [v9 setBody:v14];
      }

      else
      {
        uint64_t v15 = SFLocalizedStringForKey(@"REMOTE_BULLETIN_MESSAGE_OPEN", v13);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v9 setBody:v16];
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      if (v18)
      {
        [v9 setSubtitle:v18];
      }

      else
      {
        uint64_t v19 = SFLocalizedStringForKey(@"REMOTE_BULLETIN_SUBTITLE", v17);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        [v9 setSubtitle:v20];
      }

      if (dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 prompt]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _riServerUpdate:info:]",  30LL,  "KBUpdate (legacy) %@, Prompt: '%@', Title: '%@'\n",  v11,  v21,  v22);
      }

      tvNotifCenter = self->_tvNotifCenter;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000F0E1C;
      v24[3] = &unk_1005CB3E8;
      v24[4] = v11;
      -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:]( tvNotifCenter,  "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:",  v11,  v9,  v24);
    }

    else if (dword_100643408 <= 60 {
           && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 60LL)))
    }
    {
      LogPrintF( &dword_100643408,  "-[SDNotificationManager _riServerUpdate:info:]",  60LL,  "### KBUpdate: request %@ not found\n",  v10);
    }
  }
}

- (void)riServerUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0FC8;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_riServerUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDNotificationManager riServerContentForDevice:backgroundAction:]( self,  "riServerContentForDevice:backgroundAction:",  v7,  0LL));
  id v9 = [v8 mutableCopy];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0LL;
  uint64_t v13 = 4294960591LL;
  if (v10 && v11)
  {
    if (v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tvKeyboardRequests,  "objectForKeyedSubscript:",  v11));

      if (v12)
      {
        uint64_t v14 = SFRTIDataPayloadForData(v6);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v12)
        {
          Class v15 = off_1006434C8();
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class payloadWithData:version:]( v15,  "payloadWithData:version:",  v16,  [v12 version]));

          if (v17)
          {
            if (dword_100643408 <= 30
              && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
            {
              LogPrintF( &dword_100643408,  "-[SDNotificationManager _riServerUpdate:rtiData:]",  30LL,  "Updating TV text from RTI data\n");
            }

            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 documentTraits]);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 prompt]);

            id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 documentTraits]);
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);

            if (v19)
            {
              [v9 setBody:v19];
              if (v21)
              {
LABEL_13:
                [v9 setSubtitle:v21];
                goto LABEL_16;
              }
            }

            else
            {
              uint64_t v24 = SFLocalizedStringForKey(@"REMOTE_BULLETIN_MESSAGE_OPEN", v22);
              unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
              [v9 setBody:v25];

              if (v21) {
                goto LABEL_13;
              }
            }

            uint64_t v26 = SFLocalizedStringForKey(@"REMOTE_BULLETIN_SUBTITLE", v23);
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            [v9 setSubtitle:v27];

LABEL_16:
            if (dword_100643408 <= 30
              && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
            {
              LogPrintF( &dword_100643408,  "-[SDNotificationManager _riServerUpdate:rtiData:]",  30LL,  "TV KBUpdate (RTI) %@, Prompt: '%@', Title: '%@'\n",  v11,  v19,  v21);
            }

            tvNotifCenter = self->_tvNotifCenter;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_1000F141C;
            v33[3] = &unk_1005CB3E8;
            void v33[4] = v11;
            -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:]( tvNotifCenter,  "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:",  v11,  v9,  v33);
LABEL_21:

            goto LABEL_22;
          }

          uint64_t v13 = 4294960563LL;
        }

        else
        {
          uint64_t v13 = 4294960554LL;
        }
      }

      else
      {
        uint64_t v13 = 4294960569LL;
      }
    }

    else
    {
      id v12 = 0LL;
      uint64_t v13 = 4294960559LL;
    }
  }

  if (dword_100643408 <= 60 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 60LL)))
  {
    uint64_t v29 = (int)v13;
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    __int128 v30 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v13, 0LL, 0LL));
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    uint64_t v17 = (void *)v31;
    __int128 v32 = @"?";
    if (v31) {
      __int128 v32 = (const __CFString *)v31;
    }
    id v35 = v32;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v29,  v19));
    LogPrintF( &dword_100643408,  "-[SDNotificationManager _riServerUpdate:rtiData:]",  60LL,  "### Error handling RTI data: %@\n",  v21);
    goto LABEL_21;
  }

- (NSSet)activeTVAutoFillPrompts
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_autoFillRequests, "allKeys"));
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (void *)v2;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  return (NSSet *)v5;
}

- (void)tvAutoFillPostIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F15F4;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_tvAutoFillPostIfNeeded:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000F16A0;
    v6[3] = &unk_1005CB480;
    v6[4] = v5;
    v6[5] = self;
    -[SDNotificationManager _riServerEnsureStarted:completion:](self, "_riServerEnsureStarted:completion:", 1LL, v6);
  }
}

- (void)tvAutoFillRemove:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F1934;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_tvAutoFillRemove:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_autoFillRequests,  "objectForKeyedSubscript:",  v5));

      if (v6)
      {
        if (dword_100643408 <= 30
          && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
        {
          LogPrintF(&dword_100643408, "-[SDNotificationManager _tvAutoFillRemove:]", 30LL, "AFRemove %@\n", v5);
        }

        tvNotifCenter = self->_tvNotifCenter;
        id v9 = v5;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( tvNotifCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v8);

        -[NSMutableDictionary removeObjectForKey:](self->_autoFillRequests, "removeObjectForKey:", v5);
      }
    }
  }
}

- (void)tvAutoFillRemoveAll
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F1ADC;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_tvAutoFillRemoveAll
{
  if (self->_tvNotifCenter)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100643408 <= 10
      && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 10LL)))
    {
      LogPrintF(&dword_100643408, "-[SDNotificationManager _tvAutoFillRemoveAll]", 10LL, "AFRemoveAll");
    }

    -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_tvNotifCenter, "removeAllDeliveredNotifications");
    -[NSMutableDictionary removeAllObjects](self->_autoFillRequests, "removeAllObjects");
  }

- (id)watchKeyboardContentForDevice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = (void *)v5;
  id v7 = 0LL;
  id v8 = 0LL;
  id v9 = 0LL;
  id v10 = 0LL;
  if (v4 && v5)
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);

    unsigned int v12 = [v3 deviceActionType];
    uint64_t v13 = @"WATCH_KEYBOARD_MESSAGE";
    if (v12 == 19)
    {
      uint64_t v13 = @"WATCH_KEYBOARD_MESSAGE_AUTOFILL";
      uint64_t v14 = @"WATCH_KEYBOARD_SUBTITLE_AUTOFILL";
    }

    else
    {
      uint64_t v14 = @"WATCH_KEYBOARD_SUBTITLE";
    }

    id v8 = v13;
    id v10 = v14;
    id v7 = objc_alloc_init(off_1006434B8());
    uint64_t v16 = SFLocalizedStringForKey(v8, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v7 setBody:v17];

    [v7 setCategoryIdentifier:@"continuityRemoteCategory"];
    [v7 setShouldHideTime:1];
    [v7 setShouldHideDate:1];
    [v7 setShouldSuppressDefaultAction:1];
    [v7 setShouldIgnoreDoNotDisturb:1];
    id v18 = -[objc_class soundWithAlertType:](off_1006434C0(), "soundWithAlertType:", 23LL);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v7 setSound:v19];

    uint64_t v21 = SFLocalizedStringForKey(v10, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v7 setSubtitle:v22];

    v29[0] = @"deviceIdentifier";
    v29[1] = @"sessionID";
    v30[0] = v6;
    v30[1] = v9;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    [v7 setUserInfo:v23];

    if (SFDeviceClassCodeGet(v24, v25) == 1)
    {
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationIcon iconForApplicationIdentifier:]( &OBJC_CLASS___UNNotificationIcon,  "iconForApplicationIdentifier:",  @"com.apple.Bridge"));
      [v7 setIcon:v26];
    }
  }

  id v27 = v7;

  return v27;
}

- (void)watchKeyboardPostIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F1E64;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_watchKeyboardPostIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SDNotificationManager watchKeyboardContentForDevice:](self, "watchKeyboardContentForDevice:", v4));
    id v8 = (void *)v7;
    if (v7)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000F1F34;
      v9[3] = &unk_1005CBC20;
      v9[4] = v6;
      v9[5] = self;
      v9[6] = v7;
      -[SDNotificationManager _watchEnsureStarted:completion:](self, "_watchEnsureStarted:completion:", 1LL, v9);
    }
  }
}

- (void)watchKeyboardRemove:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F2038;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_watchKeyboardRemove:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_watchKeyboardRequests,  "objectForKeyedSubscript:",  v5));

      if (v6)
      {
        if (dword_100643408 <= 30
          && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
        {
          LogPrintF(&dword_100643408, "-[SDNotificationManager _watchKeyboardRemove:]", 30LL, "Watch KBRemove %@\n", v5);
        }

        watchNotifCenter = self->_watchNotifCenter;
        id v9 = v5;
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
        -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( watchNotifCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v8);

        -[NSMutableDictionary removeObjectForKey:](self->_watchKeyboardRequests, "removeObjectForKey:", v5);
      }
    }
  }
}

- (void)watchKeyboardRemoveAll
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F21E0;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardRemoveAll
{
}

- (void)watchKeyboardUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2310;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardUpdate:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDNotificationManager riServerContentForDevice:backgroundAction:]( self,  "riServerContentForDevice:backgroundAction:",  v7,  0LL));
  id v9 = [v8 mutableCopy];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_watchNotifCenter && v10 && v11 && v9)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_watchKeyboardRequests,  "objectForKeyedSubscript:",  v11));

    if (v12)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 prompt]);
      if (v14)
      {
        [v9 setBody:v14];
      }

      else
      {
        uint64_t v15 = SFLocalizedStringForKey(@"WATCH_KEYBOARD_MESSAGE_OPEN", v13);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v9 setBody:v16];
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
      if (v18)
      {
        [v9 setSubtitle:v18];
      }

      else
      {
        uint64_t v19 = SFLocalizedStringForKey(@"WATCH_KEYBOARD_SUBTITLE", v17);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        [v9 setSubtitle:v20];
      }

      if (dword_100643408 <= 30
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 prompt]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _watchKeyboardUpdate:info:]",  30LL,  "Watch KBUpdate (legacy) %@, Prompt: '%@', Title: '%@'\n",  v11,  v21,  v22);
      }

      watchNotifCenter = self->_watchNotifCenter;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000F25B4;
      v24[3] = &unk_1005CB3E8;
      v24[4] = v11;
      -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:]( watchNotifCenter,  "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:",  v11,  v9,  v24);
    }

    else if (dword_100643408 <= 60 {
           && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 60LL)))
    }
    {
      LogPrintF( &dword_100643408,  "-[SDNotificationManager _watchKeyboardUpdate:info:]",  60LL,  "### KBUpdate: request %@ not found\n",  v10);
    }
  }
}

- (void)watchKeyboardUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F2760;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_watchKeyboardUpdate:(id)a3 rtiData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNotificationManager watchKeyboardContentForDevice:](self, "watchKeyboardContentForDevice:", v7));
  id v9 = [v8 mutableCopy];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0LL;
  uint64_t v13 = 4294960591LL;
  if (v10 && v11)
  {
    if (v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_watchKeyboardRequests,  "objectForKeyedSubscript:",  v11));

      if (v12)
      {
        uint64_t v14 = SFRTIDataPayloadForData(v6);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v12)
        {
          Class v15 = off_1006434C8();
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class payloadWithData:version:]( v15,  "payloadWithData:version:",  v16,  [v12 version]));

          if (v17)
          {
            if (dword_100643408 <= 30
              && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
            {
              LogPrintF( &dword_100643408,  "-[SDNotificationManager _watchKeyboardUpdate:rtiData:]",  30LL,  "Updating watch text from RTI data\n");
            }

            id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 documentTraits]);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 prompt]);

            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 documentTraits]);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 title]);

            if (v19)
            {
              [v9 setBody:v19];
              if (v21)
              {
LABEL_13:
                [v9 setSubtitle:v21];
                goto LABEL_16;
              }
            }

            else
            {
              uint64_t v24 = SFLocalizedStringForKey(@"WATCH_KEYBOARD_MESSAGE_OPEN", v22);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
              [v9 setBody:v25];

              if (v21) {
                goto LABEL_13;
              }
            }

            uint64_t v26 = SFLocalizedStringForKey(@"WATCH_KEYBOARD_SUBTITLE", v23);
            id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            [v9 setSubtitle:v27];

LABEL_16:
            if (dword_100643408 <= 30
              && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
            {
              LogPrintF( &dword_100643408,  "-[SDNotificationManager _watchKeyboardUpdate:rtiData:]",  30LL,  "Watch KBUpdate (RTI) %@, Prompt: '%@', Title: '%@'\n",  v11,  v19,  v21);
            }

            watchNotifCenter = self->_watchNotifCenter;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_1000F2BB0;
            v33[3] = &unk_1005CB3E8;
            void v33[4] = v11;
            -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:]( watchNotifCenter,  "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:",  v11,  v9,  v33);
LABEL_21:

            goto LABEL_22;
          }

          uint64_t v13 = 4294960563LL;
        }

        else
        {
          uint64_t v13 = 4294960554LL;
        }
      }

      else
      {
        uint64_t v13 = 4294960569LL;
      }
    }

    else
    {
      id v12 = 0LL;
      uint64_t v13 = 4294960559LL;
    }
  }

  if (dword_100643408 <= 60 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 60LL)))
  {
    uint64_t v29 = (int)v13;
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    __int128 v30 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(v13, 0LL, 0LL));
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    uint64_t v17 = (void *)v31;
    __int128 v32 = @"?";
    if (v31) {
      __int128 v32 = (const __CFString *)v31;
    }
    id v35 = v32;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v29,  v19));
    LogPrintF( &dword_100643408,  "-[SDNotificationManager _watchKeyboardUpdate:rtiData:]",  60LL,  "### Error handling RTI data: %@\n",  v21);
    goto LABEL_21;
  }

- (void)_watchHandleResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v5 = (void (**)(void))a4;
  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager _watchHandleResponse:completion:]",  30LL,  "Handle Watch response: %@\n",  v6);
  }
  if (v5) {
    v5[2](v5);
  }
}

- (id)homePodHandoffContentForDevice:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 notificationType];
  if (v8 == 2)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 body]);
    Class v15 = v13;
    if (v13)
    {
      id v16 = v13;
    }

    else
    {
      uint64_t v22 = SFLocalizedStringForKey(@"HOMEPOD_HANDOFF_MESSAGE_MEDIA_GENERIC", v14);
      id v16 = (id)objc_claimAutoreleasedReturnValue(v22);
    }

    id v18 = v16;

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    if (!v20)
    {
      uint64_t v21 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFER";
      goto LABEL_17;
    }

- (void)homePodHandoffPostIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3214;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffPostIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[SDNotificationManager homePodHandoffContentForDevice:info:]( self,  "homePodHandoffContentForDevice:info:",  v6,  v7));
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000F32F4;
    v9[3] = &unk_1005CC3F0;
    id v10 = v7;
    id v11 = v6;
    id v12 = self;
    id v13 = v8;
    -[SDNotificationManager _homePodEnsureStarted:completion:](self, "_homePodEnsureStarted:completion:", 1LL, v9);
  }
}

- (void)homePodHandoffRemove:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3440;
  block[3] = &unk_1005CBF30;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffRemove:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_homePodRequests, "objectForKeyedSubscript:", v6));

  if (v7)
  {
    if (dword_100643408 <= 30
      && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
    {
      else {
        id v8 = *(&off_1005CE378 + a4 - 1);
      }
      LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodHandoffRemove:reason:]",  30LL,  "HHRemove %@, %@\n",  v6,  v8);
    }

    homePodNotifCenter = self->_homePodNotifCenter;
    id v21 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( homePodNotifCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v10);

    int64_t v11 = self->_homePodNotifCenter;
    id v20 = v6;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:]( v11,  "removePendingNotificationRequestsWithIdentifiers:",  v12);

    homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
    id v19 = v6;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( homePodMiniNotificationCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v14);

    Class v15 = self->_homePodMiniNotificationCenter;
    id v18 = v6;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:]( v15,  "removePendingNotificationRequestsWithIdentifiers:",  v16);

    -[NSMutableDictionary removeObjectForKey:](self->_homePodRequests, "removeObjectForKey:", v6);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDProxHandoffAgent sharedAgent](&OBJC_CLASS___SDProxHandoffAgent, "sharedAgent"));
    [v17 notificationDidDismiss:v6 reason:a4];
  }
}

- (void)homePodHandoffRemoveAll
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F36A8;
  block[3] = &unk_1005CB2F8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffRemoveAll
{
  if (self->_homePodNotifCenter)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100643408 <= 10
      && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 10LL)))
    {
      LogPrintF(&dword_100643408, "-[SDNotificationManager _homePodHandoffRemoveAll]", 10LL, "HHRemoveAll");
    }

    -[UNUserNotificationCenter removeAllDeliveredNotifications]( self->_homePodNotifCenter,  "removeAllDeliveredNotifications");
    -[UNUserNotificationCenter removeAllDeliveredNotifications]( self->_homePodMiniNotificationCenter,  "removeAllDeliveredNotifications");
    -[NSMutableDictionary removeAllObjects](self->_homePodRequests, "removeAllObjects");
  }

- (void)homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F37F4;
  block[3] = &unk_1005CBC20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_homePodHandoffUpdateIfNeeded:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  homePodRequests = self->_homePodRequests;
  if (homePodRequests)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](homePodRequests, "objectForKeyedSubscript:", v6));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SDNotificationManager homePodHandoffContentForDevice:info:]( self,  "homePodHandoffContentForDevice:info:",  v6,  v7));
      if (v10)
      {
        int64_t v11 = self->_homePodNotifCenter;
        if ([v7 homePodType] == (id)2)
        {
          id v12 = self->_homePodMiniNotificationCenter;

          int64_t v11 = v12;
        }

        if (dword_100643408 <= 30
          && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL)))
        {
          LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodHandoffUpdateIfNeeded:info:]",  30LL,  "HHUpdate %@, %@\n",  v6,  v10);
        }

        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000F3A38;
        v13[3] = &unk_1005CB410;
        id v14 = v6;
        id v15 = v7;
        id v16 = self;
        -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:]( v11,  "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:",  v14,  v10,  v13);
      }

      else if (dword_100643408 <= 90 {
             && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 90LL)))
      }
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodHandoffUpdateIfNeeded:info:]",  90LL,  "### Failed to created content from info: %@\n",  v7);
      }
    }

    else if (dword_100643408 <= 90 {
           && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 90LL)))
    }
    {
      LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodHandoffUpdateIfNeeded:info:]",  90LL,  "### Cannot update unrecognized ID: %@\n",  v6);
    }
  }
}

- (void)_homePodHandleResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000F4040;
  v36[3] = &unk_1005CE278;
  id v7 = a4;
  id v37 = v7;
  id v8 = objc_retainBlock(v36);
  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodHandleResponse:completion:]",  30LL,  "Handle HomePod response: %@\n",  v6);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 request]);
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  if (v11)
  {
    id v35 = self;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 actionIdentifier]);
    if (!v12)
    {
      if (dword_100643408 <= 90
        && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 90LL)))
      {
        LogPrintF( &dword_100643408,  "-[SDNotificationManager _homePodHandleResponse:completion:]",  90LL,  "### No action identifier for notification response? %@",  v6);
      }

      goto LABEL_49;
    }

    id v13 = off_1006434A8();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v12;
    id v16 = v14;
    uint64_t v17 = v16;
    if (v15 == v16)
    {
      unsigned __int8 v18 = 1;
    }

    else if (v16)
    {
      unsigned __int8 v18 = [v15 isEqual:v16];
    }

    else
    {
      unsigned __int8 v18 = 0;
    }

    id v19 = off_1006434B0();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    id v21 = v15;
    id v22 = v20;
    id v23 = v22;
    if (v21 == v22)
    {
      unsigned __int8 v24 = 1;
    }

    else
    {
      if (!v22)
      {

        if ((v18 & 1) != 0)
        {
LABEL_26:
          LOBYTE(v25) = 1;
          goto LABEL_36;
        }

        unsigned __int8 v24 = 0;
LABEL_30:
        uint64_t v26 = (__CFString *)v21;
        uint64_t v27 = v26;
        if (v26 == @"TRANSFER") {
          unsigned int v25 = 1;
        }
        else {
          unsigned int v25 = -[__CFString isEqual:](v26, "isEqual:", @"TRANSFER");
        }

        if ((v24 & 1) != 0)
        {
          if (v25)
          {
LABEL_42:
            id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDProxHandoffAgent sharedAgent](&OBJC_CLASS___SDProxHandoffAgent, "sharedAgent"));
            [v34 userDidTapNotification:v11];

LABEL_49:
            goto LABEL_50;
          }

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  homePodNotifCenter = self->_homePodNotifCenter;
  id v12 = (UNUserNotificationCenter *)v8;
  id v13 = homePodNotifCenter;
  if (v13 == v12) {
    goto LABEL_10;
  }
  id v14 = v13;
  if ((v12 == 0LL) != (v13 != 0LL))
  {
    unsigned __int8 v15 = -[UNUserNotificationCenter isEqual:](v12, "isEqual:", v13);

    if ((v15 & 1) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
  }

  homePodMiniNotificationCenter = self->_homePodMiniNotificationCenter;
  uint64_t v17 = v12;
  unsigned __int8 v18 = homePodMiniNotificationCenter;
  if (v18 == v17)
  {
LABEL_10:

    goto LABEL_11;
  }

  id v19 = v18;
  if ((v12 == 0LL) == (v18 != 0LL))
  {

    goto LABEL_14;
  }

  unsigned __int8 v20 = -[UNUserNotificationCenter isEqual:](v17, "isEqual:", v18);

  if ((v20 & 1) != 0)
  {
LABEL_11:
    id v21 = _os_activity_create( (void *)&_mh_execute_header,  "Sharing/SDNotificationManager/didReceiveNotificationResponse/homepod",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0LL;
    state.opaque[1] = 0LL;
    os_activity_scope_enter(v21, &state);
    -[SDNotificationManager _homePodHandleResponse:completion:](self, "_homePodHandleResponse:completion:", v9, v10);
    os_activity_scope_leave(&state);

    goto LABEL_12;
  }

- (void)testPost:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_100643408 <= 30)
  {
    if (dword_100643408 != -1 || (v5 = _LogCategory_Initialize(&dword_100643408, 30LL), id v4 = v6, v5))
    {
      LogPrintF(&dword_100643408, "-[SDNotificationManager testPost:]", 30LL, "Test post\n");
      id v4 = v6;
    }
  }

  if (!self->_activated)
  {
    -[SDNotificationManager _activate](self, "_activate");
    id v4 = v6;
  }

  if ([v4 isEqual:@"-af"])
  {
    -[SDNotificationManager testAutofillPost](self, "testAutofillPost");
  }

  else if ([v6 isEqual:@"-afr"])
  {
    -[SDNotificationManager testAutoFillRemove](self, "testAutoFillRemove");
  }

  else if ([v6 isEqual:@"-ho"])
  {
    -[SDNotificationManager testHandoffPost](self, "testHandoffPost");
  }

  else if ([v6 isEqual:@"-kb"])
  {
    -[SDNotificationManager testKeyboardPost](self, "testKeyboardPost");
  }

  else if ([v6 isEqual:@"-kba"])
  {
    -[SDNotificationManager testKeyboardPostAutoFill](self, "testKeyboardPostAutoFill");
  }

  else if ([v6 isEqual:@"-kbr"])
  {
    -[SDNotificationManager testKeyboardRemove](self, "testKeyboardRemove");
  }

  else if ([v6 isEqual:@"-kbu"])
  {
    -[SDNotificationManager testKeyboardUpdate](self, "testKeyboardUpdate");
  }

  else if ([v6 isEqual:@"-wkb"])
  {
    -[SDNotificationManager testWatchKeyboard](self, "testWatchKeyboard");
  }

  else if ([v6 isEqual:@"-waf"])
  {
    -[SDNotificationManager testWatchKeyboardAutoFill](self, "testWatchKeyboardAutoFill");
  }

  else
  {
    -[SDNotificationManager testPostBasic](self, "testPostBasic");
  }
}

- (void)testPostBasic
{
  id v5 = objc_alloc_init(off_1006434B8());
  [v5 setBody:@"This is a test user notification"];
  [v5 setCategoryIdentifier:@"continuityRemoteCategory"];
  [v5 setSubtitle:@"Example Subtitle"];
  [v5 setTitle:@"Notification Title"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUIDString]);
  -[SDNotificationManager _addRequestWithID:content:type:](self, "_addRequestWithID:content:type:", v4, v5, 5LL);
}

- (void)testAutofillPost
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SDNotificationManager tvAutoFillPostIfNeeded:](self, "tvAutoFillPostIfNeeded:", v4);
}

- (void)testAutoFillRemove
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SDNotificationManager tvAutoFillRemove:](self, "tvAutoFillRemove:", v4);
}

- (void)testHandoffPost
{
  unsigned int v4 = SFDeviceClassCodeGet(self, a2) - 1;
  if (v4 > 2) {
    id v5 = @"HOMEPOD_HANDOFF_MESSAGE_CALL_PEER";
  }
  else {
    id v5 = *(&off_1005CE398 + (char)v4);
  }
  uint64_t v6 = SFLocalizedStringForKey(v5, v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"John Appleseed"));
  id v8 = objc_alloc_init(&OBJC_CLASS___SFNotificationInfo);
  -[SFNotificationInfo setNotificationType:](v8, "setNotificationType:", 3LL);
  -[SFNotificationInfo setBody:](v8, "setBody:", v7);
  uint64_t v9 = SFHomePodDisplayNameForDeviceName(@"Kitchen");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[SFNotificationInfo setHeader:](v8, "setHeader:", v10);

  uint64_t v12 = SFLocalizedStringForKey(@"HOMEPOD_HANDOFF_SUBTITLE_TALK_HOMEPOD", v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[SFNotificationInfo setTitle:](v8, "setTitle:", v13);

  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager testHandoffPost]",  30LL,  "Test: Posting Handoff notification\n");
  }
  -[SDNotificationManager homePodHandoffPostIfNeeded:info:]( self,  "homePodHandoffPostIfNeeded:info:",  @"00000000-0000-0000-0000-000000000000",  v8);
}

- (void)testKeyboardPost
{
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self,  "riServerPostIfNeeded:backgroundAction:",  v4,  0LL);
}

- (void)testKeyboardPostAutoFill
{
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SFDevice setDeviceActionType:](v4, "setDeviceActionType:", 19LL);
  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager testKeyboardPostAutoFill]",  30LL,  "Test: Posting KB notification with AutoFill\n");
  }
  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self,  "riServerPostIfNeeded:backgroundAction:",  v4,  0LL);
}

- (void)testKeyboardRemove
{
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SDNotificationManager riServerRemove:](self, "riServerRemove:", v4);
}

- (void)testKeyboardUpdate
{
  id v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___SFRemoteTextSessionInfo);
  [v4 setPrompt:@"Updated prompt"];
  [v4 setTitle:@"Updated Title"];
  -[SDNotificationManager riServerUpdate:info:](self, "riServerUpdate:info:", v5, v4);
}

- (void)testWatchKeyboard
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager testWatchKeyboard]",  30LL,  "Test: Posting WatchKB notification\n");
  }
  -[SDNotificationManager watchKeyboardPostIfNeeded:](self, "watchKeyboardPostIfNeeded:", v4);
}

- (void)testWatchKeyboardAutoFill
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  uint64_t v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SFDevice setDeviceActionType:](v4, "setDeviceActionType:", 19LL);
  if (dword_100643408 <= 30 && (dword_100643408 != -1 || _LogCategory_Initialize(&dword_100643408, 30LL))) {
    LogPrintF( &dword_100643408,  "-[SDNotificationManager testWatchKeyboardAutoFill]",  30LL,  "Test: Posting KB notification with AutoFill\n");
  }
  -[SDNotificationManager watchKeyboardPostIfNeeded:](self, "watchKeyboardPostIfNeeded:", v4);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end