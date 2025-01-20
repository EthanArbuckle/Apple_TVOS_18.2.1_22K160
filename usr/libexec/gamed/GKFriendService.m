@interface GKFriendService
+ (Class)interfaceClass;
+ (id)filterFriends:(id)a3 filter:(int)a4;
+ (unint64_t)requiredEntitlements;
- (id)predicateForFriendPredicate:(id)a3 withFilter:(id)a4;
- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4;
- (void)establishNearbyRelationshipsUsingPlayerTokens:(id)a3 handler:(id)a4;
- (void)getChallengableFriendIDsForPlayer:(id)a3 handler:(id)a4;
- (void)getChallengableFriendsForPlayer:(id)a3 handler:(id)a4;
- (void)getFriendIDsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5;
- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 commonFriends:(BOOL)a5 handler:(id)a6;
- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 withFilter:(int)a5 commonFriends:(BOOL)a6 handler:(id)a7;
- (void)getFriendsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5;
- (void)getFriendsForPlayer:(id)a3 handler:(id)a4;
- (void)getNearbyTokenForLocalPlayerWithHandler:(id)a3;
- (void)updateFriendsOfLocalPlayerWithHandler:(id)a3;
@end

@implementation GKFriendService

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKFriendServiceInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 4LL;
}

- (void)getFriendsForPlayer:(id)a3 handler:(id)a4
{
}

- (void)updateFriendsOfLocalPlayerWithHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002DCA4;
  v5[3] = &unk_10026C5A0;
  id v6 = a3;
  id v4 = v6;
  -[GKFriendService getFriendIDsForPlayer:commonFriends:handler:]( self,  "getFriendIDsForPlayer:commonFriends:handler:",  0LL,  0LL,  v5);
}

- (void)getFriendsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002DD4C;
  v8[3] = &unk_10026C550;
  v9 = self;
  id v10 = a5;
  id v7 = v10;
  -[GKFriendService getFriendIDsForPlayer:commonFriends:handler:]( v9,  "getFriendIDsForPlayer:commonFriends:handler:",  a3,  v5,  v8);
}

- (void)getFriendIDsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5
{
}

- (void)getChallengableFriendIDsForPlayer:(id)a3 handler:(id)a4
{
}

- (void)getChallengableFriendsForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[GKService serviceWithTransport:forClient:localPlayer:]( &OBJC_CLASS___GKProfileService,  "serviceWithTransport:forClient:localPlayer:",  v8,  v9,  v10));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002DFA4;
  v14[3] = &unk_10026C550;
  id v15 = v11;
  id v16 = v6;
  id v12 = v6;
  id v13 = v11;
  -[GKFriendService getChallengableFriendIDsForPlayer:handler:]( self,  "getChallengableFriendIDsForPlayer:handler:",  v7,  v14);
}

- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
}

- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 withFilter:(int)a5 commonFriends:(BOOL)a6 handler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (v13)
  {
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playerID]);
      unsigned int v17 = [v14 isEqualToString:v16];

      if (v17)
      {
LABEL_9:

        id v11 = 0LL;
        goto LABEL_10;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 playerID]);

      if (!v18)
      {
        if (!os_log_GKGeneral) {
          id v20 = (id)GKOSLoggers(v19);
        }
        v21 = (void *)os_log_GKError;
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
          sub_100038C68((uint64_t)v11, v21);
        }
        goto LABEL_9;
      }
    }

- (void)getNearbyTokenForLocalPlayerWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  280LL,  "-[GKFriendService getNearbyTokenForLocalPlayerWithHandler:]"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002EF88;
  v15[3] = &unk_10026B170;
  v15[4] = self;
  id v7 = v6;
  id v16 = v7;
  [v7 perform:v15];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyQueue]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002F1C8;
  v12[3] = &unk_10026B030;
  id v13 = v7;
  id v14 = v4;
  id v10 = v7;
  id v11 = v4;
  [v10 notifyOnQueue:v9 block:v12];
}

- (id)predicateForFriendPredicate:(id)a3 withFilter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 length])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v7));
    v12[0] = v5;
    v12[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v9));
  }

  else
  {
    id v10 = v5;
  }

  return v10;
}

- (void)establishNearbyRelationshipsUsingPlayerTokens:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = (os_log_s *)os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v10 = (id)GKOSLoggers(v7);
    v9 = (os_log_s *)os_log_GKGeneral;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100038E2C();
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  316LL,  "-[GKFriendService establishNearbyRelationshipsUsingPlayerTokens:handler:]"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002F4DC;
  v20[3] = &unk_10026B080;
  id v13 = v6;
  id v21 = v13;
  v22 = self;
  id v14 = v12;
  id v23 = v14;
  [v14 perform:v20];
  if (v8)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 replyQueue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002F6A8;
    v17[3] = &unk_10026B030;
    id v19 = v8;
    id v18 = v14;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKFriendService.m",  339LL,  "-[GKFriendService createFriendRequestWithIdentifier:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](&OBJC_CLASS___GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002F86C;
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
    v14[2] = sub_10002FA28;
    v14[3] = &unk_10026B030;
    id v16 = v7;
    id v15 = v11;
    [v15 notifyOnQueue:v13 block:v14];
  }
}

+ (id)filterFriends:(id)a3 filter:(int)a4
{
  id v5 = a3;
  if (a3)
  {
    uint64_t v6 = type metadata accessor for GKFilterableFriend();
    id v5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  }

  id v7 = sub_100128D4C((uint64_t)v5, a4);
  swift_bridgeObjectRelease(v5, v8);
  if (v7)
  {
    type metadata accessor for GKFilterableFriend();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7, v10);
  }

  else
  {
    v9.super.isa = 0LL;
  }

  return v9.super.isa;
}

@end