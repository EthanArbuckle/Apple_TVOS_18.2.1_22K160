@interface GKFriendServicePrivate
+ (Class)interfaceClass;
+ (id)messageInboxLocation;
+ (os_unfair_lock_s)messageInboxEntriesLock;
+ (unint64_t)requiredEntitlements;
- (void)_invalidateCacheForFriendCode:(id)a3 handler:(id)a4;
- (void)acceptFriendInvitationWithPlayerID:(id)a3 completion:(id)a4;
- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5;
- (void)cancelFriendInvitationWithPlayerID:(id)a3 completion:(id)a4;
- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)clearActivityFeedCacheWithHandler:(id)a3;
- (void)didAccept:(BOOL)a3 friendRequest:(id)a4 handler:(id)a5;
- (void)expireFriendList;
- (void)getActiveFriendRequests:(id)a3;
- (void)getChallengableFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 completion:(id)a5;
- (void)getCombinedFriendInvitationListWithCompletion:(id)a3;
- (void)getCommonFriendsForPlayer:(id)a3 handler:(id)a4;
- (void)getConcernsForPlayer:(id)a3 handler:(id)a4;
- (void)getFakeActiveFriendRequests:(id)a3;
- (void)getFriendCodeDetailWithIdentifiers:(id)a3 handler:(id)a4;
- (void)getFriendIDsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6;
- (void)getFriendInvitationMailboxWithType:(id)a3 completion:(id)a4;
- (void)getFriendRequestsBannerDataWithCompletion:(id)a3;
- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5;
- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 withFilter:(int)a5 handler:(id)a6;
- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6;
- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 handler:(id)a5;
- (void)getFriendsLatestActivityWithCompletion:(id)a3;
- (void)getMessageInboxEntries:(id)a3;
- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 gameCategoryFilter:(id)a6 handler:(id)a7;
- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 handler:(id)a6;
- (void)getPlayerActivityFeed:(id)a3 gameID:(id)a4 continuation:(id)a5 handler:(id)a6;
- (void)ignoreFriendInvitationWithPlayerID:(id)a3 completion:(id)a4;
- (void)notifyMessageBasedFriendRequestSentTo:(id)a3 nameKind:(int)a4;
- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)removeAllFriendsWithHandler:(id)a3;
- (void)removeFriendWithPlayer:(id)a3 handler:(id)a4;
- (void)removeMessageInboxEntries:(id)a3 handler:(id)a4;
- (void)reportConcern:(id)a3 handler:(id)a4;
- (void)sendFriendInvitationWithPlayerID:(id)a3 contactAssociationID:(id)a4 completion:(id)a5;
- (void)sendResponselessWithRequest:(id)a3 bagKey:(id)a4 refreshFriendsRequestContents:(BOOL)a5 completion:(id)a6;
@end

@implementation GKFriendServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKFriendServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x40000LL;
}

- (void)getChallengableFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKProfileServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  v10,  v11,  v12));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002FBC0;
  v16[3] = &unk_10026CC20;
  id v18 = v8;
  unint64_t v19 = a4;
  id v17 = v13;
  id v14 = v8;
  id v15 = v13;
  -[GKFriendService getChallengableFriendIDsForPlayer:handler:]( self,  "getChallengableFriendIDsForPlayer:handler:",  v9,  v16);
}

- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 handler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002FC68;
  v9[3] = &unk_10026CC20;
  id v10 = a5;
  unint64_t v11 = a4;
  v9[4] = self;
  id v8 = v10;
  -[GKFriendService getFriendIDsForPlayer:commonFriends:handler:]( self,  "getFriendIDsForPlayer:commonFriends:handler:",  a3,  0LL,  v9);
}

- (void)getFriendsForPlayer:(id)a3 fetchOptions:(unint64_t)a4 withFilter:(int)a5 handler:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002FDBC;
  v11[3] = &unk_10026CC20;
  id v12 = a6;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v12;
  -[GKFriendServicePrivate getFriendIDsForPlayer:withFilter:commonFriends:handler:]( self,  "getFriendIDsForPlayer:withFilter:commonFriends:handler:",  a3,  v6,  0LL,  v11);
}

- (void)getCommonFriendsForPlayer:(id)a3 handler:(id)a4
{
}

- (void)removeFriendWithPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  425LL,  "-[GKFriendServicePrivate removeFriendWithPlayer:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 playerID]);
  unint64_t v11 = (void *)v10;
  id v12 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v13 = (id)GKOSLoggers(v10);
    id v12 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100038EF0();
  }
  id v14 = &off_1001F2000;
  if (v11)
  {
    id v15 = objc_alloc(&OBJC_CLASS___GKRemoveFriendNetworkRequest);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 playerID]);
    id v17 = -[GKRemoveFriendNetworkRequest initWithFriendPlayerID:](v15, "initWithFriendPlayerID:", v16);

    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    [v18 writeToNetwork:v17 clientProxy:v19 handler:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKGameStatServicePrivate,  "serviceWithTransport:forClient:localPlayer:",  0LL,  v20,  v21));

    id v14 = &off_1001F2000;
    [v22 expireGamesFriendsPlayed];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100030120;
    v27[3] = &unk_10026B608;
    id v28 = v11;
    id v29 = v6;
    [v9 performOnManagedObjectContext:v27];
  }

  if (v7)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyQueue]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = *((void *)v14 + 449);
    v25[2] = sub_100030380;
    v25[3] = &unk_10026B030;
    v25[4] = self;
    id v26 = v7;
    [v9 notifyOnQueue:v24 block:v25];
  }
}

- (void)removeAllFriendsWithHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v6 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v7 = (id)GKOSLoggers(v4);
    id v6 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100038F54();
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  468LL,  "-[GKFriendServicePrivate removeAllFriendsWithHandler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  id v10 = -[GKRemoveAllFriendsNetworkRequest initRequest]( objc_alloc(&OBJC_CLASS___GKRemoveAllFriendsNetworkRequest),  "initRequest");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100030550;
  v15[3] = &unk_10026B480;
  v15[4] = self;
  id v16 = v9;
  id v17 = v5;
  id v13 = v5;
  id v14 = v9;
  [v11 writeToNetwork:v10 clientProxy:v12 handler:v15];
}

- (void)getConcernsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  508LL,  "-[GKFriendServicePrivate getConcernsForPlayer:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000309D8;
  v17[3] = &unk_10026B080;
  id v10 = v6;
  id v18 = v10;
  unint64_t v19 = self;
  id v11 = v9;
  id v20 = v11;
  [v11 perform:v17];
  if (v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100030D84;
    v14[3] = &unk_10026B030;
    id v16 = v7;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)reportConcern:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  544LL,  "-[GKFriendServicePrivate reportConcern:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 player]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerID]);

  uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 message]);
  id v13 = (void *)v12;
  if (v11 && v12)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100030FFC;
    v20[3] = &unk_10026BB28;
    id v21 = v11;
    id v22 = v13;
    id v23 = v6;
    v24 = self;
    id v25 = v9;
    [v25 perform:v20];

    if (!v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](&OBJC_CLASS___NSError, "userErrorForCode:userInfo:", 17LL, 0LL));
  [v9 setError:v14];

  if (v7)
  {
LABEL_6:
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 replyQueue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000311A4;
    v17[3] = &unk_10026B030;
    id v19 = v7;
    id v18 = v9;
    [v18 notifyOnQueue:v16 block:v17];
  }

- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 handler:(id)a5
{
}

- (void)getFriendsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = *(void *)&a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100031294;
  v10[3] = &unk_10026C550;
  id v11 = self;
  id v12 = a6;
  id v9 = v12;
  -[GKFriendServicePrivate getFriendIDsForPlayer:withFilter:commonFriends:handler:]( v11,  "getFriendIDsForPlayer:withFilter:commonFriends:handler:",  a3,  v7,  v6,  v10);
}

- (void)getFriendIDsForPlayer:(id)a3 withFilter:(int)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
}

- (void)cancelFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  610LL,  "-[GKFriendServicePrivate cancelFriendRequestWithIdentifier:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003152C;
  v17[3] = &unk_10026B080;
  id v10 = v6;
  id v18 = v10;
  id v19 = self;
  id v11 = v9;
  id v20 = v11;
  [v11 perform:v17];
  if (v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100031690;
    v14[3] = &unk_10026B030;
    id v16 = v7;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)acceptFriendRequestWithIdentifier:(id)a3 sendPush:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  [v10 reportFriendInviteActivityEventAtStage:5 hostApp:0];

  v20[0] = @"friend-code";
  v20[1] = @"send-push";
  v21[0] = v8;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v21[1] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100031870;
  v17[3] = &unk_10026C7A8;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [v13 issueRequest:v12 bagKey:@"gk-use-friend-code" clientProxy:v14 handler:v17];
}

- (void)rejectFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKAMPController controller](&OBJC_CLASS___GKAMPController, "controller"));
  [v8 reportFriendInviteActivityEventAtStage:7 hostApp:0];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  662LL,  "-[GKFriendServicePrivate rejectFriendRequestWithIdentifier:handler:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v9));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100031B70;
  v23[3] = &unk_10026B080;
  id v11 = v6;
  id v24 = v11;
  id v25 = self;
  id v12 = v10;
  id v26 = v12;
  [v12 perform:v23];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100031CD4;
  v18[3] = &unk_10026B0F8;
  id v19 = v12;
  id v20 = self;
  id v21 = v11;
  id v22 = v7;
  id v15 = v7;
  id v16 = v11;
  id v17 = v12;
  [v17 notifyOnQueue:v14 block:v18];
}

- (void)_invalidateCacheForFriendCode:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  688LL,  "-[GKFriendServicePrivate _invalidateCacheForFriendCode:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100031EF8;
  v19[3] = &unk_10026B608;
  id v20 = v6;
  id v10 = v9;
  id v21 = v10;
  id v11 = v6;
  [v10 performOnManagedObjectContext:v19];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000320A4;
  v16[3] = &unk_10026B030;
  id v17 = v10;
  id v18 = v7;
  id v14 = v10;
  id v15 = v7;
  [v14 notifyOnQueue:v13 block:v16];
}

- (void)getFriendCodeDetailWithIdentifiers:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  712LL,  "-[GKFriendServicePrivate getFriendCodeDetailWithIdentifiers:handler:]"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100032290;
  v18[3] = &unk_10026B408;
  id v10 = v6;
  id v19 = v10;
  id v20 = self;
  id v11 = v9;
  id v21 = v11;
  [v11 performOnManagedObjectContext:v18];
  if (v7)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 replyQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100033208;
    v14[3] = &unk_10026B148;
    id v15 = v11;
    id v16 = v10;
    id v17 = v7;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

- (void)getPlayerActivityFeed:(id)a3 gameID:(id)a4 continuation:(id)a5 handler:(id)a6
{
}

- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 handler:(id)a6
{
}

- (void)getPlayerActivityFeed:(id)a3 bundleID:(id)a4 continuation:(id)a5 gameCategoryFilter:(id)a6 handler:(id)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = (__CFString *)a6;
  id v16 = a7;
  v50 = v16;
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers(v16);
  }
  id v18 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v72 = v12;
    __int16 v73 = 2112;
    id v74 = v13;
    __int16 v75 = 2112;
    v76 = v14;
    __int16 v77 = 2112;
    v78 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "targetPlayerId: %@ bundleId: %@ continuation: %@ filter: %@",  buf,  0x2Au);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDPlayerActivity _gkFetchRequest](&OBJC_CLASS___GKCDPlayerActivity, "_gkFetchRequest"));
  v51 = v13;
  if (!v13
    || ([v13 isEqualToString:GKDaemonIdentifier] & 1) != 0
    || ([v13 isEqualToString:GKGameCenterIdentifier] & 1) != 0)
  {
    id v20 = @"NoGameId";
  }

  else
  {
    id v20 = (__CFString *)v13;
  }

  id v21 = @"NoContinuation";
  if (v14) {
    id v21 = v14;
  }
  id v22 = v21;
  v42 = v22;
  id v23 = @"NoTargetPlayer";
  if (v12) {
    id v23 = v12;
  }
  id v24 = v23;
  v44 = v24;
  id v25 = @"NoCategoryFilter";
  if (v15) {
    id v25 = v15;
  }
  v47 = v25;
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(continuation == %@) AND (gameID == %@) AND (targetPlayerID == %@) AND (gameCategoryFilter == %@)",  v22,  v20,  v24,  v47));
  [v19 setPredicate:v49];
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  902LL,  "-[GKFriendServicePrivate getPlayerActivityFeed:bundleID:continuation:gameCategoryFilter:handler:]"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v26));

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_100033890;
  v64[3] = &unk_10026CD40;
  id v28 = v19;
  id v65 = v28;
  id v29 = v14;
  v66 = v29;
  v30 = v20;
  v67 = v30;
  v31 = v12;
  v68 = v31;
  v32 = v15;
  v69 = v32;
  id v33 = v27;
  id v70 = v33;
  [v33 performOnManagedObjectContext:v64];
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v41 replyQueue]);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100033B28;
  v52[3] = &unk_10026CDE0;
  id v53 = v33;
  v54 = v30;
  v55 = v31;
  v56 = v29;
  v57 = v32;
  v58 = self;
  id v59 = v28;
  v60 = v42;
  v61 = v44;
  v62 = v47;
  id v63 = v50;
  v46 = v47;
  v45 = v44;
  v43 = v42;
  id v35 = v28;
  v48 = v32;
  v36 = v29;
  v37 = v31;
  v38 = v30;
  id v39 = v50;
  id v40 = v33;
  [v40 notifyOnQueue:v34 block:v52];
}

- (void)clearActivityFeedCacheWithHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  1029LL,  "-[GKFriendServicePrivate clearActivityFeedCacheWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100034810;
  v15[3] = &unk_10026C810;
  id v7 = v6;
  id v16 = v7;
  [v7 performOnManagedObjectContext:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000348DC;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (void)expireFriendList
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self);
  }
  id v4 = (os_log_s *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Expiring friends list", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  1050LL,  "-[GKFriendServicePrivate expireFriendList]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  [v6 performOnManagedObjectContext:&stru_10026CE00];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 replyQueue]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100034B2C;
  v9[3] = &unk_10026B670;
  v9[4] = self;
  [v6 notifyOnQueue:v8 block:v9];
}

+ (id)messageInboxLocation
{
  if (qword_1002BB4A8 != -1) {
    dispatch_once(&qword_1002BB4A8, &stru_10026CE20);
  }
  return (id)qword_1002BB4A0;
}

+ (os_unfair_lock_s)messageInboxEntriesLock
{
  if (qword_1002BB4B8 != -1) {
    dispatch_once(&qword_1002BB4B8, &stru_10026CE40);
  }
  return (os_unfair_lock_s *)&dword_1002BB4B0;
}

- (void)getMessageInboxEntries:(id)a3
{
  id v24 = (void (**)(id, NSMutableArray *, void))a3;
  v30 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock](&OBJC_CLASS___GKFriendServicePrivate, "messageInboxEntriesLock"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[GKFriendServicePrivate messageInboxLocation]( &OBJC_CLASS___GKFriendServicePrivate,  "messageInboxLocation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v3));

  os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock](&OBJC_CLASS___GKFriendServicePrivate, "messageInboxEntriesLock"));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v23 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allValues]);
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v29 = *(void *)v32;
    uint64_t v27 = GKFriendRequestURLSenderHandle;
    uint64_t v28 = GKFriendRequestURL;
    uint64_t v26 = GKFriendRequestURLSenderAlias;
    uint64_t v7 = GKFriendRequestURLContactID;
    uint64_t v8 = GKFriendRequestURLFriendCode;
    uint64_t v9 = GKFriendRequestTimestamp;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v10);
        id v12 = objc_alloc_init(&OBJC_CLASS___GKMessageInboxEntryInternal);
        id v13 = objc_alloc(&OBJC_CLASS___NSData);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v28]);
        id v15 = -[NSData initWithBase64EncodedString:options:](v13, "initWithBase64EncodedString:options:", v14, 0LL);

        id v16 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v15, 4LL);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));
        [v12 setUrl:v17];

        id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v27]);
        [v12 setSenderHandle:v18];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v26]);
        [v12 setSenderAlias:v19];

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
        [v12 setContactID:v20];

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v8]);
        [v12 setFriendCode:v21];

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);
        [v12 setTimestamp:v22];

        -[NSMutableArray addObject:](v30, "addObject:", v12);
        id v10 = (char *)v10 + 1;
      }

      while (v6 != v10);
      id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v6);
  }

  v24[2](v24, v30, 0LL);
}

- (void)removeMessageInboxEntries:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v5)
  {
    os_unfair_lock_lock(+[GKFriendServicePrivate messageInboxEntriesLock](&OBJC_CLASS___GKFriendServicePrivate, "messageInboxEntriesLock"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[GKFriendServicePrivate messageInboxLocation]( &OBJC_CLASS___GKFriendServicePrivate,  "messageInboxLocation"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfFile:",  v7));

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "friendCode", (void)v18));

          if (v15)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 friendCode]);
            [v8 setObject:0 forKeyedSubscript:v16];
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v11);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[GKFriendServicePrivate messageInboxLocation]( &OBJC_CLASS___GKFriendServicePrivate,  "messageInboxLocation"));
    [v8 writeToFile:v17 atomically:1];

    os_unfair_lock_unlock(+[GKFriendServicePrivate messageInboxEntriesLock](&OBJC_CLASS___GKFriendServicePrivate, "messageInboxEntriesLock"));
    v6[2](v6, 0LL);
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError userErrorForCode:underlyingError:]( &OBJC_CLASS___NSError,  "userErrorForCode:underlyingError:",  17LL,  0LL));
    ((void (**)(id, void *))v6)[2](v6, v8);
  }
}

- (void)getFakeActiveFriendRequests:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100035200;
  v4[3] = &unk_10026C550;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[GKFriendServicePrivate getMessageInboxEntries:](v5, "getMessageInboxEntries:", v4);
}

- (void)getActiveFriendRequests:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](&OBJC_CLASS___GKPreferences, "shared"));
  id v6 = [v5 fakeFriendRequestCount];

  if (v6)
  {
    -[GKFriendServicePrivate getFakeActiveFriendRequests:](self, "getFakeActiveFriendRequests:", v4);
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100035CFC;
    v7[3] = &unk_10026C550;
    v7[4] = self;
    id v8 = v4;
    -[GKFriendServicePrivate getMessageInboxEntries:](self, "getMessageInboxEntries:", v7);
  }
}

- (void)didAccept:(BOOL)a3 friendRequest:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  1324LL,  "-[GKFriendServicePrivate didAccept:friendRequest:handler:]"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v10));

  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  void v21[2] = sub_100036A54;
  v21[3] = &unk_10026CFD0;
  id v12 = v8;
  BOOL v25 = a3;
  id v22 = v12;
  id v23 = self;
  id v24 = v26;
  [v11 perform:v21];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyQueue]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100037170;
  v17[3] = &unk_10026CFF8;
  __int128 v20 = v26;
  void v17[4] = self;
  id v15 = v9;
  id v19 = v15;
  id v16 = v11;
  id v18 = v16;
  [v16 notifyOnQueue:v14 block:v17];

  _Block_object_dispose(v26, 8);
}

- (void)notifyMessageBasedFriendRequestSentTo:(id)a3 nameKind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = v5;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers(v5);
  }
  id v8 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "GKFriendService: notifyMessageBasedFriendRequestSentTo:%@ nameKind:%d",  buf,  0x12u);
  }

  v14[0] = GKFriendRequestRecipientNameKey;
  v14[1] = GKFriendRequestRecipientNameKindKey;
  v15[0] = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  v15[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003737C;
  v12[3] = &unk_10026B4A8;
  id v13 = v10;
  id v11 = v10;
  +[GKClientProxy enumerateClientsUsingBlock:](&OBJC_CLASS___GKClientProxy, "enumerateClientsUsingBlock:", v12);
}

- (void)getFriendsLatestActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v6 readEntityWithRequest:0 bagKey:@"gk-get-friends-latest-activity" includeStaleCacheData:0 clientProxy:v5 completionHandler:v4 entityMaker:&stru_10026D038];
}

- (void)getFriendInvitationMailboxWithType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  id v12 = @"type";
  id v13 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

  uint64_t v10 = GKBagKeyGetFriendInvitationMailbox;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  [v8 readEntityWithRequest:v9 bagKey:v10 includeStaleCacheData:0 clientProxy:v11 completionHandler:v6 entityMaker:&stru_10026D078];
}

- (void)getCombinedFriendInvitationListWithCompletion:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl("GameCenter", "friending_via_push") & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  1447LL,  "-[GKFriendServicePrivate getCombinedFriendInvitationListWithCompletion:]"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v5));

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v6 setResult:v7];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000377A8;
    v18[3] = &unk_10026B170;
    void v18[4] = self;
    id v8 = v6;
    id v19 = v8;
    [v8 perform:v18];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100037960;
    v16[3] = &unk_10026B170;
    void v16[4] = self;
    id v9 = v8;
    id v17 = v9;
    [v9 perform:v16];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 replyQueue]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100037DA0;
    v13[3] = &unk_10026B310;
    id v14 = v9;
    id v15 = v4;
    id v12 = v9;
    [v12 notifyOnQueue:v11 block:v13];
  }

  else
  {
    -[GKFriendServicePrivate getActiveFriendRequests:](self, "getActiveFriendRequests:", v4);
  }
}

- (void)sendFriendInvitationWithPlayerID:(id)a3 contactAssociationID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKClientProxy nonGameCenterForegroundClient]( &OBJC_CLASS___GKClientProxy,  "nonGameCenterForegroundClient"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);

  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 originalBundleIdentifier]);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v15 = v14;
  if (v8) {
    [v14 setObject:v8 forKeyedSubscript:@"receiving-player-id"];
  }
  if (v9) {
    [v15 setObject:v9 forKeyedSubscript:@"receiving-player-caid"];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100038070;
  v18[3] = &unk_10026B2A0;
  id v19 = v12;
  id v20 = v10;
  id v16 = v10;
  id v17 = v12;
  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:]( self,  "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:",  v15,  @"gk-send-friend-invitation",  0LL,  v18);
}

- (void)acceptFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v12 = @"issuing-player-id";
  id v13 = a3;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100038280;
  v10[3] = &unk_10026BBE8;
  id v11 = v6;
  id v9 = v6;
  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:]( self,  "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:",  v8,  @"gk-accept-friend-invitation",  1LL,  v10);
}

- (void)cancelFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v9 = @"receiving-player-id";
  id v10 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:]( self,  "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:",  v8,  @"gk-cancel-friend-invitation",  0LL,  v6);
}

- (void)ignoreFriendInvitationWithPlayerID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v12 = @"issuing-player-id";
  id v13 = a3;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100038554;
  v10[3] = &unk_10026BBE8;
  id v11 = v6;
  id v9 = v6;
  -[GKFriendServicePrivate sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:]( self,  "sendResponselessWithRequest:bagKey:refreshFriendsRequestContents:completion:",  v8,  @"gk-ignore-friend-invitation",  1LL,  v10);
}

- (void)getFriendRequestsBannerDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storeBag]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForKey:GKFriendRequestsBannerPercentAllowed]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    uint64_t v10 = (uint64_t)[v7 integerValue];
    uint64_t v11 = 100LL;
    if (v10 < 100) {
      uint64_t v11 = v10;
    }
    unint64_t v12 = v11 & ~(v11 >> 63);
  }

  else
  {
    unint64_t v12 = 100LL;
  }

  uint64_t v13 = arc4random_uniform(0x64u);
  unint64_t v14 = v13;
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers(v13);
  }
  id v16 = (void *)os_log_GKFriending;
  BOOL v17 = os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO);
  if (v17)
  {
    __int16 v18 = v16;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    int v25 = 138412546;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Friend requests banner dice roll: %@, bag value: %@",  (uint8_t *)&v25,  0x16u);
  }

  if (v12 >= v14)
  {
    if (!os_log_GKGeneral) {
      id v23 = (id)GKOSLoggers(v17);
    }
    id v24 = (os_log_s *)os_log_GKFriending;
    if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Fetching required data for friend requests banner",  (uint8_t *)&v25,  2u);
    }

    -[GKFriendServicePrivate getCombinedFriendInvitationListWithCompletion:]( self,  "getCombinedFriendInvitationListWithCompletion:",  v4);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers(v17);
    }
    id v22 = (os_log_s *)os_log_GKFriending;
    if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Friend requests banner has been disabled",  (uint8_t *)&v25,  2u);
    }

    v4[2](v4, &__NSArray0__struct, 0LL);
  }
}

- (void)sendResponselessWithRequest:(id)a3 bagKey:(id)a4 refreshFriendsRequestContents:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[GKNetworkRequestManager commonNetworkRequestManager]( &OBJC_CLASS___GKNetworkRequestManager,  "commonNetworkRequestManager"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000389E0;
  v16[3] = &unk_10026D118;
  BOOL v18 = a5;
  void v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v13 issueRequest:v12 bagKey:v11 clientProxy:v14 handler:v16];
}

@end