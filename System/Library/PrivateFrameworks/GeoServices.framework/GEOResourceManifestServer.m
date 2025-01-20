@interface GEOResourceManifestServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOResourceManifestServer)initWithDaemon:(id)a3;
- (id)_configurationForPeer:(id)a3;
- (id)_manifestManagerForPeer:(id)a3;
- (void)_configureConstrainedNetworkUpdateAssertion;
- (void)_fireOpportunisticResourceLoads;
- (void)_forEachPeerMatchingConfiguration:(id)a3 perform:(id)a4;
- (void)activateFilterWithRequest:(id)a3;
- (void)deactivateFilterWithRequest:(id)a3;
- (void)dealloc;
- (void)forceUpdateWithMessage:(id)a3;
- (void)getMaximumZoomLevelWithMessage:(id)a3;
- (void)getResourceManifestWithMessage:(id)a3;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)resetActiveTileGroupWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5;
- (void)serverProxyNeedsWiFiResourceActivity:(id)a3;
- (void)setActiveTileGroupIdentifierWithMessage:(id)a3;
- (void)setConfigurationWithMessage:(id)a3;
- (void)setRequestTokenWithMessage:(id)a3;
- (void)updateIfNecessaryWithMessage:(id)a3;
@end

@implementation GEOResourceManifestServer

+ (id)identifier
{
  return @"resourcemanifest";
}

+ (unint64_t)launchMode
{
  return 2LL;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_10005E6E8;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v16 = 0;
  if (v13 > 1758)
  {
    if (v13 <= 1982)
    {
      if (v13 == 1759)
      {
        id v33 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        v18 = v33;
        BOOL v16 = v33 != 0LL;
        if (v33)
        {
          [v33 setSignpostId:a6];
          -[GEOResourceManifestServer updateIfNecessaryWithMessage:](self, "updateIfNecessaryWithMessage:", v18);
          goto LABEL_39;
        }

        goto LABEL_40;
      }

      if (v13 == 1979)
      {
        id v23 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        v18 = v23;
        BOOL v16 = v23 != 0LL;
        if (v23)
        {
          [v23 setSignpostId:a6];
          -[GEOResourceManifestServer getMaximumZoomLevelWithMessage:](self, "getMaximumZoomLevelWithMessage:", v18);
          goto LABEL_39;
        }

        goto LABEL_40;
      }

      goto LABEL_41;
    }

    switch(v13)
    {
      case 1983:
        if (sub_100012B28(v12, v11, @"resourcemanifest", v10, &off_10005E748, 0LL))
        {
          id v30 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          v18 = v30;
          BOOL v16 = v30 != 0LL;
          if (v30)
          {
            [v30 setSignpostId:a6];
            -[GEOResourceManifestServer getResourceManifestWithMessage:](self, "getResourceManifestWithMessage:", v18);
            goto LABEL_39;
          }

          goto LABEL_40;
        }

        break;
      case 2074:
        id v31 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        v18 = v31;
        BOOL v16 = v31 != 0LL;
        if (v31)
        {
          [v31 setSignpostId:a6];
          -[GEOResourceManifestServer resetActiveTileGroupWithMessage:](self, "resetActiveTileGroupWithMessage:", v18);
          goto LABEL_39;
        }

        goto LABEL_40;
      case 2886:
        if (sub_100012B28(v12, v11, @"resourcemanifest", v10, &off_10005E700, 0LL))
        {
          id v19 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
          v18 = v19;
          BOOL v16 = v19 != 0LL;
          if (v19)
          {
            [v19 setSignpostId:a6];
            -[GEOResourceManifestServer setActiveTileGroupIdentifierWithMessage:]( self,  "setActiveTileGroupIdentifierWithMessage:",  v18);
            goto LABEL_39;
          }

- (GEOResourceManifestServer)initWithDaemon:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GEOResourceManifestServer;
  v3 = -[GEOResourceManifestServer initWithDaemon:](&v12, "initWithDaemon:", a3);
  if (v3)
  {
    v4 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  512LL,  5LL);
    peerToConfiguration = v3->_peerToConfiguration;
    v3->_peerToConfiguration = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    alreadyRegisteredConfigurations = v3->_alreadyRegisteredConfigurations;
    v3->_alreadyRegisteredConfigurations = v6;

    uint64_t v8 = geo_isolater_create("com.apple.geod.ResourceManifestServer.isolation");
    constrainedNetworkUpdateAssertionIsolation = v3->_constrainedNetworkUpdateAssertionIsolation;
    v3->_constrainedNetworkUpdateAssertionIsolation = (geo_isolater *)v8;

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v3 selector:"_configureConstrainedNetworkUpdateAssertion" name:GEONetworkObserverConstrainedNetworkDidChangeNotificationName object:0];

    -[GEOResourceManifestServer _configureConstrainedNetworkUpdateAssertion]( v3,  "_configureConstrainedNetworkUpdateAssertion");
  }

  return v3;
}

- (void)dealloc
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v3 = self->_alreadyRegisteredConfigurations;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManagerForConfiguration:]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManagerForConfiguration:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7)));
        [v8 removeServerProxyObserver:self];
        [v8 closeServerConnection];

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GEOResourceManifestServer;
  -[GEOResourceManifestServer dealloc](&v9, "dealloc");
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned int v6 = [v5 isEqualToString:@"com.apple.geod.OpportunisticResourceLoading"];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    GEOBackgroundTaskReportReportTaskInitiated();

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer daemon](self, "daemon"));
    objc_super v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 serverQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003079C;
    block[3] = &unk_100059520;
    block[4] = self;
    id v12 = v4;
    dispatch_async(v9, block);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___GEOResourceManifestServer;
    -[GEOResourceManifestServer runBackgroundTask:](&v10, "runBackgroundTask:", v4);
  }
}

- (void)_configureConstrainedNetworkUpdateAssertion
{
  constrainedNetworkUpdateAssertionIsolation = self->_constrainedNetworkUpdateAssertionIsolation;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100030824;
  v3[3] = &unk_100059190;
  v3[4] = self;
  geo_isolate_sync_data(constrainedNetworkUpdateAssertionIsolation, v3);
}

- (void)peerDidConnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000309CC;
  block[3] = &unk_100059190;
  block[4] = self;
  uint64_t v4 = qword_10006B090;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_10006B090, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GEOResourceManifestServer;
  -[GEOResourceManifestServer peerDidConnect:](&v6, "peerDidConnect:", v5);
}

- (void)peerDidDisconnect:(id)a3
{
  peerToConfiguration = self->_peerToConfiguration;
  id v5 = a3;
  -[NSMapTable removeObjectForKey:](peerToConfiguration, "removeObjectForKey:", v5);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GEOResourceManifestServer;
  -[GEOResourceManifestServer peerDidDisconnect:](&v6, "peerDidDisconnect:", v5);
}

- (id)_manifestManagerForPeer:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_peerToConfiguration, "objectForKey:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManagerForConfiguration:]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManagerForConfiguration:",  v3));

  return v4;
}

- (id)_configurationForPeer:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_peerToConfiguration, "objectForKey:", a3));
  if (!v3)
  {
    if (qword_10006B098 != -1) {
      dispatch_once(&qword_10006B098, &stru_10005A760);
    }
    id v3 = (id)qword_10006B0A0;
  }

  return v3;
}

- (void)_fireOpportunisticResourceLoads
{
  uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "ResourceManifest");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Opportunistic resource loading XPC activity fired. Will attempt to load stale resources.",  v6,  2u);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](&OBJC_CLASS___GEOResourceManifestManager, "modernManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serverProxy]);
  [v5 performOpportunisticResourceLoading];
}

- (void)setConfigurationWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  if ([v5 hasEntitlement:@"com.apple.geoservices.custom-manifest-configuration"])
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cfg"]);

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      __int128 v11 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___GEOResourceManifestConfiguration, v10));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v12,  v7,  0LL));

      if (v13)
      {
        -[NSMapTable setObject:forKey:](self->_peerToConfiguration, "setObject:forKey:", v13, v5);
        if ((-[NSMutableSet containsObject:]( self->_alreadyRegisteredConfigurations,  "containsObject:",  v13) & 1) == 0)
        {
          -[NSMutableSet addObject:](self->_alreadyRegisteredConfigurations, "addObject:", v13);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestManager modernManagerForConfiguration:]( &OBJC_CLASS___GEOResourceManifestManager,  "modernManagerForConfiguration:",  v13));
          [v14 addServerProxyObserver:self];
          [v14 openServerConnection];
        }
      }
    }

    else
    {
      __int128 v13 = 0LL;
    }
  }

  else
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "ResourceManifest");
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
      int v18 = 138543362;
      id v19 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "Un-entitled process %{public}@ is trying to set a custom manifest configuration",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (void)setActiveTileGroupIdentifierWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"reply"]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0) {
    unsigned int v9 = [v6 BOOLValue];
  }
  else {
    unsigned int v9 = 0;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"identifier"]);

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
  {
    if (v9)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"type"]);
      id v16 = [v15 integerValue];

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
      int v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v17));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 serverProxy]);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000310B8;
      v25[3] = &unk_100059168;
      id v26 = v4;
      [v19 setActiveTileGroupIdentifier:v11 updateType:v16 completionHandler:v25];
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v22));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serverProxy]);
      [v24 setActiveTileGroupIdentifier:v11];
    }
  }

  else if (v9)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -12LL,  @"Tile Group Identifier is not a number"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v20,  @"err"));
    [v4 sendReply:v21];
  }
}

- (void)updateIfNecessaryWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serverProxy]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000311C8;
  v9[3] = &unk_100059168;
  id v10 = v4;
  id v8 = v4;
  [v7 updateIfNecessary:v9];
}

- (void)forceUpdateWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"type"]);
  id v7 = [v6 integerValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serverProxy]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100031318;
  v12[3] = &unk_100059168;
  id v13 = v4;
  id v11 = v4;
  [v10 forceUpdate:v7 completionHandler:v12];
}

- (void)resetActiveTileGroupWithMessage:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 peer]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v6));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serverProxy]);
  [v5 resetActiveTileGroup];
}

- (void)setRequestTokenWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"requestToken"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v7));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serverProxy]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000314C4;
  v11[3] = &unk_100059168;
  id v12 = v4;
  id v10 = v4;
  [v9 setManifestToken:v6 completionHandler:v11];
}

- (void)activateFilterWithRequest:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 filter]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serverProxy]);

  if (v10 && v7)
  {
    id v8 = [v10 whichFilter];
    if (v8 == (id)3)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      [v7 activateResourceName:v9];
    }

    else if (v8 == (id)2)
    {
      objc_msgSend(v7, "activateResourceScenario:", objc_msgSend(v10, "scenario"));
    }

    else if (v8 == (id)1)
    {
      objc_msgSend(v7, "activateResourceScale:", objc_msgSend(v10, "scale"));
    }
  }
}

- (void)deactivateFilterWithRequest:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 filter]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serverProxy]);

  if (v10 && v7)
  {
    id v8 = [v10 whichFilter];
    if (v8 == (id)3)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      [v7 deactivateResourceName:v9];
    }

    else if (v8 == (id)2)
    {
      objc_msgSend(v7, "deactivateResourceScenario:", objc_msgSend(v10, "scenario"));
    }

    else if (v8 == (id)1)
    {
      objc_msgSend(v7, "deactivateResourceScale:", objc_msgSend(v10, "scale"));
    }
  }
}

- (void)getMaximumZoomLevelWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"style"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"scale"]);

  if (v6 && v8)
  {
    id v9 = [v6 intValue];
    id v10 = [v8 intValue];
    unsigned int v20 = 2;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v11));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serverProxy]);
    id v14 = [v13 maximumZoomLevelForStyle:v9 scale:v10 outSize:&v20];

    v21[0] = @"result";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
    v21[1] = @"idealSize";
    v22[0] = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
    v22[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
    [v4 sendReply:v17];
  }

  else
  {
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "ResourceManifest");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Missing input parameters for message 'getMaximumZoomLevel'",  (uint8_t *)&v20,  2u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError GEOErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "GEOErrorWithCode:reason:",  -10LL,  @"Missing input parameters"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary _geo_replyDictionaryForError:key:]( &OBJC_CLASS___NSDictionary,  "_geo_replyDictionaryForError:key:",  v15,  @"err"));
    [v4 sendReply:v16];
  }
}

- (void)getResourceManifestWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _manifestManagerForPeer:](self, "_manifestManagerForPeer:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serverProxy]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100031A3C;
  v9[3] = &unk_10005A788;
  id v10 = v4;
  id v8 = v4;
  [v7 getResourceManifestWithHandler:v9];
}

- (void)_forEachPeerMatchingConfiguration:(id)a3 perform:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer daemon](self, "daemon"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 peers]);
  id v10 = [v9 copy];

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (objc_msgSend(v16, "isForServerType:", 11, (void)v18))
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer _configurationForPeer:](self, "_configurationForPeer:", v16));
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v13);
  }
}

- (void)serverProxy:(id)a3 didChangeActiveTileGroup:(id)a4 finishedCallback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestServer daemon](self, "daemon"));
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 serverQueue]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100031D94;
  v18[3] = &unk_10005A828;
  id v19 = v8;
  __int128 v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  uint64_t v16 = geo_dispatch_block_clean_copy(v18);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  dispatch_async(v12, v17);
}

- (void)serverProxyNeedsWiFiResourceActivity:(id)a3
{
  if (sub_100017C50(0LL))
  {
    id v3 = [sub_100017D6C() sharedScheduler];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 taskRequestForIdentifier:@"com.apple.geod.OpportunisticResourceLoading"]);
    uint64_t v6 = DefaultLoggingSubsystem;
    uint64_t Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "ResourceManifest");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    id v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        __int128 v20 = @"com.apple.geod.OpportunisticResourceLoading";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "OpportunisticResourceLoading background task is already scheduled (%{public}@)",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Ensuring existence of opportunistic resource loading background task.",  buf,  2u);
      }

      id v10 = [sub_100017D6C() sharedScheduler];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v11 taskRequestForIdentifier:@"com.apple.geod.OpportunisticResourceLoading"]);

      if (!v9)
      {
        id v12 = [objc_alloc((Class)sub_100017E74()) initWithIdentifier:@"com.apple.geod.OpportunisticResourceLoading"];
        [v12 setPriority:1];
        [v12 setRequiresExternalPower:0];
        [v12 setRequiresNetworkConnectivity:1];
        [v12 setRequiresInexpensiveNetworkConnectivity:1];
        [v12 setNetworkDownloadSize:0x100000];
        objc_msgSend( v12,  "setScheduleAfter:",  (double)GEOConfigGetInteger( GeoServicesConfig_OpportunisticResourceLoadingActivityDelay[0],  GeoServicesConfig_OpportunisticResourceLoadingActivityDelay[1]));
        id v18 = 0LL;
        unsigned __int8 v13 = [v4 submitTaskRequest:v12 error:&v18];
        id v14 = (__CFString *)v18;
        if ((v13 & 1) == 0)
        {
          uint64_t v15 = GEOFindOrCreateLog(v6, "ResourceManifest");
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = @"Unknown";
            if (v14) {
              id v17 = v14;
            }
            *(_DWORD *)buf = 138412290;
            __int128 v20 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to submit nonrepeating task with error: %@",  buf,  0xCu);
          }
        }
      }
    }
  }

- (void).cxx_destruct
{
}

@end