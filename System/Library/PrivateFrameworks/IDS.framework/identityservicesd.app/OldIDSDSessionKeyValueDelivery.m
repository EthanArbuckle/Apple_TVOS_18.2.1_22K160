@interface OldIDSDSessionKeyValueDelivery
- (NSMutableDictionary)groupIDToDesiredMaterialSet;
- (NSMutableDictionary)localKeyToEntry;
- (NSMutableSet)localMaterials;
- (OldIDSDSessionKeyValueDelivery)initWithDelegate:(id)a3 forGroupID:(id)a4 sessionID:(id)a5 metricsCollector:(id)a6;
- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3;
- (int)_getTypeFromDataKey:(id)a3;
- (unsigned)_getKeyFromType:(int)a3;
- (void)_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5;
- (void)_updateSendData;
- (void)addDeliveryHandler:(id)a3 uuid:(id)a4;
- (void)dealloc;
- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5;
- (void)removeDeliveryHandler:(id)a3;
- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 withCompletion:(id)a7;
@end

@implementation OldIDSDSessionKeyValueDelivery

- (OldIDSDSessionKeyValueDelivery)initWithDelegate:(id)a3 forGroupID:(id)a4 sessionID:(id)a5 metricsCollector:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___OldIDSDSessionKeyValueDelivery;
  v14 = -[OldIDSDSessionKeyValueDelivery init](&v26, "init");
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->_groupID, a4);
    objc_storeStrong((id *)&v15->_sessionID, a5);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    deliveryHandlersByUUID = v15->_deliveryHandlersByUUID;
    v15->_deliveryHandlersByUUID = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    localKeyToEntry = v15->_localKeyToEntry;
    v15->_localKeyToEntry = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    remoteKeyToParticipantIDToData = v15->_remoteKeyToParticipantIDToData;
    v15->_remoteKeyToParticipantIDToData = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    groupIDToDesiredMaterialSet = v15->_groupIDToDesiredMaterialSet;
    v15->_groupIDToDesiredMaterialSet = (NSMutableDictionary *)v22;

    objc_storeStrong((id *)&v15->_metricsCollector, a6);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "IDSDSessionKeyValueDelivery init: groupID: %@, sessionID: %@",  buf,  0x16u);
    }
  }

  return v15;
}

- (void)dealloc
{
  deliveryHandlersByUUID = self->_deliveryHandlersByUUID;
  self->_deliveryHandlersByUUID = 0LL;

  localKeyToEntry = self->_localKeyToEntry;
  self->_localKeyToEntry = 0LL;

  remoteKeyToParticipantIDToData = self->_remoteKeyToParticipantIDToData;
  self->_remoteKeyToParticipantIDToData = 0LL;

  groupIDToDesiredMaterialSet = self->_groupIDToDesiredMaterialSet;
  self->_groupIDToDesiredMaterialSet = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___OldIDSDSessionKeyValueDelivery;
  -[OldIDSDSessionKeyValueDelivery dealloc](&v7, "dealloc");
}

- (void)addDeliveryHandler:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "add delivery handler with uuid %@: %@",  (uint8_t *)&v14,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_deliveryHandlersByUUID,  "objectForKeyedSubscript:",  v7));
  BOOL v11 = v10 == 0LL;

  if (v11)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_deliveryHandlersByUUID,  "setObject:forKeyedSubscript:",  v6,  v7);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "sending all cached data to new delivery handler",  (uint8_t *)&v14,  2u);
    }

    [v6 handleGroupSessionKeyValues:self->_remoteKeyToParticipantIDToData];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector keyValueDelivery](self->_metricsCollector, "keyValueDelivery"));
    [v12 event:@"addDeliveryHandler"];
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "... already added handler with uuid %@: %@",  (uint8_t *)&v14,  0x16u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)getAllKeyValueDeliveryLocalMaterialSetForGroupID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([v4 isEqualToString:self->_groupID])
  {
    -[OldIDSDSessionKeyValueDelivery _updateSendData](self, "_updateSendData");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      localMaterials = self->_localMaterials;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = localMaterials;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "getAllKeyValueDeliveryLocalMaterialSetForGroupID: %@, _localMaterials: %@",  (uint8_t *)&v12,  0x16u);
    }

    id v8 = -[NSMutableSet copy](self->_localMaterials, "copy");
  }

  else
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      groupID = self->_groupID;
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = (NSMutableSet *)groupID;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "getAllKeyValueDeliveryLocalMaterialSetForGroupID: groupID doesn't match: %@, %@",  (uint8_t *)&v12,  0x16u);
    }

    id v8 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)removeDeliveryHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_deliveryHandlersByUUID, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)receiveDictionaryData:(id)a3 forType:(int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = -[OldIDSDSessionKeyValueDelivery _getKeyFromType:](self, "_getKeyFromType:", v6);
  if ((_DWORD)v9)
  {
    uint64_t v10 = v9;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionWrapModeKey]);
    int v12 = [v11 intValue];

    if (v12 > 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionEncryptedData]);
      if (!v13)
      {
        id v24 = 0LL;
        id v16 = 0LL;
LABEL_33:

        goto LABEL_34;
      }

      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identityForDevice]);

      v47 = v15;
      if (IMGetDomainBoolForKey(@"com.apple.ids", @"disableEncryptionForData"))
      {
        id v16 = v13;
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v51 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "receiveDictionaryData: disableEncryptionForData, use plain data: %@",  buf,  0xCu);
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
        unsigned __int8 v19 = [v18 isInternalInstall];

        if ((v19 & 1) == 0)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector error:](self->_metricsCollector, "error:", @"kvd"));
          [v20 event:@"disableEncryption"];
        }

        id v21 = 0LL;
        goto LABEL_31;
      }

      if (v15)
      {
        id v49 = 0LL;
        id v16 = (id)objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping decrypt:usingKey:error:]( GFTKeyWrapping,  "decrypt:usingKey:error:",  v13,  [v15 fullIdentity],  &v49));
        id v33 = v49;
        id v24 = v33;
        if (v16)
        {
          id v21 = 0LL;
          if (!v33) {
            goto LABEL_31;
          }
        }
      }

      else
      {
        id v16 = 0LL;
        id v24 = 0LL;
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 previousIdentityForDevice]);

      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v51 = v24;
        *(_WORD *)&v51[8] = 2112;
        v52 = v47;
        __int16 v53 = 2112;
        v54 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "receiveDictionaryData: failed SecMWCopyUnwrappedSessionSeed error: %@, local identity: %@, try again using pre vious identity: %@",  buf,  0x20u);
      }

      if (v35)
      {

        id v48 = 0LL;
        uint64_t v37 = objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping decrypt:usingKey:error:]( GFTKeyWrapping,  "decrypt:usingKey:error:",  v13,  [v35 fullIdentity],  &v48));
        id v24 = v48;
        v38 = (os_log_s *)v16;
        id v16 = (id)v37;
      }

      else
      {
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "receiveDictionaryData: No previous identity",  buf,  2u);
        }
      }

      if (!v16)
      {
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_1006A6D34((uint64_t)v24, v39, v40, v41, v42, v43, v44, v45);
        }

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector error:](self->_metricsCollector, "error:", @"kvd"));
        [v46 event:@"decryptionError"];

        id v16 = 0LL;
        goto LABEL_32;
      }

      id v21 = v24;
LABEL_31:
      -[OldIDSDSessionKeyValueDelivery _receiveData:forKey:fromParticipant:]( self,  "_receiveData:forKey:fromParticipant:",  v16,  v10,  a5);
      id v24 = v21;
LABEL_32:

      goto LABEL_33;
    }

    objc_super v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006A6CCC(v12, v26, v27, v28, v29, v30, v31, v32);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector error:](self->_metricsCollector, "error:", @"kvd"));
    id v24 = v23;
    v25 = @"unsupportedWrapMode";
  }

  else
  {
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v51 = 0;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "receiveDictionaryData: unsupported key: %u, type: %d",  buf,  0xEu);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector error:](self->_metricsCollector, "error:", @"kvd"));
    id v24 = v23;
    v25 = @"unsupportedKey";
  }

  [v23 event:v25];
LABEL_34:
}

- (void)_receiveData:(id)a3 forKey:(unsigned int)a4 fromParticipant:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v29 = a3;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v40 = v6;
    *(_WORD *)&v40[4] = 2048;
    *(void *)&v40[6] = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_receiveData: key: %d particitant: %llu",  buf,  0x12u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector keyValueDelivery](self->_metricsCollector, "keyValueDelivery"));
  [v9 event:@"receiveFirstData"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a5));
  int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteKeyToParticipantIDToData,  "objectForKeyedSubscript:",  v10));
  BOOL v13 = v12 == 0LL;

  if (v13)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteKeyToParticipantIDToData,  "setObject:forKeyedSubscript:",  Mutable,  v10,  lock);
  }

  id v15 = objc_msgSend(v29, "copy", lock);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteKeyToParticipantIDToData,  "objectForKeyedSubscript:",  v10));
  [v16 setObject:v15 forKeyedSubscript:v11];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_deliveryHandlersByUUID, "allValues"));
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v17 count];
    *(_DWORD *)buf = 134217984;
    *(void *)uint64_t v40 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "_receiveData: notifying %lu handlers",  buf,  0xCu);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v20 = v17;
  id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      v23 = 0LL;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v23);
        v34 = v11;
        id v35 = v29;
        v36 = v10;
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
        uint64_t v37 = v25;
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        [v24 handleGroupSessionKeyValues:v26];

        v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }

    while (v21);
  }

  os_unfair_lock_unlock(locka);
}

- (unsigned)_getKeyFromType:(int)a3
{
  return a3 == 5;
}

- (int)_getTypeFromDataKey:(id)a3
{
  else {
    return 0;
  }
}

- (void)_updateSendData
{
  v2 = self;
  if (!self->_groupID)
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1006A6D9C(v3);
    }
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDGroupStatusNotificationController sharedInstance]( &OBJC_CLASS___IDSDGroupStatusNotificationController,  "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 groupIDToCapabilityToParticipantPushTokens]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v2->_groupID]);
  id v7 = [v6 copy];

  int v79 = IMGetDomainBoolForKey(@"com.apple.ids", @"encryptedDataForAllParticipants");
  if (!v2->_localMaterials)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    localMaterials = v2->_localMaterials;
    v2->_localMaterials = v8;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  v89 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionWithUniqueID:v2->_sessionID]);

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionWithUniqueID:v2->_groupID]);

  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  obj = v2->_localKeyToEntry;
  id v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v95,  v102,  16LL);
  BOOL v13 = &IMInsertBoolsToXPCDictionary_ptr;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v96;
    if (v79) {
      id v16 = @"YES";
    }
    else {
      id v16 = @"NO";
    }
    v76 = v16;
    v75 = v2;
    uint64_t v70 = *(void *)v96;
    id v71 = v7;
    do
    {
      id v17 = 0LL;
      id v74 = v14;
      do
      {
        if (*(void *)v96 != v15) {
          objc_enumerationMutation(obj);
        }
        v78 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)v17);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v2->_localKeyToEntry,  "objectForKeyedSubscript:",  v70,  v71));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 capability]);
        v80 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v19]);

        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13[219] GroupSessionKeyValueDelivery]);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = v17;
          unsigned int v22 = [v78 intValue];
          uint64_t v23 = v15;
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);
          unsigned int v25 = [v18 encryption];
          objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v18 capability]);
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v101 = v22;
          id v17 = v21;
          *(_WORD *)&v101[4] = 2112;
          *(void *)&v101[6] = v24;
          *(_WORD *)&v101[14] = 2112;
          *(void *)&v101[16] = v76;
          *(_WORD *)&v101[24] = 1024;
          *(_DWORD *)&v101[26] = v25;
          *(_WORD *)&v101[30] = 2112;
          *(void *)&v101[32] = v26;
          *(_WORD *)&v101[40] = 2112;
          *(void *)&v101[42] = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "_updateSendData: key: %d data: %@ encryptedDataForAllParticipants: %@, encryption: %d capability: %@, remotesPushTokens: %@",  buf,  0x36u);

          v2 = v75;
          uint64_t v15 = v23;
          id v14 = v74;
        }

        if ([v18 encryption] == 1)
        {
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);

          if (v27)
          {
            v77 = v18;
            v73 = v17;
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 getParticipantsInfoForGroup:v2->_groupID]);

            __int128 v93 = 0u;
            __int128 v94 = 0u;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            id v82 = v29;
            id v85 = [v82 countByEnumeratingWithState:&v91 objects:v99 count:16];
            if (!v85) {
              goto LABEL_54;
            }
            uint64_t v84 = *(void *)v92;
            __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
            while (1)
            {
              for (i = 0LL; i != v85; i = (char *)i + 1)
              {
                if (*(void *)v92 != v84) {
                  objc_enumerationMutation(v82);
                }
                __int128 v32 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)i);
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
                v34 = v30[305];
                id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 participantPushToken]);
                v36 = (void *)objc_claimAutoreleasedReturnValue([v34 pushTokenWithData:v35]);
                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v33 realTimeEncryptionPublicKeyForDevice:v36]);

                if (v37)
                {
                  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 fromID]);
                  v88 = v38;
                }

                else
                {
                  v38 = (void *)objc_claimAutoreleasedReturnValue([v32 participantURI]);
                  v83 = v38;
                }

                id v39 = sub_1003B4704(v38);
                uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
                uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v40));

                if (v37)
                {

                  uint64_t v42 = v30[305];
                  v87 = (void *)objc_claimAutoreleasedReturnValue([v37 pushToken]);
                  uint64_t v43 = objc_claimAutoreleasedReturnValue([v87 rawToken]);
                  v86 = (void *)v43;
                  uint64_t v44 = v90;
                }

                else
                {

                  uint64_t v42 = v30[305];
                  uint64_t v43 = objc_claimAutoreleasedReturnValue([v32 participantPushToken]);
                  uint64_t v44 = (void *)v43;
                }

                uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v42 pushTokenWithData:v43]);
                v46 = (void *)objc_claimAutoreleasedReturnValue([v41 URIByAddingPushToken:v45]);

                v47 = v44;
                if (v37)
                {

                  v47 = v87;
                }

                v90 = v44;

                if (![v89 destinationsContainFromURI:v46]
                  || ([v81 destinationsContainFromURI:v46] & 1) == 0)
                {
                  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13[219] GroupSessionKeyValueDelivery]);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    groupID = v2->_groupID;
                    sessionID = v2->_sessionID;
                    v67 = (void *)objc_claimAutoreleasedReturnValue([v89 destinations]);
                    *(_DWORD *)buf = 138413058;
                    *(void *)v101 = v46;
                    *(_WORD *)&v101[8] = 2112;
                    *(void *)&v101[10] = groupID;
                    __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
                    *(_WORD *)&v101[18] = 2112;
                    *(void *)&v101[20] = sessionID;
                    BOOL v13 = &IMInsertBoolsToXPCDictionary_ptr;
                    *(_WORD *)&v101[28] = 2112;
                    *(void *)&v101[30] = v67;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "_updateSendData: aborting send to %@ for group %@ and session %@ since this destination is not in group membership: %@",  buf,  0x2Au);
                  }

                  goto LABEL_51;
                }

                id v48 = (void *)objc_claimAutoreleasedReturnValue([v32 participantPushToken]);
                unsigned int v49 = [v80 containsObject:v48];

                int v50 = v79 | v49;
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13[219] GroupSessionKeyValueDelivery]);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = @"NO";
                  if (v50) {
                    v52 = @"YES";
                  }
                  *(void *)v101 = v76;
                  *(_WORD *)&v101[8] = 2112;
                  *(void *)&v101[10] = v52;
                  _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "encryptedDataForAllParticipants: %@, shouldSendToParticipant: %@",  buf,  0x16u);
                }

                char v53 = v50 ^ 1;
                if (!v37) {
                  char v53 = 1;
                }
                __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
                if ((v53 & 1) == 0)
                {
                  id v54 = (id)-[OldIDSDSessionKeyValueDelivery _getTypeFromDataKey:](v2, "_getTypeFromDataKey:", v78);
                  v55 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13[219] GroupSessionKeyValueDelivery]);
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v77 data]);
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v101 = (_DWORD)v54;
                    *(_WORD *)&v101[4] = 2112;
                    *(void *)&v101[6] = v78;
                    *(_WORD *)&v101[14] = 2112;
                    *(void *)&v101[16] = v37;
                    *(_WORD *)&v101[24] = 2112;
                    *(void *)&v101[26] = v32;
                    *(_WORD *)&v101[34] = 2112;
                    *(void *)&v101[36] = v56;
                    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "_updateSendData: type: %d, key: %@, publicIdentity: %@, participant: %@, data: %@",  buf,  0x30u);
                  }

                  if ((_DWORD)v54)
                  {
                    v57 = v2->_localMaterials;
                    v58 = objc_alloc(&OBJC_CLASS___IDSServerDesiredEncryptedDataSet);
                    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v77 data]);
                    id v60 = [v37 publicIdentity];
                    id v61 = [v32 participantIdentifier];
                    v62 = v58;
                    BOOL v13 = &IMInsertBoolsToXPCDictionary_ptr;
                    id v63 = v60;
                    v2 = v75;
                    v64 = -[IDSServerDesiredEncryptedDataSet initWithEncryptedData:type:forPublicIdentity:forParticipantID:]( v62,  "initWithEncryptedData:type:forPublicIdentity:forParticipantID:",  v59,  v54,  v63,  v61);
                    -[NSMutableSet addObject:](v57, "addObject:", v64);
                    goto LABEL_49;
                  }

                  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13[219] GroupSessionKeyValueDelivery]);
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    v64 = (IDSServerDesiredEncryptedDataSet *)objc_claimAutoreleasedReturnValue([v77 capability]);
                    *(_DWORD *)buf = 138412290;
                    *(void *)v101 = v64;
                    _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "_updateSendData: unknown type for capability: %@",  buf,  0xCu);
LABEL_49:
                  }

                  __int128 v30 = &IMInsertBoolsToXPCDictionary_ptr;
LABEL_51:
                }
              }

              id v85 = [v82 countByEnumeratingWithState:&v91 objects:v99 count:16];
              if (!v85)
              {
LABEL_54:

                uint64_t v15 = v70;
                id v7 = v71;
                id v17 = v73;
                id v14 = v74;
                uint64_t v18 = v77;
                break;
              }
            }
          }
        }

        id v17 = (char *)v17 + 1;
      }

      while (v17 != v14);
      id v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v95,  v102,  16LL);
    }

    while (v14);
  }

  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13[219] GroupSessionKeyValueDelivery]);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    v69 = v2->_localMaterials;
    *(_DWORD *)buf = 138412290;
    *(void *)v101 = v69;
    _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "_updateSendData: _localMaterials: %@",  buf,  0xCu);
  }
}

- (void)sendData:(id)a3 forKey:(unsigned int)a4 encryption:(unsigned int)a5 capability:(id)a6 withCompletion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  BOOL v13 = (void (**)(id, void))a7;
  id v14 = a6;
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog GroupSessionKeyValueDelivery]( &OBJC_CLASS___IDSFoundationLog,  "GroupSessionKeyValueDelivery"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v23[0] = 67109634;
    v23[1] = v10;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "sendData: send %d with encryption %d: %@",  (uint8_t *)v23,  0x18u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v16 = -[OldIDSDSessionKeyValueDeliveryLocalEntry initWithData:encryption:capability:]( objc_alloc(&OBJC_CLASS___OldIDSDSessionKeyValueDeliveryLocalEntry),  "initWithData:encryption:capability:",  v12,  v9,  v14);

  localKeyToEntry = self->_localKeyToEntry;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
  -[NSMutableDictionary setObject:forKeyedSubscript:](localKeyToEntry, "setObject:forKeyedSubscript:", v16, v18);

  os_unfair_lock_unlock(&self->_lock);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGFTMetricsCollector keyValueDelivery](self->_metricsCollector, "keyValueDelivery"));
  [v19 event:@"firstSendData"];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v16) = objc_opt_respondsToSelector(WeakRetained, "updateServerDesiredKeyValueDeliveryMaterialsNeeded");

  if ((v16 & 1) != 0)
  {
    id v22 = objc_loadWeakRetained((id *)p_delegate);
    [v22 updateServerDesiredKeyValueDeliveryMaterialsNeeded];
  }

  v13[2](v13, 0LL);
}

- (void)requestDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained requestKeyValueDeliveryDataForKey:v5 participantID:a4];
}

- (NSMutableDictionary)localKeyToEntry
{
  return self->_localKeyToEntry;
}

- (NSMutableDictionary)groupIDToDesiredMaterialSet
{
  return self->_groupIDToDesiredMaterialSet;
}

- (NSMutableSet)localMaterials
{
  return self->_localMaterials;
}

- (void).cxx_destruct
{
}

@end