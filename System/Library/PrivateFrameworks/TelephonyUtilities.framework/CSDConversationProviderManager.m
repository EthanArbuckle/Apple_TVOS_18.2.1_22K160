@interface CSDConversationProviderManager
+ (CSDConversationProviderManager)sharedInstance;
+ (id)errorForDisabledPseudonyms;
+ (id)errorForUnregisteredProviderIdentifier:(id)a3;
- (CSDConversationProviderManager)init;
- (CSDSharedConversationServerBag)serverBag;
- (NSMutableDictionary)pidToCachedProviderIdentifiers;
- (NSMutableDictionary)pidToProcessHandle;
- (NSMutableDictionary)pidToProviderIdentifiers;
- (NSMutableDictionary)providerIdentifierToProvider;
- (TUFeatureFlags)featureFlags;
- (id)beginListeningBlock;
- (id)conversationProviderForIdentifier:(id)a3;
- (id)providerIdentifiersForClient:(id)a3;
- (id)serviceForProvider:(id)a3;
- (id)tuConversationProviderForIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)createProcessMonitorIfNecessary:(id)a3 forClient:(id)a4;
- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6;
- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4;
- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6;
- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5;
- (void)setBeginListeningBlock:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setServerBag:(id)a3;
- (void)startTrackingClient:(id)a3 forProviderIdentifier:(id)a4;
- (void)stopTrackingClient:(id)a3;
@end

@implementation CSDConversationProviderManager

+ (CSDConversationProviderManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001670D8;
  block[3] = &unk_1003D7F10;
  block[4] = a1;
  if (qword_10044D0D0 != -1) {
    dispatch_once(&qword_10044D0D0, block);
  }
  return (CSDConversationProviderManager *)(id)qword_10044D0C8;
}

- (CSDConversationProviderManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CSDConversationProviderManager;
  v2 = -[CSDConversationProviderManager init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    providerIdentifierToProvider = v3->_providerIdentifierToProvider;
    v3->_providerIdentifierToProvider = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pidToProviderIdentifiers = v3->_pidToProviderIdentifiers;
    v3->_pidToProviderIdentifiers = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pidToCachedProviderIdentifiers = v3->_pidToCachedProviderIdentifiers;
    v3->_pidToCachedProviderIdentifiers = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pidToProcessHandle = v3->_pidToProcessHandle;
    v3->_pidToProcessHandle = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v3->_featureFlags;
    v3->_featureFlags = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v3->_serverBag;
    v3->_serverBag = v14;
  }

  return v3;
}

- (void)startTrackingClient:(id)a3 forProviderIdentifier:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_accessorLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v21 processIdentifier]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProviderIdentifiers](self, "pidToProviderIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);

    if (!v11)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProviderIdentifiers](self, "pidToProviderIdentifiers"));
      [v13 setObject:v12 forKeyedSubscript:v7];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProviderIdentifiers](self, "pidToProviderIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v7]);
    id v16 = [v6 copy];
    [v15 addObject:v16];
  }

  else
  {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager pidToCachedProviderIdentifiers]( self,  "pidToCachedProviderIdentifiers"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v7]);

    if (!v18)
    {
      v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager pidToCachedProviderIdentifiers]( self,  "pidToCachedProviderIdentifiers"));
      [v20 setObject:v19 forKeyedSubscript:v7];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager pidToCachedProviderIdentifiers]( self,  "pidToCachedProviderIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v7]);
    id v16 = [v6 copy];
    [v15 addObject:v16];
  }

  -[CSDConversationProviderManager createProcessMonitorIfNecessary:forClient:]( self,  "createProcessMonitorIfNecessary:forClient:",  v7,  v21);
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)stopTrackingClient:(id)a3
{
  id v9 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v9 processIdentifier]));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProcessHandle](self, "pidToProcessHandle"));
  [v6 setObject:0 forKeyedSubscript:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProviderIdentifiers](self, "pidToProviderIdentifiers"));
  [v7 setObject:0 forKeyedSubscript:v5];

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager pidToCachedProviderIdentifiers]( self,  "pidToCachedProviderIdentifiers"));
  [v8 setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (id)providerIdentifiersForClient:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProviderIdentifiers](self, "pidToProviderIdentifiers"));
  v7 = -[NSNumber initWithInt:]( [NSNumber alloc],  "initWithInt:",  [v4 processIdentifier]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  id v9 = [v8 copy];
  v10 = v9;
  if (v9) {
    v11 = (NSSet *)v9;
  }
  else {
    v11 = objc_alloc_init(&OBJC_CLASS___NSSet);
  }
  v12 = v11;

  os_unfair_lock_unlock(p_accessorLock);
  return v12;
}

- (void)registerConversationProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager conversationProviderForIdentifier:]( self,  "conversationProviderForIdentifier:",  v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v11 = (CSDConversationProvider *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Already registered provider for identifier: %@",  v10));

    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    v20 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CSDConversationProviderManager",  1LL,  v12));

    v7[2](v7, v13);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1001677B8;
    v15[3] = &unk_1003DB8D8;
    v15[4] = self;
    id v16 = -[CSDConversationProvider initWithProvider:]( objc_alloc(&OBJC_CLASS___CSDConversationProvider),  "initWithProvider:",  v6);
    id v17 = v6;
    v18 = v7;
    v11 = v16;
    v14 = objc_retainBlock(v15);
    -[CSDConversationProvider registerWithIDSWithCompletionHandler:](v11, "registerWithIDSWithCompletionHandler:", v14);
  }
}

- (id)conversationProviderForIdentifier:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  os_unfair_lock_unlock(p_accessorLock);
  return v7;
}

- (id)tuConversationProviderForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager conversationProviderForIdentifier:]( self,  "conversationProviderForIdentifier:",  v4));
  id v6 = v5;
  if (v5) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 tuProvider]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TUConversationProvider providerForIdentifier:]( &OBJC_CLASS___TUConversationProvider,  "providerForIdentifier:",  v4));
  }
  v8 = (void *)v7;

  return v8;
}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  id v26 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager serverBag](self, "serverBag"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
  unsigned __int8 v14 = [v12 gftaasPseudonymsEnabled:v13];

  if ((v14 & 1) == 0)
  {
    id v16 = objc_msgSend((id)objc_opt_class(self, v15), "errorForDisabledPseudonyms");
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0LL, 0LL, v17);
  }

  os_unfair_lock_lock(&self->_accessorLock);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v19]);

  if (v20)
  {
    [v20 generatePseudonymHandleForConversationWithExpiryDuration:v10 URI:v11 completionHandler:a4];
    os_unfair_lock_unlock(&self->_accessorLock);
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
    id v22 = [v21 copy];

    os_unfair_lock_unlock(&self->_accessorLock);
    id v24 = objc_msgSend((id)objc_opt_class(self, v23), "errorForUnregisteredProviderIdentifier:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0LL, 0LL, v25);
  }
}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

  if (v16)
  {
    [v16 renewPseudonymHandle:v22 expirationDate:v11 completionHandler:v12];
  }

  else
  {
    v18 = (void *)objc_opt_class(self, v17);
    NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v20 = [v19 copy];
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 errorForUnregisteredProviderIdentifier:v20]);
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v21);
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

  if (v13)
  {
    [v13 revokePseudonymHandle:v18 completionHandler:v9];
  }

  else
  {
    uint64_t v15 = (void *)objc_opt_class(self, v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 errorForUnregisteredProviderIdentifier:v16]);
    v9[2](v9, 0LL, v17);
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v13]);
  id v15 = [v14 copy];

  if (v15)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10016819C;
    v20[3] = &unk_1003DB900;
    id v21 = v10;
    [v15 isPseudonymHandleForProvider:v8 completionHandler:v20];
  }

  else
  {
    uint64_t v17 = (void *)objc_opt_class(self, v16);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue([v17 errorForUnregisteredProviderIdentifier:v18]);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v19);
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (id)serviceForProvider:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (([v4 isDefaultProvider] & 1) != 0
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager featureFlags](self, "featureFlags")),
        unsigned __int8 v7 = [v6 groupFacetimeAsAServiceEnabled],
        v6,
        (v7 & 1) == 0))
  {
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeMultiwayIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeMultiwayIDSService,  "sharedInstance"));
    id v15 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v4 isDefaultProvider];
      uint64_t v17 = @"NO";
      if (v16) {
        uint64_t v17 = @"YES";
      }
      int v21 = 138412546;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "provider.isDefaultProvider: %@, provider: %@",  (uint8_t *)&v21,  0x16u);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 service]);

    id v12 = sub_1001704C4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager providerIdentifierToProvider]( self,  "providerIdentifierToProvider"));
      int v21 = 138412802;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "service: %@, provider: %@, providerIdentifierToProvider: %@",  (uint8_t *)&v21,  0x20u);
    }
  }

  if (TUSimulatedModeEnabled(v18))
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[CSDSimulatedIDSService sharedInstance](&OBJC_CLASS___CSDSimulatedIDSService, "sharedInstance"));

    id v11 = (__CFString *)v19;
  }

  os_unfair_lock_unlock(p_accessorLock);

  return v11;
}

- (void)setBeginListeningBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  id v5 = objc_retainBlock(v4);
  id beginListeningBlock = self->_beginListeningBlock;
  self->_id beginListeningBlock = v5;

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager providerIdentifierToProvider](self, "providerIdentifierToProvider"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v12);
        uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDConversationProviderManager beginListeningBlock]( self,  "beginListeningBlock",  (void)v16));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 service]);
        ((void (**)(void, void *))v14)[2](v14, v15);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  os_unfair_lock_unlock(&self->_accessorLock);
}

+ (id)errorForUnregisteredProviderIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Did not register GFT Provider with identifier: %@",  a3));
  NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
  id v8 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CSDConversationProviderManager",  0LL,  v4));

  return v5;
}

+ (id)errorForDisabledPseudonyms
{
  NSErrorUserInfoKey v5 = NSLocalizedFailureReasonErrorKey;
  id v6 = @"Pseudonym creation is not enabled";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CSDConversationProviderManager",  0LL,  v2));

  return v3;
}

- (void)createProcessMonitorIfNecessary:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProcessHandle](self, "pidToProcessHandle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  if (!v9)
  {
    objc_initWeak(&location, self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( RBSProcessIdentifier,  "identifierWithPid:",  [v7 processIdentifier]));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v10,  0LL));

    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    id v15 = sub_1001688B8;
    __int128 v16 = &unk_1003DB928;
    objc_copyWeak(&v17, &location);
    [v11 monitorForDeath:&v13];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationProviderManager pidToProcessHandle](self, "pidToProcessHandle", v13, v14, v15, v16));
    [v12 setObject:v11 forKeyedSubscript:v6];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (id)beginListeningBlock
{
  return self->_beginListeningBlock;
}

- (NSMutableDictionary)providerIdentifierToProvider
{
  return self->_providerIdentifierToProvider;
}

- (NSMutableDictionary)pidToProviderIdentifiers
{
  return self->_pidToProviderIdentifiers;
}

- (NSMutableDictionary)pidToCachedProviderIdentifiers
{
  return self->_pidToCachedProviderIdentifiers;
}

- (NSMutableDictionary)pidToProcessHandle
{
  return self->_pidToProcessHandle;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDSharedConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end