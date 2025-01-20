@interface ACCNowPlayingServer
+ (id)sharedServer;
- (ACCNowPlayingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (AccessoryNowPlayingXPCClientProtocol)remoteObject;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableArray)clientConnections;
- (NSXPCConnection)activeConnection;
- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4;
- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7;
- (void)sendUpdatedSubscriberList;
- (void)setActiveConnection:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setPlaybackElapsedTime:(id)a3;
- (void)setPlaybackQueueIndex:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)triggerMediaItemArtworkUpdate;
- (void)triggerMediaItemAttributesUpdate;
- (void)triggerPlaybackAttributesUpdate;
@end

@implementation ACCNowPlayingServer

- (ACCNowPlayingServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCNowPlayingServer;
  v4 = -[ACCFeatureServer initWithXPCServiceName:andFeatureNotification:]( &v10,  "initWithXPCServiceName:andFeatureNotification:",  a3,  a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v5;

    activeConnection = v4->_activeConnection;
    v4->_activeConnection = 0LL;

    remoteObject = v4->_remoteObject;
    v4->_remoteObject = 0LL;
  }

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    objc_super v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    objc_super v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)buf = 138412290;
    v34 = xpcServiceName;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] New XPC connection for: %@",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AccessoryNowPlayingXPCServerProtocol));
  [v7 setExportedInterface:v12];

  v13 = -[ACCNowPlayingServerRemote initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ACCNowPlayingServerRemote),  "initWithXPCConnection:",  v7);
  [v7 setExportedObject:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AccessoryNowPlayingXPCClientProtocol));
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_1001F9A28;
  objc_copyWeak(&v29, &from);
  v28[4] = self;
  objc_copyWeak(&v30, &location);
  [v7 setInvalidationHandler:v28];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
  [v15 addObject:v7];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v16 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v16 = (os_log_s *)&_os_log_default;
    id v17 = &_os_log_default;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
    v19 = (NSString *)[v18 count];
    *(_DWORD *)buf = 134217984;
    v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] There are now %lu client(s).",  buf,  0xCu);
  }

  [v7 resume];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
  BOOL v21 = [v20 count] == (id)1;

  if (v21)
  {
    -[ACCNowPlayingServer setActiveConnection:](self, "setActiveConnection:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer activeConnection](self, "activeConnection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 remoteObjectProxyWithErrorHandler:&__block_literal_global_1]);
    -[ACCNowPlayingServer setRemoteObject:](self, "setRemoteObject:", v23);

    if (gLogObjects && gNumLogObjects >= 5)
    {
      v24 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v24 = (os_log_s *)&_os_log_default;
      id v25 = &_os_log_default;
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
      -[ACCNowPlayingServer listener:shouldAcceptNewConnection:].cold.1(v26, buf, v24);
    }
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    int v22 = 138412290;
    id v23 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] XPC connection invalidated: %@",  (uint8_t *)&v22,  0xCu);
  }

  id v6 = a1 + 5;
  id v7 = objc_loadWeakRetained(a1 + 5);
  [v7 setInvalidationHandler:0];

  id v8 = objc_loadWeakRetained(a1 + 5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] activeConnection]);
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained(a1 + 6);
    [v11 setActiveConnection:0];

    id v12 = objc_loadWeakRetained(a1 + 6);
    [v12 setRemoteObject:0];
  }

  v13 = a1 + 6;
  id v14 = objc_loadWeakRetained(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientConnections]);
  id v16 = objc_loadWeakRetained(v6);
  [v15 removeObject:v16];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v17 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = (os_log_s *)&_os_log_default;
    id v18 = &_os_log_default;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = objc_loadWeakRetained(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientConnections]);
    id v21 = [v20 count];
    int v22 = 134217984;
    id v23 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] There are now %lu client(s).",  (uint8_t *)&v22,  0xCu);
  }
}

void __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke_73(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke_73_cold_1((uint64_t)v2, v5);
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    unsigned __int8 v8 = [v7 isEqual:v4];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)sendUpdatedSubscriberList
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] sendUpdatedSubscriberList...",  v9,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  [v6 updateSubscriberList:v8 WithReply:&__block_literal_global_76];
}

void __48__ACCNowPlayingServer_sendUpdatedSubscriberList__block_invoke(id a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __48__ACCNowPlayingServer_sendUpdatedSubscriberList__block_invoke_cold_1();
  }
}

- (void)triggerMediaItemAttributesUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
    -[dispatch_queue_s triggerMediaItemAttributesUpdateWithReply:]( v5,  "triggerMediaItemAttributesUpdateWithReply:",  &__block_literal_global_77);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v5, &__block_literal_global_79);
  }
}

void __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke(id a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke_cold_1();
  }
}

void __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke_78(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] No clients connected, sending default media item attributes...",  v5,  2u);
  }

  id v4 = (void *)platform_nowPlaying_copyDefaultMediaItemAttributes();
  platform_nowPlaying_mediaItemAttributesUpdate((uint64_t)v4);
}

- (void)triggerMediaItemArtworkUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
    -[dispatch_queue_s triggerMediaItemArtworkUpdateWithReply:]( v5,  "triggerMediaItemArtworkUpdateWithReply:",  &__block_literal_global_80);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v5, &__block_literal_global_82);
  }
}

void __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke(id a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke_cold_1();
  }
}

void __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke_81(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] #Artwork No clients connected, sending default media item artwork...",  v5,  2u);
  }

  id v4 = (void *)platform_nowPlaying_copyDefaultMediaItemArtwork();
  platform_nowPlaying_mediaItemArtworkUpdate((uint64_t)v4);
}

- (void)triggerPlaybackAttributesUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
    -[dispatch_queue_s triggerPlaybackAttributesUpdateWithReply:]( v5,  "triggerPlaybackAttributesUpdateWithReply:",  &__block_literal_global_83);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v5, &__block_literal_global_85);
  }
}

void __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke(id a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke_cold_1();
  }
}

void __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke_84(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] No clients connected, sending default playback attributes...",  v5,  2u);
  }

  id v4 = (void *)platform_nowPlaying_copyDefaultPlaybackAttributes();
  platform_nowPlaying_playbackAttributesUpdate(v4);
}

- (void)requestPlaybackQueueListInfo:(id)a3 requestID:(id)a4 startIndex:(unsigned int)a5 upToCount:(unsigned int)a6 infoMask:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v16 = a3;
  id v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));

  if (v13)
  {
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
    -[dispatch_queue_s requestPlaybackQueueListInfo:requestID:startIndex:upToCount:infoMask:]( v14,  "requestPlaybackQueueListInfo:requestID:startIndex:upToCount:infoMask:",  v16,  v12,  v9,  v8,  v7);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v14, &__block_literal_global_86);
  }
}

void __92__ACCNowPlayingServer_requestPlaybackQueueListInfo_requestID_startIndex_upToCount_infoMask___block_invoke( id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] No clients connected, sending playback queue list not available...",  v4,  2u);
  }

  platform_nowPlaying_playbackQueueListChanged(0);
}

- (void)cancelRequestPlaybackQueueListInfo:(id)a3 requestID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));

  if (v8)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
    [v9 cancelRequestPlaybackQueueListInfo:v6 requestID:v7];
  }

  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 5;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v11 = &_os_log_default;
    }

    else
    {
      id v9 = *(id *)(gLogObjects + 32);
    }

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "[#Now Playing] No clients connected, ignore cancel for accessoryUID %@, requestID %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (void)setPlaybackElapsedTime:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
  [v5 setPlaybackElapsedTime:v4 withReply:&__block_literal_global_87];
}

void __46__ACCNowPlayingServer_setPlaybackElapsedTime___block_invoke(id a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __46__ACCNowPlayingServer_setPlaybackElapsedTime___block_invoke_cold_1();
  }
}

- (void)setPlaybackQueueIndex:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer remoteObject](self, "remoteObject"));
  [v5 setPlaybackQueueIndex:v4 withReply:&__block_literal_global_88];
}

void __45__ACCNowPlayingServer_setPlaybackQueueIndex___block_invoke(id a1, BOOL a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__ACCNowPlayingServer_setPlaybackQueueIndex___block_invoke_cold_1();
  }
}

- (NSXPCConnection)activeConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCNowPlayingServer clientConnections](self, "clientConnections"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  }

  else
  {
    id v6 = 0LL;
  }

  return (NSXPCConnection *)v6;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __35__ACCNowPlayingServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once != -1) {
    dispatch_once(&sharedServer_once, block);
  }
  return (id)sharedServer_sharedInstance;
}

void __35__ACCNowPlayingServer_sharedServer__block_invoke(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.now-playing" andFeatureNotification:"com.apple.accessories.now-playing.availability-changed"];
  BOOL v2 = (void *)sharedServer_sharedInstance;
  sharedServer_sharedInstance = (uint64_t)v1;
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (void)setActiveConnection:(id)a3
{
}

- (AccessoryNowPlayingXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[#Now Playing] Get remote object: %@",  buf,  0xCu);
}

void __58__ACCNowPlayingServer_listener_shouldAcceptNewConnection___block_invoke_73_cold_1( uint64_t a1,  os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[#Now Playing] XPC connection error: %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void __48__ACCNowPlayingServer_sendUpdatedSubscriberList__block_invoke_cold_1()
{
}

void __55__ACCNowPlayingServer_triggerMediaItemAttributesUpdate__block_invoke_cold_1()
{
}

void __52__ACCNowPlayingServer_triggerMediaItemArtworkUpdate__block_invoke_cold_1()
{
}

void __54__ACCNowPlayingServer_triggerPlaybackAttributesUpdate__block_invoke_cold_1()
{
}

void __46__ACCNowPlayingServer_setPlaybackElapsedTime___block_invoke_cold_1()
{
}

void __45__ACCNowPlayingServer_setPlaybackQueueIndex___block_invoke_cold_1()
{
}

@end