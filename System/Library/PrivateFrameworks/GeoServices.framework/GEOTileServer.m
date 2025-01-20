@interface GEOTileServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOTileServer)initWithDaemon:(id)a3;
- (NSString)description;
- (void)_canShrinkBySize:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5;
- (void)_didDeleteExternalTileData:(id)a3;
- (void)_receivedTile:(void *)a3 error:(void *)a4 info:(void *)a5 forKey:(const void *)a6 forPeer:(void *)a7;
- (void)_shrinkDB:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5;
- (void)beginPreload:(id)a3 fromPeer:(id)a4;
- (void)canShrinkBySize:(id)a3 fromPeer:(id)a4;
- (void)canShrinkBySizeSync:(id)a3 fromPeer:(id)a4;
- (void)cancel:(id)a3 fromPeer:(id)a4;
- (void)corrupt:(id)a3 fromPeer:(id)a4;
- (void)dealloc;
- (void)endPreload:(id)a3 fromPeer:(id)a4;
- (void)enumerateTiles:(id)a3 fromPeer:(id)a4;
- (void)loadTiles:(id)a3 fromPeer:(id)a4;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)reprioritizeKey:(id)a3 fromPeer:(id)a4;
- (void)runBackgroundTask:(id)a3;
- (void)shrinkDB:(id)a3 fromPeer:(id)a4;
- (void)shrinkDBSync:(id)a3 fromPeer:(id)a4;
- (void)tileLoader:(id)a3 submittedTilesToNetwork:(id)a4 forClient:(id)a5;
@end

@implementation GEOTileServer

+ (id)identifier
{
  return @"tiles";
}

+ (unint64_t)launchMode
{
  return 1LL;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &__NSArray0__struct;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v14 = 0;
  if (v13 <= 782)
  {
    if (v13 <= 417)
    {
      if (v13 == 120)
      {
        id v46 = -[GEOTileServer cancel:fromPeer:](self, "cancel:fromPeer:", v11, v12);
        if (a6 != -1LL)
        {
          uint64_t v47 = GEOGetGEODaemonLog(v46);
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          v18 = v48;
          if (!a6 || !os_signpost_enabled(v48)) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
      }

      else
      {
        if (v13 != 224) {
          goto LABEL_67;
        }
        id v25 = -[GEOTileServer loadTiles:fromPeer:](self, "loadTiles:fromPeer:", v11, v12);
        if (a6 != -1LL)
        {
          uint64_t v26 = GEOGetGEODaemonLog(v25);
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          v18 = v27;
          if (!a6 || !os_signpost_enabled(v27)) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
      }
    }

    else
    {
      if (v13 == 418)
      {
        id v34 = -[GEOTileServer beginPreload:fromPeer:](self, "beginPreload:fromPeer:", v11, v12);
        if (a6 == -1LL) {
          goto LABEL_66;
        }
        uint64_t v35 = GEOGetGEODaemonLog(v34);
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        v18 = v36;
        if (!a6 || !os_signpost_enabled(v36)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }

      if (v13 != 421)
      {
        if (v13 == 655)
        {
          id v19 = -[GEOTileServer shrinkDB:fromPeer:](self, "shrinkDB:fromPeer:", v11, v12);
          if (a6 == -1LL) {
            goto LABEL_66;
          }
          uint64_t v20 = GEOGetGEODaemonLog(v19);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          v18 = v21;
          if (!a6 || !os_signpost_enabled(v21)) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }

        goto LABEL_67;
      }

      id v37 = -[GEOTileServer endPreload:fromPeer:](self, "endPreload:fromPeer:", v11, v12);
      if (a6 != -1LL)
      {
        uint64_t v38 = GEOGetGEODaemonLog(v37);
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        v18 = v39;
        if (!a6 || !os_signpost_enabled(v39)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
    }

    goto LABEL_66;
  }

  if (v13 > 1067)
  {
    if (v13 == 1068)
    {
      id v40 = -[GEOTileServer shrinkDBSync:fromPeer:](self, "shrinkDBSync:fromPeer:", v11, v12);
      if (a6 == -1LL) {
        goto LABEL_66;
      }
      uint64_t v41 = GEOGetGEODaemonLog(v40);
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      v18 = v42;
      if (!a6 || !os_signpost_enabled(v42)) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }

    if (v13 != 1320)
    {
      if (v13 == 1374)
      {
        id v22 = -[GEOTileServer canShrinkBySizeSync:fromPeer:](self, "canShrinkBySizeSync:fromPeer:", v11, v12);
        if (a6 == -1LL) {
          goto LABEL_66;
        }
        uint64_t v23 = GEOGetGEODaemonLog(v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        v18 = v24;
        if (!a6 || !os_signpost_enabled(v24)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }

      goto LABEL_67;
    }

    id v43 = -[GEOTileServer reprioritizeKey:fromPeer:](self, "reprioritizeKey:fromPeer:", v11, v12);
    if (a6 != -1LL)
    {
      uint64_t v44 = GEOGetGEODaemonLog(v43);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      v18 = v45;
      if (!a6 || !os_signpost_enabled(v45)) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }

- (GEOTileServer)initWithDaemon:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GEOTileServer;
  v3 = -[GEOTileServer initWithDaemon:](&v13, "initWithDaemon:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](v3, "daemon"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serverQueue]);
    uint64_t v7 = geo_dispatch_queue_create_with_target("com.apple.GeoServices.geod.TileServer", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
    [v9 setInternalDelegate:v4];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
    [v10 setInternalDelegateQ:v4->_queue];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v4 selector:"_didDeleteExternalTileData:" name:GEOTileLoaderDidDeleteExternalTileDataNotification object:0];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GEOTileServer;
  -[GEOTileServer dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GEOTileServer;
  v2 = -[GEOTileServer description](&v8, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v3, v5));

  return (NSString *)v6;
}

- (void)_didDeleteExternalTileData:(id)a3
{
}

- (void)loadTiles:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 serverQueue]);
  dispatch_assert_queue_V2(v9);

  xpc_object_t value = xpc_dictionary_get_value(v6, "list");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileKeyList listFromXPCData:](&OBJC_CLASS___GEOTileKeyList, "listFromXPCData:", v11));

  BOOL v13 = xpc_dictionary_get_BOOL(v6, "disk");
  BOOL v14 = xpc_dictionary_get_BOOL(v6, "net");
  BOOL v15 = xpc_dictionary_get_BOOL(v6, "wifi");
  BOOL v16 = xpc_dictionary_get_BOOL(v6, "preload");
  BOOL v17 = xpc_dictionary_get_BOOL(v6, "proactively_load_on_failure");
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___GEOResourceManifestConfiguration, v18);
  uint64_t v20 = GEODecodeXPCValue(v6, "mcfg", v19, 0LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = sub_10002990C(v6);
  uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = v13;
  if (v14) {
    uint64_t v24 = v13 | 2LL;
  }
  if (v15) {
    v24 |= 8uLL;
  }
  BOOL v25 = !v17;
  uint64_t v26 = (void *)v23;
  if (v25) {
    uint64_t v27 = v24;
  }
  else {
    uint64_t v27 = v24 | 0x100;
  }
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[GEOTileLoader modernLoaderForResourceManifestConfiguration:locale:]( &OBJC_CLASS___GEOTileLoader,  "modernLoaderForResourceManifestConfiguration:locale:",  v21,  v23));
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  v30 = reply;
  if (reply)
  {
    uint64_t v209 = v27;
    xpc_dictionary_set_string(reply, "event", "tiles.finished");
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v6);
    uint64_t v32 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    if (![v12 count])
    {
      xpc_connection_send_message(v32, v30);
LABEL_49:

      goto LABEL_50;
    }

    connection = v32;
    v212 = v26;
    xpc_object_t message = v30;
    id v213 = v6;
    v214 = v12;
    v215 = v28;
    if (v16 && ([v7 hasEntitlement:@"com.apple.geoservices.preload"] & 1) == 0)
    {
      v198 = v21;
      v56 = NSStringFromSelector(a2);
      __int16 v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
      __int16 v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not allowed for %@ because of missing entitlement",  v57,  v58));

      NSLog(@"%@", v59);
      id v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](&OBJC_CLASS___NSError, "GEOErrorWithCode:reason:", -5LL, v59));
      __int128 v277 = 0u;
      __int128 v278 = 0u;
      __int128 v279 = 0u;
      __int128 v280 = 0u;
      id v61 = v12;
      id v62 = [v61 countByEnumeratingWithState:&v277 objects:v299 count:16];
      if (v62)
      {
        id v63 = v62;
        uint64_t v64 = *(void *)v278;
        do
        {
          for (i = 0LL; i != v63; i = (char *)i + 1)
          {
            if (*(void *)v278 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = *(void *)(*((void *)&v277 + 1) + 8LL * (void)i);
            v67 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v60,  0LL,  v66,  v67);
          }

          id v63 = [v61 countByEnumeratingWithState:&v277 objects:v299 count:16];
        }

        while (v63);
      }

      uint64_t v32 = connection;
      v30 = message;
      xpc_connection_send_message(connection, message);

      id v6 = v213;
      id v12 = v214;
      v21 = v198;
      uint64_t v26 = v212;
      id v28 = v215;
      goto LABEL_49;
    }

    xpc_object_t v33 = xpc_dictionary_get_value(v6, "priorities");
    id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v207 = v34;
    if (xpc_get_type(v34) != (xpc_type_t)&_xpc_type_data)
    {
      uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Bad XPC request encoding (type)"));
      v36 = v12;
      id v37 = (void *)v35;
      __int128 v273 = 0u;
      __int128 v274 = 0u;
      __int128 v275 = 0u;
      __int128 v276 = 0u;
      id v38 = v36;
      id v39 = [v38 countByEnumeratingWithState:&v273 objects:v298 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v274;
        do
        {
          for (j = 0LL; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v274 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v273 + 1) + 8LL * (void)j);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v7 peerID]);
            -[GEOTileServer _receivedTile:error:info:forKey:forPeer:]( self,  "_receivedTile:error:info:forKey:forPeer:",  0LL,  v37,  0LL,  v43,  v44);
          }

          id v40 = [v38 countByEnumeratingWithState:&v273 objects:v298 count:16];
        }

        while (v40);
      }

- (void)cancel:(id)a3 fromPeer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  *(void *)length = 0LL;
  data = (__int128 *)xpc_dictionary_get_data(v5, "key", (size_t *)length);
  if (*(void *)length == 16LL)
  {
    char v17 = 1;
    __int128 v16 = xmmword_100045D18;
    __int128 v16 = *data;
    int64_t int64 = xpc_dictionary_get_int64(v5, "batch");
    id v9 = v6;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 peerID]);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%lli",  v10,  int64));

    id v12 = sub_10002B4C0(v9, v5);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v13 cancelKey:&v16 forClient:v11];
  }

  else
  {
    __int128 v16 = 0uLL;
    char v17 = 0;
    uint64_t v14 = GEOGetTileLoadingLog(data);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)length = 138412290;
      *(void *)&length[4] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "Received wrong length for tileKey from peer %@",  length,  0xCu);
    }
  }
}

- (void)reprioritizeKey:(id)a3 fromPeer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  *(void *)length = 0LL;
  data = (__int128 *)xpc_dictionary_get_data(v5, "key", (size_t *)length);
  if (*(void *)length != 16LL)
  {
    __int128 v17 = 0uLL;
    char v18 = 0;
    uint64_t v15 = GEOGetTileLoadingLog(data);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)length = 138412290;
      *(void *)&length[4] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "Received wrong length for tileKey from peer %@",  length,  0xCu);
    }

    goto LABEL_6;
  }

  char v18 = 1;
  __int128 v17 = xmmword_100045D18;
  __int128 v17 = *data;
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "priority");
  if ((_DWORD)uint64)
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, "batch");
    id v10 = v6;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peerID]);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%lli",  v11,  int64));

    id v13 = sub_10002B4C0(v10, v5);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v14 reprioritizeKey:&v17 forClient:v12 newPriority:uint64];

LABEL_6:
  }
}

- (void)canShrinkBySize:(id)a3 fromPeer:(id)a4
{
}

- (void)canShrinkBySizeSync:(id)a3 fromPeer:(id)a4
{
}

- (void)_canShrinkBySize:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 serverQueue]);
  dispatch_assert_queue_V2(v11);

  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  if (reply)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v8);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_10002B970;
    id v22 = &unk_10005A4C0;
    id v23 = reply;
    id v15 = v14;
    id v24 = v15;
    __int128 v16 = objc_retainBlock(&v19);
    id v17 = sub_10002B4C0(v9, v8);
    if (v5)
    {
      char v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      ((void (*)(void ***, id))v16[2])( v16,  objc_msgSend(v18, "calculateFreeableSizeSync", v19, v20, v21, v22, v23));
    }

    else
    {
      char v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      objc_msgSend(v18, "calculateFreeableSizeWithCallbackQ:finished:", self->_queue, v16, v19, v20, v21, v22, v23);
    }
  }
}

- (void)shrinkDB:(id)a3 fromPeer:(id)a4
{
}

- (void)shrinkDBSync:(id)a3 fromPeer:(id)a4
{
}

- (void)_shrinkDB:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 serverQueue]);
  dispatch_assert_queue_V2(v11);

  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  id v13 = reply;
  if (reply)
  {
    BOOL v34 = v5;
    v36 = reply;
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v8);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    id v37 = v8;
    uint64_t v32 = self;
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "sz");
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 peers]);

    id v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = 0LL;
      id v38 = 0LL;
      uint64_t v20 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v16);
          }
          id v22 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
          if ([v23 isEqual:v24])
          {
          }

          else
          {
            unsigned __int8 v25 = [v22 isLocationd];

            if ((v25 & 1) == 0)
            {
              uint64_t v26 = v38;
              if (!v38) {
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
              }
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleIdentifier]);
              id v38 = v26;
              [v26 appendFormat:@"%@, ", v27];

              ++v19;
            }
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }

      while (v18);
    }

    else
    {
      uint64_t v19 = 0LL;
      id v38 = 0LL;
    }

    objc_msgSend(v38, "deleteCharactersInRange:", (char *)objc_msgSend(v38, "length") - 2, 2);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10002BD48;
    v39[3] = &unk_10005A4C0;
    id v13 = v36;
    id v40 = v36;
    id v28 = v35;
    id v41 = v28;
    uint64_t v29 = objc_retainBlock(v39);
    if (v19
      && ([v9 hasEntitlement:@"com.apple.geoservices.shrinkdb.force"] & 1) == 0)
    {
      NSLog(@"Refusing to shrink tile db because there are clients: %@", v38);
      ((void (*)(void *, void))v29[2])(v29, 0LL);
      id v8 = v37;
    }

    else
    {
      id v8 = v37;
      id v30 = sub_10002B4C0(v9, v37);
      id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      if (v34) {
        ((void (*)(void *, id))v29[2])(v29, [v31 shrinkDiskCacheToSizeSync:uint64]);
      }
      else {
        [v31 shrinkDiskCacheToSize:uint64 callbackQ:v32->_queue finished:v29];
      }
    }
  }
}

- (void)corrupt:(id)a3 fromPeer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  size_t length = 0LL;
  data = xpc_dictionary_get_data(v5, "key", &length);
  if (length == 16)
  {
    char v13 = 1;
    *(_OWORD *)buf = xmmword_100045D18;
    *(_OWORD *)buf = *data;
    id v8 = sub_10002B4C0(v6, v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v9 reportCorruptTile:buf];
  }

  else
  {
    uint64_t v10 = GEOGetTileLoadingLog(data);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_FAULT,  "Peer %@ provided incorrect tile key data for corrupt data",  buf,  0xCu);
    }
  }
}

- (void)beginPreload:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 serverQueue]);
  dispatch_assert_queue_V2(v9);

  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "sz");
  [v6 setPreloading:1];
  id v11 = sub_10002B4C0(v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 peerID]);
  [v13 beginPreloadSessionOfSize:uint64 forClient:v12];
}

- (void)endPreload:(id)a3 fromPeer:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if ([v5 preloading])
  {
    [v5 setPreloading:0];
    id v6 = sub_10002B4C0(v5, v9);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
    [v7 endPreloadSessionForClient:v8];
  }
}

- (void)peerDidConnect:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 peerID]);

  [v5 openForClient:v4];
}

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 serverQueue]);
  dispatch_assert_queue_V2(v6);

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  pendingPeerToClientIdentifiers = self->_pendingPeerToClientIdentifiers;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 peerID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingPeerToClientIdentifiers,  "objectForKeyedSubscript:",  v8));

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
        [v15 cancelAllForClient:v14];

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v11);
  }

  __int128 v16 = self->_pendingPeerToClientIdentifiers;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 peerID]);
  -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

  if ([v4 preloading])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 peerID]);
    [v18 endPreloadSessionForClient:v19];

    [v4 setPreloading:0];
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](&OBJC_CLASS___GEOTileLoader, "modernLoader"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v4 peerID]);
  [v20 closeForClient:v21];

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___GEOTileServer;
  -[GEOTileServer peerDidDisconnect:](&v22, "peerDidDisconnect:", v4);
}

- (void)_receivedTile:(void *)a3 error:(void *)a4 info:(void *)a5 forKey:(const void *)a6 forPeer:(void *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 daemon]);
  __int128 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v15 serverQueue]);
  dispatch_assert_queue_V2(v16);

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 daemon]);
  xpc_object_t v18 = (xpc_object_t)objc_claimAutoreleasedReturnValue([v17 peers]);

  id v19 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v19)
  {
    objc_super v22 = 0LL;
LABEL_24:

    goto LABEL_25;
  }

  id v20 = v19;
  id v37 = v13;
  id v38 = v12;
  id v21 = v11;
  objc_super v22 = 0LL;
  uint64_t v23 = *(void *)v41;
  do
  {
    for (i = 0LL; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v41 != v23) {
        objc_enumerationMutation(v18);
      }
      __int128 v25 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 peerID]);
      unsigned int v27 = [v14 isEqualToString:v26];

      if (v27)
      {
        id v28 = v25;

        objc_super v22 = v28;
      }
    }

    id v20 = [v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }

  while (v20);

  id v11 = v21;
  if (v22)
  {
    id v13 = v37;
    id v12 = v38;
    if (!v38
      || [v38 code] != (id)-2
      || (uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v38 domain]),
          uint64_t v30 = GEOErrorDomain(),
          id v31 = (void *)objc_claimAutoreleasedReturnValue(v30),
          unsigned __int8 v32 = [v29 isEqualToString:v31],
          v31,
          v29,
          (v32 & 1) == 0))
    {
      xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_data(v18, "tileKey", a6, 0x10uLL);
      if (v11)
      {
        xpc_dictionary_set_string(v18, "event", "tiles.tile");
        xpc_object_t v33 = xpc_dictionary_create(0LL, 0LL, 0LL);
        [v11 encodeToXPCDictionary:v33];
        BOOL v34 = "tileData";
      }

      else
      {
        xpc_dictionary_set_string(v18, "event", "tiles.err");
        xpc_object_t v33 = objc_msgSend(v38, "_geo_newXPCData");
        if (!v33)
        {
LABEL_21:

          if (v37)
          {
            id v35 = objc_msgSend(v37, "_geo_newXPCObject");
            xpc_dictionary_set_value(v18, "tileInfo", v35);
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue([v22 connection]);
          [v36 sendMessage:v18];

          goto LABEL_24;
        }

        BOOL v34 = "err";
      }

      xpc_dictionary_set_value(v18, v34, v33);
      goto LABEL_21;
    }
  }

  else
  {
    id v13 = v37;
    id v12 = v38;
  }

- (void)tileLoader:(id)a3 submittedTilesToNetwork:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 serverQueue]);
  dispatch_assert_queue_V2(v12);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTileServer daemon](self, "daemon"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peers]);

  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v15)
  {
    xpc_object_t v18 = v14;
    goto LABEL_13;
  }

  id v16 = v15;
  id v28 = v9;
  id v17 = v8;
  xpc_object_t v18 = 0LL;
  uint64_t v19 = *(void *)v30;
  do
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v14);
      }
      id v21 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v21 peerID]);
      unsigned int v23 = [v10 isEqualToString:v22];

      if (v23)
      {
        id v24 = v21;

        xpc_object_t v18 = v24;
      }
    }

    id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }

  while (v16);

  id v8 = v17;
  id v9 = v28;
  if (v18)
  {
    xpc_object_t v25 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v25, "event", "tiles.net");
    id v26 = [v28 newXPCData];
    xpc_dictionary_set_value(v25, "list", v26);
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v18 connection]);
    [v27 sendMessage:v25];

LABEL_13:
  }
}

- (void)enumerateTiles:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  id v9 = reply;
  if (reply)
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(reply);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    if (v11)
    {
      BOOL v12 = xpc_dictionary_get_BOOL(v6, "include_data");
      id v13 = dispatch_group_create();
      id v14 = sub_10002B4C0(v7, v6);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      queue = self->_queue;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10002C980;
      v22[3] = &unk_10005A4E8;
      BOOL v24 = v12;
      id v17 = v11;
      id v23 = v17;
      [v15 enumerateAllKeysIncludingData:v12 onQueue:queue group:v13 dataHandler:v22];

      xpc_object_t v18 = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002CADC;
      block[3] = &unk_100059520;
      id v20 = v17;
      id v21 = v9;
      dispatch_group_notify(v13, v18, block);
    }
  }
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned __int8 v7 = [v6 isEqualToString:GEOProactiveTileDownloaderTaskIdentifier];

  if ((v7 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___GEOTileServer;
    -[GEOTileServer runBackgroundTask:](&v8, "runBackgroundTask:", v4);
  }
}

- (void).cxx_destruct
{
}

@end