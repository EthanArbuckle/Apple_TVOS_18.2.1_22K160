@interface SDConnectedBrowser
+ (id)sharedBrowser;
- (BOOL)opticalDisk:(id)a3;
- (NSArray)airDropNodes;
- (NSArray)nodes;
- (NSArray)odiskNodes;
- (SDConnectedBrowser)init;
- (id)URLForRemounting:(id)a3;
- (id)connectedNodes;
- (id)recentNodes;
- (int)addNode:(__SFNode *)a3;
- (int)removeNode:(__SFNode *)a3;
- (void)addAirDropPerson:(__SFNode *)a3;
- (void)browseAfterDelay:(double)a3;
- (void)buildNodesAndNotify:(BOOL)a3;
- (void)combineRecentAndConnectedNodes:(BOOL)a3;
- (void)postNotification;
- (void)removeAirDropPerson:(__SFNode *)a3;
- (void)removeAirDropPersonInternal:(__SFNode *)a3;
- (void)setODiskServers:(id)a3;
- (void)setServers:(id)a3;
- (void)start;
- (void)stop;
- (void)volumesChanged:(id)a3;
@end

@implementation SDConnectedBrowser

+ (id)sharedBrowser
{
  if (qword_1006571C0 != -1) {
    dispatch_once(&qword_1006571C0, &stru_1005CEE70);
  }
  return (id)qword_1006571C8;
}

- (SDConnectedBrowser)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SDConnectedBrowser;
  v2 = -[SDConnectedBrowser init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    timer = v2->_timer;
    v2->_timer = 0LL;

    servers = v3->_servers;
    v3->_servers = 0LL;

    *(void *)&v3->_clientCount = 0LL;
    v3->_connectedCount = 0;
    odiskServers = v3->_odiskServers;
    v3->_odiskServers = 0LL;

    v3->_airDropPeople = 0LL;
    v3->_sendNotification = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v7;
  }

  return v3;
}

- (void)setServers:(id)a3
{
  id v5 = a3;
  if (sub_10008E314(self->_servers, v5))
  {
    objc_storeStrong((id *)&self->_servers, a3);
    self->_sendNotification = 1;
  }
}

- (void)setODiskServers:(id)a3
{
  id v5 = a3;
  if (sub_10008E314(self->_odiskServers, v5))
  {
    objc_storeStrong((id *)&self->_odiskServers, a3);
    self->_sendNotification = 1;
  }
}

- (NSArray)nodes
{
  return -[NSDictionary allValues](self->_servers, "allValues");
}

- (NSArray)odiskNodes
{
  return -[NSDictionary allValues](self->_odiskServers, "allValues");
}

- (void)postNotification
{
  if (self->_sendNotification)
  {
    self->_sendNotification = 0;
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v2 postNotificationName:@"com.apple.sharingd.ConnectedChanged" object:0 userInfo:0];
  }

- (void)browseAfterDelay:(double)a3
{
  timer = self->_timer;
  dispatch_time_t v4 = sub_100114580(a3);
  sub_100114638((dispatch_source_s *)timer, v4);
}

- (id)recentNodes
{
  id v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2, "allValues"));

  return v3;
}

- (int)addNode:(__SFNode *)a3
{
  return -1;
}

- (int)removeNode:(__SFNode *)a3
{
  return -1;
}

- (BOOL)opticalDisk:(id)a3
{
  uint64_t v15 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v3 = _CFURLGetVolumePropertyFlags(a3, 0x800000LL, &v15, &cf);
  if ((_DWORD)v3)
  {
    return BYTE2(v15) >> 7;
  }

  else
  {
    uint64_t v6 = browser_log(v3, v4);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100129344((uint64_t)&cf, v7, v8, v9, v10, v11, v12, v13);
    }

    CFRelease(cf);
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)URLForRemounting:(id)a3
{
  id v18 = 0LL;
  id v17 = 0LL;
  unsigned __int8 v3 = [a3 getResourceValue:&v18 forKey:NSURLVolumeURLForRemountingKey error:&v17];
  id v4 = v18;
  id v5 = v17;
  uint64_t v7 = v5;
  if ((v3 & 1) == 0)
  {
    uint64_t v8 = browser_log(v5, v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001293B0((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return v4;
}

- (id)connectedNodes
{
  v40 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v45 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v44 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v39 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  NSURLResourceKey v54 = NSURLVolumeURLForRemountingKey;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v36 = (void *)v3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mountedVolumeURLsIncludingResourceValuesForKeys:v3 options:2]);

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v50;
    uint64_t v37 = kSFNodeProtocolAFP;
    uint64_t v38 = kSFNodeProtocolFile;
    uint64_t v41 = kSFNodeKindConnected;
    uint64_t v42 = *(void *)v50;
    id v43 = v6;
    v47 = self;
    do
    {
      uint64_t v10 = 0LL;
      id v46 = v8;
      do
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v10);
        unsigned __int8 v12 = -[SDConnectedBrowser opticalDisk:](self, "opticalDisk:", v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser URLForRemounting:](self, "URLForRemounting:", v11));
        uint64_t v14 = v13;
        if ((v12 & 1) != 0 || v13)
        {
          uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 host]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 scheme]);
          v48 = v16;
          if ((v12 & 1) != 0)
          {
            uint64_t v17 = variable initialization expression of SDAirDropHashStoreCDB.writer();
            id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v17);
            if (v18) {
              goto LABEL_10;
            }
          }

          else
          {
            if (v15) {
              BOOL v21 = v16 == 0LL;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21 && ([v16 isEqual:v38] & 1) == 0)
            {
              id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor serverNameForHost:](self->_monitor, "serverNameForHost:", v15));
              if (!v18)
              {
                v22 = (__CFNetService *)_CFNetServiceCreateFromURL(0LL, v14);
                if (!v22
                  || (v23 = v22,
                      CFStringRef Name = CFNetServiceGetName(v22),
                      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(Name),
                      CFRelease(v23),
                      !v18))
                {
                  if (![v48 isEqual:v37]
                    || (v25 = sub_100116304(v11), (id v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v25)) == 0LL))
                  {
                    id v18 = v15;
                  }
                }
              }

- (void)combineRecentAndConnectedNodes:(BOOL)a3
{
  BOOL v40 = a3;
  uint64_t v3 = self;
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser recentNodes](self, "recentNodes"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDConnectedBrowser connectedNodes](v3, "connectedNodes"));
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v39 = [v4 count];
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  v44 = v3;
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v50;
    uint64_t v10 = kSFNodeKindConnected;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
        uint64_t v13 = (const void *)SFNodeCopyRealName(v12, v7);
        servers = v3->_servers;
        if (servers
          && (Copy = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](servers, "objectForKeyedSubscript:", v13)),
              Copy,
              Copy))
        {
          v16 = (const void *)SFNodeCopyURL(v12);
          id v18 = (const void *)SFNodeCopyModel(v12, v17);
          v20 = (void *)SFNodeCopyRealName(Copy, v19);
          SFNodeSetURL(Copy, v16);
          SFNodeSetModel(Copy, v18);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", Copy, v20);
          if (v18) {
            CFRelease(v18);
          }
          if (v16) {
            CFRelease(v16);
          }
          uint64_t v3 = v44;
        }

        else
        {
          Copy = (void *)SFNodeCreateCopy(0LL, v12);
          v20 = (void *)SFNodeCopyRealName(Copy, v21);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", Copy, v20);
          CFRelease(Copy);
        }

        SFNodeAddKind(Copy, v10);
        CFRelease(v13);
      }

      id v8 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }

    while (v8);
  }

  if (v39 != (id)v3->_connectedCount)
  {
    v3->_connectedCount = (int)v39;
    v3->_sendNotification = 1;
  }

  if (v40) {
    -[SDConnectedBrowser addToRecents:](v3, "addToRecents:", v5);
  }
  id v41 = [v42 count];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v22 = v42;
  id v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v25 = v23;
    uint64_t v26 = *(void *)v46;
    uint64_t v27 = kSFNodeKindConnected;
    uint64_t v28 = kSFNodeKindRecent;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(v22);
        }
        uint64_t v30 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)j);
        v31 = (void *)SFNodeCopyRealName(v30, v24);
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v31));

        if (v32) {
          goto LABEL_26;
        }
        v35 = v44->_servers;
        if (v35)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v31));

          if (v32)
          {
            v36 = (const void *)SFNodeCopyURL(v30);
            SFNodeSetURL(v32, v36);
            SFNodeRemoveKind(v32, v27);
            if (v36) {
              CFRelease(v36);
            }
LABEL_26:
            v34 = (void *)SFNodeCopyRealName(v32, v33);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, v34);
            goto LABEL_32;
          }
        }

        v34 = (void *)SFNodeCreateCopy(0LL, v30);
        uint64_t v38 = (const void *)SFNodeCopyRealName(v34, v37);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v34, v38);
        CFRelease(v38);
        v32 = v34;
LABEL_32:
        CFRelease(v34);
        SFNodeAddKind(v32, v28);
      }

      id v25 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }

    while (v25);
  }

  if (v41 != (id)v44->_recentsCount)
  {
    v44->_recentsCount = (int)v41;
    v44->_sendNotification = 1;
  }

  -[SDConnectedBrowser setServers:](v44, "setServers:", v5);
}

- (void)buildNodesAndNotify:(BOOL)a3
{
}

- (void)addAirDropPerson:(__SFNode *)a3
{
  airDropPeople = self->_airDropPeople;
  if (!airDropPeople)
  {
    airDropPeople = CFBagCreateMutable(0LL, 0LL, &kCFTypeBagCallBacks);
    self->_airDropPeople = airDropPeople;
  }

  CFBagAddValue(airDropPeople, a3);
  if (CFBagGetCountOfValue(self->_airDropPeople, a3) == 1)
  {
    SFNodeAddKind(a3, kSFNodeKindConnected);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100128F8C;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (NSArray)airDropNodes
{
  id v2 = sub_10008D61C(0LL, 0LL, self->_airDropPeople);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFSet allObjects](v2, "allObjects"));
    CFRelease(v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return (NSArray *)v4;
}

- (void)removeAirDropPersonInternal:(__SFNode *)a3
{
  if (!CFBagGetCountOfValue(self->_airDropPeople, a3))
  {
    SFNodeRemoveKind(a3, kSFNodeKindConnected);
    dispatch_async(&_dispatch_main_q, &stru_1005CEE90);
  }

- (void)removeAirDropPerson:(__SFNode *)a3
{
  unsigned int v5 = -[SDStatusMonitor wirelessEnabled](self->_monitor, "wirelessEnabled");
  double v6 = 0.0;
  if (v5) {
    double v6 = 2.0;
  }
  dispatch_time_t v7 = sub_100114580(v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100129168;
  v8[3] = &unk_1005CC330;
  v8[4] = self;
  v8[5] = a3;
  dispatch_after(v7, &_dispatch_main_q, v8);
}

- (void)volumesChanged:(id)a3
{
}

- (void)start
{
  int clientCount = self->_clientCount;
  self->_int clientCount = clientCount + 1;
  if (!clientCount)
  {
    if (!self->_timer)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100129270;
      v8[3] = &unk_1005CB2F8;
      v8[4] = self;
      id v4 = sub_100114598(1, &_dispatch_main_q, v8);
      unsigned int v5 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v4);
      timer = self->_timer;
      self->_timer = v5;

      dispatch_resume((dispatch_object_t)self->_timer);
    }

    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 addObserver:self selector:"volumesChanged:" name:@"com.apple.sharingd.VolumesChanged" object:0];
  }

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_int clientCount = v2;
  if (!v2)
  {
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel((dispatch_source_t)timer);
      unsigned int v5 = self->_timer;
      self->_timer = 0LL;
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self];

    servers = self->_servers;
    self->_servers = 0LL;

    odiskServers = self->_odiskServers;
    self->_odiskServers = 0LL;

    self->_recentsCount = 0;
    self->_connectedCount = 0;
  }

- (void).cxx_destruct
{
}

@end