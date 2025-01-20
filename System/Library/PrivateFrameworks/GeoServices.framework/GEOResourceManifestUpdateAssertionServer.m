@interface GEOResourceManifestUpdateAssertionServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)checkinForUpdateAssertionWithRequest:(id)a3;
- (void)peerDidDisconnect:(id)a3;
@end

@implementation GEOResourceManifestUpdateAssertionServer

+ (id)identifier
{
  return @"resourcemanifestupdateassertion";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (sub_100011D18(v10) == 2583)
  {
    BOOL v13 = 1;
    if (sub_100012B28(v12, v11, @"resourcemanifestupdateassertion", v10, &off_10005E760, 1LL))
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___GEOResourceManifestUpdateAssertionXPCCheckinRequest, v14, v15);
      id v17 = sub_100012270(@"resourcemanifestupdateassertion", v10, v11, v16, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = v18;
      BOOL v13 = v18 != 0LL;
      if (v18)
      {
        [v18 setSignpostId:a6];
        -[GEOResourceManifestUpdateAssertionServer checkinForUpdateAssertionWithRequest:]( self,  "checkinForUpdateAssertionWithRequest:",  v19);
      }
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_peerToAssertionRecord, "objectForKey:", v4));
  if (v5)
  {
    -[NSMapTable removeObjectForKey:](self->_peerToAssertionRecord, "removeObjectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry]( &OBJC_CLASS___GEOResourceManifestUpdateAssertionRegistry,  "sharedRegistry"));
    [v6 removeAssertion:v5];
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GEOResourceManifestUpdateAssertionServer;
  -[GEOResourceManifestUpdateAssertionServer peerDidDisconnect:](&v7, "peerDidDisconnect:", v4);
}

- (void)checkinForUpdateAssertionWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  objc_super v7 = (void *)v6;
  v8 = @"<unknown>";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry]( &OBJC_CLASS___GEOResourceManifestUpdateAssertionRegistry,  "sharedRegistry"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 reason]);
  [v4 timestamp];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addAssertionForProcess:reason:creationTimestamp:", v9, v11));

  peerToAssertionRecord = self->_peerToAssertionRecord;
  if (!peerToAssertionRecord)
  {
    uint64_t v14 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  0LL,  5LL);
    uint64_t v15 = self->_peerToAssertionRecord;
    self->_peerToAssertionRecord = v14;

    peerToAssertionRecord = self->_peerToAssertionRecord;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](peerToAssertionRecord, "objectForKey:", v16));

  if (v17)
  {
    uint64_t v18 = GEOGetResourceManifestLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v4 reason]);
      int v24 = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "Process '%{public}@' already has an existing update assertion on this connection (reason: '%{public}@')",  (uint8_t *)&v24,  0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[GEOResourceManifestUpdateAssertionRegistry sharedRegistry]( &OBJC_CLASS___GEOResourceManifestUpdateAssertionRegistry,  "sharedRegistry"));
    [v21 removeAssertion:v17];
  }

  v22 = self->_peerToAssertionRecord;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  -[NSMapTable setObject:forKey:](v22, "setObject:forKey:", v12, v23);
}

- (void).cxx_destruct
{
}

@end