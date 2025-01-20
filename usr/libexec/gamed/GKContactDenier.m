@interface GKContactDenier
- (id)deniedContactIdentifiers;
- (id)denyListLocation:(id)a3;
- (id)friendSuggestionsDenyListLocation;
- (void)clearFriendSuggestionsDenyList;
- (void)denyContact:(id)a3 replyQueue:(id)a4 handler:(id)a5;
@end

@implementation GKContactDenier

- (void)denyContact:(id)a3 replyQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = (dispatch_queue_s *)a4;
  id v10 = a5;
  v11 = (void (**)(void, void))v10;
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers(v10);
  }
  v13 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[GKContactDenier denyContact:replyQueue:handler:]";
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Attempting to deny contact: %@", buf, 0x16u);
  }

  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B5160;
    block[3] = &unk_10026B148;
    id v16 = (id)objc_claimAutoreleasedReturnValue(-[GKContactDenier friendSuggestionsDenyListLocation](self, "friendSuggestionsDenyListLocation"));
    id v17 = v8;
    v18 = v11;
    id v14 = v16;
    dispatch_async(v9, block);
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"gamed",  17LL,  0LL));
    ((void (**)(void, id))v11)[2](v11, v14);
  }
}

- (id)denyListLocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = GKInsecureCacheRoot(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v3]);

  uint64_t v8 = GKInsecureCacheRoot(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (id)gkEnsureDirectory(v9);

  return v6;
}

- (void)clearFriendSuggestionsDenyList
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B52A0;
  block[3] = &unk_10026B670;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)deniedContactIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactDenier friendSuggestionsDenyListLocation](self, "friendSuggestionsDenyListLocation"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v2));

  id v10 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v3,  &v10));
  id v5 = v10;
  v6 = v5;
  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers(v5);
    }
    uint64_t v8 = (os_log_s *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1000B53D8((uint64_t)v6, v8);
    }
  }

  return v4;
}

- (id)friendSuggestionsDenyListLocation
{
  return -[GKContactDenier denyListLocation:](self, "denyListLocation:", @"friendSuggestionsDenyList.plist");
}

@end