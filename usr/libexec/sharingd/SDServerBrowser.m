@interface SDServerBrowser
+ (id)sharedBrowser;
- (BOOL)isAirDropEnabled;
- (NSString)description;
- (SDServerBrowser)init;
- (id)airDropNodesForDomain:(id)a3;
- (id)bonjourNodesForDomain:(id)a3;
- (id)odiskNodesForDomain:(id)a3;
- (id)stringForBrowserMode:(int64_t)a3;
- (id)windowsNodesForWorkgroup:(id)a3;
- (void)airDropTransferRequested:(id)a3;
- (void)bonjourNodesDidChange:(id)a3;
- (void)incrementTransfersCompleted;
- (void)incrementTransfersInitiated;
- (void)postNotification:(id)a3 forNeighborhood:(id)a4;
- (void)setBonjourBrowserMode:(int64_t)a3;
- (void)setIconData:(id)a3 iconHash:(id)a4 forPerson:(__SFNode *)a5;
- (void)startAirDropBrowsing:(id)a3 bundleID:(id)a4 sessionID:(id)a5 helperConnection:(id)a6 delayBonjour:(BOOL)a7;
- (void)startAirDropBrowsing:(id)a3 connection:(id)a4 sessionID:(id)a5;
- (void)startBrowsingDomain:(id)a3;
- (void)startBrowsingWorkgroup:(id)a3;
- (void)startODiskBrowsing:(id)a3;
- (void)stopAirDropBrowsing:(id)a3;
- (void)stopBrowsingDomain:(id)a3;
- (void)stopBrowsingWorkgroup:(id)a3;
- (void)stopODiskBrowsing:(id)a3;
- (void)windowsNodesDidChange:(id)a3;
@end

@implementation SDServerBrowser

+ (id)sharedBrowser
{
  if (qword_100656FE8 != -1) {
    dispatch_once(&qword_100656FE8, &stru_1005CD3B0);
  }
  return (id)qword_100656FF0;
}

- (SDServerBrowser)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SDServerBrowser;
  v2 = -[SDServerBrowser init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_mode = 0LL;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    odiskBrowsers = v3->_odiskBrowsers;
    v3->_odiskBrowsers = v4;

    v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    bonjourBrowsers = v3->_bonjourBrowsers;
    v3->_bonjourBrowsers = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    windowsBrowsers = v3->_windowsBrowsers;
    v3->_windowsBrowsers = v8;

    v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    airDropBrowsers = v3->_airDropBrowsers;
    v3->_airDropBrowsers = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v3 selector:"airDropTransferRequested:" name:@"com.apple.sharingd.AirDropTransferInitiated" object:0];
  }

  return v3;
}

- (void)postNotification:(id)a3 forNeighborhood:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = @"NeighborhoodName";
    id v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:v5 object:0 userInfo:v8];
}

- (void)airDropTransferRequested:(id)a3
{
  uint64_t v4 = airdrop_log(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SDServerBrowser: AirDrop transfer requested notification received",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  @"local"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Browser"]);
  if (([v7 startCalled] & 1) == 0)
  {
    [v7 start];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A0480;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)bonjourNodesDidChange:(id)a3
{
  id v7 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v7 types]);
  if ([v4 containsObject:@"_afpovertcp._tcp."])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    id v6 = @"com.apple.sharingd.BonjourChanged";
LABEL_7:
    -[SDServerBrowser postNotification:forNeighborhood:](self, "postNotification:forNeighborhood:", v6, v5);

    goto LABEL_8;
  }

  if ([v4 containsObject:sub_10008E590()])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    id v6 = @"com.apple.sharingd.AirDropChanged";
    goto LABEL_7;
  }

  if ([v4 containsObject:@"_odisk._tcp."])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    id v6 = @"com.apple.sharingd.ODisksChanged";
    goto LABEL_7;
  }

- (void)windowsNodesDidChange:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 workgroup]);
  -[SDServerBrowser postNotification:forNeighborhood:]( self,  "postNotification:forNeighborhood:",  @"com.apple.sharingd.WindowsChanged",  v4);
}

- (void)startBrowsingDomain:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bonjourBrowsers,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"Count"));
    uint64_t v8 = [v7 intValue] + 1;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"Count");
  }

  else
  {
    v11[0] = @"_afpovertcp._tcp.";
    v11[1] = @"_smb._tcp.";
    v11[2] = @"_rfb._tcp.";
    v11[3] = @"_adisk._tcp.";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 4LL));
    v10 = -[SDBonjourBrowser initWithDomain:types:]( objc_alloc(&OBJC_CLASS___SDBonjourBrowser),  "initWithDomain:types:",  v4,  v9);
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &off_1005F77F8,  @"Count");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, @"Browser");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bonjourBrowsers, "setObject:forKeyedSubscript:", v6, v4);
    -[SDBonjourBrowser setDelegate:](v10, "setDelegate:", self);
    -[SDBonjourBrowser setMode:](v10, "setMode:", self->_mode);
    -[SDBonjourBrowser start](v10, "start");
  }
}

- (void)setBonjourBrowserMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bonjourBrowsers,  "objectForKeyedSubscript:",  @"local"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Browser"]);
    [v4 setMode:a3];
  }

- (id)bonjourNodesForDomain:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Browser"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nodes]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)stopBrowsingDomain:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:"));
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Count"]);
    uint64_t v7 = [v6 intValue] - 1;

    if ((_DWORD)v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      [v5 setObject:v8 forKeyedSubscript:@"Count"];
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Browser"]);
      [v9 invalidate];

      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Browser"]);
      [v10 setDelegate:0];

      -[NSMutableDictionary removeObjectForKey:](self->_bonjourBrowsers, "removeObjectForKey:", v11);
    }
  }
}

- (void)startODiskBrowsing:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_odiskBrowsers,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"Count"));
    uint64_t v8 = [v7 intValue] + 1;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"Count");
  }

  else
  {
    id v11 = @"_odisk._tcp.";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    v10 = -[SDBonjourBrowser initWithDomain:types:]( objc_alloc(&OBJC_CLASS___SDBonjourBrowser),  "initWithDomain:types:",  v4,  v9);
    id v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &off_1005F77F8,  @"Count");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, @"Browser");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_odiskBrowsers, "setObject:forKeyedSubscript:", v6, v4);
    -[SDBonjourBrowser setDelegate:](v10, "setDelegate:", self);
    -[SDBonjourBrowser start](v10, "start");
  }
}

- (id)odiskNodesForDomain:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Browser"]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nodes]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)stopODiskBrowsing:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:"));
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Count"]);
    uint64_t v7 = [v6 intValue] - 1;

    if ((_DWORD)v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      [v5 setObject:v8 forKeyedSubscript:@"Count"];
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Browser"]);
      [v9 invalidate];

      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Browser"]);
      [v10 setDelegate:0];

      -[NSMutableDictionary removeObjectForKey:](self->_odiskBrowsers, "removeObjectForKey:", v11);
    }
  }
}

- (void)startAirDropBrowsing:(id)a3 bundleID:(id)a4 sessionID:(id)a5 helperConnection:(id)a6 delayBonjour:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  v12));
  if (v16)
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", @"Count"));
    uint64_t v19 = [v18 intValue] + 1;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v20, @"Count");
  }

  else
  {
    v27 = sub_10008E590();
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    v21 = -[SDBonjourBrowser initWithDomain:types:]( objc_alloc(&OBJC_CLASS___SDBonjourBrowser),  "initWithDomain:types:",  v12,  v20);
    -[SDBonjourBrowser setHelperConnection:](v21, "setHelperConnection:", v15);
    v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &off_1005F77F8,  @"Count");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v21, @"Browser");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_airDropBrowsers,  "setObject:forKeyedSubscript:",  v17,  v12);
    -[SDBonjourBrowser setBundleID:](v21, "setBundleID:", v13);
    -[SDBonjourBrowser setSessionID:](v21, "setSessionID:", v14);
    id v22 = -[SDBonjourBrowser setDelegate:](v21, "setDelegate:", self);
    if (a7)
    {
      uint64_t v23 = airdrop_log(v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Delayed Bonjour browsing requested",  v25,  2u);
      }
    }

    else
    {
      -[SDBonjourBrowser start](v21, "start");
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A0ECC;
      block[3] = &unk_1005CB2F8;
      block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }
}

- (void)startAirDropBrowsing:(id)a3 connection:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  v8));
  if (v11)
  {
    id v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", @"Count"));
    uint64_t v14 = [v13 intValue] + 1;

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, @"Count");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", @"Browser"));
    if (([v16 startCalled] & 1) == 0)
    {
      [v16 start];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000A115C;
      v18[3] = &unk_1005CB2F8;
      v18[4] = self;
      dispatch_async(&_dispatch_main_q, v18);
    }
  }

  else
  {
    v20 = sub_10008E590();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
    v17 = -[SDBonjourBrowser initWithDomain:types:]( objc_alloc(&OBJC_CLASS___SDBonjourBrowser),  "initWithDomain:types:",  v8,  v16);
    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &off_1005F77F8,  @"Count");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, @"Browser");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_airDropBrowsers, "setObject:forKeyedSubscript:", v12, v8);
    -[SDBonjourBrowser setXpcConnection:](v17, "setXpcConnection:", v9);
    -[SDBonjourBrowser setSessionID:](v17, "setSessionID:", v10);
    -[SDBonjourBrowser setDelegate:](v17, "setDelegate:", self);
    -[SDBonjourBrowser start](v17, "start");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A1148;
    block[3] = &unk_1005CB2F8;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)setIconData:(id)a3 iconHash:(id)a4 forPerson:(__SFNode *)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  @"local"));
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Browser"]);
    [v11 setIconData:v12 iconHash:v8 forPerson:a5];
  }
}

- (void)incrementTransfersInitiated
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  @"local"));
  id v4 = v2;
  if (v2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Browser"]);
    objc_msgSend(v5, "setTransfersInitiated:", objc_msgSend(v5, "transfersInitiated") + 1);
  }

  else
  {
    uint64_t v6 = browser_log(0LL, v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1000A1F90((os_log_t)v5);
    }
  }
}

- (void)incrementTransfersCompleted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  @"local"));
  id v4 = v2;
  if (v2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Browser"]);
    objc_msgSend(v5, "setTransfersCompleted:", objc_msgSend(v5, "transfersCompleted") + 1);
  }

  else
  {
    uint64_t v6 = browser_log(0LL, v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "incrementTransfersCompleted: No AirDrop browsers are running",  v7,  2u);
    }
  }
}

- (id)airDropNodesForDomain:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Browser"]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nodes]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)isAirDropEnabled
{
  return -[NSMutableDictionary count](self->_airDropBrowsers, "count") != 0LL;
}

- (void)stopAirDropBrowsing:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", v4));
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Count"]);
    uint64_t v8 = [v7 intValue] - 1;

    if ((_DWORD)v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
      [v6 setObject:v9 forKeyedSubscript:@"Count"];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Browser"]);
      [v10 invalidate];

      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Browser"]);
      [v11 setDelegate:0];

      -[NSMutableDictionary removeObjectForKey:](self->_airDropBrowsers, "removeObjectForKey:", v4);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A1524;
      block[3] = &unk_1005CB2F8;
      block[4] = self;
      dispatch_async(&_dispatch_main_q, block);
    }
  }
}

- (void)startBrowsingWorkgroup:(id)a3
{
  id v9 = a3;
  id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_windowsBrowsers,  "objectForKeyedSubscript:"));
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"Count"));
    uint64_t v7 = [v6 intValue] + 1;

    uint64_t v8 = (SDWindowsBrowser *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, @"Count");
  }

  else
  {
    uint64_t v8 = -[SDWindowsBrowser initWithWorkgroup:](objc_alloc(&OBJC_CLASS___SDWindowsBrowser), "initWithWorkgroup:", v9);
    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &off_1005F77F8,  @"Count");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, @"Browser");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_windowsBrowsers, "setObject:forKeyedSubscript:", v5, v9);
    -[SDWindowsBrowser setDelegate:](v8, "setDelegate:", self);
    -[SDWindowsBrowser start](v8, "start");
  }
}

- (id)windowsNodesForWorkgroup:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:", a3));
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Browser"]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nodes]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (void)stopBrowsingWorkgroup:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:"));
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Count"]);
    uint64_t v7 = [v6 intValue] - 1;

    if ((_DWORD)v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      [v5 setObject:v8 forKeyedSubscript:@"Count"];
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Browser"]);
      [v8 stop];
      [v8 setDelegate:0];
      -[NSMutableDictionary removeObjectForKey:](self->_windowsBrowsers, "removeObjectForKey:", v9);
    }
  }
}

- (id)stringForBrowserMode:(int64_t)a3
{
  int v3 = a3;
  uint64_t v5 = browser_log(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unrecognized browser mode %d",  (uint8_t *)v7,  8u);
  }

  return 0LL;
}

- (NSString)description
{
  id v86 = 0LL;
  NSAppendPrintF(&v86, "ServerBrowser\n");
  id v3 = v86;
  id v85 = v3;
  NSAppendPrintF(&v85, "--------------\n");
  id v4 = v85;

  id v84 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDServerBrowser stringForBrowserMode:](self, "stringForBrowserMode:", self->_mode));
  NSAppendPrintF(&v84, "Mode:                                %@\n", v5);
  id v6 = v84;

  if (-[NSMutableDictionary count](self->_bonjourBrowsers, "count"))
  {
    id v83 = v6;
    NSAppendPrintF(&v83, "Bonjour Browsers:\n");
    id v7 = v83;

    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    obj = self->_bonjourBrowsers;
    id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v90,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v80;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v80 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bonjourBrowsers,  "objectForKeyedSubscript:",  v12));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Browser"]);
          id v78 = v7;
          NSAppendPrintF(&v78, "Domain:                              %@\n", v12);
          id v15 = v78;

          id v77 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 description]);
          NSAppendPrintF(&v77, "%@", v16);
          id v7 = v77;
        }

        id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v90,  16LL);
      }

      while (v9);
    }

    id v76 = v7;
    NSAppendPrintF(&v76, "\n");
    id v6 = v76;
  }

  if (-[NSMutableDictionary count](self->_airDropBrowsers, "count"))
  {
    id v75 = v6;
    NSAppendPrintF(&v75, "AirDrop Browsers:\n");
    id v17 = v75;

    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    obja = self->_airDropBrowsers;
    id v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v71,  v89,  16LL);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v72;
      do
      {
        for (j = 0LL; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v72 != v20) {
            objc_enumerationMutation(obja);
          }
          uint64_t v22 = *(void *)(*((void *)&v71 + 1) + 8LL * (void)j);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_airDropBrowsers,  "objectForKeyedSubscript:",  v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"Browser"]);
          id v70 = v17;
          NSAppendPrintF(&v70, "Domain:                              %@\n", v22);
          id v25 = v70;

          id v69 = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue([v24 description]);
          NSAppendPrintF(&v69, "%@", v26);
          id v17 = v69;
        }

        id v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v71,  v89,  16LL);
      }

      while (v19);
    }

    id v68 = v17;
    NSAppendPrintF(&v68, "\n");
    id v6 = v68;
  }

  if (-[NSMutableDictionary count](self->_windowsBrowsers, "count"))
  {
    id v67 = v6;
    NSAppendPrintF(&v67, "Windows Browsers:\n");
    id v27 = v67;

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    objb = self->_windowsBrowsers;
    id v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( objb,  "countByEnumeratingWithState:objects:count:",  &v63,  v88,  16LL);
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v64;
      do
      {
        for (k = 0LL; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v64 != v30) {
            objc_enumerationMutation(objb);
          }
          uint64_t v32 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)k);
          v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_windowsBrowsers,  "objectForKeyedSubscript:",  v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"Browser"]);
          id v62 = v27;
          NSAppendPrintF(&v62, "Domain:                              %@\n", v32);
          id v35 = v62;

          id v61 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue([v34 description]);
          NSAppendPrintF(&v61, "%@", v36);
          id v27 = v61;
        }

        id v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( objb,  "countByEnumeratingWithState:objects:count:",  &v63,  v88,  16LL);
      }

      while (v29);
    }

    id v60 = v27;
    NSAppendPrintF(&v60, "\n");
    id v6 = v60;
  }

  if (-[NSMutableDictionary count](self->_odiskBrowsers, "count"))
  {
    id v59 = v6;
    NSAppendPrintF(&v59, "ODisk Browsers:\n");
    id v37 = v59;

    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    objc = self->_odiskBrowsers;
    id v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( objc,  "countByEnumeratingWithState:objects:count:",  &v55,  v87,  16LL);
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v56;
      do
      {
        for (m = 0LL; m != v39; m = (char *)m + 1)
        {
          if (*(void *)v56 != v40) {
            objc_enumerationMutation(objc);
          }
          uint64_t v42 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)m);
          v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_odiskBrowsers,  "objectForKeyedSubscript:",  v42));
          v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"Browser"]);
          id v54 = v37;
          NSAppendPrintF(&v54, "Domain:                              %@\n", v42);
          id v45 = v54;

          id v53 = v45;
          v46 = (void *)objc_claimAutoreleasedReturnValue([v44 description]);
          NSAppendPrintF(&v53, "%@", v46);
          id v37 = v53;
        }

        id v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( objc,  "countByEnumeratingWithState:objects:count:",  &v55,  v87,  16LL);
      }

      while (v39);
    }

    id v52 = v37;
    NSAppendPrintF(&v52, "\n");
    id v6 = v52;
  }

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end