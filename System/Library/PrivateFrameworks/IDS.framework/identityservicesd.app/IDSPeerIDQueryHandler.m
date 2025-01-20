@interface IDSPeerIDQueryHandler
+ (BOOL)isQueryRetryForBadSignatureEnabled;
+ (BOOL)isServerBackoffModeActive;
+ (BOOL)shouldUseSelfTokens;
+ (double)queryRetryIntervalForBadSignature;
+ (int)queryRetryNumberForBadSignature;
+ (int)serverBackoffModeMaxSenderRetries;
+ (int)serverBackoffModeReceiverRetryInterval;
- (BOOL)_addCompletionBlock:(id)a3 forURIs:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8;
- (BOOL)isInServerBackoffMode;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (FTMessageDelivery_DualMode)dualInterfaceidQueryMessageDelivery;
- (IDSPeerIDNetworkChangeNotifier)networkChangeNotifier;
- (IDSPeerIDPushHandler)pushHandler;
- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4;
- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4 dualMessageDelivery:(id)a5 networkChangeNotifier:(id)a6 pushHandler:(id)a7;
- (IDSPeerIDQueryHandlerDataSource)dataSource;
- (IDSPeerIDQueryHandlerDelegate)delegate;
- (NSMutableArray)queryQueue;
- (NSMutableDictionary)completionBlocksToURIsMap;
- (NSMutableDictionary)disasterModeTokens;
- (NSMutableDictionary)extraCompletionBlocks;
- (id)_completionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6;
- (void)_bagLoaded:(id)a3;
- (void)_dequeuePendingQueryIfPossible;
- (void)_removeCompletionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6;
- (void)_startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8 reason:(id)a9 completionBlock:(id)a10;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)dealloc;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)setCompletionBlocksToURIsMap:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisasterModeTokens:(id)a3;
- (void)setDualInterfaceidQueryMessageDelivery:(id)a3;
- (void)setExtraCompletionBlocks:(id)a3;
- (void)setIsInServerBackoffMode:(BOOL)a3;
- (void)setNetworkChangeNotifier:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueryQueue:(id)a3;
@end

@implementation IDSPeerIDQueryHandler

+ (BOOL)shouldUseSelfTokens
{
  if (IMGetDomainBoolForKey(@"com.apple.ids", @"ForceSelfTokens"))
  {
    _IMWarn(@"***** Forcing self tokens mode *****");
    return 1;
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"vc-disaster-sender-self-tokens"]);
    BOOL v2 = (int)[v4 intValue] > 0;
  }

  return v2;
}

+ (BOOL)isServerBackoffModeActive
{
  if (IMGetDomainBoolForKey(@"com.apple.ids", @"DebiliatedMode"))
  {
    _IMWarn(@"***** Forcing debiliated mode *****");
    return 1;
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    unsigned __int8 v4 = [v3 isInDebilitatedMode];

    return v4;
  }

+ (int)serverBackoffModeMaxSenderRetries
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"vc-disaster-sender-max-retries"]);

  if (v3)
  {
    int v4 = [v3 intValue];
    else {
      int v5 = v4 & ~(v4 >> 31);
    }
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (int)serverBackoffModeReceiverRetryInterval
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"vc-disaster-receiver-retry-interval"]);

  if (v3)
  {
    int v4 = [v3 intValue];
    else {
      int v5 = v4 & ~(v4 >> 31);
    }
  }

  else
  {
    int v5 = 300;
  }

  return v5;
}

+ (BOOL)isQueryRetryForBadSignatureEnabled
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"id-query-bad-signature-retry-enabled"]);

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (double)queryRetryIntervalForBadSignature
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"id-query-bad-signature-retry-interval"]);

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }

  else
  {
    double v5 = 5.0;
  }

  return v5;
}

+ (int)queryRetryNumberForBadSignature
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"id-query-bad-signature-retry-number"]);

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 1;
  }

  return v4;
}

- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[FTMessageDelivery_DualMode initWithPreferedType:]( objc_alloc(&OBJC_CLASS___FTMessageDelivery_DualMode),  "initWithPreferedType:",  1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationRequestTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationRequestTracker,  "sharedInstance"));
  -[FTMessageDelivery_DualMode addRequestObserver:](v8, "addRequestObserver:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NetworkChangeNotifier sharedInstance](&OBJC_CLASS___NetworkChangeNotifier, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  v12 = -[IDSPeerIDQueryHandler initWithDelegate:dataSource:dualMessageDelivery:networkChangeNotifier:pushHandler:]( self,  "initWithDelegate:dataSource:dualMessageDelivery:networkChangeNotifier:pushHandler:",  v7,  v6,  v8,  v10,  v11);

  return v12;
}

- (IDSPeerIDQueryHandler)initWithDelegate:(id)a3 dataSource:(id)a4 dualMessageDelivery:(id)a5 networkChangeNotifier:(id)a6 pushHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSPeerIDQueryHandler;
  v17 = -[IDSPeerIDQueryHandler init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_storeStrong((id *)&v18->_dataSource, a4);
    objc_storeStrong((id *)&v18->_networkChangeNotifier, a6);
    objc_storeStrong((id *)&v18->_dualInterfaceidQueryMessageDelivery, a5);
    -[FTMessageDelivery_DualMode setUserAgent:]( v18->_dualInterfaceidQueryMessageDelivery,  "setUserAgent:",  @"com.apple.madrid-lookup");
    objc_storeStrong((id *)&v18->_pushHandler, a7);
    v18->_isInServerBackoffMode = +[IDSPeerIDQueryHandler isServerBackoffModeActive]( &OBJC_CLASS___IDSPeerIDQueryHandler,  "isServerBackoffModeActive");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v18 selector:"_bagLoaded:" name:IDSServerBagFinishedLoadingNotification object:0];
  }

  return v18;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:0 object:0];

  -[FTMessageDelivery_DualMode invalidate](self->_dualInterfaceidQueryMessageDelivery, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSPeerIDQueryHandler;
  -[IDSPeerIDQueryHandler dealloc](&v4, "dealloc");
}

- (void)_bagLoaded:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IDSPeerIDQueryHandler isServerBackoffModeActive]( &OBJC_CLASS___IDSPeerIDQueryHandler,  "isServerBackoffModeActive");
  if (self->_isInServerBackoffMode != v5)
  {
    self->_isInServerBackoffMode = v5;
    uint64_t v6 = OSLogHandleForIDSCategory("PeerIDManager");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isInServerBackoffMode) {
        v8 = @"YES";
      }
      else {
        v8 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Bag loaded notification! Is in backoff mode changed to %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Bag loaded notification! Is in backoff mode changed to %@");
    }

    if (self->_isInServerBackoffMode) {
      v10 = @"entered";
    }
    else {
      v10 = @"left";
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iMessage server has %@ debilitated mode.",  v10));
    sub_10012E874(0, @"iMessage Debilitated Mode", v11, 1073LL);
  }
}

- (BOOL)_addCompletionBlock:(id)a3 forURIs:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8
{
  id v63 = a3;
  id v14 = a4;
  id v15 = (__CFString *)a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count])
  {
    id v60 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v15, "prefixedURI"));
    id v20 = [v19 length];

    if (v20)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "__imArrayByApplyingBlock:", &stru_100901B40));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "__imSetFromArray"));
      id v21 = sub_100345EB8(v15, v16, [v17 forRefresh]);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_completionBlocksToURIsMap, "objectForKey:", v62));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v61]);
      id v24 = [v23 count];
      BOOL v25 = v24 == 0LL;

      if (v63)
      {
        if (v24 || ![v17 preventNewQuery])
        {
          completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
          if (!completionBlocksToURIsMap)
          {
            Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
            v31 = self->_completionBlocksToURIsMap;
            self->_completionBlocksToURIsMap = Mutable;

            completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
          }

          CFMutableDictionaryRef v32 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( completionBlocksToURIsMap,  "objectForKey:",  v62));
          if (!v32)
          {
            CFMutableDictionaryRef v32 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            -[NSMutableDictionary setObject:forKey:](self->_completionBlocksToURIsMap, "setObject:forKey:", v32, v62);
          }

          v33 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v32, "objectForKey:", v61));
          if (!v33)
          {
            v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            -[__CFDictionary setObject:forKey:](v32, "setObject:forKey:", v33, v61);
          }

          uint64_t v34 = OSLogHandleForIDSCategory("PeerLookup");
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v36 = [v17 forRefresh];
            unsigned int v37 = [v17 preventNewQuery];
            v38 = @"NO";
            *(_DWORD *)buf = 138413826;
            v65 = v15;
            if (v36) {
              v39 = @"YES";
            }
            else {
              v39 = @"NO";
            }
            if (v37) {
              v40 = @"YES";
            }
            else {
              v40 = @"NO";
            }
            if (!v24) {
              v38 = @"YES";
            }
            __int16 v66 = 2112;
            id v67 = v16;
            __int16 v68 = 2112;
            v69 = v39;
            __int16 v70 = 2112;
            v71 = v40;
            __int16 v72 = 2112;
            v73 = v38;
            __int16 v74 = 2112;
            id v75 = v60;
            __int16 v76 = 2112;
            id v77 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Adding queued query fromURI: %@  service: %@   forRefresh: %@ preventNew: %@ first query: %@ identifier: %@ for URIs: %@",  buf,  0x48u);
          }

          if (os_log_shim_legacy_logging_enabled(v41)
            && _IDSShouldLog(0LL, @"PeerLookup"))
          {
            else {
              v42 = @"NO";
            }
            v58 = v42;
            else {
              v43 = @"NO";
            }
            if (v24) {
              v44 = @"NO";
            }
            else {
              v44 = @"YES";
            }
            id v56 = v60;
            id v57 = v14;
            v54 = v43;
            v55 = v44;
            id v52 = v16;
            v53 = v58;
            v51 = v15;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"Adding queued query fromURI: %@  service: %@   forRefresh: %@ preventNew: %@ first query: %@ identifier: %@ for URIs: %@");
          }

          id v45 = objc_msgSend(v63, "copy", v51, v52, v53, v54, v55, v56, v57);
          -[NSMutableArray addObject:](v33, "addObject:", v45);
        }

        else
        {
          uint64_t v26 = OSLogHandleForIDSCategory("PeerLookup");
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v65 = @"YES";
            __int16 v66 = 2112;
            id v67 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "First query, but not allowed to start: %@ %@",  buf,  0x16u);
          }

          if (os_log_shim_legacy_logging_enabled(v28)
            && _IDSShouldLog(0LL, @"PeerLookup"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"First query, but not allowed to start: %@ %@");
          }

          BOOL v25 = 1;
        }
      }

      else
      {
        uint64_t v46 = OSLogHandleForIDSCategory("PeerLookup");
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = @"NO";
          if (!v24) {
            v48 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v65 = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "No block supplied, but is this the first query: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v49)
          && _IDSShouldLog(0LL, @"PeerLookup"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"No block supplied, but is this the first query: %@");
        }
      }
    }

    else
    {
      BOOL v25 = 0;
    }

    id v18 = v60;
  }

  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (id)_completionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6
{
  unsigned int v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__imArrayByApplyingBlock:", &stru_100901B60));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "__imSetFromArray"));

    completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
    id v16 = sub_100345EB8(v11, v12, v6);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](completionBlocksToURIsMap, "objectForKey:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v14]);
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

- (void)_removeCompletionBlocksForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5 forRefresh:(BOOL)a6
{
  unsigned int v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    id v13 = sub_100345EB8(v11, v12, v6);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_completionBlocksToURIsMap, "objectForKey:", v14));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__imArrayByApplyingBlock:", &stru_100901B80));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imSetFromArray"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v17]);

    [v15 removeObjectForKey:v17];
    if (![v15 count]) {
      -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksToURIsMap, "removeObjectForKey:", v14);
    }
    uint64_t v19 = OSLogHandleForIDSCategory("PeerLookup");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = @"YES";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v10;
      if (!v18) {
        id v21 = @"NO";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      v33 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Removing queued query for URIs: %@   fromURI: %@  service: %@ URIs set found in completion block map: %@",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v22) && _IDSShouldLog(0LL, @"PeerLookup"))
    {
      v23 = @"YES";
      if (!v18) {
        v23 = @"NO";
      }
      id v27 = v12;
      uint64_t v28 = v23;
      id v25 = v10;
      id v26 = v11;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"Removing queued query for URIs: %@   fromURI: %@  service: %@ URIs set found in completion block map: %@");
    }

    if (!-[NSMutableDictionary count](self->_completionBlocksToURIsMap, "count", v25, v26, v27, v28, *(_OWORD *)buf))
    {
      completionBlocksToURIsMap = self->_completionBlocksToURIsMap;
      self->_completionBlocksToURIsMap = 0LL;
    }
  }
}

- (void)_startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 queryIdentifier:(id)a8 reason:(id)a9 completionBlock:(id)a10
{
  id v16 = (IDSPeerIDQueryHandler *)a3;
  id v17 = (NSDictionary *)a4;
  id v18 = (IDSPeerIDQueryHandler *)a5;
  id v19 = a6;
  id v54 = a7;
  id v50 = a8;
  id v51 = a9;
  id v53 = a10;
  id v20 = -[IDSPeerIDQueryHandler count](v16, "count");
  id v52 = v17;
  if (v19 && v18 && v17 && v20)
  {
    queryQueue = self->_queryQueue;
    if (!queryQueue)
    {
      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v23 = self->_queryQueue;
      self->_queryQueue = v22;

      queryQueue = self->_queryQueue;
    }

    id v24 = (NSDictionary *)-[NSMutableArray count](queryQueue, "count");
    if ((unint64_t)v24 > 0x3C)
    {
      v40 = v24;
      uint64_t v41 = OSLogHandleForIDSCategory("PeerLookup");
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413314;
        id v56 = self;
        __int16 v57 = 2048;
        v58 = v40;
        __int16 v59 = 2112;
        id v60 = v16;
        __int16 v61 = 2112;
        id v62 = v19;
        __int16 v63 = 2112;
        v64 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%@ uh-oh! Our queue is too long %lu. Dropping id query for URIs %@ fromService %@ fromURI %@",  buf,  0x34u);
      }

      if (os_log_shim_legacy_logging_enabled(v43)
        && _IDSShouldLog(0LL, @"PeerLookup"))
      {
        id v47 = v19;
        v48 = v18;
        id v45 = v40;
        uint64_t v46 = v16;
        v44 = self;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"%@ uh-oh! Our queue is too long %lu. Dropping id query for URIs %@ fromService %@ fromURI %@");
      }
    }

    else
    {
      uint64_t v49 = objc_alloc(&OBJC_CLASS___NSDictionary);
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v54 forSending]));
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v54 forRefresh]));
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v54 forMessaging]));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v54 resultExpected]));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v54 isForced]));
      __int16 v30 = -[NSDictionary initWithObjectsAndKeys:]( v49,  "initWithObjectsAndKeys:",  v16,  @"URIs",  v52,  @"FromIdentity",  v18,  @"FromURI",  v19,  @"FromService",  v25,  @"ForSending",  v26,  @"forRefresh",  v27,  @"ForMessaging",  v28,  @"ResultExpected",  v29,  @"IsForced",  v50,  @"QueryIdentifier",  v51,  @"QueryReason",  0LL);

      -[NSMutableArray addObject:](self->_queryQueue, "addObject:", v30);
      uint64_t v31 = OSLogHandleForIDSCategory("PeerLookup");
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (IDSPeerIDQueryHandler *)-[NSMutableArray count](self->_queryQueue, "count");
        *(_DWORD *)buf = 138412802;
        id v56 = self;
        __int16 v57 = 2112;
        v58 = v30;
        __int16 v59 = 2048;
        id v60 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ enqueuing work %@. Current queue size is %lu",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v34)
        && _IDSShouldLog(0LL, @"PeerLookup"))
      {
        id v45 = v30;
        uint64_t v46 = (IDSPeerIDQueryHandler *)-[NSMutableArray count](self->_queryQueue, "count");
        v44 = self;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"%@ enqueuing work %@. Current queue size is %lu");
      }
    }

    -[IDSPeerIDQueryHandler _dequeuePendingQueryIfPossible]( self,  "_dequeuePendingQueryIfPossible",  v44,  v45,  v46,  v47,  v48);
  }

  else
  {
    uint64_t v35 = OSLogHandleForIDSCategory("PeerLookup");
    unsigned int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v56 = v16;
      __int16 v57 = 2112;
      v58 = v17;
      __int16 v59 = 2112;
      id v60 = v18;
      __int16 v61 = 2112;
      id v62 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "  *** failing query for URIs: %@    cert: %@   fromURI: %@   fromService: %@",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v37) && _IDSShouldLog(0LL, @"PeerLookup"))
    {
      uint64_t v46 = v18;
      id v47 = v19;
      id v45 = v17;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"  *** failing query for URIs: %@    cert: %@   fromURI: %@   fromService: %@");
    }

    if (v53)
    {
      -[IDSPeerIDQueryHandler _removeCompletionBlocksForURIs:fromURI:fromService:forRefresh:]( self,  "_removeCompletionBlocksForURIs:fromURI:fromService:forRefresh:",  v16,  v18,  v19,  [v54 forRefresh]);
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSPeerIDManagerErrorDomain,  2LL,  0LL));
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithKeyArray:defaultValue:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithKeyArray:defaultValue:",  v16,  v38));

      LOBYTE(v45) = 0;
      (*((void (**)(id, IDSPeerIDQueryHandler *, void, IDSPeerIDQueryHandler *, void, void, id, void, void *, NSDictionary *, IDSPeerIDQueryHandler *, id))v53
       + 2))( v53,  v18,  0LL,  v16,  0LL,  0LL,  v19,  0LL,  v39,  v45,  v46,  v47);
    }
  }
}

- (void)_dequeuePendingQueryIfPossible
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( -[FTMessageDelivery_DualMode queuedMessages]( self->_dualInterfaceidQueryMessageDelivery,  "queuedMessages"));
  id v3 = [v2 count];

  if (!-[NSMutableArray count](self->_queryQueue, "count"))
  {
    uint64_t v7 = OSLogHandleForIDSCategory("PeerLookup");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Asked to _dequeuePendingQueryIfPossible but we have no queued queries",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(1LL, @"PeerLookup")) {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"PeerLookup",  @"Asked to _dequeuePendingQueryIfPossible but we have no queued queries");
    }
    return;
  }

  if ((unint64_t)v3 >= 6)
  {
    uint64_t v4 = OSLogHandleForIDSCategory("PeerLookup");
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Tried to _dequeuePendingQueryIfPossible but we currently have %lu in-flight queries",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v6))
    {
      if (_IDSShouldLog(0LL, @"PeerLookup")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"Tried to _dequeuePendingQueryIfPossible but we currently have %lu in-flight queries");
      }
    }

    return;
  }

  v170 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_queryQueue, "objectAtIndex:", 0LL));
  -[NSMutableArray removeObjectAtIndex:](self->_queryQueue, "removeObjectAtIndex:", 0LL);
  if (!-[NSMutableArray count](self->_queryQueue, "count"))
  {
    queryQueue = self->_queryQueue;
    self->_queryQueue = 0LL;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"URIs"]);
  v169 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"FromIdentity"]);
  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"FromURI"]);
  v183 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"FromService"]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"ForSending"]);
  unsigned __int8 v162 = [v13 BOOLValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"forRefresh"]);
  unsigned int v182 = [v14 BOOLValue];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"ForMessaging"]);
  unsigned int v166 = [v15 BOOLValue];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"ResultExpected"]);
  unsigned int v165 = [v16 BOOLValue];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"IsForced"]);
  unsigned int v164 = [v17 BOOLValue];

  v168 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v170 objectForKey:@"QueryIdentifier"]);
  v167 = (void *)objc_claimAutoreleasedReturnValue([v170 objectForKey:@"QueryReason"]);
  uint64_t v18 = OSLogHandleForIDSCategory("PeerLookup");
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v183;
    *(_WORD *)&_BYTE buf[22] = 2112;
    v244 = v168;
    *(_WORD *)v245 = 2112;
    *(void *)&v245[2] = v167;
    *(_WORD *)&v245[10] = 2112;
    *(void *)&v245[12] = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Starting ID query from URI: %@ Service: %@ identifier: %@ reason: %@ for IDs: %@",  buf,  0x34u);
  }

  if (os_log_shim_legacy_logging_enabled(v20))
  {
    v160 = v167;
    v161 = v11;
    v154 = v183;
    v157 = v168;
    v149 = v12;
    _IDSLogEventV( @"IDSFoundation",  @"PeerLookup",  @"Starting ID query from URI: %@ Service: %@ identifier: %@ reason: %@ for IDs: %@");
  }

  uint64_t v21 = OSLogHandleForIDSCategory("PeerLookup");
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v169;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "       Identity: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v23) && _IDSShouldLog(0LL, @"PeerLookup"))
  {
    v149 = v169;
    _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup", @"       Identity: %@");
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationKeyManager sharedInstance]( &OBJC_CLASS___IDSRegistrationKeyManager,  "sharedInstance",  v149,  v154,  v157,  v160,  v161));
  id v163 = [v24 identityPrivateKey];

  v230[0] = 0LL;
  v230[1] = v230;
  v230[2] = 0x2020000000LL;
  char v231 = 1;
  v228[0] = 0LL;
  v228[1] = v228;
  v228[2] = 0x2020000000LL;
  char v229 = 1;
  v226[0] = 0LL;
  v226[1] = v226;
  v226[2] = 0x2020000000LL;
  int v227 = 0;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v244 = sub_100348578;
  *(void *)v245 = sub_100348588;
  *(void *)&v245[8] = 0LL;
  uint64_t v220 = 0LL;
  v221 = &v220;
  uint64_t v222 = 0x3032000000LL;
  v223 = sub_100348578;
  v224 = sub_100348588;
  id v225 = 0LL;
  else {
    double v25 = 60.0;
  }
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v175 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v218 = 0u;
  __int128 v219 = 0u;
  __int128 v216 = 0u;
  __int128 v217 = 0u;
  id obj = v11;
  id v27 = [obj countByEnumeratingWithState:&v216 objects:v242 count:16];
  v177 = v26;
  if (!v27)
  {
    LODWORD(v171) = 0;
    goto LABEL_96;
  }

  int v172 = 0;
  uint64_t v171 = 0LL;
  uint64_t v28 = *(void *)v217;
  v180 = (void *)kIDSServiceDefaultsSentinelAlias;
  do
  {
    v29 = 0LL;
    do
    {
      if (*(void *)v217 != v28) {
        objc_enumerationMutation(obj);
      }
      __int16 v30 = *(__CFString **)(*((void *)&v216 + 1) + 8LL * (void)v29);
      uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString tokenFreeURI](v30, "tokenFreeURI", v150));
      if ((v182 & 1) == 0)
      {
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDQueryHandler dataSource](self, "dataSource"));
        unsigned int v33 = [v32 hasQueryResultsForURI:v30 fromURI:v12 service:v183];

        if (v33)
        {
          uint64_t v34 = OSLogHandleForIDSCategory("PeerLookup");
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v240 = 138412802;
            *(void *)&v240[4] = v30;
            *(_WORD *)&v240[12] = 2112;
            *(void *)&v240[14] = v12;
            *(_WORD *)&v240[22] = 2112;
            id v241 = v183;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "               Skipping URI: %@   => already have tokens   (From: %@   Service: %@)",  v240,  0x20u);
          }

          if (os_log_shim_legacy_logging_enabled(v36)
            && _IDSShouldLog(0LL, @"PeerLookup"))
          {
            v155 = v12;
            id v158 = v183;
            v150 = v30;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"               Skipping URI: %@   => already have tokens   (From: %@   Service: %@)");
          }

          -[NSMutableArray addObject:](v175, "addObject:", v31, v150, v155, v158);
          goto LABEL_65;
        }
      }

      uint64_t v37 = (NSMutableArray *)-[__CFString FZIDType](v31, "FZIDType");
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray prefixedURI](v12, "prefixedURI"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "_im_normalizedURIString"));
      v40 = (void *)objc_claimAutoreleasedReturnValue([v180 lowercaseString]);
      BOOL v41 = [v39 rangeOfString:v40] == (id)0x7FFFFFFFFFFFFFFFLL;

      if (!v41)
      {
        uint64_t v53 = OSLogHandleForIDSCategory("PeerLookup");
        id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v240 = 138412290;
          *(void *)&v240[4] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "******** Found sentinel alias as from URI: %@, failing *********",  v240,  0xCu);
        }

        char v56 = _IDSShouldLog(0LL, @"PeerLookup");
        id v52 = @"******** Found sentinel alias as from URI: %@, failing *********";
        goto LABEL_57;
      }

      if (-[NSMutableArray FZIDType](v12, "FZIDType") == (id)-1LL)
      {
        uint64_t v57 = OSLogHandleForIDSCategory("PeerLookup");
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v240 = 138412290;
          *(void *)&v240[4] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "******** Found invalid from URI: %@, failing *********",  v240,  0xCu);
        }

        char v56 = _IDSShouldLog(0LL, @"PeerLookup");
        id v52 = @"******** Found invalid from URI: %@, failing *********";
LABEL_57:
        id v60 = (const __CFString *)v12;
        if ((v56 & 1) != 0) {
          goto LABEL_64;
        }
        goto LABEL_65;
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v31, "prefixedURI"));
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "_im_normalizedURIString"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v180 lowercaseString]);
      BOOL v45 = [v43 rangeOfString:v44] == (id)0x7FFFFFFFFFFFFFFFLL;

      if (v45)
      {
        if (v37 != (NSMutableArray *)1)
        {
          if ((unint64_t)v37 >= 7)
          {
            uint64_t v64 = OSLogHandleForIDSCategory("PeerLookup");
            v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v240 = 138412546;
              *(void *)&v240[4] = v31;
              *(_WORD *)&v240[12] = 2048;
              *(void *)&v240[14] = v37;
              _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "******** Found bad URI type in query set: %@ (%ld), failing *********",  v240,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v66)
              && _IDSShouldLog(0LL, @"PeerLookup"))
            {
              v150 = v31;
              v155 = v37;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"******** Found bad URI type in query set: %@ (%ld), failing *********");
            }

            goto LABEL_65;
          }

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ([v15 count])
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    unsigned int v23 = -[IDSPeerIDQueryHandler _addCompletionBlock:forURIs:fromURI:fromService:context:queryIdentifier:]( self,  "_addCompletionBlock:forURIs:fromURI:fromService:context:queryIdentifier:",  v21,  v15,  v17,  v18,  v19,  v22);
    if (v23 && ([v19 preventNewQuery] & 1) == 0) {
      -[IDSPeerIDQueryHandler _startQueryForURIs:fromIdentity:fromURI:fromService:context:queryIdentifier:reason:completionBlock:]( self,  "_startQueryForURIs:fromIdentity:fromURI:fromService:context:queryIdentifier:reason:completionBlock:",  v15,  v16,  v17,  v18,  v19,  v22,  v20,  v21);
    }
    unsigned int v24 = v23 & [v19 preventNewQuery] ^ 1;
  }

  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (!self->_extraCompletionBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        extraCompletionBlocks = self->_extraCompletionBlocks;
        self->_extraCompletionBlocks = Mutable;
      }

      id v10 = [v6 copy];
      id v11 = v10;
      if (v10)
      {
        id v12 = self->_extraCompletionBlocks;
        id v13 = objc_retainBlock(v10);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v7);
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("PeerIDManager");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Empty completion block for token: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"PeerIDManager"))
      {
        _IDSLogV(0LL, @"IDSFoundation", @"PeerIDManager", @"Empty completion block for token: %@");
      }
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("PeerIDManager");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Empty token for completion block", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"PeerIDManager", @"Empty token for completion block");
    }
  }
}

- (void)removeCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_extraCompletionBlocks, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_extraCompletionBlocks, "count"))
    {
      extraCompletionBlocks = self->_extraCompletionBlocks;
      self->_extraCompletionBlocks = 0LL;
    }
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("PeerIDManager");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Empty token for removing completion block",  v9,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"PeerIDManager", @"Empty token for removing completion block");
    }
  }
}

- (FTMessageDelivery_DualMode)dualInterfaceidQueryMessageDelivery
{
  return self->_dualInterfaceidQueryMessageDelivery;
}

- (void)setDualInterfaceidQueryMessageDelivery:(id)a3
{
}

- (NSMutableArray)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
}

- (NSMutableDictionary)completionBlocksToURIsMap
{
  return self->_completionBlocksToURIsMap;
}

- (void)setCompletionBlocksToURIsMap:(id)a3
{
}

- (NSMutableDictionary)extraCompletionBlocks
{
  return self->_extraCompletionBlocks;
}

- (void)setExtraCompletionBlocks:(id)a3
{
}

- (NSMutableDictionary)disasterModeTokens
{
  return self->_disasterModeTokens;
}

- (void)setDisasterModeTokens:(id)a3
{
}

- (BOOL)isInServerBackoffMode
{
  return self->_isInServerBackoffMode;
}

- (void)setIsInServerBackoffMode:(BOOL)a3
{
  self->_isInServerBackoffMode = a3;
}

- (IDSPeerIDNetworkChangeNotifier)networkChangeNotifier
{
  return self->_networkChangeNotifier;
}

- (void)setNetworkChangeNotifier:(id)a3
{
}

- (IDSPeerIDPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSPeerIDQueryHandlerDelegate)delegate
{
  return (IDSPeerIDQueryHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSPeerIDQueryHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end