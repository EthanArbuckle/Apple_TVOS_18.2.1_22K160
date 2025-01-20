@interface BMSyncServiceServer
- (BMSyncServiceServer)initWithQueue:(id)a3 biomeSyncCore:(id)a4 cascadeSyncManager:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_cloudKitSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4;
- (void)_rapportSyncWithDevices:(id)a3 syncTriggeredHandler:(id)a4 syncCompletedHandler:(id)a5;
- (void)_rapportSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4;
- (void)cascadeRapportSyncWithReply:(id)a3;
- (void)cloudKitSyncWithReply:(id)a3;
- (void)peerInformationWithReply:(id)a3;
- (void)rapportSyncWithReply:(id)a3;
- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4;
- (void)triggerCloudKitSyncWithReply:(id)a3;
- (void)triggerRapportSyncDeviceIdentifiers:(id)a3 reply:(id)a4;
- (void)triggerRapportSyncWithReply:(id)a3;
@end

@implementation BMSyncServiceServer

- (BMSyncServiceServer)initWithQueue:(id)a3 biomeSyncCore:(id)a4 cascadeSyncManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___BMSyncServiceServer;
  v12 = -[BMSyncServiceServer init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_core, a4);
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v13->_cascadeSyncManager, a5);
    v14 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.biomesyncd.sync");
    listener = v13->_listener;
    v13->_listener = v14;

    -[NSXPCListener setDelegate:](v13->_listener, "setDelegate:", v13);
    -[NSXPCListener resume](v13->_listener, "resume");
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BMProcess processWithXPCConnection:](&OBJC_CLASS___BMProcess, "processWithXPCConnection:", v5));
  if (([v6 BOOLForEntitlement:@"com.apple.private.biome.sync"] & 1) != 0
    || os_variant_allows_internal_security_policies("com.apple.biomesyncd")
    && ([v6 BOOLForEntitlement:@"com.apple.internal.biome.sync"] & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BMSyncServiceServerProtocol));
    [v5 setExportedInterface:v7];

    [v5 setExportedObject:self];
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___BMSyncServiceClientProtocol));
    [v5 setRemoteObjectInterface:v8];

    [v5 resume];
    BOOL v9 = 1;
  }

  else
  {
    [v5 invalidate];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_cloudKitSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F5BC;
  block[3] = &unk_100069340;
  block[4] = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncCore syncScheduler](self->_core, "syncScheduler"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001F6D4;
  v17[3] = &unk_100069368;
  id v18 = v10;
  id v12 = v10;
  [v11 syncCloudKitNowIfPolicyAllowsWithReason:5 activity:0 completionHandler:v17];

  v13 = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001F6E8;
  v15[3] = &unk_100069390;
  id v16 = v9;
  id v14 = v9;
  dispatch_sync((dispatch_queue_t)v13, v15);
}

- (void)_rapportSyncWithSyncTriggeredHandler:(id)a3 syncCompletedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F7A8;
  block[3] = &unk_100069340;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_rapportSyncWithDevices:(id)a3 syncTriggeredHandler:(id)a4 syncCompletedHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FA28;
  block[3] = &unk_1000693B8;
  id v17 = v9;
  id v18 = v10;
  block[4] = self;
  id v16 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)triggerRapportSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("-[BMSyncServiceServer triggerRapportSyncWithReply:]");
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "triggerRapportSyncWithReply called", buf, 2u);
  }

  id v11 = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001FCEC;
  v12[3] = &unk_1000693E0;
  id v13 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = nullsub_1;
  v10[3] = &unk_100068CB0;
  id v8 = v5;
  id v9 = v4;
  -[BMSyncServiceServer _rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:]( self,  "_rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:",  v12,  v10);
}

- (void)triggerRapportSyncDeviceIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)os_transaction_create("-[BMSyncServiceServer triggerRapportSyncDeviceIdentifiers:reply:]");
  uint64_t v9 = __biome_log_for_category(11LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "triggerRapportSyncDeviceIdentifiers called",  buf,  2u);
  }

  id v14 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001FE30;
  v15[3] = &unk_1000693E0;
  id v16 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = nullsub_2;
  v13[3] = &unk_100068CB0;
  id v11 = v8;
  id v12 = v6;
  -[BMSyncServiceServer _rapportSyncWithDevices:syncTriggeredHandler:syncCompletedHandler:]( self,  "_rapportSyncWithDevices:syncTriggeredHandler:syncCompletedHandler:",  v7,  v15,  v13);
}

- (void)rapportSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("-[BMSyncServiceServer rapportSyncWithError:]");
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError called", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001FF3C;
  v10[3] = &unk_100069408;
  id v11 = v5;
  id v12 = v4;
  id v8 = v5;
  id v9 = v4;
  -[BMSyncServiceServer _rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:]( self,  "_rapportSyncWithSyncTriggeredHandler:syncCompletedHandler:",  0LL,  v10);
}

- (void)cascadeRapportSyncWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("-[BMSyncServiceServer cascadeRapportSyncWithReply:]");
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError called", buf, 2u);
  }

  uint64_t v8 = __biome_log_for_category(11LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[BMPersonaUtilities currentPersonaIdentifierLoggingDescription]( &OBJC_CLASS___BMPersonaUtilities,  "currentPersonaIdentifierLoggingDescription"));
    *(_DWORD *)buf = 138412290;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "rapportSyncWithError persona is %@", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CCPersonaSyncManager syncEngineForCurrentPersona]( self->_cascadeSyncManager,  "syncEngineForCurrentPersona"));
  [v11 startClient];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100020110;
  v15[3] = &unk_100069430;
  id v17 = v5;
  id v18 = v4;
  id v16 = v11;
  id v12 = v5;
  id v13 = v4;
  id v14 = v11;
  [v14 syncNowWithReason:5 activity:0 completionHandler:v15];
}

- (void)triggerCloudKitSyncWithReply:(id)a3
{
  uint64_t v4 = BMSyncErrorDomain;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  1LL,  0LL));
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)cloudKitSyncWithReply:(id)a3
{
  uint64_t v4 = BMSyncErrorDomain;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v4,  1LL,  0LL));
  uint64_t v8 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  (*((void (**)(id, void *, void *))a3 + 2))(v5, &__NSArray0__struct, v7);
}

- (void)remoteDevicesForAccount:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002036C;
  block[3] = &unk_100069458;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)peerInformationWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000207D4;
  block[3] = &unk_100068B98;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
}

@end