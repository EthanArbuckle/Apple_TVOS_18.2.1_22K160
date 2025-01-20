@interface IDSPeerAggregateMessage
- (BOOL)addAggregatableMessage:(id)a3;
- (BOOL)expectingMoreResponses;
- (BOOL)fireAndForget;
- (BOOL)hasReceivedAPSDAck;
- (BOOL)hasSpaceForAggregatableMessage:(id)a3;
- (BOOL)isFinalMessage;
- (BOOL)removeAllAggregatableMessages;
- (IDSPeerAggregateMessage)init;
- (IDSPeerAggregateMessage)initWithHighPriority:(BOOL)a3;
- (IDSPeerAggregateMessage)initWithPeerMessage:(id)a3 service:(id)a4 fromIdentity:(id)a5 maxSize:(unint64_t)a6;
- (NSData)fromIdentity;
- (NSData)groupIdentifer;
- (NSData)groupPayload;
- (NSDate)expirationDate;
- (NSDictionary)additionalDictionary;
- (NSMutableSet)individualPeerMessages;
- (NSMutableSet)pendingResponseTokens;
- (NSNumber)chunkNumber;
- (NSNumber)deliveryMinimumTime;
- (NSNumber)deliveryMinimumTimeDelay;
- (NSNumber)priority;
- (NSString)encryptionType;
- (NSString)messageID;
- (NSString)sourcePeerID;
- (NSString)sourceShortHandle;
- (NSString)targetService;
- (id)_processMessageResponseForMessage:(id)a3 withError:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)currentSize;
- (int64_t)maxSize;
- (unint64_t)sizeOfKeysWithValues;
- (void)callAllAckBlocks;
- (void)callAllIndividualCompletionBlocksWithDeliveryContext:(id)a3;
- (void)clearAllPendingResponseTokens;
- (void)logFailureInfo;
- (void)noteResponseForToken:(id)a3;
- (void)setAdditionalDictionary:(id)a3;
- (void)setChunkNumber:(id)a3;
- (void)setCurrentSize:(int64_t)a3;
- (void)setDeliveryMinimumTime:(id)a3;
- (void)setDeliveryMinimumTimeDelay:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setFromIdentity:(id)a3;
- (void)setGroupIdentifer:(id)a3;
- (void)setGroupPayload:(id)a3;
- (void)setHasReceivedAPSDAck:(BOOL)a3;
- (void)setIndividualPeerMessages:(id)a3;
- (void)setIsFinalMessage:(BOOL)a3;
- (void)setMaxSize:(int64_t)a3;
- (void)setMessageID:(id)a3;
- (void)setPendingResponseTokens:(id)a3;
- (void)setPriority:(id)a3;
- (void)setSourcePeerID:(id)a3;
- (void)setSourceShortHandle:(id)a3;
- (void)setTargetService:(id)a3;
@end

@implementation IDSPeerAggregateMessage

- (IDSPeerAggregateMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSPeerAggregateMessage;
  v2 = -[IDSPeerAggregateMessage init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[IDSPeerAggregateMessage setWantsResponse:](v2, "setWantsResponse:", 1LL);
  }
  return v3;
}

- (IDSPeerAggregateMessage)initWithHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = -[IDSPeerAggregateMessage init](self, "init");
  objc_super v5 = v4;
  if (v4)
  {
    -[IDSPeerAggregateMessage setHighPriority:](v4, "setHighPriority:", v3);
    if (!v3) {
      -[IDSPeerAggregateMessage setTimeout:](v5, "setTimeout:", 1200.0);
    }
    -[IDSPeerAggregateMessage setChunkNumber:](v5, "setChunkNumber:", &off_100946900);
  }

  return v5;
}

- (IDSPeerAggregateMessage)initWithPeerMessage:(id)a3 service:(id)a4 fromIdentity:(id)a5 maxSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = -[IDSPeerAggregateMessage init](self, "init");
  if (v13)
  {
    -[IDSPeerAggregateMessage setHighPriority:](v13, "setHighPriority:", [v10 highPriority]);
    else {
      double v14 = 1200.0;
    }
    -[IDSPeerAggregateMessage setTimeout:](v13, "setTimeout:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 sourcePeerID]);
    -[IDSPeerAggregateMessage setSourcePeerID:](v13, "setSourcePeerID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 sourceShortHandle]);
    -[IDSPeerAggregateMessage setSourceShortHandle:](v13, "setSourceShortHandle:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 messageID]);
    -[IDSPeerAggregateMessage setMessageID:](v13, "setMessageID:", v17);

    -[IDSPeerAggregateMessage setFireAndForget:](v13, "setFireAndForget:", [v10 fireAndForget]);
    -[IDSPeerAggregateMessage setHighPriority:](v13, "setHighPriority:", [v10 highPriority]);
    -[IDSPeerAggregateMessage setWantsResponse:](v13, "setWantsResponse:", [v10 wantsResponse]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v10 topic]);
    -[IDSPeerAggregateMessage setTopic:](v13, "setTopic:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v10 additionalDictionary]);
    -[IDSPeerAggregateMessage setAdditionalDictionary:](v13, "setAdditionalDictionary:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v10 encryptionType]);
    -[IDSPeerAggregateMessage setEncryptionType:](v13, "setEncryptionType:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue([v10 expirationDate]);
    -[IDSPeerAggregateMessage setExpirationDate:](v13, "setExpirationDate:", v21);

    -[IDSPeerAggregateMessage setWantsMultipleResponses:]( v13,  "setWantsMultipleResponses:",  [v10 wantsResponse]);
    -[IDSPeerAggregateMessage setMaxSize:](v13, "setMaxSize:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v10 originalTimestamp]);
    -[IDSPeerAggregateMessage setOriginalTimestamp:](v13, "setOriginalTimestamp:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 priority]);
    -[IDSPeerAggregateMessage setPriority:](v13, "setPriority:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v10 deliveryStatusContext]);
    -[IDSPeerAggregateMessage setDeliveryStatusContext:](v13, "setDeliveryStatusContext:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    -[IDSPeerAggregateMessage setUserInfo:](v13, "setUserInfo:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceData]);
    -[IDSPeerAggregateMessage setServiceData:](v13, "setServiceData:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v10 clientInfo]);
    -[IDSPeerAggregateMessage setClientInfo:](v13, "setClientInfo:", v27);

    -[IDSPeerAggregateMessage setChunkNumber:](v13, "setChunkNumber:", &off_100946900);
    -[IDSPeerAggregateMessage setTargetService:](v13, "setTargetService:", v11);
    -[IDSPeerAggregateMessage setFromIdentity:](v13, "setFromIdentity:", v12);
    -[IDSPeerAggregateMessage setIgnoreMaxRetryCount:]( v13,  "setIgnoreMaxRetryCount:",  [v10 ignoreMaxRetryCount]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v10 deliveryMinimumTimeDelay]);
    -[IDSPeerAggregateMessage setDeliveryMinimumTimeDelay:](v13, "setDeliveryMinimumTimeDelay:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue([v10 deliveryMinimumTime]);
    -[IDSPeerAggregateMessage setDeliveryMinimumTime:](v13, "setDeliveryMinimumTime:", v29);
  }

  return v13;
}

- (BOOL)hasSpaceForAggregatableMessage:(id)a3
{
  int64_t currentSize = self->_currentSize;
  return (unint64_t)[a3 sizeOfKeysWithValues] + currentSize <= self->_maxSize;
}

- (BOOL)addAggregatableMessage:(id)a3
{
  id v4 = a3;
  individualPeerMessages = self->_individualPeerMessages;
  if (!individualPeerMessages)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v7 = self->_individualPeerMessages;
    self->_individualPeerMessages = v6;

    individualPeerMessages = self->_individualPeerMessages;
  }

  -[NSMutableSet addObject:](individualPeerMessages, "addObject:", v4);
  if (-[IDSPeerAggregateMessage wantsMultipleResponses](self, "wantsMultipleResponses"))
  {
    pendingResponseTokens = self->_pendingResponseTokens;
    if (!pendingResponseTokens)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v10 = self->_pendingResponseTokens;
      self->_pendingResponseTokens = v9;

      pendingResponseTokens = self->_pendingResponseTokens;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 targetToken]);
    -[NSMutableSet addObject:](pendingResponseTokens, "addObject:", v11);
  }

  int64_t currentSize = self->_currentSize;
  self->_int64_t currentSize = (int64_t)[v4 sizeOfKeysWithValues] + currentSize;

  return 1;
}

- (BOOL)removeAllAggregatableMessages
{
  return 1;
}

- (void)setGroupPayload:(id)a3
{
  id v5 = a3;
  id v6 = [v5 length];

  self->_currentSize += (int64_t)v6;
}

- (void)setGroupIdentifer:(id)a3
{
  id v5 = a3;
  id v6 = [v5 length];

  self->_currentSize += (int64_t)v6;
}

- (void)callAllIndividualCompletionBlocksWithDeliveryContext:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_individualPeerMessages;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)v9),  "completionBlock",  (void)v11));
        ((void (**)(void, id))v10)[2](v10, v4);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)clearAllPendingResponseTokens
{
  BOOL v3 = -[NSMutableSet initWithSet:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithSet:",  self->_pendingResponseTokens);
  pendingResponseTokens = self->_pendingResponseTokens;
  self->_pendingResponseTokens = v3;

  -[NSMutableSet removeAllObjects](self->_pendingResponseTokens, "removeAllObjects");
}

- (void)callAllAckBlocks
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v3 = self->_individualPeerMessages;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
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
        uint64_t v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v9 + 1) + 8 * (void)v7),  "ackBlock",  (void)v9));
        ((void (**)(void, IDSPeerAggregateMessage *))v8)[2](v8, self);

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  -[IDSPeerAggregateMessage setHasReceivedAPSDAck:](self, "setHasReceivedAPSDAck:", 1LL);
}

- (void)noteResponseForToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("AggregateMessage");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 responseToken]);
    pendingResponseTokens = self->_pendingResponseTokens;
    *(_DWORD *)buf = 138412546;
    v48 = v7;
    __int16 v49 = 2112;
    v50 = pendingResponseTokens;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "removing token %@ from %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v9)
    && _IDSShouldLog(0LL, @"AggregateMessage"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v4 responseToken]);
    v40 = self->_pendingResponseTokens;
    _IDSLogV(0LL, @"IDSFoundation", @"AggregateMessage", @"removing token %@ from %@");
  }

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseToken", v38, v40));
  BOOL v11 = v10 == 0LL;

  if (v11)
  {
    -[IDSPeerAggregateMessage callAllIndividualCompletionBlocksWithDeliveryContext:]( self,  "callAllIndividualCompletionBlocksWithDeliveryContext:",  v4);
    -[IDSPeerAggregateMessage clearAllPendingResponseTokens](self, "clearAllPendingResponseTokens");
  }

  else
  {
    if (!-[IDSPeerAggregateMessage hasReceivedAPSDAck](self, "hasReceivedAPSDAck")) {
      -[IDSPeerAggregateMessage callAllAckBlocks](self, "callAllAckBlocks");
    }
    __int128 v12 = -[NSMutableSet initWithSet:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithSet:",  self->_pendingResponseTokens);
    __int128 v13 = self->_pendingResponseTokens;
    self->_pendingResponseTokens = v12;

    __int128 v14 = self->_pendingResponseTokens;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 responseToken]);
    LODWORD(v14) = -[NSMutableSet containsObject:](v14, "containsObject:", v15);

    if ((_DWORD)v14)
    {
      v16 = self->_pendingResponseTokens;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 responseToken]);
      -[NSMutableSet removeObject:](v16, "removeObject:", v17);

      v18 = -[NSMutableSet initWithSet:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithSet:",  self->_individualPeerMessages);
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      v19 = v18;
      id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
      if (v20)
      {
        uint64_t v21 = *(void *)v43;
        while (2)
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v19);
            }
            v23 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 targetToken]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v4 responseToken]);
            unsigned int v26 = [v24 isEqual:v25];

            if (v26)
            {
              v41 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v23 completionBlock]);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v4 responseError]);
              id v28 = [v4 responseCode];
              v29 = (void *)objc_claimAutoreleasedReturnValue([v23 targetPeerID]);
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage sourcePeerID](self, "sourcePeerID"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage targetService](self, "targetService"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage fromIdentity](self, "fromIdentity"));
              v33 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerAggregateMessage _processMessageResponseForMessage:withError:resultCode:toURI:fromURI:service:fromIdentity:]( self,  "_processMessageResponseForMessage:withError:resultCode:toURI:fromURI:service:fromIdentity:",  v23,  v27,  v28,  v29,  v30,  v31,  v32));

              [v4 setResponseError:v33];
              uint64_t v34 = OSLogHandleForIDSCategory("IDSDelivery");
              v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTimeStamp]);
                *(_DWORD *)buf = 138412290;
                v48 = v36;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "DeliveryContext Timestamp is %@",  buf,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v37)
                && _IDSShouldLog(0LL, @"IDSDelivery"))
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue([v4 responseTimeStamp]);
                _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"DeliveryContext Timestamp is %@");
              }

              ((void (**)(void, id))v41)[2](v41, v4);
              -[NSMutableSet removeObject:](v19, "removeObject:", v23);

              goto LABEL_26;
            }
          }

          id v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
          if (v20) {
            continue;
          }
          break;
        }
      }

- (id)_processMessageResponseForMessage:(id)a3 withError:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9
{
  id v15 = a3;
  id v69 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v68 = a9;
  uint64_t v19 = OSLogHandleForIDSCategory("IDSDelivery");
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v71 = a5;
    __int16 v72 = 2112;
    id v73 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Processing response %ld for message %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v21) && _IDSShouldLog(0LL, @"IDSDelivery"))
  {
    int64_t v56 = a5;
    id v59 = v15;
    _IDSLogV(0LL, @"IDSFoundation", @"IDSDelivery", @"Processing response %ld for message %@");
  }

  if (a5 == 1002)
  {
    uint64_t v22 = OSLogHandleForIDSCategory("Warning");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage pushToken](self, "pushToken"));
      *(_DWORD *)buf = 138412802;
      int64_t v71 = (int64_t)v17;
      __int16 v72 = 2112;
      id v73 = v16;
      __int16 v74 = 2112;
      id v75 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Message has been removed, Add Honeybee support here to grab logs from the other side who sent this FromURI:%@ To URI:%@ Token:%@ ",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v25))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage pushToken](self, "pushToken"));
      _IDSWarnV( @"IDSFoundation",  @"Message has been removed, Add Honeybee support here to grab logs from the other side who sent this FromURI:%@ ToURI:%@ Token:%@ ");

      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage pushToken](self, "pushToken", v17, v16, v63));
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Message has been removed, Add Honeybee support here to grab logs from the other side who sent this FromURI:%@ ToURI:%@ Token:%@ ");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage pushToken](self, "pushToken", v17, v16, v26));
      id v59 = v16;
      v62 = v27;
      int64_t v56 = (int64_t)v17;
      _IDSLogTransport( @"Warning",  @"IDS",  @"Message has been removed, Add Honeybee support here to grab logs from the other side who sent this FromURI:%@ ToURI:%@ Token:%@ ");
    }

- (BOOL)expectingMoreResponses
{
  return -[NSMutableSet count](self->_pendingResponseTokens, "count") != 0LL;
}

- (void)logFailureInfo
{
  uint64_t v3 = OSLogHandleForIDSCategory("AggregateMessage");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage messageID](self, "messageID"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage uniqueIDString](self, "uniqueIDString"));
    *(_DWORD *)buf = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Msg with GUID: %@ & i:%@ is missing 255s",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"AggregateMessage"))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage messageID](self, "messageID"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage uniqueIDString](self, "uniqueIDString"));
    _IDSLogV(0LL, @"IDSFoundation", @"AggregateMessage", @"Msg with GUID: %@ & i:%@ is missing 255s");
  }

  uint64_t v8 = OSLogHandleForIDSCategory("AggregateMessage");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    pendingResponseTokens = self->_pendingResponseTokens;
    *(_DWORD *)buf = 138412290;
    id v23 = pendingResponseTokens;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v11)
    && _IDSShouldLog(0LL, @"AggregateMessage"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AggregateMessage", @"%@");
  }

  uint64_t v12 = OSLogHandleForIDSCategory("AggregateMessage");
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    chunkNumber = self->_chunkNumber;
    *(_DWORD *)buf = 138412290;
    id v23 = chunkNumber;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Chunk: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"AggregateMessage"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"AggregateMessage", @"Chunk: %@");
  }

  uint64_t v16 = OSLogHandleForIDSCategory("AggregateMessage");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isFinalMessage) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    id v23 = (id)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "WasLast?: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v19))
  {
  }

- (unint64_t)sizeOfKeysWithValues
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v3 = self->_individualPeerMessages;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v20 + 1) + 8 * (void)i) sizeOfKeysWithValues];
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage messageID](self, "messageID"));
  __int128 v10 = v9;
  if (v9 && (uint64_t v11 = (const char *)[v9 UTF8String]) != 0)
  {
    memset(uu, 170, sizeof(uu));
    uuid_parse(v11, uu);
    id v19 = 0LL;
    jw_uuid_to_data(uu, &v19);
    id v12 = v19;
    id v13 = [v12 length];
  }

  else
  {
    id v13 = 0LL;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage sourcePeerID](self, "sourcePeerID"));
  id v15 = [v14 lengthOfBytesUsingEncoding:4];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage encryptionType](self, "encryptionType"));
  id v17 = [v16 lengthOfBytesUsingEncoding:4];

  return (unint64_t)v15 + (void)v13 + v6 + (unint64_t)v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IDSPeerAggregateMessage;
  id v4 = -[IDSPeerAggregateMessage copyWithZone:](&v22, "copyWithZone:", a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage sourcePeerID](self, "sourcePeerID"));
  [v4 setSourcePeerID:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage encryptionType](self, "encryptionType"));
  [v4 setEncryptionType:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage messageID](self, "messageID"));
  [v4 setMessageID:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage priority](self, "priority"));
  [v4 setPriority:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage expirationDate](self, "expirationDate"));
  [v4 setExpirationDate:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage additionalDictionary](self, "additionalDictionary"));
  [v4 setAdditionalDictionary:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage individualPeerMessages](self, "individualPeerMessages"));
  [v4 setIndividualPeerMessages:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage pendingResponseTokens](self, "pendingResponseTokens"));
  id v13 = [v12 mutableCopy];
  [v4 setPendingResponseTokens:v13];

  objc_msgSend(v4, "setMaxSize:", -[IDSPeerAggregateMessage maxSize](self, "maxSize"));
  objc_msgSend(v4, "setCurrentSize:", -[IDSPeerAggregateMessage currentSize](self, "currentSize"));
  objc_msgSend(v4, "setFireAndForget:", -[IDSPeerAggregateMessage fireAndForget](self, "fireAndForget"));
  objc_msgSend(v4, "setHasReceivedAPSDAck:", -[IDSPeerAggregateMessage hasReceivedAPSDAck](self, "hasReceivedAPSDAck"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage chunkNumber](self, "chunkNumber"));
  [v4 setChunkNumber:v14];

  objc_msgSend(v4, "setIsFinalMessage:", -[IDSPeerAggregateMessage isFinalMessage](self, "isFinalMessage"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage targetService](self, "targetService"));
  [v4 setTargetService:v15];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage fromIdentity](self, "fromIdentity"));
  [v4 setFromIdentity:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage groupPayload](self, "groupPayload"));
  [v4 setGroupPayload:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage groupIdentifer](self, "groupIdentifer"));
  [v4 setGroupIdentifer:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage deliveryMinimumTimeDelay](self, "deliveryMinimumTimeDelay"));
  [v4 setDeliveryMinimumTimeDelay:v19];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage deliveryMinimumTime](self, "deliveryMinimumTime"));
  [v4 setDeliveryMinimumTime:v20];

  return v4;
}

- (id)requiredKeys
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSPeerAggregateMessage;
  id v2 = -[IDSPeerAggregateMessage requiredKeys](&v6, "requiredKeys");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (NSMutableArray *)[v3 mutableCopy];

  if (!v4) {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  -[NSMutableArray addObject:](v4, "addObject:", @"dtl");
  return v4;
}

- (id)messageBody
{
  v82.receiver = self;
  v82.super_class = (Class)&OBJC_CLASS___IDSPeerAggregateMessage;
  id v3 = -[IDSPeerAggregateMessage messageBody](&v82, "messageBody");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  Mutable = (__CFDictionary *)[v4 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage messageID](self, "messageID"));
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (const char *)[v6 UTF8String];
    if (v8)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v8, uu);
      id v81 = 0LL;
      jw_uuid_to_data(uu, &v81);
      id v9 = v81;
      if (v9) {
        CFDictionarySetValue(Mutable, @"U", v9);
      }
    }
  }

  additionalDictionary = self->_additionalDictionary;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_10006B148;
  v79[3] = &unk_1008F8418;
  uint64_t v11 = Mutable;
  __int16 v80 = v11;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](additionalDictionary, "enumerateKeysAndObjectsUsingBlock:", v79);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage sourcePeerID](self, "sourcePeerID"));
  if (v12)
  {
    CFDictionarySetValue(v11, @"sP", v12);
  }

  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_100696B14(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage sourceShortHandle](self, "sourceShortHandle"));
  if (v21) {
    CFDictionarySetValue(v11, @"sPs", v21);
  }

  if (-[IDSPeerAggregateMessage fireAndForget](self, "fireAndForget"))
  {
    CFDictionarySetValue(v11, IDSExpirationDateKey, &off_100946918);
  }

  else
  {
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage expirationDate](self, "expirationDate"));

    if (v22)
    {
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage expirationDate](self, "expirationDate"));
      [v23 timeIntervalSince1970];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)v24));

      if (v25) {
        CFDictionarySetValue(v11, IDSExpirationDateKey, v25);
      }
    }
  }

  uint64_t v26 = objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage encryptionType](self, "encryptionType"));
  if (v26)
  {
    v27 = (void *)v26;
    char v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage encryptionType](self, "encryptionType"));
    uint64_t v29 = IDSEncryptionTypeStringFromEncryptionType(2LL);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    unsigned __int8 v31 = [v28 isEqualToIgnoringCase:v30];

    if ((v31 & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage encryptionType](self, "encryptionType"));
      if (v32) {
        CFDictionarySetValue(v11, @"E", v32);
      }
    }
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage groupPayload](self, "groupPayload"));
  id v34 = [v33 length];

  if (v34)
  {
    uint64_t v35 = IDSEncryptionTypeStringFromEncryptionType(3LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (v36) {
      CFDictionarySetValue(v11, @"E", v36);
    }
  }

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage additionalDictionary](self, "additionalDictionary"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"c"]);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage topic](self, "topic"));
  uint64_t v40 = IDSServiceNameiMessageLite;
  if ([v39 isEqualToString:IDSServiceNameiMessageLite])
  {
    id v41 = [v38 unsignedIntegerValue];

    if (v41 != (id)100) {
      goto LABEL_34;
    }
    uint64_t v42 = IDSEncryptionTypeStringFromEncryptionType(2LL);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (v39) {
      CFDictionarySetValue(v11, @"E", v39);
    }
  }

LABEL_34:
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerAggregateMessage topic](self, "topic"));
  if ([v43 isEqualToString:v40])
  {
    if ([v38 unsignedIntegerValue] == (id)100)
    {

LABEL_39:
      CFDictionarySetValue(v11, IDSDesiredProtocolKey, &off_100946918);
      goto LABEL_40;
    }

    id v44 = [v38 unsignedIntegerValue];

    if (v44 == (id)128) {
      goto LABEL_39;
    }
  }

  else
  {
  }

- (NSString)sourcePeerID
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setSourcePeerID:(id)a3
{
}

- (NSString)sourceShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setSourceShortHandle:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setEncryptionType:(id)a3
{
}

- (NSString)messageID
{
  return (NSString *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setMessageID:(id)a3
{
}

- (NSString)targetService
{
  return (NSString *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setTargetService:(id)a3
{
}

- (NSNumber)priority
{
  return (NSNumber *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setPriority:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSData)fromIdentity
{
  return (NSData *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setFromIdentity:(id)a3
{
}

- (NSDictionary)additionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setAdditionalDictionary:(id)a3
{
}

- (NSMutableSet)individualPeerMessages
{
  return (NSMutableSet *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setIndividualPeerMessages:(id)a3
{
}

- (NSMutableSet)pendingResponseTokens
{
  return (NSMutableSet *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setPendingResponseTokens:(id)a3
{
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int64_t)a3
{
  self->_maxSize = a3;
}

- (int64_t)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(int64_t)a3
{
  self->_int64_t currentSize = a3;
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (BOOL)hasReceivedAPSDAck
{
  return self->_hasReceivedAPSDAck;
}

- (void)setHasReceivedAPSDAck:(BOOL)a3
{
  self->_hasReceivedAPSDAck = a3;
}

- (NSNumber)chunkNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setChunkNumber:(id)a3
{
}

- (BOOL)isFinalMessage
{
  return self->_isFinalMessage;
}

- (void)setIsFinalMessage:(BOOL)a3
{
  self->_isFinalMessage = a3;
}

- (NSData)groupPayload
{
  return self->_groupPayload;
}

- (NSData)groupIdentifer
{
  return self->_groupIdentifer;
}

- (NSNumber)deliveryMinimumTimeDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
}

- (NSNumber)deliveryMinimumTime
{
  return (NSNumber *)objc_getProperty(self, a2, 400LL, 1);
}

- (void)setDeliveryMinimumTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end