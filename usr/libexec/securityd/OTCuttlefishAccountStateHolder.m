@interface OTCuttlefishAccountStateHolder
- (BOOL)_onqueuePersistAccountChanges:(id)a3 error:(id *)a4;
- (BOOL)persistAccountChanges:(id)a3 error:(id *)a4;
- (BOOL)persistLastHealthCheck:(id)a3 error:(id *)a4;
- (BOOL)persistNewEgoPeerID:(id)a3 error:(id *)a4;
- (BOOL)persistNewTrustState:(int)a3 error:(id *)a4;
- (BOOL)persistOctagonJoinAttempt:(int)a3 error:(id *)a4;
- (BOOL)persistSendingMetricsPermitted:(int)a3 error:(id *)a4;
- (NSMutableSet)monitors;
- (NSString)containerName;
- (NSString)contextID;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)queue;
- (OTCuttlefishAccountStateHolder)initWithQueue:(id)a3 container:(id)a4 context:(id)a5 personaAdapter:(id)a6 activeAccount:(id)a7;
- (OTPersonaAdapter)personaAdapter;
- (TPSpecificUser)activeAccount;
- (id)_onqueueLoadOrCreateAccountMetadata:(id *)a3;
- (id)getEgoPeerID:(id *)a3;
- (id)lastHealthCheckupDate:(id *)a3;
- (id)loadOrCreateAccountMetadata:(id *)a3;
- (int)fetchSendingMetricsPermitted:(id *)a3;
- (void)asyncNotifyAccountStateChanges:(id)a3 from:(id)a4;
- (void)registerNotification:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setMonitors:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation OTCuttlefishAccountStateHolder

- (OTCuttlefishAccountStateHolder)initWithQueue:(id)a3 container:(id)a4 context:(id)a5 personaAdapter:(id)a6 activeAccount:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___OTCuttlefishAccountStateHolder;
  v17 = -[OTCuttlefishAccountStateHolder init](&v25, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    dispatch_queue_t v19 = dispatch_queue_create("OTCuttlefishAccountStateHolderNotifier", 0LL);
    notifyQueue = v18->_notifyQueue;
    v18->_notifyQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_containerName, a4);
    objc_storeStrong((id *)&v18->_contextID, a5);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    monitors = v18->_monitors;
    v18->_monitors = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v18->_personaAdapter, a6);
    objc_storeStrong((id *)&v18->_activeAccount, a7);
  }

  return v18;
}

- (void)registerNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder monitors](self, "monitors"));
  [v5 addObject:v4];
}

- (id)loadOrCreateAccountMetadata:(id *)a3
{
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  dispatch_queue_t v19 = sub_100185540;
  v20 = sub_100185550;
  id v21 = 0LL;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_100185540;
  id v14 = sub_100185550;
  id v15 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100185764;
  block[3] = &unk_1002914F8;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v5, block);

  if (a3)
  {
    v6 = (void *)v11[5];
    if (v6) {
      *a3 = v6;
    }
  }

  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)_onqueueLoadOrCreateAccountMetadata:(id *)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder containerName](self, "containerName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder contextID](self, "contextID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder personaAdapter](self, "personaAdapter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder activeAccount](self, "activeAccount"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 personaUniqueString]);
  id v18 = 0LL;
  v11 = (OTAccountMetadataClassC *)objc_claimAutoreleasedReturnValue( +[OTAccountMetadataClassC loadFromKeychainForContainer:contextID:personaAdapter:personaUniqueString:error:]( &OBJC_CLASS___OTAccountMetadataClassC,  "loadFromKeychainForContainer:contextID:personaAdapter:personaUniqueString:error:",  v6,  v7,  v8,  v10,  &v18));
  id v12 = v18;

  if (v11 && !v12) {
    goto LABEL_6;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  if ([v13 isEqualToString:NSOSStatusErrorDomain])
  {
    id v14 = [v12 code];

    if (v14 == (id)-25300LL)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___OTAccountMetadataClassC);

      -[OTAccountMetadataClassC setAttemptedJoin:](v15, "setAttemptedJoin:", 1LL);
      v11 = v15;
LABEL_6:
      uint64_t v16 = v11;
      v11 = v16;
      goto LABEL_10;
    }
  }

  else
  {
  }

  uint64_t v16 = 0LL;
  if (a3) {
    *a3 = v12;
  }
LABEL_10:

  return v16;
}

- (id)getEgoPeerID:(id *)a3
{
  id v12 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishAccountStateHolder loadOrCreateAccountMetadata:]( self,  "loadOrCreateAccountMetadata:",  &v12));
  id v5 = v12;
  v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0LL;
  }
  if (v7)
  {
    if (a3)
    {
      id v8 = v5;
LABEL_12:
      uint64_t v10 = 0LL;
      *a3 = v8;
      goto LABEL_14;
    }

- (id)lastHealthCheckupDate:(id *)a3
{
  id v10 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishAccountStateHolder loadOrCreateAccountMetadata:]( self,  "loadOrCreateAccountMetadata:",  &v10));
  id v5 = v10;
  v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0LL;
  }
  if (v7)
  {
    id v8 = 0LL;
    if (a3) {
      *a3 = v5;
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 lastHealthCheckup] / 1000.0));
  }

  return v8;
}

- (BOOL)persistNewEgoPeerID:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100185734;
  v8[3] = &unk_100291520;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = -[OTCuttlefishAccountStateHolder persistAccountChanges:error:]( self,  "persistAccountChanges:error:",  v8,  a4);

  return (char)a4;
}

- (BOOL)persistNewTrustState:(int)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100185704;
  v5[3] = &unk_100291540;
  int v6 = a3;
  return -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v5, a4);
}

- (BOOL)persistAccountChanges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_100185540;
  v43 = sub_100185550;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100185540;
  v37 = sub_100185550;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_100185540;
  v31 = sub_100185550;
  id v32 = 0LL;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100185558;
  uint64_t v16 = &unk_100291568;
  dispatch_queue_t v19 = &v27;
  v20 = &v39;
  v17 = self;
  id v21 = &v33;
  id v8 = v6;
  id v18 = v8;
  v22 = &v23;
  dispatch_sync(v7, &v13);

  if (a4)
  {
    id v9 = (void *)v40[5];
    if (v9) {
      *a4 = v9;
    }
  }

  uint64_t v10 = v34[5];
  if (v10) {
    -[OTCuttlefishAccountStateHolder asyncNotifyAccountStateChanges:from:]( self,  "asyncNotifyAccountStateChanges:from:",  v10,  v28[5],  v13,  v14,  v15,  v16,  v17);
  }
  char v11 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v11;
}

- (BOOL)persistLastHealthCheck:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001854F8;
  v8[3] = &unk_100291520;
  id v9 = a3;
  id v6 = v9;
  LOBYTE(a4) = -[OTCuttlefishAccountStateHolder persistAccountChanges:error:]( self,  "persistAccountChanges:error:",  v8,  a4);

  return (char)a4;
}

- (BOOL)persistOctagonJoinAttempt:(int)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001854C8;
  v5[3] = &unk_100291540;
  int v6 = a3;
  return -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v5, a4);
}

- (int)fetchSendingMetricsPermitted:(id *)a3
{
  id v10 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishAccountStateHolder loadOrCreateAccountMetadata:]( self,  "loadOrCreateAccountMetadata:",  &v10));
  id v5 = v10;
  int v6 = v5;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4 == 0LL;
  }
  if (v7)
  {
    int v8 = 0;
    if (a3) {
      *a3 = v5;
    }
  }

  else
  {
    int v8 = [v4 sendingMetricsPermitted];
  }

  return v8;
}

- (BOOL)persistSendingMetricsPermitted:(int)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100185498;
  v5[3] = &unk_100291540;
  int v6 = a3;
  return -[OTCuttlefishAccountStateHolder persistAccountChanges:error:](self, "persistAccountChanges:error:", v5, a4);
}

- (BOOL)_onqueuePersistAccountChanges:(id)a3 error:(id *)a4
{
  int v6 = (uint64_t (**)(id, id))a3;
  BOOL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  id v24 = 0LL;
  int v8 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishAccountStateHolder _onqueueLoadOrCreateAccountMetadata:]( self,  "_onqueueLoadOrCreateAccountMetadata:",  &v24));
  id v9 = v24;
  if (!v8)
  {
    id v12 = 0LL;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  id v21 = a4;
  id v10 = [v8 copy];
  v22 = v6;
  uint64_t v11 = v6[2](v6, v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder containerName](self, "containerName"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder contextID](self, "contextID"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder personaAdapter](self, "personaAdapter"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder activeAccount](self, "activeAccount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 personaUniqueString]);
  id v23 = v9;
  unsigned __int8 v18 = [v12 saveToKeychainForContainer:v13 contextID:v14 personaAdapter:v15 personaUniqueString:v17 error:&v23];
  id v20 = v23;

  if ((v18 & 1) == 0)
  {

    id v12 = 0LL;
  }

  id v9 = v20;
  a4 = v21;
  int v6 = v22;
  if (v21)
  {
LABEL_7:
    if (v9) {
      *a4 = v9;
    }
  }

- (void)asyncNotifyAccountStateChanges:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishAccountStateHolder notifyQueue](self, "notifyQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100185390;
  v11[3] = &unk_100291A60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)notifyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setNotifyQueue:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setContextID:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setActiveAccount:(id)a3
{
}

- (NSMutableSet)monitors
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMonitors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end