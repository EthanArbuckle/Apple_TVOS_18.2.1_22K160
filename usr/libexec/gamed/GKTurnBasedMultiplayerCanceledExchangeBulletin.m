@interface GKTurnBasedMultiplayerCanceledExchangeBulletin
+ (BOOL)shouldLoadCacheData;
- (id)aggregateDictionaryKey;
- (void)loadBulletinMessageWithHandler:(id)a3;
- (void)loadDataWithHandler:(id)a3;
@end

@implementation GKTurnBasedMultiplayerCanceledExchangeBulletin

+ (BOOL)shouldLoadCacheData
{
  return 0;
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedExchangeCanceled;
}

- (void)loadDataWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerCanceledExchangeBulletin loadDataWithHandler:",  buf,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKTurnBasedMultiplayerBulletin.m",  944LL,  "-[GKTurnBasedMultiplayerCanceledExchangeBulletin loadDataWithHandler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](&OBJC_CLASS___GKClientProxy, "gameCenterClient"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100114DA0;
  v21[3] = &unk_10026B170;
  v21[4] = self;
  id v11 = v9;
  id v22 = v11;
  [v11 perform:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100114EFC;
  v19[3] = &unk_10026B170;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  [v12 perform:v19];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100115024;
  v16[3] = &unk_10026B030;
  id v17 = v12;
  id v18 = v5;
  id v14 = v12;
  id v15 = v5;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)loadBulletinMessageWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral) {
    id v6 = (id)GKOSLoggers(v4);
  }
  v7 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "GKTurnBasedMultiplayerCanceledExchangeBulletin loadBulletinMessageWithHandler:",  buf,  2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001151D0;
  v12[3] = &unk_10026B170;
  v12[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  @"loadBulletinMessageWithHandler"));
  id v13 = v8;
  [v8 perform:v12];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100115674;
    v9[3] = &unk_10026B030;
    id v11 = v5;
    id v10 = v8;
    [v10 notifyOnMainQueueWithBlock:v9];
  }
}

@end