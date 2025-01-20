@interface CKKSPeerProviderState
+ (id)createFromProvider:(id)a3;
+ (id)noPeersState:(id)a3;
- (BOOL)essential;
- (BOOL)unwrapKey:(id)a3 fromShares:(id)a4 error:(id *)a5;
- (CKKSPeerProviderState)initWithPeerProviderID:(id)a3 essential:(BOOL)a4 selfPeers:(id)a5 selfPeersError:(id)a6 trustedPeers:(id)a7 trustedPeersError:(id)a8;
- (CKKSSelves)currentSelfPeers;
- (NSError)currentSelfPeersError;
- (NSError)currentTrustedPeersError;
- (NSSet)currentTrustedPeerIDs;
- (NSSet)currentTrustedPeers;
- (NSString)peerProviderID;
- (id)description;
- (void)setEssential:(BOOL)a3;
- (void)setPeerProviderID:(id)a3;
@end

@implementation CKKSPeerProviderState

- (CKKSPeerProviderState)initWithPeerProviderID:(id)a3 essential:(BOOL)a4 selfPeers:(id)a5 selfPeersError:(id)a6 trustedPeers:(id)a7 trustedPeersError:(id)a8
{
  id v30 = a3;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___CKKSPeerProviderState;
  v18 = -[CKKSPeerProviderState init](&v35, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerProviderID, a3);
    v19->_essential = a4;
    objc_storeStrong((id *)&v19->_currentSelfPeers, a5);
    objc_storeStrong((id *)&v19->_currentSelfPeersError, a6);
    objc_storeStrong((id *)&v19->_currentTrustedPeers, a7);
    objc_storeStrong((id *)&v19->_currentTrustedPeersError, a8);
    if (v19->_currentTrustedPeers)
    {
      v20 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", v29, v30));
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      v21 = v19->_currentTrustedPeers;
      id v22 = -[NSSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          v25 = 0LL;
          do
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            -[NSSet addObject:](v20, "addObject:", v26);

            v25 = (char *)v25 + 1;
          }

          while (v23 != v25);
          id v23 = -[NSSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
        }

        while (v23);
      }

      currentTrustedPeerIDs = v19->_currentTrustedPeerIDs;
      v19->_currentTrustedPeerIDs = v20;
    }
  }

  return v19;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState peerProviderID](self, "peerProviderID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeers](self, "currentSelfPeers"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));
  v6 = (void *)v5;
  if (v5) {
    v7 = (const __CFString *)v5;
  }
  else {
    v7 = &stru_100294B48;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeers](self, "currentTrustedPeers"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentTrustedPeersError](self, "currentTrustedPeersError"));
  v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = &stru_100294B48;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSPeerProviderState(%@): %@%@ %@%@>",  v3,  v4,  v7,  v8,  v11));

  return v12;
}

- (BOOL)unwrapKey:(id)a3 fromShares:(id)a4 error:(id *)a5
{
  id v85 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeers](self, "currentSelfPeers"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 currentSelf]);
  if (!v10)
  {

LABEL_10:
    id v16 = v85;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v85 zoneName]);
    id v25 = sub_1000AA6AC(@"ckksshare", v24);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState peerProviderID](self, "peerProviderID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));
      *(_DWORD *)buf = 138412546;
      v105 = v27;
      __int16 v106 = 2112;
      id v107 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Don't have self peers for %@: %@", buf, 0x16u);

      id v16 = v85;
    }

    if (a5)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSPeerProviderState currentSelfPeersError](self, "currentSelfPeersError"));
      id v22 = @"Key unwrap failed";
      uint64_t v23 = 38LL;
      goto LABEL_14;
    }

- (NSString)peerProviderID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPeerProviderID:(id)a3
{
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (CKKSSelves)currentSelfPeers
{
  return self->_currentSelfPeers;
}

- (NSError)currentSelfPeersError
{
  return self->_currentSelfPeersError;
}

- (NSSet)currentTrustedPeers
{
  return self->_currentTrustedPeers;
}

- (NSSet)currentTrustedPeerIDs
{
  return self->_currentTrustedPeerIDs;
}

- (NSError)currentTrustedPeersError
{
  return self->_currentTrustedPeersError;
}

- (void).cxx_destruct
{
}

+ (id)noPeersState:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___CKKSPeerProviderState);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 providerID]);
  id v6 = [v3 essential];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  24LL,  @"No current self peer available"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  24LL,  @"No current trusted peers available"));
  uint64_t v9 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:]( v4,  "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:",  v5,  v6,  0LL,  v7,  0LL,  v8);

  return v9;
}

+ (id)createFromProvider:(id)a3
{
  id v3 = a3;
  v4 = objc_autoreleasePoolPush();
  id v14 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchSelfPeers:&v14]);
  id v6 = v14;
  id v13 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchTrustedPeers:&v13]);
  id v8 = v13;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___CKKSPeerProviderState);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 providerID]);
  v11 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:]( v9,  "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:",  v10,  [v3 essential],  v5,  v6,  v7,  v8);

  objc_autoreleasePoolPop(v4);
  return v11;
}

@end