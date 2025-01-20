@interface SBDPlaybackPositionService
+ (id)serviceForXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (OS_dispatch_queue)queue;
- (SBCClientConfiguration)clientConfiguration;
- (SBCPlaybackPositionClientProtocol)clientProxy;
- (SBDDomainSyncServiceHandler)syncHandler;
- (SBDDomainValueServiceHandler)valueHandler;
- (SBDPlaybackPositionService)initWithXPCConnection:(id)a3;
- (id)_connectionClientIdentity;
- (void)_sendSyncHandlerMessageWithBlock:(id)a3;
- (void)_sendValueHandlerMessageWithBlock:(id)a3;
- (void)beginAccessingPlaybackPositionEntities;
- (void)deletePlaybackPositionEntities;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)endAccessingPlaybackPositionEntities;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)setClientConfiguration:(id)a3;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
@end

@implementation SBDPlaybackPositionService

- (SBDPlaybackPositionService)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SBDPlaybackPositionService;
  v6 = -[SBDPlaybackPositionService init](&v19, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create(0LL, 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_XPCConnection, a3);
    -[NSXPCConnection setExportedObject:](v6->_XPCConnection, "setExportedObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SBCPlaybackPositionServiceInterface serviceInterface]( &OBJC_CLASS___SBCPlaybackPositionServiceInterface,  "serviceInterface"));
    -[NSXPCConnection setExportedInterface:](v6->_XPCConnection, "setExportedInterface:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[SBCPlaybackPositionServiceInterface serviceClientInterface]( &OBJC_CLASS___SBCPlaybackPositionServiceInterface,  "serviceClientInterface"));
    -[NSXPCConnection setRemoteObjectInterface:](v6->_XPCConnection, "setRemoteObjectInterface:", v10);

    objc_initWeak(&location, v6->_XPCConnection);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000025D8;
    v16[3] = &unk_10001C678;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v6->_XPCConnection, "setInvalidationHandler:", v16);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100002690;
    v14[3] = &unk_10001C678;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v6->_XPCConnection, "setInterruptionHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](v6->_XPCConnection, "remoteObjectProxy"));
    clientProxy = v6->_clientProxy;
    v6->_clientProxy = (SBCPlaybackPositionClientProtocol *)v11;
  }

  return v6;
}

- (void)setClientConfiguration:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000024BC;
  block[3] = &unk_10001CFB8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000249C;
  v5[3] = &unk_10001C8E0;
  id v6 = a3;
  id v4 = v6;
  -[SBDPlaybackPositionService _sendSyncHandlerMessageWithBlock:](self, "_sendSyncHandlerMessageWithBlock:", v5);
}

- (void)beginAccessingPlaybackPositionEntities
{
}

- (void)endAccessingPlaybackPositionEntities
{
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100002468;
  v13[3] = &unk_10001C700;
  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  id v16 = v9;
  BOOL v17 = a4;
  id v14 = v8;
  id v10 = v15;
  id v11 = v8;
  id v12 = v9;
  -[SBDPlaybackPositionService _sendSyncHandlerMessageWithBlock:](self, "_sendSyncHandlerMessageWithBlock:", v13);
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000245C;
  v6[3] = &unk_10001C728;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  id v4 = v8;
  id v5 = v7;
  -[SBDPlaybackPositionService _sendSyncHandlerMessageWithBlock:](self, "_sendSyncHandlerMessageWithBlock:", v6);
}

- (void)deletePlaybackPositionEntities
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002450;
  v4[3] = &unk_10001C8B8;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  id v3 = v5;
  -[SBDPlaybackPositionService _sendSyncHandlerMessageWithBlock:](self, "_sendSyncHandlerMessageWithBlock:", v4);
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100002444;
  v6[3] = &unk_10001C728;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  id v4 = v8;
  id v5 = v7;
  -[SBDPlaybackPositionService _sendSyncHandlerMessageWithBlock:](self, "_sendSyncHandlerMessageWithBlock:", v6);
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002418;
  v11[3] = &unk_10001C750;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  id v14 = v7;
  id v8 = v13;
  id v9 = v6;
  id v10 = v7;
  -[SBDPlaybackPositionService _sendSyncHandlerMessageWithBlock:](self, "_sendSyncHandlerMessageWithBlock:", v11);
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000023F4;
  v8[3] = &unk_10001C778;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[SBDPlaybackPositionService _sendValueHandlerMessageWithBlock:](self, "_sendValueHandlerMessageWithBlock:", v8);
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000023D0;
  v8[3] = &unk_10001C778;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[SBDPlaybackPositionService _sendValueHandlerMessageWithBlock:](self, "_sendValueHandlerMessageWithBlock:", v8);
}

- (id)_connectionClientIdentity
{
  XPCConnection = self->_XPCConnection;
  if (!XPCConnection)
  {
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Could not create client identity with nil connection",  buf,  2u);
    }

    goto LABEL_7;
  }

  -[NSXPCConnection auditToken](XPCConnection, "auditToken");
  uint64_t v4 = MSVTCCIdentityForAuditToken(&v9);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection description](self->_XPCConnection, "description"));
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Could not create client identity from XPCConnection=%@",  buf,  0xCu);
    }

- (void)_sendSyncHandlerMessageWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, SBDDomainSyncServiceHandler *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SBCClientConfiguration playbackPositionDomain](self->_clientConfiguration, "playbackPositionDomain"));
  unsigned __int8 v6 = [v5 supportsSyncProtocol];

  if ((v6 & 1) != 0)
  {
    syncHandler = self->_syncHandler;
    if (!syncHandler)
    {
      id v8 = objc_alloc(&OBJC_CLASS___SBDDomainSyncServiceHandler);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SBCClientConfiguration playbackPositionDomain]( self->_clientConfiguration,  "playbackPositionDomain"));
      id v10 = -[SBDDomainSyncServiceHandler initWithDomain:](v8, "initWithDomain:", v9);
      id v11 = self->_syncHandler;
      self->_syncHandler = v10;

      syncHandler = self->_syncHandler;
    }

    v4[2](v4, syncHandler);
  }

  else
  {
    id v12 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[SBCClientConfiguration playbackPositionDomain]( self->_clientConfiguration,  "playbackPositionDomain"));
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "attempt to use sync APIs on domain (%@) that does not support the sync protocol",  (uint8_t *)&v14,  0xCu);
    }

    v4[2](v4, 0LL);
  }
}

- (void)_sendValueHandlerMessageWithBlock:(id)a3
{
  id v4 = a3;
  valueHandler = self->_valueHandler;
  id v10 = v4;
  if (!valueHandler)
  {
    unsigned __int8 v6 = objc_alloc(&OBJC_CLASS___SBDDomainValueServiceHandler);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SBCClientConfiguration playbackPositionDomain]( self->_clientConfiguration,  "playbackPositionDomain"));
    id v8 = -[SBDDomainValueServiceHandler initWithDomain:](v6, "initWithDomain:", v7);
    uint64_t v9 = self->_valueHandler;
    self->_valueHandler = v8;

    id v4 = v10;
    valueHandler = self->_valueHandler;
  }

  (*((void (**)(id, SBDDomainValueServiceHandler *))v4 + 2))(v4, valueHandler);
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SBCPlaybackPositionClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (SBDDomainSyncServiceHandler)syncHandler
{
  return self->_syncHandler;
}

- (SBDDomainValueServiceHandler)valueHandler
{
  return self->_valueHandler;
}

- (SBCClientConfiguration)clientConfiguration
{
  return self->_clientConfiguration;
}

- (void).cxx_destruct
{
}

+ (id)serviceForXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithXPCConnection:v4];

  return v5;
}

@end