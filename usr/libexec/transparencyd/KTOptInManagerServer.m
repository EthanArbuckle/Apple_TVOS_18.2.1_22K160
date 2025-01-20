@interface KTOptInManagerServer
+ (id)getOptInHistory:(id)a3 store:(id)a4 error:(id *)a5;
+ (id)getOptInHistoryDiagnostic:(id)a3 store:(id)a4;
+ (id)notificationKeyForApplication:(id)a3;
+ (id)optInKeyForApplication:(id)a3;
+ (void)optInManagerOptInState:(id)a3 sync:(BOOL)a4 store:(id)a5 complete:(id)a6;
- (BOOL)kvsOptInState;
- (BOOL)outstandingSetSignal;
- (Class)account;
- (KTContext)context;
- (KTKVSProtocol)store;
- (KTOptInManagerServer)initWithApplication:(id)a3;
- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4;
- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5;
- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5 account:(Class)a6 store:(id)a7;
- (KTSMManager)stateMachine;
- (NSString)applicationId;
- (OS_dispatch_group)setGroup;
- (OS_dispatch_queue)setQueue;
- (id)emailPrefix;
- (id)getAggregateOptInState:(id *)a3;
- (id)getCurrentOptInEntry:(id *)a3;
- (id)getOptInHistory:(id *)a3;
- (id)notificationKey;
- (id)optInKey;
- (int)notifyToken;
- (void)changeOptInState:(unint64_t)a3 dataStore:(id)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4;
- (void)getOptInState:(id)a3;
- (void)handleOptInStateChange:(id)a3;
- (void)setAccount:(Class)a3;
- (void)setApplicationId:(id)a3;
- (void)setContext:(id)a3;
- (void)setNotifyToken:(int *)a3;
- (void)setOutstandingSetSignal:(BOOL)a3;
- (void)setSetGroup:(id)a3;
- (void)setSetQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation KTOptInManagerServer

+ (id)optInKeyForApplication:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.optIn", a3);
}

+ (id)notificationKeyForApplication:(id)a3
{
  return +[KTOptInManager notificationKeyForApplication:]( &OBJC_CLASS___KTOptInManager,  "notificationKeyForApplication:",  a3);
}

- (KTOptInManagerServer)initWithApplication:(id)a3
{
  return -[KTOptInManagerServer initWithApplication:context:](self, "initWithApplication:context:", a3, 0LL);
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4
{
  return -[KTOptInManagerServer initWithApplication:context:stateMachine:]( self,  "initWithApplication:context:stateMachine:",  a3,  a4,  0LL);
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v12 = -[KTOptInManagerServer initWithApplication:context:stateMachine:account:store:]( self,  "initWithApplication:context:stateMachine:account:store:",  v10,  v9,  v8,  objc_opt_class(&OBJC_CLASS___TransparencyAccount, v11),  0LL);

  return v12;
}

- (KTOptInManagerServer)initWithApplication:(id)a3 context:(id)a4 stateMachine:(id)a5 account:(Class)a6 store:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v12));

  if (v16)
  {
    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___KTOptInManagerServer;
    v17 = -[KTOptInManagerServer init](&v30, "init");
    v18 = v17;
    if (v17)
    {
      -[KTOptInManagerServer setApplicationId:](v17, "setApplicationId:", v12);
      -[KTOptInManagerServer setContext:](v18, "setContext:", v13);
      -[KTOptInManagerServer setStateMachine:](v18, "setStateMachine:", v14);
      if (v15)
      {
        -[KTOptInManagerServer setStore:](v18, "setStore:", v15);
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[KTKVSSoftStore sharedStore](&OBJC_CLASS___KTKVSSoftStore, "sharedStore"));
        -[KTOptInManagerServer setStore:](v18, "setStore:", v21);
      }

      -[KTOptInManagerServer setAccount:](v18, "setAccount:", a6);
      dispatch_group_t v22 = dispatch_group_create();
      -[KTOptInManagerServer setSetGroup:](v18, "setSetGroup:", v22);

      dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
      dispatch_queue_t v25 = dispatch_queue_create("KTOptInManagerSet", v24);
      -[KTOptInManagerServer setSetQueue:](v18, "setSetQueue:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyDistributedReadNotificationCenter defaultCenter]( &OBJC_CLASS___TransparencyDistributedReadNotificationCenter,  "defaultCenter"));
      [v26 addObserver:v18 selector:"handleCDPReset:" name:@"com.apple.security.resetprotecteddata.complete"];

      v27 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyDistributedReadNotificationCenter defaultCenter]( &OBJC_CLASS___TransparencyDistributedReadNotificationCenter,  "defaultCenter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer notificationKey](v18, "notificationKey"));
      [v27 addObserver:v18 selector:"handleOptInStateChange:" name:v28];
    }

    self = v18;
    v20 = self;
  }

  else
  {
    if (qword_1002EECB0 != -1) {
      dispatch_once(&qword_1002EECB0, &stru_100287128);
    }
    v19 = (os_log_s *)qword_1002EECB8;
    if (os_log_type_enabled((os_log_t)qword_1002EECB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }

    v20 = 0LL;
  }

  return v20;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyDistributedReadNotificationCenter defaultCenter]( &OBJC_CLASS___TransparencyDistributedReadNotificationCenter,  "defaultCenter"));
  [v3 removeObserver:self name:@"com.apple.security.resetprotecteddata.complete"];

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyDistributedReadNotificationCenter defaultCenter]( &OBJC_CLASS___TransparencyDistributedReadNotificationCenter,  "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer notificationKey](self, "notificationKey"));
  [v4 removeObserver:self name:v5];

  notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(*notifyToken);
    v7 = self->_notifyToken;
  }

  else
  {
    v7 = 0LL;
  }

  free(v7);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KTOptInManagerServer;
  -[KTOptInManagerServer dealloc](&v8, "dealloc");
}

+ (void)optInManagerOptInState:(id)a3 sync:(BOOL)a4 store:(id)a5 complete:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11 && ([v11 storeReady] & 1) != 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100193424;
    v19[3] = &unk_100287150;
    id v23 = a1;
    id v20 = v10;
    id v13 = v11;
    id v21 = v13;
    id v22 = v12;
    id v14 = objc_retainBlock(v19);
    id v15 = v14;
    if (v8)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100193530;
      v17[3] = &unk_100279428;
      v18 = v14;
      [v13 forceSync:v17];
    }

    else
    {
      ((void (*)(void *))v14[2])(v14);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInterface,  -308LL,  @"KVS store not yet loaded"));
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v16);
  }
}

- (id)optInKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManagerServer optInKeyForApplication:]( &OBJC_CLASS___KTOptInManagerServer,  "optInKeyForApplication:",  v2));

  return v3;
}

- (id)notificationKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManager notificationKeyForApplication:]( &OBJC_CLASS___KTOptInManager,  "notificationKeyForApplication:",  v2));

  return v3;
}

- (id)getOptInHistory:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer store](self, "store"));
  unsigned __int8 v6 = [v5 storeReady];

  if ((v6 & 1) != 0)
  {
    BOOL v8 = (void *)objc_opt_class(self, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer store](self, "store"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 getOptInHistory:v9 store:v10 error:a3]);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInterface,  -308LL,  @"KVS store not yet loaded"));
    id v9 = v12;
    id v11 = 0LL;
    if (a3 && v12)
    {
      id v9 = v12;
      id v11 = 0LL;
      *a3 = v9;
    }
  }

  return v11;
}

+ (id)getOptInHistory:(id)a3 store:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[KTOptInManagerServer optInKeyForApplication:]( &OBJC_CLASS___KTOptInManagerServer,  "optInKeyForApplication:",  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"OptInServerGet",  v7));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);
  if (v12)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v11);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      id v40 = v8;
      v41 = v10;
      v39 = v9;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      id v14 = v12;
      id v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v15)
      {
        id v17 = v15;
        uint64_t v18 = *(void *)v44;
        id obj = v14;
LABEL_5:
        uint64_t v19 = 0LL;
        while (1)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0) {
            break;
          }
          id v22 = v20;
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDate, v24);
          if ((objc_opt_isKindOfClass(v23, v25) & 1) == 0)
          {

LABEL_24:
            v36 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -283LL,  @"Opt-in entry has wrong value types"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
            [v37 logResultForEvent:v41 hardFailure:1 result:v36];

            if (a5 && v36) {
              *a5 = v36;
            }

LABEL_28:
            id v9 = v39;
            id v8 = v40;
            id v10 = v41;
            id v14 = obj;
            goto LABEL_29;
          }

          v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:1]);
          uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber, v27);
          char isKindOfClass = objc_opt_isKindOfClass(v26, v28);

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_24;
          }

          if (v17 == (id)++v19)
          {
            id v14 = obj;
            id v17 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
            if (v17) {
              goto LABEL_5;
            }
            goto LABEL_13;
          }
        }

        id v22 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -282LL,  @"Latest opt-in entry is not an array"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        [v35 logResultForEvent:v41 hardFailure:1 result:v22];

        if (!a5) {
          goto LABEL_28;
        }
        id v9 = v39;
        id v8 = v40;
        id v14 = obj;
        if (v22)
        {
          id v22 = v22;
          *a5 = v22;
        }

        id v10 = v41;
LABEL_29:

        v31 = 0LL;
        goto LABEL_30;
      }

+ (id)getOptInHistoryDiagnostic:(id)a3 store:(id)a4
{
  id v28 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getOptInHistory:a3 store:a4 error:&v28]);
  id v5 = v28;
  unsigned __int8 v6 = v5;
  if (v4)
  {
    id v22 = v5;
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          if ((unint64_t)[v12 count] >= 2)
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDate, v15);
            if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
            {
              uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
              if ((objc_opt_isKindOfClass(v14, v18) & 1) != 0)
              {
                v29[0] = @"date";
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_toISO_8601_UTCString"));
                v29[1] = @"state";
                v30[0] = v19;
                v30[1] = v14;
                id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
                [v23 addObject:v20];
              }
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }

      while (v9);
    }

    unsigned __int8 v6 = v22;
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

- (id)getCurrentOptInEntry:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getOptInHistory:](self, "getOptInHistory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]);

  return v4;
}

- (void)getOptInState:(id)a3
{
  v4 = (void (**)(id, id, void *, void))a3;
  id v10 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getCurrentOptInEntry:](self, "getCurrentOptInEntry:", &v10));
  unint64_t v6 = (unint64_t)v10;
  if (v5 | v6)
  {
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectAtIndexedSubscript:1]);
      id v8 = [v7 BOOLValue];

      id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 objectAtIndexedSubscript:0]);
      v4[2](v4, v8, v9, 0LL);
    }

    else
    {
      v4[2](v4, 0LL, 0LL, v6);
    }
  }

  else
  {
    v4[2](v4, 0LL, 0LL, 0LL);
  }
}

- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4
{
  uint64_t v5 = kTransparencyErrorInterface;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v5,  -285LL,  @"tvOS KT opt-in not supported for %@",  v7));

  (*((void (**)(id, void, void, id))v6 + 2))(v6, 0LL, 0LL, v8);
}

- (BOOL)kvsOptInState
{
  return 0;
}

- (void)changeOptInState:(unint64_t)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  id v6 = a5;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer setQueue](self, "setQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100193FEC;
  v9[3] = &unk_1002798C8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (id)emailPrefix
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  if ([v4 isEqualToString:kKTApplicationIdentifierIDSFaceTime])
  {

LABEL_4:
    goto LABEL_5;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
  unsigned __int8 v9 = [v8 isEqualToString:kKTApplicationIdentifierIDSMultiplex];

  if ((v9 & 1) == 0)
  {
    id v6 = 0LL;
    return v6;
  }

- (void)handleOptInStateChange:(id)a3
{
  id v4 = a3;
  if (qword_1002EECB0 != -1) {
    dispatch_once(&qword_1002EECB0, &stru_1002871B0);
  }
  uint64_t v5 = (os_log_s *)qword_1002EECB8;
  if (os_log_type_enabled((os_log_t)qword_1002EECB8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got opt-in change notification", buf, 2u);
  }

  id v19 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer getCurrentOptInEntry:](self, "getCurrentOptInEntry:", &v19));
  id v7 = v19;
  if (v7 || !v6)
  {
    if (qword_1002EECB0 != -1) {
      dispatch_once(&qword_1002EECB0, &stru_1002871D0);
    }
    uint64_t v10 = qword_1002EECB8;
    if (os_log_type_enabled((os_log_t)qword_1002EECB8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      uint64_t v11 = "failed to get current opt-in state: %@";
      id v12 = (os_log_s *)v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, 0xCu);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
    unsigned __int8 v9 = [v8 BOOLValue];

    if ((v9 & 1) != 0)
    {
      id v7 = 0LL;
      goto LABEL_19;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer context](self, "context"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 followUp]);
    id v18 = 0LL;
    unsigned __int8 v16 = [v15 clearAllFollowups:&v18];
    id v7 = v18;

    if ((v16 & 1) == 0)
    {
      if (qword_1002EECB0 != -1) {
        dispatch_once(&qword_1002EECB0, &stru_1002871F0);
      }
      uint64_t v17 = qword_1002EECB8;
      if (os_log_type_enabled((os_log_t)qword_1002EECB8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        uint64_t v11 = "failed to clear existing follow ups on optOut notification: %@";
        id v12 = (os_log_s *)v17;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        goto LABEL_13;
      }
    }
  }

- (id)getAggregateOptInState:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer stateMachine](self, "stateMachine"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deps]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudRecords]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInManagerServer applicationId](self, "applicationId"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getAggregateOptInStateForApplication:v8 error:a3]);
  }

  else
  {
    if (qword_1002EECB0 != -1) {
      dispatch_once(&qword_1002EECB0, &stru_100287210);
    }
    uint64_t v10 = (os_log_s *)qword_1002EECB8;
    if (os_log_type_enabled((os_log_t)qword_1002EECB8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "no state machine or cloudrecords", v12, 2u);
    }

    unsigned __int8 v9 = 0LL;
  }

  return v9;
}

- (KTKVSProtocol)store
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStore:(id)a3
{
}

- (KTContext)context
{
  return (KTContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
}

- (NSString)applicationId
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setApplicationId:(id)a3
{
}

- (Class)account
{
  return (Class)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAccount:(Class)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int *)a3
{
  self->_notifyToken = a3;
}

- (BOOL)outstandingSetSignal
{
  return self->_outstandingSetSignal;
}

- (void)setOutstandingSetSignal:(BOOL)a3
{
  self->_outstandingSetSignal = a3;
}

- (OS_dispatch_queue)setQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSetQueue:(id)a3
{
}

- (OS_dispatch_group)setGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSetGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end