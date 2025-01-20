@interface AXAssetsXPCServer
- (AXAssetsXPCServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)refreshAssetCatalogForAssetTypeHandler;
- (id)updateAssetForAssetTypeHandler;
- (void)_xpcQueue_acceptNewConnection:(id)a3;
- (void)invokeSimpleTaskById:(id)a3 arguments:(id)a4;
- (void)refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5;
- (void)runFirstBootTasks:(BOOL)a3;
- (void)runFirstUnlockTasks;
- (void)setRefreshAssetCatalogForAssetTypeHandler:(id)a3;
- (void)setUpdateAssetForAssetTypeHandler:(id)a3;
- (void)startServer;
- (void)updateAssetForAssetType:(id)a3;
@end

@implementation AXAssetsXPCServer

- (AXAssetsXPCServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AXAssetsXPCServer;
  v2 = -[AXAssetsXPCServer init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.axassetsd.xpc", v6);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v7;

    v9 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accessibility.axassetsd.service");
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v9;

    -[NSXPCListener _setQueue:](v2->_xpcListener, "_setQueue:", v2->_xpcQueue);
    -[NSXPCListener setDelegate:](v2->_xpcListener, "setDelegate:", v2);
  }

  return v2;
}

- (void)startServer
{
  uint64_t v3 = AXLogAssetDaemon(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_attr_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Will begin listening for client connections",  v5,  2u);
  }

  -[NSXPCListener resume](self->_xpcListener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.accessibility.axassets"]);
  unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

  if ((v7 & 1) != 0) {
    goto LABEL_2;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1000219D0));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"application-identifier"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v11);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v10, v12);
  if ((isKindOfClass & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
    unsigned __int8 v15 = [v9 containsObject:v14];

    if ((v15 & 1) != 0)
    {

LABEL_2:
      -[AXAssetsXPCServer _xpcQueue_acceptNewConnection:](self, "_xpcQueue_acceptNewConnection:", v5);
      [v5 resume];
      BOOL v8 = 1;
      goto LABEL_9;
    }
  }

  uint64_t v16 = AXLogAssetDaemon(isKindOfClass);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1000152D8(v5, (uint64_t)v10, v17);
  }

  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (void)_xpcQueue_acceptNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v4 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Accepting new system connection from PID %d",  (uint8_t *)&buf,  8u);
  }

  uint64_t v7 = _AXCreateAXAssetsServiceInterface([v4 _setQueue:self->_xpcQueue]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v4 setExportedInterface:v8];

  [v4 setExportedObject:self];
  [v4 setRemoteObjectInterface:0];
  objc_initWeak(&buf, v4);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000E550;
  v11[3] = &unk_100020770;
  objc_copyWeak(&v12, &buf);
  [v4 setInterruptionHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000E60C;
  v9[3] = &unk_100020770;
  objc_copyWeak(&v10, &buf);
  [v4 setInvalidationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&buf);
}

- (void)refreshAssetCatalogForAssetType:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[AXAssetsXPCServer refreshAssetCatalogForAssetTypeHandler]( self,  "refreshAssetCatalogForAssetTypeHandler"));

  if (v9)
  {
    id v10 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue( -[AXAssetsXPCServer refreshAssetCatalogForAssetTypeHandler]( self,  "refreshAssetCatalogForAssetTypeHandler"));
    ((void (**)(void, id, id, BOOL))v10)[2](v10, v11, v8, v5);
  }
}

- (void)updateAssetForAssetType:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXAssetsXPCServer updateAssetForAssetTypeHandler](self, "updateAssetForAssetTypeHandler"));

  if (v4)
  {
    BOOL v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[AXAssetsXPCServer updateAssetForAssetTypeHandler]( self,  "updateAssetForAssetTypeHandler"));
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)invokeSimpleTaskById:(id)a3 arguments:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  [v7 invokeTaskById:v6 arguments:v5];
}

- (void)runFirstBootTasks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = AXLogAssetDaemon(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Recieved xpc force run first boot actions message",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  [v6 handleFirstBoot:v3];
}

- (void)runFirstUnlockTasks
{
  uint64_t v2 = AXLogAssetDaemon(self);
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Recieved xpc to run first unlock actions message",  v5,  2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSimpleAssetTaskManager sharedInstance](&OBJC_CLASS___AXSimpleAssetTaskManager, "sharedInstance"));
  [v4 handleFirstUnlock];
}

- (id)refreshAssetCatalogForAssetTypeHandler
{
  return self->_refreshAssetCatalogForAssetTypeHandler;
}

- (void)setRefreshAssetCatalogForAssetTypeHandler:(id)a3
{
}

- (id)updateAssetForAssetTypeHandler
{
  return self->_updateAssetForAssetTypeHandler;
}

- (void)setUpdateAssetForAssetTypeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end