@interface HHDDaemonServiceRegistry
- (HHDAssetManagementService)assetManager;
- (HHDBubbleManagementService)bubbleManager;
- (HHDDaemonServiceRegistry)initWithQueue:(id)a3;
- (HHDEndpointManagementService)endpointManager;
- (HHDJobManagementService)jobManager;
- (HHDManagementServerService)managementServer;
- (HHDNotificationProxy)notificationProxy;
- (HHDPersistence)persistence;
- (HHDSideBoardService)sideBoardManager;
- (void)bootstrapAllServices;
- (void)startAllServices;
- (void)stopAllServices;
@end

@implementation HHDDaemonServiceRegistry

- (HHDDaemonServiceRegistry)initWithQueue:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___HHDDaemonServiceRegistry;
  v5 = -[HHDDaemonServiceRegistry init](&v27, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[HHDBubbleManager bubbleManager](&OBJC_CLASS___HHDBubbleManager, "bubbleManager"));
    bubbleManager = v5->_bubbleManager;
    v5->_bubbleManager = (HHDBubbleManager *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[HHDEndpointManager endpointManager](&OBJC_CLASS___HHDEndpointManager, "endpointManager"));
    endpointManager = v5->_endpointManager;
    v5->_endpointManager = (HHDEndpointManager *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[HHDSqlitePersistence defaultPersistence](&OBJC_CLASS___HHDSqlitePersistence, "defaultPersistence"));
    persistence = v5->_persistence;
    v5->_persistence = (HHDSqlitePersistence *)v10;

    v12 = -[HHDJobManager initWithQueue:](objc_alloc(&OBJC_CLASS___HHDJobManager), "initWithQueue:", v4);
    jobManager = v5->_jobManager;
    v5->_jobManager = (HHDJobManagementService *)v12;

    v14 = -[HHDManagementServer initWithQueue:](objc_alloc(&OBJC_CLASS___HHDManagementServer), "initWithQueue:", v4);
    managementServer = v5->_managementServer;
    v5->_managementServer = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[HHDNotificationProxy notificationProxy](&OBJC_CLASS___HHDNotificationProxy, "notificationProxy"));
    notificationProxy = v5->_notificationProxy;
    v5->_notificationProxy = (HHDNotificationProxy *)v16;

    v18 = -[HHDAssetManager initWithQueue:](objc_alloc(&OBJC_CLASS___HHDAssetManager), "initWithQueue:", v4);
    assetManager = v5->_assetManager;
    v5->_assetManager = v18;

    v20 = objc_alloc(&OBJC_CLASS___HHDSideBoardManager);
    v21 = objc_opt_new(&OBJC_CLASS___HHDSideBoardManagerFactory);
    v22 = -[HHDSideBoardManager initWithFactory:queue:](v20, "initWithFactory:queue:", v21, v4);
    sideBoardManager = v5->_sideBoardManager;
    v5->_sideBoardManager = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___HHDKeepAliveManager);
    keepAliveManager = v5->_keepAliveManager;
    v5->_keepAliveManager = v24;
  }

  return v5;
}

- (void)bootstrapAllServices
{
  id v3 = sub_10000D39C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@Bootstrapping services", (uint8_t *)&v5, 0xCu);
  }

  -[HHDSqlitePersistence bootstrapWithServiceRegistry:](self->_persistence, "bootstrapWithServiceRegistry:", self);
  -[HHDNotificationProxy bootstrapWithNotificationService:]( self->_notificationProxy,  "bootstrapWithNotificationService:",  self->_managementServer);
  -[HHDEndpointManager bootstrapWithServiceRegistry:](self->_endpointManager, "bootstrapWithServiceRegistry:", self);
  -[HHDBubbleManager bootstrapWithServiceRegistry:](self->_bubbleManager, "bootstrapWithServiceRegistry:", self);
  -[HHDManagementServer bootstrapWithServiceRegistry:](self->_managementServer, "bootstrapWithServiceRegistry:", self);
  -[HHDSideBoardManager bootstrapWithServiceRegistry:](self->_sideBoardManager, "bootstrapWithServiceRegistry:", self);
  -[HHDAssetManager bootstrapWithServiceRegistry:](self->_assetManager, "bootstrapWithServiceRegistry:", self);
  -[HHDKeepAliveManager bootstrapWithServiceRegistry:](self->_keepAliveManager, "bootstrapWithServiceRegistry:", self);
}

- (void)startAllServices
{
  id v3 = sub_10000D39C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@Starting services", (uint8_t *)&v5, 0xCu);
  }

  -[HHDEndpointManager start](self->_endpointManager, "start");
  -[HHDSideBoardManager start](self->_sideBoardManager, "start");
  -[HHDAssetManager start](self->_assetManager, "start");
}

- (void)stopAllServices
{
  id v3 = sub_10000D39C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = &stru_100024E50;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@Stopping services", (uint8_t *)&v5, 0xCu);
  }

  -[HHDManagementServer stop](self->_managementServer, "stop");
  -[HHDAssetManager stop](self->_assetManager, "stop");
  -[HHDSideBoardManager stop](self->_sideBoardManager, "stop");
  -[HHDKeepAliveManager stop](self->_keepAliveManager, "stop");
  -[HHDSqlitePersistence close](self->_persistence, "close");
}

- (HHDSideBoardService)sideBoardManager
{
  return (HHDSideBoardService *)self->_sideBoardManager;
}

- (HHDBubbleManagementService)bubbleManager
{
  return (HHDBubbleManagementService *)self->_bubbleManager;
}

- (HHDEndpointManagementService)endpointManager
{
  return (HHDEndpointManagementService *)self->_endpointManager;
}

- (HHDManagementServerService)managementServer
{
  return (HHDManagementServerService *)self->_managementServer;
}

- (HHDPersistence)persistence
{
  return (HHDPersistence *)self->_persistence;
}

- (HHDAssetManagementService)assetManager
{
  return (HHDAssetManagementService *)self->_assetManager;
}

- (HHDJobManagementService)jobManager
{
  return self->_jobManager;
}

- (HHDNotificationProxy)notificationProxy
{
  return self->_notificationProxy;
}

- (void).cxx_destruct
{
}

@end