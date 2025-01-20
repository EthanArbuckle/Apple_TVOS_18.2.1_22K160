@interface FAHeartbeatOperation
+ (id)urlEndpoint;
- (BOOL)shouldForcePush;
- (FAHeartbeatOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5;
- (id)_followupIdentifiers;
- (id)fetchHeartbeatData;
- (void)setForcePush:(BOOL)a3;
@end

@implementation FAHeartbeatOperation

- (FAHeartbeatOperation)initWithNetworkService:(id)a3 grandSlamSigner:(id)a4 familyGrandSlamSigner:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___FAHeartbeatOperation;
  v11 = -[FANetworkClient initWithNetworkService:](&v14, "initWithNetworkService:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_grandSlamSigner, a4);
    objc_storeStrong((id *)&v12->_familyGrandSlamSigner, a5);
  }

  return v12;
}

+ (id)urlEndpoint
{
  return @"familyHeartbeat";
}

- (id)fetchHeartbeatData
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FAHeartbeatOperation _followupIdentifiers](self, "_followupIdentifiers"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"notificationIDs");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v24 ensureDeviceUnlockedSinceBoot]);
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v23 then]);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10000FD70;
  v29[3] = &unk_100040EA0;
  v29[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 then]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10000FDAC;
  v27[3] = &unk_100041A60;
  v27[4] = self;
  v28 = v3;
  id v9 = (uint64_t (*)(void *, void *))v8[2];
  v22 = v3;
  uint64_t v10 = v9(v8, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v11 then]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000FE58;
  v26[3] = &unk_100041700;
  v26[4] = self;
  uint64_t v13 = ((uint64_t (**)(void, void *))v12)[2](v12, v26);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v14 then]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000FEC4;
  v25[3] = &unk_100041358;
  v25[4] = self;
  uint64_t v16 = ((uint64_t (**)(void, void *))v15)[2](v15, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v17 then]);
  uint64_t v19 = ((uint64_t (**)(void, Block_layout *))v18)[2](v18, &stru_100041AA0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return v20;
}

- (id)_followupIdentifiers
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v3 = objc_alloc(&OBJC_CLASS___FLFollowUpController);
  id v4 = [v3 initWithClientIdentifier:FAFollowUpClientIdentifier];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pendingFollowUpItems:0]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FFF8;
  v8[3] = &unk_100041AC8;
  uint64_t v6 = v2;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (BOOL)shouldForcePush
{
  return self->_forcePush;
}

- (void)setForcePush:(BOOL)a3
{
  self->_forcePush = a3;
}

- (void).cxx_destruct
{
}

@end