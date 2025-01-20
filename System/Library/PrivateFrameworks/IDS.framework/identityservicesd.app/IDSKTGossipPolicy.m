@interface IDSKTGossipPolicy
- (BOOL)havePreviouslyGossipedToURI:(id)a3;
- (BOOL)shouldGossipToURI:(id)a3;
- (BOOL)shouldSelfVerifyBecauseOfPeer;
- (IDSKTGossipPolicy)initWithGossipSpecification:(id)a3;
- (IDSKTGossipPolicySpecification)spec;
- (IDSKVStore)kvStore;
- (NSDate)lastSelfVerifyDate;
- (NSMutableSet)gossipRecipients;
- (void)_loadGossipRecipients;
- (void)_storeGossipRecipients;
- (void)markGossipForURI:(id)a3;
- (void)markSelfVerifyBecauseOfPeer;
- (void)resetGossipState;
- (void)setGossipRecipients:(id)a3;
- (void)setKvStore:(id)a3;
- (void)setLastSelfVerifyDate:(id)a3;
- (void)setSpec:(id)a3;
@end

@implementation IDSKTGossipPolicy

- (IDSKTGossipPolicy)initWithGossipSpecification:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v20 handleFailureInMethod:a2, self, @"IDSKTGossipPolicy.m", 38, @"Invalid parameter not satisfying: %@", @"spec" object file lineNumber description];
  }

  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IDSKTGossipPolicy;
  v7 = -[IDSKTGossipPolicy init](&v21, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_spec, a3);
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    gossipRecipients = v8->_gossipRecipients;
    v8->_gossipRecipients = v9;

    uint64_t v13 = CSDBGetMobileUserDirectory(v11, v12);
    if (v13) {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    }
    else {
      v14 = @"~";
    }
    v22[0] = v14;
    v22[1] = @"/Library/IdentityServices/ids-gossip.db";
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v15));

    if (v13) {
    v17 = -[IDSKVStore initWithPath:storeName:dataProtectionClass:]( objc_alloc(&OBJC_CLASS___IDSKVStore),  "initWithPath:storeName:dataProtectionClass:",  v16,  @"GossipCache",  0LL);
    }
    kvStore = v8->_kvStore;
    v8->_kvStore = v17;

    -[IDSKTGossipPolicy _loadGossipRecipients](v8, "_loadGossipRecipients");
  }

  return v8;
}

- (void)resetGossipState
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[IDSKTGossipPolicy setGossipRecipients:](self, "setGossipRecipients:", v3);

  -[IDSKTGossipPolicy _storeGossipRecipients](self, "_storeGossipRecipients");
}

- (BOOL)havePreviouslyGossipedToURI:(id)a3
{
  return -[NSMutableSet containsObject:](self->_gossipRecipients, "containsObject:", a3);
}

- (BOOL)shouldGossipToURI:(id)a3
{
  unsigned int v4 = -[NSMutableSet containsObject:](self->_gossipRecipients, "containsObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTGossipPolicy spec](self, "spec"));
  id v6 = v5;
  if (v4) {
    uint32_t v7 = [v5 subsequentGossipChance];
  }
  else {
    uint32_t v7 = [v5 firstGossipChance];
  }
  BOOL v8 = arc4random_uniform(0x64u) < v7;

  return v8;
}

- (void)markGossipForURI:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableSet count](self->_gossipRecipients, "count");
  if ((unint64_t)v4 >= -[IDSKTGossipPolicySpecification maxRecipientMemory](self->_spec, "maxRecipientMemory"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_gossipRecipients, "allObjects"));
    id v6 = objc_msgSend(v5, "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(v5, "count")));
    uint32_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NSMutableSet removeObject:](self->_gossipRecipients, "removeObject:", v7);
  }

  -[NSMutableSet addObject:](self->_gossipRecipients, "addObject:", v8);
  -[IDSKTGossipPolicy _storeGossipRecipients](self, "_storeGossipRecipients");
}

- (BOOL)shouldSelfVerifyBecauseOfPeer
{
  if (!self->_lastSelfVerifyDate) {
    return 1;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v3 timeIntervalSinceDate:self->_lastSelfVerifyDate];
  double v5 = v4;

  -[IDSKTGossipPolicySpecification selfVerifyThrottleTime](self->_spec, "selfVerifyThrottleTime");
  return v5 > v6;
}

- (void)markSelfVerifyBecauseOfPeer
{
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  lastSelfVerifyDate = self->_lastSelfVerifyDate;
  self->_lastSelfVerifyDate = v3;
}

- (void)_loadGossipRecipients
{
  kvStore = self->_kvStore;
  id v31 = 0LL;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKVStore dataForKey:error:](kvStore, "dataForKey:error:", @"gossip-recipient-set", &v31));
  id v5 = v31;
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIDSCategory("IDSKTGossipPolicy");
    uint32_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Error fetching stored gossip recipients { error: %@ }",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(1LL, @"IDSKTGossipPolicy"))
    {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSKTGossipPolicy",  @"Error fetching stored gossip recipients { error: %@ }");
    }
  }

  if (v4)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSMutableSet, v9);
    uint64_t v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___IDSURI, v11),  0LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v30 = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "_strictlyUnarchivedObjectOfClasses:fromData:error:",  v13,  v4,  &v30));
    id v15 = v30;

    if (v15)
    {
      uint64_t v16 = OSLogHandleForIDSCategory("IDSKTGossipPolicy");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Error unarchiving stored gossip recipients { error: %@ }",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v18)
        && _IDSShouldLog(1LL, @"IDSKTGossipPolicy"))
      {
        _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSKTGossipPolicy",  @"Error unarchiving stored gossip recipients { error: %@ }");
      }
    }

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v19 = v14;
    id v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___IDSURI, v20);
          if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0) {
            -[NSMutableSet addObject:](self->_gossipRecipients, "addObject:", v24);
          }
        }

        id v21 = [v19 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }

      while (v21);
    }
  }
}

- (void)_storeGossipRecipients
{
  gossipRecipients = self->_gossipRecipients;
  id v15 = 0LL;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  gossipRecipients,  1LL,  &v15));
  id v5 = v15;
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIDSCategory("IDSKTGossipPolicy");
    uint32_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Error archiving stored gossip recipients { error: %@ }",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(1LL, @"IDSKTGossipPolicy"))
    {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSKTGossipPolicy",  @"Error archiving stored gossip recipients { error: %@ }");
    }
  }

  kvStore = self->_kvStore;
  id v14 = 0LL;
  -[IDSKVStore persistData:forKey:error:](kvStore, "persistData:forKey:error:", v4, @"gossip-recipient-set", &v14);
  id v10 = v14;
  if (v10)
  {
    uint64_t v11 = OSLogHandleForIDSCategory("IDSKTGossipPolicy");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Error storing gossip recipients { error: %@ }",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(1LL, @"IDSKTGossipPolicy"))
    {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"IDSKTGossipPolicy",  @"Error storing gossip recipients { error: %@ }");
    }
  }
}

- (IDSKTGossipPolicySpecification)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
}

- (NSMutableSet)gossipRecipients
{
  return self->_gossipRecipients;
}

- (void)setGossipRecipients:(id)a3
{
}

- (IDSKVStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
}

- (NSDate)lastSelfVerifyDate
{
  return self->_lastSelfVerifyDate;
}

- (void)setLastSelfVerifyDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end