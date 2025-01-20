@interface IDSGroupMasterKeyMaterialCache
- (BOOL)hasCachedMasterKeyIdentifier:(id)a3;
- (BOOL)hasClientReceivedMasterKeyIdentifier:(id)a3;
- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetBlock:(id)a5 queue:(id)a6;
- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetInterval:(double)a5 automaticResetBlock:(id)a6 queue:(id)a7;
- (NSMutableDictionary)remoteParticipantIDToKeyMaterial;
- (NSSet)masterKeyIdentifiersReceivedByClient;
- (NSSet)masterKeyMaterials;
- (NSSet)membershipURIs;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (double)automaticResetInterval;
- (id)_groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3 shouldIncludePeerKeys:(BOOL)a4;
- (id)automaticResetBlock;
- (id)cachedMasterKeyMaterialCollection;
- (id)currentLocalMasterKeyMaterial;
- (id)debugDescription;
- (id)description;
- (id)firstLocalMasterKeyMaterial;
- (id)groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3;
- (id)inFlightResetBlock;
- (id)localMasterKeyCollectionToBroadcastForDestinationURI:(id)a3;
- (id)nextLocalMasterKeyMaterial;
- (id)remoteMasterKeyMaterialCollectionToSend;
- (id)sampleMkMCollectionToBroadcast:(id)a3;
- (unsigned)numberOfBroadcastCacheMKM;
- (void)_startAutomaticCacheResetTimerIfNeeded;
- (void)cleanUpMasterKeyMaterialUsingPredicate:(id)a3;
- (void)noteClientReceiptOfMasterKeyIdentifier:(id)a3;
- (void)noteReceivedFirstKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4;
- (void)noteReceivedGroupMasterKeyMaterialCollection:(id)a3;
- (void)resetCacheWithNewMembershipURIs:(id)a3;
- (void)resetClientMasterKeyIdentifierReceipts;
- (void)resetRemoteMasterKeyMaterialCacheAndCancelResetInterval;
- (void)setAutomaticResetBlock:(id)a3;
- (void)setAutomaticResetInterval:(double)a3;
- (void)setCurrentLocalMasterKeyMaterial:(id)a3;
- (void)setFirstLocalMasterKeyMaterial:(id)a3;
- (void)setInFlightResetBlock:(id)a3;
- (void)setMasterKeyIdentifiersReceivedByClient:(id)a3;
- (void)setMasterKeyMaterials:(id)a3;
- (void)setMembershipURIs:(id)a3;
- (void)setNextLocalMasterKeyMaterial:(id)a3;
- (void)setRemoteParticipantIDToKeyMaterial:(id)a3;
- (void)updateLastRatchetedKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4;
@end

@implementation IDSGroupMasterKeyMaterialCache

- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetBlock:(id)a5 queue:(id)a6
{
  return -[IDSGroupMasterKeyMaterialCache initWithIdentifier:initialMembershipURIs:automaticResetInterval:automaticResetBlock:queue:]( self,  "initWithIdentifier:initialMembershipURIs:automaticResetInterval:automaticResetBlock:queue:",  a3,  a4,  a5,  a6,  600.0);
}

- (IDSGroupMasterKeyMaterialCache)initWithIdentifier:(id)a3 initialMembershipURIs:(id)a4 automaticResetInterval:(double)a5 automaticResetBlock:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___IDSGroupMasterKeyMaterialCache;
  v17 = -[IDSGroupMasterKeyMaterialCache init](&v44, "init");
  v18 = v17;
  if (!v17) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v17->_identifier, a3);
  objc_storeStrong((id *)&v18->_queue, a7);
  v18->_automaticResetInterval = a5;
  id v19 = objc_retainBlock(v15);
  id automaticResetBlock = v18->_automaticResetBlock;
  v18->_id automaticResetBlock = v19;

  v21 = objc_alloc_init(&OBJC_CLASS___NSSet);
  masterKeyMaterials = v18->_masterKeyMaterials;
  v18->_masterKeyMaterials = v21;

  if (v14) {
    v23 = (NSSet *)v14;
  }
  else {
    v23 = objc_alloc_init(&OBJC_CLASS___NSSet);
  }
  membershipURIs = v18->_membershipURIs;
  v18->_membershipURIs = v23;

  v25 = objc_alloc_init(&OBJC_CLASS___NSSet);
  masterKeyIdentifiersReceivedByClient = v18->_masterKeyIdentifiersReceivedByClient;
  v18->_masterKeyIdentifiersReceivedByClient = v25;

  v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  remoteParticipantIDToKeyMaterial = v18->_remoteParticipantIDToKeyMaterial;
  v18->_remoteParticipantIDToKeyMaterial = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  unsigned int v30 = [v29 slowCPUDevice];

  v31 = @"ids-groupMKMCache-number-of-broadcast-cache-mkm";
  if (v30) {
    v31 = @"ids-groupMKMCache-number-of-broadcast-cache-mkm-slow-cpu";
  }
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:v32]);

  if (v34 && (uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber, v35), (objc_opt_isKindOfClass(v34, v36) & 1) != 0))
  {
    v18->_unsigned int numberOfBroadcastCacheMKM = [v34 unsignedIntValue];
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int numberOfBroadcastCacheMKM = v18->_numberOfBroadcastCacheMKM;
      *(_DWORD *)buf = 138412546;
      v46 = (IDSGroupMasterKeyMaterialCache *)v32;
      __int16 v47 = 1024;
      unsigned int v48 = numberOfBroadcastCacheMKM;
      v39 = "Got number of broadcast cache MKM bag value {key: %@, value: %u}";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 0x12u);
    }
  }

  else
  {
    if (v30) {
      int v40 = 10;
    }
    else {
      int v40 = 64;
    }
    v18->_unsigned int numberOfBroadcastCacheMKM = v40;
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = v18->_numberOfBroadcastCacheMKM;
      *(_DWORD *)buf = 138412546;
      v46 = (IDSGroupMasterKeyMaterialCache *)v32;
      __int16 v47 = 1024;
      unsigned int v48 = v41;
      v39 = "Couldn't get broadcast cache MKM bag value, using default value {key used: %@, value: %u}";
      goto LABEL_16;
    }
  }

  v42 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Created group MkM cache { self: %@ }",  buf,  0xCu);
  }

LABEL_20:
  return v18;
}

- (void)resetCacheWithNewMembershipURIs:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Resetting group MkM cache { self: %@ }",  (uint8_t *)&v8,  0xCu);
  }

  -[IDSGroupMasterKeyMaterialCache setCurrentLocalMasterKeyMaterial:](self, "setCurrentLocalMasterKeyMaterial:", 0LL);
  if (v4)
  {
    -[IDSGroupMasterKeyMaterialCache setMembershipURIs:](self, "setMembershipURIs:", v4);
  }

  else
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSSet);
    -[IDSGroupMasterKeyMaterialCache setMembershipURIs:](self, "setMembershipURIs:", v6);
  }

  v7 = objc_alloc_init(&OBJC_CLASS___NSSet);
  -[IDSGroupMasterKeyMaterialCache setMasterKeyMaterials:](self, "setMasterKeyMaterials:", v7);
}

- (void)resetRemoteMasterKeyMaterialCacheAndCancelResetInterval
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting remote MkM cache { self: %@ }",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___NSSet);
  -[IDSGroupMasterKeyMaterialCache setMasterKeyMaterials:](self, "setMasterKeyMaterials:", v4);

  -[IDSGroupMasterKeyMaterialCache setInFlightResetBlock:](self, "setInFlightResetBlock:", 0LL);
}

- (void)cleanUpMasterKeyMaterialUsingPredicate:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v6 filteredSetUsingPredicate:v4]);

  -[IDSGroupMasterKeyMaterialCache setMasterKeyMaterials:](self, "setMasterKeyMaterials:", v5);
}

- (void)noteReceivedGroupMasterKeyMaterialCollection:(id)a3
{
  id v41 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v43 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  int v40 = self;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
  id v6 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        if ([v10 participantID])
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 participantID]));
          v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11));

          if (v12)
          {
            -[NSMutableArray addObject:](v12, "addObject:", v10);
          }

          else
          {
            v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            -[NSMutableArray addObject:](v12, "addObject:", v10);
            id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 participantID]));
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, v13);
          }
        }

        else
        {
          -[NSMutableSet addObject:](v43, "addObject:", v10);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }

    while (v7);
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v41 masterKeyMaterials]);
  id v15 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v49;
    v42 = v14;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
        if (![v19 participantID])
        {
          -[NSMutableSet addObject:](v43, "addObject:", v19);
          continue;
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v19 participantID]));
        v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v20));

        if (!v21)
        {
          v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableArray addObject:](v21, "addObject:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v19 participantID]));
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v21, v23);
          goto LABEL_25;
        }

        id v22 = -[NSMutableArray count](v21, "count");
        -[NSMutableArray addObject:](v21, "addObject:", v19);
        if (v22 != (id)1)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v21, "sortedArrayUsingSelector:", "compare:"));
          v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", (char *)objc_msgSend(v23, "count") - 2));
          -[NSMutableArray addObject:](v24, "addObject:", v25);

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", (char *)objc_msgSend(v23, "count") - 1));
          -[NSMutableArray addObject:](v24, "addObject:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v19 participantID]));
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v24, v27);

          id v14 = v42;
LABEL_25:
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }

    while (v16);
  }

  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v4, "allValues"));
  id v30 = [v29 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v45;
    do
    {
      for (k = 0LL; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v29);
        }
        -[NSMutableArray addObjectsFromArray:]( v28,  "addObjectsFromArray:",  *(void *)(*((void *)&v44 + 1) + 8LL * (void)k));
      }

      id v31 = [v29 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }

    while (v31);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet setByAddingObjectsFromArray:](v43, "setByAddingObjectsFromArray:", v28));
  -[IDSGroupMasterKeyMaterialCache setMasterKeyMaterials:](v40, "setMasterKeyMaterials:", v34);

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](v40, "membershipURIs"));
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v41 membershipURIs]);
  unsigned int v37 = [v35 isSubsetOfSet:v36];

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v41 membershipURIs]);
    -[IDSGroupMasterKeyMaterialCache setMembershipURIs:](v40, "setMembershipURIs:", v38);
  }

  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Noted received MkM collection in MkM cache { self: %@ }",  buf,  0xCu);
  }

  -[IDSGroupMasterKeyMaterialCache _startAutomaticCacheResetTimerIfNeeded]( v40,  "_startAutomaticCacheResetTimerIfNeeded");
}

- (id)sampleMkMCollectionToBroadcast:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if ((unint64_t)[v4 count] > self->_numberOfBroadcastCacheMKM)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 count];
      unsigned int numberOfBroadcastCacheMKM = self->_numberOfBroadcastCacheMKM;
      int v11 = 134218240;
      id v12 = v7;
      __int16 v13 = 1024;
      unsigned int v14 = numberOfBroadcastCacheMKM;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Number of peer MkM to broadcast is over maximum permitted value -- introducing sampling { cachedCount: %lu, maxi mumCountToBroadcast: %u }",  (uint8_t *)&v11,  0x12u);
    }

    id v9 = [v4 mutableCopy];
    objc_msgSend(v9, "__imRandomizeArray");
    int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", 0, self->_numberOfBroadcastCacheMKM));
  }

  return v5;
}

- (id)groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3
{
  return -[IDSGroupMasterKeyMaterialCache _groupMasterKeyCollectionToBroadcastForDestinationURI:shouldIncludePeerKeys:]( self,  "_groupMasterKeyCollectionToBroadcastForDestinationURI:shouldIncludePeerKeys:",  a3,  1LL);
}

- (id)localMasterKeyCollectionToBroadcastForDestinationURI:(id)a3
{
  return -[IDSGroupMasterKeyMaterialCache _groupMasterKeyCollectionToBroadcastForDestinationURI:shouldIncludePeerKeys:]( self,  "_groupMasterKeyCollectionToBroadcastForDestinationURI:shouldIncludePeerKeys:",  a3,  0LL);
}

- (id)_groupMasterKeyCollectionToBroadcastForDestinationURI:(id)a3 shouldIncludePeerKeys:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial"));

  if (v8)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10069CDF8(self);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial"));
    -[NSMutableSet addObject:](v7, "addObject:", v10);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 tokenFreeURI]);
  if (v4)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
    if (![v12 count])
    {
LABEL_13:

      goto LABEL_14;
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](self, "membershipURIs"));
    if ([v13 containsObject:v6])
    {

LABEL_10:
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10069CD78(self);
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache sampleMkMCollectionToBroadcast:]( self,  "sampleMkMCollectionToBroadcast:",  v18));

      -[NSMutableSet addObjectsFromArray:](v7, "addObjectsFromArray:", v12);
      goto LABEL_13;
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](self, "membershipURIs"));
    unsigned int v15 = [v14 containsObject:v11];

    if (v15) {
      goto LABEL_10;
    }
  }

- (id)cachedMasterKeyMaterialCollection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v3));

  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache currentLocalMasterKeyMaterial](self, "currentLocalMasterKeyMaterial"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache currentLocalMasterKeyMaterial]( self,  "currentLocalMasterKeyMaterial"));
    [v4 addObject:v6];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial"));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial"));
    [v4 addObject:v8];
  }

  id v9 = objc_alloc(&OBJC_CLASS___IDSGroupMasterKeyMaterialCollection);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](self, "membershipURIs"));
  id v12 = -[IDSGroupMasterKeyMaterialCollection initWithMasterKeyMaterials:membershipURIs:]( v9,  "initWithMasterKeyMaterials:membershipURIs:",  v10,  v11);

  return v12;
}

- (id)remoteMasterKeyMaterialCollectionToSend
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache remoteParticipantIDToKeyMaterial]( self,  "remoteParticipantIDToKeyMaterial"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v4));

  id v6 = objc_alloc(&OBJC_CLASS___IDSGroupMasterKeyMaterialCollection);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](self, "membershipURIs"));
  id v9 = -[IDSGroupMasterKeyMaterialCollection initWithMasterKeyMaterials:membershipURIs:]( v6,  "initWithMasterKeyMaterials:membershipURIs:",  v7,  v8);

  return v9;
}

- (BOOL)hasCachedMasterKeyIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache currentLocalMasterKeyMaterial](self, "currentLocalMasterKeyMaterial"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyIndex]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  unsigned __int8 v8 = [v4 isEqualToString:v7];

  if ((v8 & 1) != 0
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial")),
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 keyIndex]),
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]),
        unsigned __int8 v12 = [v4 isEqualToString:v11],
        v11,
        v10,
        v9,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }

  else
  {
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    char v22 = 0;
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10013288C;
    v16[3] = &unk_1008FB520;
    id v17 = v4;
    v18 = &v19;
    [v14 enumerateObjectsUsingBlock:v16];

    BOOL v13 = *((_BYTE *)v20 + 24) != 0;
    _Block_object_dispose(&v19, 8);
  }

  return v13;
}

- (void)_startAutomaticCacheResetTimerIfNeeded
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSGroupMasterKeyMaterialCache automaticResetInterval](self, "automaticResetInterval");
    uint64_t v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache inFlightResetBlock](self, "inFlightResetBlock"));
    id v7 = objc_retainBlock(v6);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Starting automatic cache reset timer if needed { self: %@, resetInterval: %f, inFlightResetBlock: %@ }",  buf,  0x20u);
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache inFlightResetBlock](self, "inFlightResetBlock"));
  if (v8)
  {
  }

  else
  {
    -[IDSGroupMasterKeyMaterialCache automaticResetInterval](self, "automaticResetInterval");
    if (v9 > 0.0)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      -[IDSGroupMasterKeyMaterialCache automaticResetInterval](self, "automaticResetInterval");
      dispatch_time_t v11 = dispatch_walltime(0LL, (uint64_t)(v10 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100132B28;
      block[3] = &unk_1008F8A78;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      -[IDSGroupMasterKeyMaterialCache setInFlightResetBlock:](self, "setInFlightResetBlock:", v12);
      BOOL v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache queue](self, "queue"));
      dispatch_after(v11, v13, v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }

- (void)noteClientReceiptOfMasterKeyIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache masterKeyIdentifiersReceivedByClient]( self,  "masterKeyIdentifiersReceivedByClient"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 setByAddingObject:v4]);

    -[IDSGroupMasterKeyMaterialCache setMasterKeyIdentifiersReceivedByClient:]( self,  "setMasterKeyIdentifiersReceivedByClient:",  v5);
  }

- (BOOL)hasClientReceivedMasterKeyIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache masterKeyIdentifiersReceivedByClient]( self,  "masterKeyIdentifiersReceivedByClient"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)resetClientMasterKeyIdentifierReceipts
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSSet);
  -[IDSGroupMasterKeyMaterialCache setMasterKeyIdentifiersReceivedByClient:]( self,  "setMasterKeyIdentifiersReceivedByClient:",  v3);
}

- (void)noteReceivedFirstKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache remoteParticipantIDToKeyMaterial]( self,  "remoteParticipantIDToKeyMaterial"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);

  if (v9 || ([v6 isGeneratedLocally] & 1) != 0)
  {
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Already noted first key material for remote participant: %@ - ignoring",  (uint8_t *)&v13,  0xCu);
    }
  }

  else
  {
    dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog RealTimeEncryptionController]( &OBJC_CLASS___IDSFoundationLog,  "RealTimeEncryptionController"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Noting first key material for remote participant: %@",  (uint8_t *)&v13,  0xCu);
    }

    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache remoteParticipantIDToKeyMaterial]( self,  "remoteParticipantIDToKeyMaterial"));
    dispatch_block_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    -[os_log_s setObject:forKey:](v10, "setObject:forKey:", v6, v12);
  }
}

- (void)updateLastRatchetedKeyMaterial:(id)a3 forRemoteParticipant:(unint64_t)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[IDSGroupMasterKeyMaterialCache remoteParticipantIDToKeyMaterial]( self,  "remoteParticipantIDToKeyMaterial"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  [v8 setObject:v6 forKey:v7];
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache identifier](self, "identifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache currentLocalMasterKeyMaterial](self, "currentLocalMasterKeyMaterial"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](self, "membershipURIs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<%@: %p identifier: %@, currentLocalMkM: %@, nextLocalMkM: %@, URIs: %@, MkMsCount: %lu>",  v3,  self,  v4,  v5,  v6,  v7,  [v8 count]));

  return v9;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache identifier](self, "identifier"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache currentLocalMasterKeyMaterial](self, "currentLocalMasterKeyMaterial"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache nextLocalMasterKeyMaterial](self, "nextLocalMasterKeyMaterial"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache membershipURIs](self, "membershipURIs"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupMasterKeyMaterialCache masterKeyMaterials](self, "masterKeyMaterials"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p identifier: %@, currentLocalMkM: %@, nextLocalMkM: %@, URIs: %@, MkMs: %@>",  v3,  self,  v4,  v5,  v6,  v7,  v8));

  return v9;
}

- (id)firstLocalMasterKeyMaterial
{
  return self->_firstLocalMasterKeyMaterial;
}

- (void)setFirstLocalMasterKeyMaterial:(id)a3
{
}

- (id)currentLocalMasterKeyMaterial
{
  return self->_currentLocalMasterKeyMaterial;
}

- (void)setCurrentLocalMasterKeyMaterial:(id)a3
{
}

- (id)nextLocalMasterKeyMaterial
{
  return self->_nextLocalMasterKeyMaterial;
}

- (void)setNextLocalMasterKeyMaterial:(id)a3
{
}

- (double)automaticResetInterval
{
  return self->_automaticResetInterval;
}

- (void)setAutomaticResetInterval:(double)a3
{
  self->_automaticResetInterval = a3;
}

- (unsigned)numberOfBroadcastCacheMKM
{
  return self->_numberOfBroadcastCacheMKM;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)automaticResetBlock
{
  return self->_automaticResetBlock;
}

- (void)setAutomaticResetBlock:(id)a3
{
}

- (id)inFlightResetBlock
{
  return self->_inFlightResetBlock;
}

- (void)setInFlightResetBlock:(id)a3
{
}

- (NSSet)masterKeyMaterials
{
  return self->_masterKeyMaterials;
}

- (void)setMasterKeyMaterials:(id)a3
{
}

- (NSSet)membershipURIs
{
  return self->_membershipURIs;
}

- (void)setMembershipURIs:(id)a3
{
}

- (NSSet)masterKeyIdentifiersReceivedByClient
{
  return self->_masterKeyIdentifiersReceivedByClient;
}

- (void)setMasterKeyIdentifiersReceivedByClient:(id)a3
{
}

- (NSMutableDictionary)remoteParticipantIDToKeyMaterial
{
  return self->_remoteParticipantIDToKeyMaterial;
}

- (void)setRemoteParticipantIDToKeyMaterial:(id)a3
{
}

- (void).cxx_destruct
{
}

@end