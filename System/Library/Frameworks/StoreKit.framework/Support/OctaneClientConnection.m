@interface OctaneClientConnection
+ (id)_connectionForUUID:(id)a3;
+ (id)addConnectionWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5;
+ (id)connectionsForBundleID:(id)a3;
+ (unint64_t)observerCountForEventIdentifier:(id)a3;
+ (void)_enumerateAllConnectionsWithBlock:(id)a3;
+ (void)initialize;
+ (void)receiveEventOfType:(int64_t)a3 withData:(id)a4 onAllObserversWithID:(id)a5;
+ (void)removeConnectionWithUUID:(id)a3;
- (OctaneClientConnection)initWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5;
- (void)dealloc;
- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5;
- (void)registerObservationID:(id)a3;
- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4;
- (void)transactionUpdated:(id)a3 forBundleID:(id)a4;
- (void)unregisterObservationID:(id)a3;
@end

@implementation OctaneClientConnection

+ (void)initialize
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)qword_10032E8C0;
  qword_10032E8C0 = (uint64_t)v2;

  v4 = objc_opt_new(&OBJC_CLASS___UnfairLock);
  v5 = (void *)qword_10032E8C8;
  qword_10032E8C8 = (uint64_t)v4;
}

+ (id)addConnectionWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[OctaneClientConnection initWithBundleID:connection:type:]( objc_alloc(&OBJC_CLASS___OctaneClientConnection),  "initWithBundleID:connection:type:",  v7,  v8,  a5);

  v10 = (void *)qword_10032E8C8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000579FC;
  v16[3] = &unk_1002E78B8;
  id v17 = v7;
  v11 = v9;
  v18 = v11;
  id v12 = v7;
  sub_100046160(v10, v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

+ (id)connectionsForBundleID:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100057B54;
  v18 = sub_100057B64;
  id v19 = 0LL;
  v4 = (void *)qword_10032E8C8;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_100057B6C;
  v11 = &unk_1002E6A00;
  v13 = &v14;
  id v5 = v3;
  id v12 = v5;
  sub_100046160(v4, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15[5], "allObjects", v8, v9, v10, v11));

  _Block_object_dispose(&v14, 8);
  return v6;
}

+ (void)removeConnectionWithUUID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _connectionForUUID:a3]);
  id v5 = v4;
  if (v4)
  {
    v6 = (void *)qword_10032E8C8;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100057DC0;
    v23[3] = &unk_1002E7958;
    id v7 = v4;
    v24 = v7;
    sub_100046160(v6, v23);
    if (v7[5] == (id)1)
    {
      id v8 = [v7[4] mutableCopy];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100057E0C;
      v21[3] = &unk_1002E9378;
      id v9 = v8;
      id v22 = v9;
      [a1 _enumerateAllConnectionsWithBlock:v21];
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v14);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance", (void)v17));
            [v16 unregisterForEventWithIdentifier:v15];

            uint64_t v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }

        while (v12);
      }
    }
  }
}

+ (unint64_t)observerCountForEventIdentifier:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100057F20;
  v7[3] = &unk_1002E93A0;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [a1 _enumerateAllConnectionsWithBlock:v7];
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (void)receiveEventOfType:(int64_t)a3 withData:(id)a4 onAllObserversWithID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100057B54;
  v26 = sub_100057B64;
  v27 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10005814C;
  v19[3] = &unk_1002E93A0;
  id v10 = v9;
  id v20 = v10;
  v21 = &v22;
  [a1 _enumerateAllConnectionsWithBlock:v19];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v11 = (id)v23[5];
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v14),  "receiveEventOfType:eventData:identifier:",  a3,  v8,  v10,  (void)v15);
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }

    while (v12);
  }

  _Block_object_dispose(&v22, 8);
}

+ (void)_enumerateAllConnectionsWithBlock:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  unint64_t v5 = (void *)qword_10032E8C8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10005833C;
  v16[3] = &unk_1002E7958;
  v6 = v4;
  __int128 v17 = v6;
  sub_100046160(v5, v16);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v6;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v18,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8LL * (void)v10);
        objc_sync_enter(v11);
        v3[2](v3, v11);
        objc_sync_exit(v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v18,  16LL);
    }

    while (v8);
  }
}

+ (id)_connectionForUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  __int128 v14 = sub_100057B54;
  __int128 v15 = sub_100057B64;
  id v16 = 0LL;
  id v4 = (void *)qword_10032E8C8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000585DC;
  v8[3] = &unk_1002E7840;
  id v5 = v3;
  id v9 = v5;
  id v10 = &v11;
  sub_100046160(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (OctaneClientConnection)initWithBundleID:(id)a3 connection:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___OctaneClientConnection;
  id v10 = -[OctaneClientConnection init](&v25, "init");
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0
      && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"octaneClientUUID"]),
          v13,
          v13))
    {
      __int128 v14 = (NSString *)[v8 copy];
      bundleID = v10->_bundleID;
      v10->_bundleID = v14;

      uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 remoteObjectProxy]);
      remoteObject = v10->_remoteObject;
      v10->_remoteObject = (ASDOctaneClientProtocol *)v16;

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"octaneClientUUID"]);
      __int128 v19 = (NSString *)[v18 copy];
      uuid = v10->_uuid;
      v10->_uuid = v19;

      v10->_type = a5;
      if (a5 != 1)
      {
LABEL_12:

        goto LABEL_13;
      }

      v21 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      eventObservations = v10->_eventObservations;
      v10->_eventObservations = v21;
    }

    else
    {
      if (qword_10032E918 != -1) {
        dispatch_once(&qword_10032E918, &stru_1002E93C8);
      }
      v23 = (os_log_s *)qword_10032E908;
      if (os_log_type_enabled((os_log_t)qword_10032E908, OS_LOG_TYPE_ERROR)) {
        sub_1002621CC((uint64_t)v9, v23);
      }
      eventObservations = v10;
      id v10 = 0LL;
    }

    goto LABEL_12;
  }

- (void)dealloc
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000589BC;
  v4[3] = &unk_1002E7958;
  v4[4] = self;
  sub_100046160((void *)qword_10032E8C8, v4);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OctaneClientConnection;
  -[OctaneClientConnection dealloc](&v3, "dealloc");
}

- (void)registerObservationID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](v4->_eventObservations, "addObject:", v5);
  objc_sync_exit(v4);
}

- (void)unregisterObservationID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_eventObservations, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (void)transactionDeleted:(unint64_t)a3 forBundleID:(id)a4
{
  if (!self->_type) {
    -[ASDOctaneClientProtocol transactionDeleted:forBundleID:]( self->_remoteObject,  "transactionDeleted:forBundleID:",  a3,  a4);
  }
}

- (void)transactionUpdated:(id)a3 forBundleID:(id)a4
{
  if (!self->_type) {
    -[ASDOctaneClientProtocol transactionUpdated:forBundleID:]( self->_remoteObject,  "transactionUpdated:forBundleID:",  a3,  a4);
  }
}

- (void)receiveEventOfType:(int64_t)a3 eventData:(id)a4 identifier:(id)a5
{
  if (self->_type == 1) {
    -[ASDOctaneClientProtocol receiveEventOfType:eventData:identifier:]( self->_remoteObject,  "receiveEventOfType:eventData:identifier:",  a3,  a4,  a5);
  }
}

- (void).cxx_destruct
{
}

@end