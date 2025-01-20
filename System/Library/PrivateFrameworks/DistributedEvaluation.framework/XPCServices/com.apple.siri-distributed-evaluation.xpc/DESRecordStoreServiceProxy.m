@interface DESRecordStoreServiceProxy
- (DESRecordStoreServiceProxy)initWithXPCConnection:(id)a3;
- (void)createForwardConnection;
- (void)dealloc;
- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4;
- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5;
- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3;
- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4;
- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4;
- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4;
- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6;
@end

@implementation DESRecordStoreServiceProxy

- (DESRecordStoreServiceProxy)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DESRecordStoreServiceProxy;
  v6 = -[DESRecordStoreServiceProxy init](&v17, "init");
  v7 = v6;
  v8 = 0LL;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("DESServiceConnection", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    [v5 _setQueue:v7->_queue];
    objc_initWeak(&location, v7);
    [v5 setInterruptionHandler:&stru_1000041E8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100001BD8;
    v14[3] = &unk_100004210;
    objc_copyWeak(&v15, &location);
    [v5 setInvalidationHandler:v14];
    v8 = v7;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dealloc
{
  forwardConnection = self->_forwardConnection;
  self->_forwardConnection = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DESRecordStoreServiceProxy;
  -[DESRecordStoreServiceProxy dealloc](&v4, "dealloc");
}

- (void)createForwardConnection
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  objc_super v4 = -[NSXPCConnection initWithMachServiceName:options:]( v3,  "initWithMachServiceName:options:",  DESFullServiceName,  4096LL);
  forwardConnection = self->_forwardConnection;
  self->_forwardConnection = v4;

  v6 = self->_forwardConnection;
  uint64_t XPCInterface = DESServiceGetXPCInterface(1LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
  -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v8);

  -[NSXPCConnection setInterruptionHandler:](self->_forwardConnection, "setInterruptionHandler:", &stru_100004230);
  objc_initWeak(&location, self);
  dispatch_queue_attr_t v9 = self->_forwardConnection;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100001E38;
  v13 = &unk_100004210;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", &v10);
  -[NSXPCConnection resume](self->_forwardConnection, "resume", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4
{
  v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  forwardConnection = self->_forwardConnection;
  if (!forwardConnection)
  {
    -[DESRecordStoreServiceProxy createForwardConnection](self, "createForwardConnection");
    forwardConnection = self->_forwardConnection;
  }

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_1000020B4;
  objc_super v17 = &unk_100004280;
  id v9 = v7;
  id v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( forwardConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &v14));
  if (v10)
  {
    if (v6) {
      v6[2](v6, v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel", v14, v15, v16, v17));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100002CA4();
    }

    if (v9)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      v20 = @"Fail to create remote object proxy.";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v12));
      (*((void (**)(id, void *))v9 + 2))(v9, v13);
    }
  }
}

- (void)fetchInstalledBundlesIdsWithCompletion:(id)a3
{
  id v4 = a3;
  if ((+[DESServiceAccess hasToolEntitlement:]( &OBJC_CLASS___DESServiceAccess,  "hasToolEntitlement:",  self->_connection) & 1) != 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000022D8;
    v10[3] = &unk_1000042A8;
    id v11 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000022E4;
    v8[3] = &unk_100004280;
    id v9 = v11;
    -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v10,  v8);

    id v5 = v11;
  }

  else
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100002D44();
    }

    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    v13 = @"fetchInstalledBundlesIdsWithCompletion may only be called by des_tool";
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v5));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
  }
}

- (void)saveRecordForBundleId:(id)a3 data:(id)a4 recordInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    connection = self->_connection;
    id v25 = 0LL;
    unsigned __int8 v15 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v10,  connection,  &v25);
    id v16 = v25;
    if ((v15 & 1) != 0)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100002528;
      v20[3] = &unk_1000042D0;
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100002538;
      v18[3] = &unk_100004280;
      id v19 = v24;
      -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v20,  v18);
    }

    else
    {
      (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v16);
    }
  }

  else
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v27 = @"invalid arguments passed to service; programmer error!";
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  v16));
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0LL, v17);
  }
}

- (void)fetchSavedRecordInfoForRecordType:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100002628;
  v10[3] = &unk_1000042F8;
  id v11 = a3;
  id v12 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100002634;
  v8[3] = &unk_100004280;
  id v9 = v12;
  id v6 = v12;
  id v7 = v11;
  -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v10,  v8);
}

- (void)deleteAllSavedRecordsForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connection = self->_connection;
  id v16 = 0LL;
  unsigned __int8 v9 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v6,  connection,  &v16);
  id v10 = v16;
  if ((v9 & 1) != 0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100002770;
    v13[3] = &unk_1000042F8;
    id v14 = v6;
    id v15 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000277C;
    v11[3] = &unk_100004280;
    id v12 = v15;
    -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v13,  v11);
  }

  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v10);
  }
}

- (void)deleteSavedRecordForBundleId:(id)a3 identfier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connection = self->_connection;
  id v20 = 0LL;
  unsigned __int8 v12 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v8,  connection,  &v20);
  id v13 = v20;
  if ((v12 & 1) != 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000028D0;
    v16[3] = &unk_100004320;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000028E0;
    v14[3] = &unk_100004280;
    id v15 = v19;
    -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v16,  v14);
  }

  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v13);
  }
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000029C8;
  v10[3] = &unk_1000042F8;
  id v11 = a3;
  id v12 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000029D4;
  v8[3] = &unk_100004280;
  id v9 = v12;
  id v6 = v12;
  id v7 = v11;
  -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v10,  v8);
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connection = self->_connection;
  id v21 = 0LL;
  unsigned __int8 v12 = +[DESServiceAccess hasRecordAccessToBundleId:connection:error:]( &OBJC_CLASS___DESServiceAccess,  "hasRecordAccessToBundleId:connection:error:",  v9,  connection,  &v21);
  id v13 = v21;
  if ((v12 & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100002BB8;
    v17[3] = &unk_100004320;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100002BC8;
    v15[3] = &unk_100004280;
    id v16 = v20;
    -[DESRecordStoreServiceProxy performOnRemoteObjecWithBlock:errorHandler:]( self,  "performOnRemoteObjecWithBlock:errorHandler:",  v17,  v15);
  }

  else
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Uh oh %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
  }
}

- (void).cxx_destruct
{
}

  ;
}

@end