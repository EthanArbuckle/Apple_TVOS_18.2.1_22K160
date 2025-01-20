@interface GKBadgeController
+ (id)sharedController;
- (BOOL)isBadgingEnabledForBundleID:(id)a3;
- (GKBadgeController)init;
- (id)_badgeCountURL;
- (id)_dictionaryForBadgeType:(unint64_t)a3;
- (id)_plistKeyForBadgeType:(unint64_t)a3;
- (unint64_t)_badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4;
- (unint64_t)_totalBadgeCountForBundleID:(id)a3;
- (unint64_t)badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4;
- (void)badgeAllApplications;
- (void)badgeApplicationWithBundleID:(id)a3 badgeCount:(unint64_t)a4;
- (void)badgeBundleID:(id)a3 badgeCount:(unint64_t)a4;
- (void)registerBadgePermissionForBundleID:(id)a3 completionHandler:(id)a4;
- (void)setBadgeCount:(unint64_t)a3 forBundleID:(id)a4 badgeType:(unint64_t)a5;
- (void)synchronize;
- (void)unbadgeAllApplications;
@end

@implementation GKBadgeController

+ (id)sharedController
{
  if (qword_1002BB598 != -1) {
    dispatch_once(&qword_1002BB598, &stru_100270E50);
  }
  return (id)qword_1002BB590;
}

- (id)_badgeCountURL
{
  uint64_t v2 = GKInsecureCacheRoot(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:GKGameCenterIdentifier]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathExtension:@"badgeCounts"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  return v6;
}

- (GKBadgeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GKBadgeController;
  uint64_t v2 = -[GKBadgeController init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.badgecontroller.syncqueue", 0LL);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    -[GKBadgeController synchronize](v2, "synchronize");
  }

  return v2;
}

- (id)_plistKeyForBadgeType:(unint64_t)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a3);
}

- (void)synchronize
{
  if (self->_dirty)
  {
    uint64_t v3 = ++qword_1002BB5A0;
    dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
    syncQueue = (dispatch_queue_s *)self->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000BB0B8;
    block[3] = &unk_100270E78;
    block[4] = self;
    block[5] = v3;
    dispatch_after(v4, syncQueue, block);
  }

  else
  {
    objc_super v6 = (dispatch_queue_s *)self->_syncQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000BB284;
    v7[3] = &unk_10026B670;
    v7[4] = self;
    dispatch_async(v6, v7);
  }

- (BOOL)isBadgingEnabledForBundleID:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  if ([v4 notificationBadgesEnabled])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](&OBJC_CLASS___NSBundle, "_gkBundleWithIdentifier:", v3));
    unsigned __int8 v6 = [v5 _gkIsBadgingEnabled];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)badgeApplicationWithBundleID:(id)a3 badgeCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers(v6);
  }
  v9 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "GKBadgeController: badgeApplicationWithBundleID",  buf,  2u);
  }

  if (-[GKBadgeController isBadgingEnabledForBundleID:](self, "isBadgingEnabledForBundleID:", v7))
  {
    -[GKBadgeController badgeBundleID:badgeCount:](self, "badgeBundleID:badgeCount:", v7, a4);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _gkBundleWithIdentifier:](&OBJC_CLASS___NSBundle, "_gkBundleWithIdentifier:", v7));
    unsigned int v11 = [v10 _gkIsBadgingEnabled];

    if (v11)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000BB690;
      v17[3] = &unk_100270EA0;
      v17[4] = self;
      id v18 = v7;
      unint64_t v19 = a4;
      -[GKBadgeController registerBadgePermissionForBundleID:completionHandler:]( self,  "registerBadgePermissionForBundleID:completionHandler:",  v18,  v17);
    }
  }

  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BB740;
  block[3] = &unk_10026BDB0;
  id v15 = v7;
  v16 = self;
  id v13 = v7;
  dispatch_async(syncQueue, block);
}

- (void)badgeBundleID:(id)a3 badgeCount:(unint64_t)a4
{
  id v6 = (__CFString *)a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  unsigned int v8 = [v7 notificationBadgesEnabled];

  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers(v9);
    }
    unsigned int v11 = (os_log_s *)os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "GKBadgeController: badgeApplicationWithBundleID - Badging enabled",  buf,  2u);
    }

    bzero(buf, 0x400uLL);
    if (-[GKBadgeController isBadgingEnabledForBundleID:](self, "isBadgingEnabledForBundleID:", v6))
    {
      uint64_t CString = CFStringGetCString(v6, (char *)buf, 1024LL, 0x8000100u);
      if ((_DWORD)CString)
      {
        if (!os_log_GKGeneral) {
          id v13 = (id)GKOSLoggers(CString);
        }
        v14 = (void *)os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          id v15 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  a4));
          int v19 = 138412546;
          v20 = v6;
          __int16 v21 = 2112;
          v22 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Setting badge count for bundleID: %@ count: %@",  (uint8_t *)&v19,  0x16u);
        }

        id v17 = [[UISApplicationState alloc] initWithBundleIdentifier:v6];
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
        [v17 setBadgeValue:v18];
      }
    }
  }
}

- (id)_dictionaryForBadgeType:(unint64_t)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  v7 = v6;
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (v6 != syncQueue)
  {
    label = dispatch_queue_get_label(v6);
    id v10 = dispatch_queue_get_label(syncQueue);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKBadgeController _dictionaryForBadgeType:]",  label,  v10,  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]",  v12,  "-[GKBadgeController _dictionaryForBadgeType:]",  [v14 UTF8String],  207));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  return self->_badgeDictionaries[a3];
}

- (unint64_t)_badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4
{
  id v6 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  uint64_t v9 = v8;
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (v8 != syncQueue)
  {
    label = dispatch_queue_get_label(v8);
    v12 = dispatch_queue_get_label(syncQueue);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKBadgeController _badgeCountForBundleID:badgeType:]",  label,  v12,  v13));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    id v16 = objc_claimAutoreleasedReturnValue([v15 lastPathComponent]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]",  v14,  "-[GKBadgeController _badgeCountForBundleID:badgeType:]",  [v16 UTF8String],  213));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v17);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBadgeController _dictionaryForBadgeType:](self, "_dictionaryForBadgeType:", a4));
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v6]);
  id v20 = [v19 unsignedIntegerValue];

  return (unint64_t)v20;
}

- (unint64_t)badgeCountForBundleID:(id)a3 badgeType:(unint64_t)a4
{
  id v6 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unsigned int v8 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(current_queue);
  syncQueue = self->_syncQueue;

  if (v8 == syncQueue)
  {
    label = dispatch_queue_get_label((dispatch_queue_t)self->_syncQueue);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the same queue(%s), would deadlock at %@",  "-[GKBadgeController badgeCountForBundleID:badgeType:]",  label,  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (dispatch_get_current_queue() != _syncQueue)\n[%s (%s:%d)]",  v12,  "-[GKBadgeController badgeCountForBundleID:badgeType:]",  [v14 UTF8String],  219));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  if (!v6) {
    id v6 = GKGameCenterIdentifier;
  }
  id v16 = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BBEC4;
  block[3] = &unk_100270EC8;
  void block[4] = self;
  id v21 = v6;
  v22 = &v24;
  unint64_t v23 = a4;
  id v17 = v6;
  dispatch_sync(v16, block);
  unint64_t v18 = v25[3];

  _Block_object_dispose(&v24, 8);
  return v18;
}

- (unint64_t)_totalBadgeCountForBundleID:(id)a3
{
  id v4 = a3;
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(current_queue);
  v7 = v6;
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  if (v6 != syncQueue)
  {
    label = dispatch_queue_get_label(v6);
    id v10 = dispatch_queue_get_label(syncQueue);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s invoked on the wrong queue (got:%s expected:%s) at %@",  "-[GKBadgeController _totalBadgeCountForBundleID:]",  label,  v10,  v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBadgeController.m"));
    id v14 = objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]",  v12,  "-[GKBadgeController _totalBadgeCountForBundleID:]",  [v14 UTF8String],  232));

    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"GameKit Exception",  @"%@",  v15);
  }

  uint64_t v16 = 0LL;
  unint64_t v17 = 0LL;
  badgeDictionaries = self->_badgeDictionaries;
  do
  {
    int v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( badgeDictionaries[v16],  "objectForKeyedSubscript:",  v4));
    v17 += (unint64_t)[v19 unsignedIntegerValue];

    ++v16;
  }

  while (v16 != 4);

  return v17;
}

- (void)setBadgeCount:(unint64_t)a3 forBundleID:(id)a4 badgeType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = v8;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers(v8);
  }
  unsigned int v11 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKBadgeController: setBadgeCount", buf, 2u);
  }

  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared")),
        id v13 = [v12 multiplayerAllowedPlayerType],
        v12,
        !v13))
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers(v14);
    }
    unint64_t v17 = (os_log_s *)os_log_GKTrace;
    BOOL v18 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "setBadgeCount: Ignoring TB and sessions badge count, multiplayer is restricted",  buf,  2u);
    }

    if (!os_log_GKGeneral) {
      id v19 = (id)GKOSLoggers(v18);
    }
    id v20 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "ignoring turn-based and sessions badge count update for %@ as multiplayer is restricted",  buf,  0xCu);
    }
  }

  else
  {
    if (!v9) {
      id v9 = GKGameCenterIdentifier;
    }
    syncQueue = (dispatch_queue_s *)self->_syncQueue;
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    unint64_t v23 = sub_1000BC2C4;
    uint64_t v24 = &unk_100270EF0;
    v25 = self;
    unint64_t v27 = a5;
    id v9 = v9;
    id v26 = v9;
    unint64_t v28 = a3;
    dispatch_async(syncQueue, &v21);
    -[GKBadgeController synchronize](self, "synchronize", v21, v22, v23, v24, v25);
  }
}

- (void)badgeAllApplications
{
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BC3B0;
  block[3] = &unk_10026B670;
  void block[4] = self;
  dispatch_async(syncQueue, block);
}

- (void)unbadgeAllApplications
{
  syncQueue = (dispatch_queue_s *)self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BC5F4;
  block[3] = &unk_10026B670;
  void block[4] = self;
  dispatch_async(syncQueue, block);
  -[GKBadgeController synchronize](self, "synchronize");
}

- (void)registerBadgePermissionForBundleID:(id)a3 completionHandler:(id)a4
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
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "GKBadgeController: registerBadgePermissionForBundleID:",  buf,  2u);
  }

  if (v6 && ([v6 isEqualToString:GKGameCenterIdentifier] & 1) == 0)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](&OBJC_CLASS___GKApplicationWorkspace, "defaultWorkspace"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationProxyForBundleID:v6]);
    if ([v12 isInstalled] && (objc_msgSend(v12, "isRestricted") & 1) == 0)
    {
      syncQueue = (dispatch_queue_s *)self->_syncQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000BC8F8;
      block[3] = &unk_10026B148;
      void block[4] = self;
      id v15 = v6;
      id v16 = v8;
      dispatch_async(syncQueue, block);
    }
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = 4LL;
  do
    objc_storeStrong((id *)&(&self->super.isa)[v3--], 0LL);
  while (v3 * 8);
}

@end