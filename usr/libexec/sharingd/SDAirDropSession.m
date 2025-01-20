@interface SDAirDropSession
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)send;
- (NSString)clientBundleID;
- (SDAirDropSession)initWithPerson:(__SFNode *)a3 items:(id)a4 sandboxExtensions:(id)a5;
- (SDAirDropSessionDelegate)delegate;
- (int)clientPid;
- (void)addClientForNode:(__SFNode *)a3 shouldPublishProgress:(BOOL)a4;
- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)consumeSandboxExtensions;
- (void)dealloc;
- (void)handleConversionProgress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releaseSandboxExtensions;
- (void)removeClientAlerts;
- (void)serversChanged:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)start;
- (void)startProgress;
- (void)stop;
@end

@implementation SDAirDropSession

- (SDAirDropSession)initWithPerson:(__SFNode *)a3 items:(id)a4 sandboxExtensions:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___SDAirDropSession;
  v11 = -[SDAirDropSession init](&v37, "init");
  if (v11)
  {
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    airDropClients = v11->_airDropClients;
    v11->_airDropClients = v12;

    v11->_clientPid = 0;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  0LL));
    conversionProgress = v11->_conversionProgress;
    v11->_conversionProgress = (NSProgress *)v14;

    v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    currentNames = v11->_currentNames;
    v11->_currentNames = v16;

    objc_storeWeak((id *)&v11->_delegate, 0LL);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[SDAirDropDiscoveryLogger discoverabilityMetricsForNode:]( &OBJC_CLASS___SDAirDropDiscoveryLogger,  "discoverabilityMetricsForNode:",  a3));
    discoveryMetrics = v11->_discoveryMetrics;
    v11->_discoveryMetrics = (NSDictionary *)v18;

    objc_storeStrong((id *)&v11->_items, a4);
    v11->_lastEvent = 1LL;
    uint64_t Copy = SFNodeCreateCopy(0LL, a3);
    progress = v11->_progress;
    v11->_person = (__SFNode *)Copy;
    v11->_progress = 0LL;

    v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v11->_properties;
    v11->_properties = v22;

    v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    results = v11->_results;
    v11->_results = v24;

    uint64_t v27 = SFNodeCopyRealName(a3, v26);
    rootNodeName = v11->_rootNodeName;
    v11->_rootNodeName = (NSString *)v27;

    objc_storeStrong((id *)&v11->_sandboxExtensions, a5);
    v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    sandboxExtensionHandles = v11->_sandboxExtensionHandles;
    v11->_sandboxExtensionHandles = v29;

    v31 = (void *)SFNodeCopySiblingNodes(a3);
    v32 = (NSMutableArray *)[v31 mutableCopy];
    siblingNodes = v11->_siblingNodes;
    v11->_siblingNodes = v32;

    v34 = objc_alloc_init(&OBJC_CLASS___NSProgress);
    transferProgress = v11->_transferProgress;
    v11->_transferProgress = v34;
  }

  return v11;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  properties = self->_properties;
  if (a3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](properties, "setObject:forKeyedSubscript:", a3, a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", a4);
  }
}

- (void)consumeSandboxExtensions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_sandboxExtensions, "allValues"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&__int128 v5 = 67109378LL;
    __int128 v19 = v5;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(id *)(*((void *)&v20 + 1) + 8LL * (void)v8);
        uint64_t v10 = sandbox_extension_consume([v9 bytes]);
        if (v10 < 0)
        {
          uint64_t v13 = airdrop_log(v10);
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            int v14 = *__error();
            *(_DWORD *)buf = v19;
            unsigned int v25 = v14;
            __int16 v26 = 2112;
            id v27 = v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "sandbox_extension_consume failed with error %d for tokenData \"%@\"",  buf,  0x12u);
          }
        }

        else
        {
          sandboxExtensionHandles = self->_sandboxExtensionHandles;
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10));
          -[NSMutableArray addObject:](sandboxExtensionHandles, "addObject:", v12);
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v6);
  }

  id v15 = -[NSMutableArray count](self->_sandboxExtensionHandles, "count", v19);
  if (v15)
  {
    uint64_t v16 = airdrop_log(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = -[NSMutableArray count](self->_sandboxExtensionHandles, "count");
      *(_DWORD *)buf = 67109120;
      unsigned int v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Consumed %d sandbox extensions", buf, 8u);
    }
  }
}

- (void)releaseSandboxExtensions
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_sandboxExtensionHandles;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        sandbox_extension_release(objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "integerValue", (void)v7));
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (void)start
{
  id v3 = (OS_os_transaction *)os_transaction_create("SDAirDropSession");
  transaction = self->_transaction;
  self->_transaction = v3;

  uint64_t v6 = airdrop_log(v5);
  __int128 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    person = self->_person;
    *(_DWORD *)buf = 138412290;
    unsigned int v25 = person;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start AirDrop session with %@", buf, 0xCu);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v9 postNotificationName:@"com.apple.sharingd.AirDropTransferInitiated" object:0];

  -[SDAirDropSession consumeSandboxExtensions](self, "consumeSandboxExtensions");
  siblingNodes = self->_siblingNodes;
  if (siblingNodes)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v11 = siblingNodes;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[SDAirDropSession addClientForNode:shouldPublishProgress:]( self,  "addClientForNode:shouldPublishProgress:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v15),  0LL,  (void)v19);
          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v13);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v16 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.AirDropChanged" object:0];

    -[SDAirDropSession serversChanged:](self, "serversChanged:", 0LL);
    -[SDAirDropSession postNotificationForTransferStatus:progress:]( self,  "postNotificationForTransferStatus:progress:",  11LL,  0.0);
  }

  else
  {
    -[SDAirDropSession addClientForNode:shouldPublishProgress:]( self,  "addClientForNode:shouldPublishProgress:",  self->_person,  1LL);
  }

  if (!-[NSMutableArray count](self->_airDropClients, "count", (void)v19))
  {
    uint64_t v17 = airdrop_log(0LL);
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No session clients started at the moment, most likely we have not discovered the node over Bonjour yet",  buf,  2u);
    }
  }

- (BOOL)send
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = self->_airDropClients;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)i), "send", (void)v9);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v4);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)serversChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDServerBrowser sharedBrowser](&OBJC_CLASS___SDServerBrowser, "sharedBrowser", a3));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 airDropNodesForDomain:@"local"]);

  __int128 v20 = (void *)SFNodeCopyComputerName(self->_person);
  uint64_t v6 = (void *)SFNodeCopyContactIdentifiers(self->_person);
  if (!v6)
  {
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_siblingNodes, "objectAtIndexedSubscript:", 0LL));
    id v8 = sub_100034938((uint64_t)v7);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (sub_100034824(v14))
        {
          id v15 = (void *)SFNodeCopyComputerName(v14);
        }

        else
        {
          id v17 = sub_100034938(v14);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
        }

        currentNames = self->_currentNames;
        __int128 v19 = (void *)SFNodeCopyRealName(v14, v16);
        LOBYTE(currentNames) = -[NSMutableArray containsObject:](currentNames, "containsObject:", v19);

        if ((currentNames & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_siblingNodes, "addObject:", v14);
          -[SDAirDropSession addClientForNode:shouldPublishProgress:]( self,  "addClientForNode:shouldPublishProgress:",  v14,  0LL);
        }

- (void)addClientForNode:(__SFNode *)a3 shouldPublishProgress:(BOOL)a4
{
  BOOL v4 = a4;
  __int128 v7 = (void *)SFNodeCopyKinds(a3);
  id v8 = [v7 containsObject:kSFNodeKindRapport];
  int v9 = (int)v8;
  uint64_t v10 = airdrop_log(v8);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v29 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SDAirDropSession: skip Rapport node %@",  buf,  0xCu);
    }
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v29 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Start session client for %@", buf, 0xCu);
    }

    id v11 = -[SDAirDropClient initWithPerson:items:forDiscovery:]( objc_alloc(&OBJC_CLASS___SDAirDropClient),  "initWithPerson:items:forDiscovery:",  a3,  self->_items,  0LL);
    uint64_t v13 = kSFOperationFileIconKey;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFileIconKey));
    -[os_log_s setProperty:forKey:](v11, "setProperty:forKey:", v14, v13);

    uint64_t v15 = kSFOperationSessionIDKey;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
    -[os_log_s setProperty:forKey:](v11, "setProperty:forKey:", v16, v15);

    uint64_t v17 = kSFOperationSmallFileIconKey;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSmallFileIconKey));
    -[os_log_s setProperty:forKey:](v11, "setProperty:forKey:", v18, v17);

    uint64_t v19 = kSFOperationItemsDescriptionKey;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationItemsDescriptionKey));
    -[os_log_s setProperty:forKey:](v11, "setProperty:forKey:", v20, v19);

    uint64_t v21 = kSFOperationFromShareSheet;
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationFromShareSheet));
    -[os_log_s setProperty:forKey:](v11, "setProperty:forKey:", v22, v21);

    __int128 v23 = *(_OWORD *)&self->_auditToken.val[4];
    v27[0] = *(_OWORD *)self->_auditToken.val;
    v27[1] = v23;
    -[os_log_s setAuditToken:](v11, "setAuditToken:", v27);
    -[os_log_s setClientBundleID:](v11, "setClientBundleID:", self->_clientBundleID);
    -[os_log_s setDiscoveryMetrics:](v11, "setDiscoveryMetrics:", self->_discoveryMetrics);
    -[os_log_s setShouldPublishProgress:](v11, "setShouldPublishProgress:", v4);
    if (self->_clientPid) {
      -[os_log_s setClientPid:](v11, "setClientPid:");
    }
    -[os_log_s setDelegate:](v11, "setDelegate:", self);
    -[os_log_s activate](v11, "activate");
    -[NSMutableArray addObject:](self->_airDropClients, "addObject:", v11);
    currentNames = self->_currentNames;
    __int16 v26 = (void *)SFNodeCopyRealName(a3, v25);
    -[NSMutableArray addObject:](currentNames, "addObject:", v26);
  }
}

- (void)stop
{
  uint64_t v3 = airdrop_log(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    person = self->_person;
    *(_DWORD *)buf = 138412290;
    __int128 v22 = person;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop AirDrop session with %@", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v6 = self->_airDropClients;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v10), "invalidate", (void)v16);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 removeObserver:self name:@"com.apple.sharingd.AirDropChanged" object:0];

  airDropClients = self->_airDropClients;
  self->_airDropClients = 0LL;

  currentNames = self->_currentNames;
  self->_currentNames = 0LL;

  responseClient = self->_responseClient;
  self->_responseClient = 0LL;

  transaction = self->_transaction;
  self->_transaction = 0LL;
}

- (void)dealloc
{
  if (self->_conversionObserver) {
    -[NSProgress removeObserver:forKeyPath:]( self->_conversionProgress,  "removeObserver:forKeyPath:",  self,  @"fractionCompleted");
  }
  -[SDAirDropSession releaseSandboxExtensions](self, "releaseSandboxExtensions");
  -[NSProgress _unpublish](self->_progress, "_unpublish");
  CFRelease(self->_person);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropSession;
  -[SDAirDropSession dealloc](&v3, "dealloc");
}

- (void)removeClientAlerts
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  objc_super v3 = self->_airDropClients;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(SDAirDropClient **)(*((void *)&v9 + 1) + 8LL * (void)v7);
        if (v8 != self->_responseClient) {
          -[SDAirDropClient invalidate](v8, "invalidate", (void)v9);
        }
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }
}

- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v10 mutableCopy];
  id v12 = [v11 addEntriesFromDictionary:self->_results];
  if (a4 == 7)
  {
LABEL_2:
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationBytesCopiedKey]);
    -[NSProgress setCompletedUnitCount:]( self->_transferProgress,  "setCompletedUnitCount:",  [v13 longLongValue]);

    LODWORD(v13) = self->_hadConversion;
    -[NSProgress fractionCompleted](self->_transferProgress, "fractionCompleted");
    double v15 = v14 * 100.0;
    if ((_DWORD)v13) {
      double v15 = v15 * 0.8 + 20.0;
    }
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)v15);
    progress = self->_progress;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationTimeRemainingKey]);
    -[NSProgress setUserInfoObject:forKey:]( progress,  "setUserInfoObject:forKey:",  v17,  NSProgressEstimatedTimeRemainingKey);

    double v18 = (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
    __int128 v19 = self;
    uint64_t v20 = 7LL;
  }

  else
  {
    uint64_t v22 = airdrop_log(v12);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10000ED54(a4, (uint64_t)v11, v23);
    }

    switch(a4)
    {
      case 3LL:
        if (self->_conversionActive) {
          goto LABEL_6;
        }
        self->_allowedWaiting = 1;
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2LL);
        double v18 = 0.0;
        __int128 v19 = self;
        uint64_t v20 = 3LL;
        break;
      case 4LL:
        objc_storeStrong((id *)&self->_responseClient, a3);
        -[SDAirDropSession removeClientAlerts](self, "removeClientAlerts");
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 4LL);
        double v18 = 0.0;
        __int128 v19 = self;
        uint64_t v20 = 4LL;
        break;
      case 5LL:
        objc_storeStrong((id *)&self->_responseClient, a3);
        -[SDAirDropSession removeClientAlerts](self, "removeClientAlerts");
        if (self->_conversionObserver)
        {
          self->_conversionObserver = 0;
          -[NSProgress removeObserver:forKeyPath:]( self->_conversionProgress,  "removeObserver:forKeyPath:",  self,  @"fractionCompleted");
        }

        if (self->_hadConversion) {
          uint64_t v25 = 20LL;
        }
        else {
          uint64_t v25 = 0LL;
        }
        -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v25);
        uint64_t v26 = airdrop_log(-[NSProgress cancel](self->_conversionProgress, "cancel"));
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v27, self);

        uint64_t v29 = kSFOperationTotalBytesKey;
        v30 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationTotalBytesKey]);
        uint64_t v31 = (uint64_t)[v30 longLongValue];

        uint64_t v33 = airdrop_log(v32);
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        v35 = v34;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          LOWORD(v56) = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v35,  OS_SIGNPOST_INTERVAL_BEGIN,  v28,  "TransferTime",  "",  (uint8_t *)&v56,  2u);
        }

        uint64_t v37 = airdrop_log(v36);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        v39 = v38;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          int v56 = 134349056;
          uint64_t v57 = 102400 * (v31 / 102400);
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_BEGIN,  v28,  "TransferTimeBytes",  "totalBytes=%{public, signpost.telemetry:number1}lld",  (uint8_t *)&v56,  0xCu);
        }

        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 3LL);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v29]);
        -[NSProgress setTotalUnitCount:]( self->_transferProgress,  "setTotalUnitCount:",  [v40 longLongValue]);

        -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", 0LL);
        *(_WORD *)&self->_conversionActive = 0;
        goto LABEL_6;
      case 7LL:
        goto LABEL_2;
      case 9LL:
        uint64_t v41 = airdrop_log(v24);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        os_signpost_id_t v43 = os_signpost_id_make_with_pointer(v42, self);

        uint64_t v45 = airdrop_log(v44);
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        v47 = v46;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          LOWORD(v56) = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  v43,  "TransferTime",  " enableTelemetry=YES ",  (uint8_t *)&v56,  2u);
        }

        uint64_t v49 = airdrop_log(v48);
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        v51 = v50;
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          LOWORD(v56) = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v51,  OS_SIGNPOST_INTERVAL_END,  v43,  "TransferTimeBytes",  " enableTelemetry=YES ",  (uint8_t *)&v56,  2u);
        }

        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 6LL);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress sf_personRealName](self->_progress, "sf_personRealName"));

        if (!v52) {
          goto LABEL_6;
        }
        double v18 = 0.0;
        __int128 v19 = self;
        uint64_t v20 = 9LL;
        break;
      case 10LL:
        v53 = self->_progress;
        v54 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationErrorKey]);
        v55 = (void *)objc_claimAutoreleasedReturnValue([v54 localizedDescription]);
        -[NSProgress sf_failedWithError:](v53, "sf_failedWithError:", v55);

        double v18 = 0.0;
        __int128 v19 = self;
        uint64_t v20 = 10LL;
        break;
      case 11LL:
        if (self->_conversionActive) {
          goto LABEL_6;
        }
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 2LL);
        double v18 = 0.0;
        __int128 v19 = self;
        uint64_t v20 = 11LL;
        break;
      case 15LL:
        -[NSProgress setSf_transferState:](self->_progress, "setSf_transferState:", 1LL);
        -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", 0LL);
        goto LABEL_6;
      default:
        goto LABEL_6;
    }
  }

  -[SDAirDropSession postNotificationForTransferStatus:progress:]( v19,  "postNotificationForTransferStatus:progress:",  v20,  v18);
LABEL_6:
  self->_lastEvent = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained airDropSession:self event:a4 withResults:v11];
}

- (void)startProgress
{
  if (!self->_progress && self->_clientBundleID)
  {
    objc_super v3 = self->_rootNodeName;
    if (v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_properties,  "objectForKeyedSubscript:",  kSFOperationSessionIDKey));
      if (v4)
      {
        id location = 0LL;
        objc_initWeak(&location, self);
        id v5 = objc_alloc(&OBJC_CLASS___NSProgress);
        uint64_t v6 = (NSProgress *)objc_claimAutoreleasedReturnValue( -[NSProgress sf_initWithAppBundle:sessionID:andPersonRealName:]( v5,  "sf_initWithAppBundle:sessionID:andPersonRealName:",  self->_clientBundleID,  v4,  v3));
        progress = self->_progress;
        self->_progress = v6;

        -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 100LL);
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_10000E7D0;
        v10[3] = &unk_1005CB140;
        objc_copyWeak(&v12, &location);
        id v11 = v4;
        -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v10);
        -[NSProgress _publish](self->_progress, "_publish");

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }

      else
      {
        uint64_t v8 = airdrop_log(0LL);
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10000EDFC(v9);
        }
      }
    }
  }

- (void)handleConversionProgress:(id)a3
{
  id v7 = a3;
  conversionProgress = self->_conversionProgress;
  if (!conversionProgress)
  {
    id v5 = (NSProgress *)objc_claimAutoreleasedReturnValue( +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  0LL));
    uint64_t v6 = self->_conversionProgress;
    self->_conversionProgress = v5;

    conversionProgress = self->_conversionProgress;
  }

  self->_conversionActive = 1;
  -[NSProgress setTotalUnitCount:]( conversionProgress,  "setTotalUnitCount:",  (char *)-[NSProgress totalUnitCount](conversionProgress, "totalUnitCount") + 100);
  -[NSProgress addChild:withPendingUnitCount:](self->_conversionProgress, "addChild:withPendingUnitCount:", v7, 100LL);
  if (!self->_conversionObserver && !self->_allowedWaiting)
  {
    self->_conversionObserver = 1;
    -[NSProgress addObserver:forKeyPath:options:context:]( self->_conversionProgress,  "addObserver:forKeyPath:options:context:",  self,  @"fractionCompleted",  0LL,  0LL);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"));

  if (v13)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSProgress, v14);
    if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
    {
      id v16 = v11;
      if (([v16 isCancelled] & 1) == 0 && self->_conversionActive)
      {
        __int128 v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 100LL));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  @"conversionTotal");

        [v16 fractionCompleted];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19 * 100.0 * 0.2));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v20,  kSFOperationPercentConvertedKey);

        -[NSMutableDictionary addEntriesFromDictionary:](self->_results, "addEntriesFromDictionary:", v17);
        -[SDAirDropSession airDropClient:event:withResults:](self, "airDropClient:event:withResults:", 0LL, 15LL, v17);
      }

      if (([v16 isCancelled] & 1) == 0 && !self->_hadConversion)
      {
        [v16 fractionCompleted];
        -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (uint64_t)(v21 * 100.0 * 0.2));
        -[SDAirDropSession postNotificationForTransferStatus:progress:]( self,  "postNotificationForTransferStatus:progress:",  15LL,  (double)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount"));
      }

      [v16 fractionCompleted];
      if (v22 == 1.0 || [v16 isCancelled])
      {
        self->_hadConversion = 1;
        *(_WORD *)&self->_conversionActive = 0;
        if (self->_conversionObserver)
        {
          self->_conversionObserver = 0;
          -[NSProgress removeObserver:forKeyPath:]( self->_conversionProgress,  "removeObserver:forKeyPath:",  self,  @"fractionCompleted");
          conversionProgress = self->_conversionProgress;
          self->_conversionProgress = 0LL;
        }
      }
    }
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000EBE8;
    block[3] = &unk_1005CB168;
    block[4] = self;
    id v25 = v10;
    id v26 = v11;
    id v27 = v12;
    os_signpost_id_t v28 = a6;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (SDAirDropSessionDelegate)delegate
{
  return (SDAirDropSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end