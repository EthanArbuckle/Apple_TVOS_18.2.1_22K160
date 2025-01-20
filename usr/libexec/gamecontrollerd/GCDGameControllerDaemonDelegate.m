@interface GCDGameControllerDaemonDelegate
- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4;
- (BOOL)acceptNewConnectionFromMediaRemote:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldKeepRunning;
- (GCDGameControllerDaemonDelegate)init;
- (void)addController:(id)a3 forward:(BOOL)a4;
- (void)appDidEnterBackground;
- (void)appDidEnterBackgroundWithPID:(int)a3;
- (void)appWillEnterForeground;
- (void)appWillEnterForegroundWithPID:(int)a3;
- (void)controllerDidConnect:(id)a3;
- (void)controllerDidDisconnect:(id)a3;
- (void)controllerWithUDID:(unint64_t)a3 setArrayValue:(id)a4 forElement:(int)a5 forward:(BOOL)a6;
- (void)controllerWithUDID:(unint64_t)a3 setValue:(float)a4 forElement:(int)a5 forward:(BOOL)a6;
- (void)dealloc;
- (void)microControllerWithDigitizerX:(float)a3 withY:(float)a4 withTimeStamp:(unint64_t)a5 touchDown:(BOOL)a6;
- (void)microControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 digitizerY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7;
- (void)ping;
- (void)processMicroControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 withY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7;
- (void)removeController:(id)a3 forward:(BOOL)a4;
@end

@implementation GCDGameControllerDaemonDelegate

- (GCDGameControllerDaemonDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GCDGameControllerDaemonDelegate;
  v2 = -[GCDGameControllerDaemonDelegate init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    appConnections = v2->_appConnections;
    v2->_appConnections = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    foregroundAppConnections = v2->_foregroundAppConnections;
    v2->_foregroundAppConnections = v5;
  }

  return v2;
}

- (void)dealloc
{
  if (sub_1000065FC())
  {
    id v3 = sub_100006820();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GCDGameControllerDaemonDelegate;
  -[GCDGameControllerDaemonDelegate dealloc](&v5, "dealloc");
}

- (void)ping
{
  if (sub_1000065FC())
  {
    id v2 = sub_100006820();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ping", v4, 2u);
    }
  }

- (BOOL)shouldKeepRunning
{
  return 1;
}

- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1000065FC())
  {
    id v14 = sub_100006820();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "acceptNewConnectionFromGCEnabledApp: %@",  (uint8_t *)location,  0xCu);
    }
  }

  objc_super v8 = self->_foregroundAppConnections;
  objc_sync_enter(v8);
  -[NSMutableArray addObject:](self->_foregroundAppConnections, "addObject:", v6);
  objc_sync_exit(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GameControllerDaemon));
  [v6 setExportedInterface:v9];

  [v6 setExportedObject:self];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GameControllerClientProtocol));
  [v6 setRemoteObjectInterface:v10];

  v11 = self->_appConnections;
  objc_sync_enter(v11);
  -[NSMutableArray addObject:](self->_appConnections, "addObject:", v6);
  objc_sync_exit(v11);

  objc_initWeak(location, v6);
  objc_initWeak(&from, self->_appConnections);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_100003B08;
  v19 = &unk_10000C348;
  objc_copyWeak(&v21, location);
  objc_copyWeak(&v22, &from);
  v20 = self;
  v12 = objc_retainBlock(&v16);
  objc_msgSend(v6, "setInvalidationHandler:", v12, v16, v17, v18, v19);
  [v6 setInterruptionHandler:v12];
  [v6 resume];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return 1;
}

- (BOOL)acceptNewConnectionFromMediaRemote:(id)a3
{
  v4 = (NSXPCConnection *)a3;
  if (sub_1000065FC())
  {
    id v12 = sub_100006820();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "acceptNewConnectionFromMediaRemote: %@",  (uint8_t *)location,  0xCu);
    }
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GameControllerDaemon));
  -[NSXPCConnection setExportedInterface:](v4, "setExportedInterface:", v5);

  -[NSXPCConnection setExportedObject:](v4, "setExportedObject:", self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GameControllerClientProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v6);

  objc_initWeak(location, v4);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003E98;
  v14[3] = &unk_10000C370;
  objc_copyWeak(&v15, location);
  id v7 = objc_retainBlock(v14);
  -[NSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", v7);
  -[NSXPCConnection setInterruptionHandler:](v4, "setInterruptionHandler:", v7);
  -[NSXPCConnection resume](v4, "resume");
  objc_super v8 = self->_mediaremoted;
  objc_sync_enter(v8);
  mediaremoted = self->_mediaremoted;
  self->_mediaremoted = v4;
  v10 = v4;

  objc_sync_exit(v8);
  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = GCBundleWithPID([v7 processIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (sub_1000065FC())
  {
    id v15 = sub_100006820();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 resourcePath]);
      int v18 = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "New connection '%@' for listener '%@' from %@",  (uint8_t *)&v18,  0x20u);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 resourcePath]);
  unsigned int v11 = [v10 containsString:@"/System/Library/PrivateFrameworks/MediaRemote.framework/Support"];

  if (v11) {
    unsigned __int8 v12 = -[GCDGameControllerDaemonDelegate acceptNewConnectionFromMediaRemote:]( self,  "acceptNewConnectionFromMediaRemote:",  v7);
  }
  else {
    unsigned __int8 v12 = -[GCDGameControllerDaemonDelegate acceptNewConnection:fromGCEnabledApp:]( self,  "acceptNewConnection:fromGCEnabledApp:",  v7,  0LL);
  }
  BOOL v13 = v12;

  return v13;
}

- (void)controllerWithUDID:(unint64_t)a3 setValue:(float)a4 forElement:(int)a5 forward:(BOOL)a6
{
  uint64_t v7 = *(void *)&a5;
  if (sub_1000065FC())
  {
    id v20 = sub_100006820();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v28 = a3;
      __int16 v29 = 2048;
      double v30 = a4;
      __int16 v31 = 1024;
      int v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "udid:%ld, value:%f, element:%d", buf, 0x1Cu);
    }
  }

  unsigned int v11 = self->_foregroundAppConnections;
  objc_sync_enter(v11);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  unsigned __int8 v12 = self->_foregroundAppConnections;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    BOOL v15 = (_DWORD)v7 != 24 || a6;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v22 + 1) + 8 * (void)v16),  "remoteObjectProxyWithErrorHandler:",  &stru_10000C3B0,  (void)v22));
        id v19 = v17;
        if (v15)
        {
          *(float *)&double v18 = a4;
          [v17 controllerWithUDID:a3 setValue:v7 forElement:v18];
        }

        v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)controllerWithUDID:(unint64_t)a3 setArrayValue:(id)a4 forElement:(int)a5 forward:(BOOL)a6
{
  uint64_t v6 = *(void *)&a5;
  float v7 = a4.var0[3];
  float v8 = a4.var0[2];
  float v9 = a4.var0[1];
  float v10 = a4.var0[0];
  id v13 = self->_foregroundAppConnections;
  objc_sync_enter(v13);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v14 = self->_foregroundAppConnections;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        double v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v23 + 1) + 8 * (void)v17),  "remoteObjectProxyWithErrorHandler:",  &stru_10000C3D0,  (void)v23));
        *(float *)&double v19 = v10;
        *(float *)&double v20 = v9;
        *(float *)&double v21 = v8;
        *(float *)&double v22 = v7;
        [v18 controllerWithUDID:a3 setValue0:v6 setValue1:v19 setValue2:v20 setValue3:v21 forElement:v22];

        uint64_t v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    }

    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)microControllerWithDigitizerX:(float)a3 withY:(float)a4 withTimeStamp:(unint64_t)a5 touchDown:(BOOL)a6
{
  if (sub_1000065FC())
  {
    id v6 = sub_100006820();
    float v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "microControllerWithDigitizerX called unexpectedly. NO-OP",  v8,  2u);
    }
  }

- (void)microControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 digitizerY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7
{
  BOOL v7 = a7;
  if (sub_1000065FC())
  {
    id v19 = sub_100006820();
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134218752;
      unint64_t v22 = a3;
      __int16 v23 = 2048;
      double v24 = a4;
      __int16 v25 = 2048;
      double v26 = a5;
      __int16 v27 = 1024;
      BOOL v28 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "UDID:%ld, digitizerXY:%.1f,%.1f, touchDown:%d",  (uint8_t *)&v21,  0x26u);
    }

    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    LODWORD(v13) = 0;
    LODWORD(v14) = 0;
    id v15 = self;
    unint64_t v16 = a3;
    unint64_t v17 = a6;
    uint64_t v18 = 0LL;
    goto LABEL_8;
  }

  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  id v15 = self;
  unint64_t v16 = a3;
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  unint64_t v17 = a6;
  uint64_t v18 = 1LL;
LABEL_8:
  -[GCDGameControllerDaemonDelegate processMicroControllerWithUDID:setDigitizerX:withY:withTimeStamp:touchDown:]( v15,  "processMicroControllerWithUDID:setDigitizerX:withY:withTimeStamp:touchDown:",  v16,  v17,  v18,  v13,  v14);
}

- (void)processMicroControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 withY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7
{
  BOOL v7 = a7;
  double v13 = self->_foregroundAppConnections;
  objc_sync_enter(v13);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  double v14 = self->_foregroundAppConnections;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      unint64_t v17 = 0LL;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v21 + 1) + 8 * (void)v17),  "remoteObjectProxy",  (void)v21));
        *(float *)&double v19 = a4;
        *(float *)&double v20 = a5;
        [v18 microControllerWithUDID:a3 setDigitizerX:a6 digitizerY:v7 withTimeStamp:v19 touchDown:v20];

        unint64_t v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    }

    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)controllerDidConnect:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[GCDGameControllerDaemonDelegate addController:forward:](self, "addController:forward:", v4, 1LL);
}

- (void)addController:(id)a3 forward:(BOOL)a4
{
  id v6 = a3;
  if (sub_1000065FC())
  {
    id v49 = sub_100006820();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v6;
      __int16 v141 = 2048;
      id v142 = [v6 deviceHash];
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "addController:%@ for hash:%lu",  location,  0x16u);
    }
  }

  if (!a4)
  {
    BOOL v7 = self->_appConnections;
    objc_sync_enter(v7);
    __int128 v135 = 0u;
    __int128 v136 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    float v8 = self->_appConnections;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v135,  v139,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v136;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v136 != v10) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v135 + 1) + 8 * (void)i) remoteObjectProxy]);
          [v12 addControllerForAppStoreRemote:v6];
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v135,  v139,  16LL);
      }

      while (v9);
    }

    objc_sync_exit(v7);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([v6 gamepad]);
  v51 = (void *)objc_claimAutoreleasedReturnValue([v53 dpad]);
  objc_initWeak((id *)location, self);
  id v52 = v6;
  id v13 = [v52 deviceHash];
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472LL;
  v132[2] = sub_100005560;
  v132[3] = &unk_10000C3F8;
  objc_copyWeak(v133, (id *)location);
  v133[1] = v13;
  BOOL v134 = a4;
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v51 down]);
  [v14 setValueChangedHandler:v132];

  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472LL;
  v129[2] = sub_1000055B4;
  v129[3] = &unk_10000C3F8;
  objc_copyWeak(v130, (id *)location);
  v130[1] = v13;
  BOOL v131 = a4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v51 right]);
  [v15 setValueChangedHandler:v129];

  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472LL;
  v126[2] = sub_100005608;
  v126[3] = &unk_10000C3F8;
  objc_copyWeak(v127, (id *)location);
  v127[1] = v13;
  BOOL v128 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v51 left]);
  [v16 setValueChangedHandler:v126];

  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472LL;
  v123[2] = sub_10000565C;
  v123[3] = &unk_10000C3F8;
  objc_copyWeak(v124, (id *)location);
  v124[1] = v13;
  BOOL v125 = a4;
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v51 up]);
  [v17 setValueChangedHandler:v123];

  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472LL;
  v120[2] = sub_1000056B0;
  v120[3] = &unk_10000C3F8;
  objc_copyWeak(v121, (id *)location);
  v121[1] = v13;
  BOOL v122 = a4;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v53 buttonA]);
  [v18 setValueChangedHandler:v120];

  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_100005704;
  v117[3] = &unk_10000C3F8;
  objc_copyWeak(v118, (id *)location);
  v118[1] = v13;
  BOOL v119 = a4;
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v53 buttonB]);
  [v19 setValueChangedHandler:v117];

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472LL;
  v114[2] = sub_100005758;
  v114[3] = &unk_10000C3F8;
  objc_copyWeak(v115, (id *)location);
  v115[1] = v13;
  BOOL v116 = a4;
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v53 buttonX]);
  [v20 setValueChangedHandler:v114];

  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472LL;
  v111[2] = sub_1000057AC;
  v111[3] = &unk_10000C3F8;
  objc_copyWeak(v112, (id *)location);
  v112[1] = v13;
  BOOL v113 = a4;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v53 buttonY]);
  [v21 setValueChangedHandler:v111];

  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472LL;
  v108[2] = sub_100005800;
  v108[3] = &unk_10000C3F8;
  objc_copyWeak(v109, (id *)location);
  v109[1] = v13;
  BOOL v110 = a4;
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v53 leftShoulder]);
  [v22 setValueChangedHandler:v108];

  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472LL;
  v105[2] = sub_100005854;
  v105[3] = &unk_10000C3F8;
  objc_copyWeak(v106, (id *)location);
  v106[1] = v13;
  BOOL v107 = a4;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v53 rightShoulder]);
  [v23 setValueChangedHandler:v105];

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v52 extendedGamepad]);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472LL;
  v102[2] = sub_1000058A8;
  v102[3] = &unk_10000C3F8;
  objc_copyWeak(v103, (id *)location);
  v103[1] = v13;
  BOOL v104 = a4;
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 leftThumbstick]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 down]);
  [v26 setValueChangedHandler:v102];

  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_1000058FC;
  v99[3] = &unk_10000C3F8;
  objc_copyWeak(v100, (id *)location);
  v100[1] = v13;
  BOOL v101 = a4;
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v24 leftThumbstick]);
  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 right]);
  [v28 setValueChangedHandler:v99];

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472LL;
  v96[2] = sub_100005950;
  v96[3] = &unk_10000C3F8;
  objc_copyWeak(v97, (id *)location);
  v97[1] = v13;
  BOOL v98 = a4;
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v24 leftThumbstick]);
  double v30 = (void *)objc_claimAutoreleasedReturnValue([v29 left]);
  [v30 setValueChangedHandler:v96];

  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472LL;
  v93[2] = sub_1000059A4;
  v93[3] = &unk_10000C3F8;
  objc_copyWeak(v94, (id *)location);
  v94[1] = v13;
  BOOL v95 = a4;
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v24 leftThumbstick]);
  int v32 = (void *)objc_claimAutoreleasedReturnValue([v31 up]);
  [v32 setValueChangedHandler:v93];

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472LL;
  v90[2] = sub_1000059F8;
  v90[3] = &unk_10000C3F8;
  objc_copyWeak(v91, (id *)location);
  v91[1] = v13;
  BOOL v92 = a4;
  v33 = (void *)objc_claimAutoreleasedReturnValue([v24 rightThumbstick]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 down]);
  [v34 setValueChangedHandler:v90];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_100005A4C;
  v87[3] = &unk_10000C3F8;
  objc_copyWeak(v88, (id *)location);
  v88[1] = v13;
  BOOL v89 = a4;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v24 rightThumbstick]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 right]);
  [v36 setValueChangedHandler:v87];

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100005AA0;
  v84[3] = &unk_10000C3F8;
  objc_copyWeak(v85, (id *)location);
  v85[1] = v13;
  BOOL v86 = a4;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v24 rightThumbstick]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 left]);
  [v38 setValueChangedHandler:v84];

  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472LL;
  v81[2] = sub_100005AF4;
  v81[3] = &unk_10000C3F8;
  objc_copyWeak(v82, (id *)location);
  v82[1] = v13;
  BOOL v83 = a4;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v24 rightThumbstick]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 up]);
  [v40 setValueChangedHandler:v81];

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_100005B48;
  v78[3] = &unk_10000C3F8;
  objc_copyWeak(v79, (id *)location);
  v79[1] = v13;
  BOOL v80 = a4;
  v41 = (void *)objc_claimAutoreleasedReturnValue([v24 leftTrigger]);
  [v41 setValueChangedHandler:v78];

  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_100005B9C;
  v75[3] = &unk_10000C3F8;
  objc_copyWeak(v76, (id *)location);
  v76[1] = v13;
  BOOL v77 = a4;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v24 rightTrigger]);
  [v42 setValueChangedHandler:v75];

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_100005BF0;
  v72[3] = &unk_10000C3F8;
  objc_copyWeak(v73, (id *)location);
  v73[1] = v13;
  BOOL v74 = a4;
  v43 = (void *)objc_claimAutoreleasedReturnValue([v24 buttonMenu]);
  [v43 setValueChangedHandler:v72];

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_100005C44;
  v69[3] = &unk_10000C3F8;
  objc_copyWeak(v70, (id *)location);
  v70[1] = v13;
  BOOL v71 = a4;
  v44 = (void *)objc_claimAutoreleasedReturnValue([v24 buttonOptions]);
  [v44 setValueChangedHandler:v69];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_100005C98;
  v66[3] = &unk_10000C3F8;
  objc_copyWeak(v67, (id *)location);
  v67[1] = v13;
  BOOL v68 = a4;
  v45 = (void *)objc_claimAutoreleasedReturnValue([v24 buttonHome]);
  [v45 setValueChangedHandler:v66];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100005CEC;
  v63[3] = &unk_10000C3F8;
  objc_copyWeak(v64, (id *)location);
  v64[1] = v13;
  BOOL v65 = a4;
  v46 = (void *)objc_claimAutoreleasedReturnValue([v24 leftThumbstickButton]);
  [v46 setValueChangedHandler:v63];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_100005D40;
  v60[3] = &unk_10000C3F8;
  objc_copyWeak(v61, (id *)location);
  v61[1] = v13;
  BOOL v62 = a4;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v24 rightThumbstickButton]);
  [v47 setValueChangedHandler:v60];

  if (([v52 isATVRemote] & 1) == 0)
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_100005D94;
    v57[3] = &unk_10000C420;
    objc_copyWeak(v58, (id *)location);
    v58[1] = v13;
    BOOL v59 = a4;
    v48 = (void *)objc_claimAutoreleasedReturnValue([v52 motion]);
    [v48 setValueChangedHandler:v57];

    objc_destroyWeak(v58);
  }

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_100005E9C;
  v54[3] = &unk_10000C448;
  objc_copyWeak(v55, (id *)location);
  v55[1] = v13;
  BOOL v56 = a4;
  [v52 setControllerPausedHandler:v54];
  objc_destroyWeak(v55);
  objc_destroyWeak(v61);
  objc_destroyWeak(v64);
  objc_destroyWeak(v67);
  objc_destroyWeak(v70);
  objc_destroyWeak(v73);
  objc_destroyWeak(v76);
  objc_destroyWeak(v79);
  objc_destroyWeak(v82);
  objc_destroyWeak(v85);
  objc_destroyWeak(v88);
  objc_destroyWeak(v91);
  objc_destroyWeak(v94);
  objc_destroyWeak(v97);
  objc_destroyWeak(v100);
  objc_destroyWeak(v103);

  objc_destroyWeak(v106);
  objc_destroyWeak(v109);
  objc_destroyWeak(v112);
  objc_destroyWeak(v115);
  objc_destroyWeak(v118);
  objc_destroyWeak(v121);
  objc_destroyWeak(v124);
  objc_destroyWeak(v127);
  objc_destroyWeak(v130);
  objc_destroyWeak(v133);

  objc_destroyWeak((id *)location);
}

- (void)controllerDidDisconnect:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  -[GCDGameControllerDaemonDelegate removeController:forward:](self, "removeController:forward:", v4, 1LL);
}

- (void)removeController:(id)a3 forward:(BOOL)a4
{
  id v6 = a3;
  if (sub_1000065FC())
  {
    id v13 = sub_100006820();
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2048;
      id v23 = [v6 deviceHash];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "removeController:%@ for hash: %lu",  buf,  0x16u);
    }
  }

  if (!a4)
  {
    BOOL v7 = self->_appConnections;
    objc_sync_enter(v7);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    float v8 = self->_appConnections;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        unsigned int v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v11),  "remoteObjectProxy",  (void)v15));
          [v12 removeController:v6];

          unsigned int v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v9);
    }

    objc_sync_exit(v7);
  }
}

- (void)appWillEnterForeground
{
  if (sub_1000065FC())
  {
    id v2 = sub_100006820();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "appWillEnterForeground", v4, 2u);
    }
  }

- (void)appDidEnterBackground
{
  if (sub_1000065FC())
  {
    id v2 = sub_100006820();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "appDidEnterBackground", v4, 2u);
    }
  }

- (void)appWillEnterForegroundWithPID:(int)a3
{
  if (sub_1000065FC())
  {
    id v13 = sub_100006820();
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "appWillEnterForegroundWithPID:%d", buf, 8u);
    }
  }

  objc_super v5 = self->_appConnections;
  objc_sync_enter(v5);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_appConnections;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "processIdentifier", (void)v15) == a3)
        {
          id v11 = v10;
          goto LABEL_12;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_12:

  objc_sync_exit(v5);
  unsigned __int8 v12 = self->_foregroundAppConnections;
  objc_sync_enter(v12);
  objc_sync_exit(v12);
}

- (void)appDidEnterBackgroundWithPID:(int)a3
{
  if (sub_1000065FC())
  {
    id v13 = sub_100006820();
    double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "appDidEnterBackgroundWithPID:%d", buf, 8u);
    }
  }

  objc_super v5 = self->_appConnections;
  objc_sync_enter(v5);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_appConnections;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "processIdentifier", (void)v15) == a3)
        {
          id v11 = v10;
          goto LABEL_12;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_12:

  objc_sync_exit(v5);
  unsigned __int8 v12 = self->_foregroundAppConnections;
  objc_sync_enter(v12);
  -[NSMutableArray removeObject:](self->_foregroundAppConnections, "removeObject:", v11);
  objc_sync_exit(v12);
}

- (void).cxx_destruct
{
}

@end