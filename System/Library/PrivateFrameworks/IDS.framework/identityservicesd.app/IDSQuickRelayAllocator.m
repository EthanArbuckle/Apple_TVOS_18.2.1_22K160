@interface IDSQuickRelayAllocator
+ (IDSQuickRelayAllocator)sharedInstance;
- (BOOL)_addConnectStatus:(id)a3 relaySessionID:(id)a4 previousTime:(unint64_t)a5 qrReason:(unsigned __int16)a6 previousError:(unsigned __int16)a7 previousRelayIP:(unsigned int)a8 previousAccessToken:(id)a9;
- (BOOL)_addResponseToCache:(id)a3 sessionInfo:(id)a4 modifiedMessage:(id *)a5;
- (BOOL)_hasSessionInfoRequiredKeys:(id)a3;
- (BOOL)_isDuplicateResponse:(id)a3 newResponse:(id)a4;
- (BOOL)_sendKeepAliveRequest:(id)a3;
- (BOOL)_shouldUseCurrentResponse:(id)a3 cachedMessage:(id)a4;
- (BOOL)_startQRConnectionWithDefaults:(id)a3;
- (BOOL)hasParticipantID:(id)a3 participantID:(id)a4;
- (BOOL)invalidateLatestResponse:(id)a3 qrReason:(unsigned __int16)a4 previousError:(unsigned __int16)a5;
- (BOOL)isURIAvailabeInAllocateResponse:(id)a3 uri:(id)a4;
- (IDSQuickRelayAllocator)init;
- (id)_createSessionInfoFromResponsePayload:(id)a3;
- (id)_filterSelfAllocationsForSessionID:(id)a3;
- (id)_findAllocationForSessionID:(id)a3 requestIDStr:(id)a4;
- (id)_findAllocationListForSessionID:(id)a3;
- (id)_findSessionWithID:(id)a3;
- (id)_getCombinedSoftwareID:(id)a3;
- (id)_getGroupID:(id)a3;
- (id)_getIDSAWDLoggingInstance;
- (id)_getPushTokenFromParticipantID:(id)a3 participantID:(id)a4;
- (id)_getQuickRelayIPPreference:(unint64_t)a3;
- (id)_getResponse:(id)a3 relaySessionID:(id)a4;
- (id)_getResponseForQRSessionID:(id)a3 sessionID:(id)a4 index:(int64_t *)a5;
- (id)_getResponseFromQRGroupID:(id)a3;
- (id)_getSelfAllocationFromCache:(id)a3;
- (id)_getStatusMessageFromStatusCode:(unint64_t)a3;
- (id)_getURIForRecipientFromResponse:(id)a3;
- (id)_mergeParticipantID2PushTokenMapping:(id)a3 sourceResponse:(id)a4 mappingChange:(BOOL *)a5;
- (id)_parseQuickRelayDefaults:(id)a3 gropuID:(id)a4;
- (id)_peerIDManager;
- (id)_queryPolicy;
- (id)_setupAllocation:(id)a3 fromURI:(id)a4 sessionID:(id)a5 isSessionIDRemoteDeviceID:(BOOL)a6 options:(id)a7 prevConnectStatus:(id *)a8 requestUUID:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11;
- (id)_setupNewAllocation:(id)a3 sessionID:(id)a4 isSessionIDRemoteDeviceID:(BOOL)a5 fromIdentity:(id)a6 fromURI:(id)a7 fromService:(id)a8 options:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11 forAdditionalAllocation:(BOOL)a12;
- (id)_tokenURIForToken:(id)a3 uri:(id)a4;
- (id)_translateParticipantIDtoUINT64ForResponse:(id)a3;
- (id)_uriToParticipantID:(id)a3;
- (id)_uuidFromNSStringToNSData:(id)a3;
- (id)findAllocateResponseForSessionID:(id)a3 FromURI:(id)a4;
- (id)getAdditionalAllocationForAddress:(id)a3 selfAddress:(unsigned int)a4 relaySessionID:(id)a5 allocateType:(int64_t)a6 qrReason:(unsigned __int16)a7 previousTime:(unint64_t)a8 previousError:(unsigned __int16)a9 previousRelayIP:(unsigned int)a10 previousAccessToken:(id)a11 requestSelfAllocation:(BOOL)a12 isSessionIDRemoteDeviceID:(BOOL)a13 withPreferredRemoteInterface:(int)a14 withPreferredLocalInterface:(int)a15;
- (id)getAllocateResponse:(id)a3 groupID:(id)a4;
- (id)getPushTokenForRelaySessionID:(id)a3 relaySessionID:(id)a4;
- (id)getPushTokenFromParticipantID:(id)a3 participantID:(id)a4;
- (id)getPushTokensFromParticipantIDs:(id)a3 participantIDs:(id)a4;
- (id)getRelaySessionIDForIDSSessionID:(id)a3 pushToken:(id)a4;
- (id)getURIFromParticipantID:(id)a3 participantID:(id)a4;
- (id)setupNewAllocation:(id)a3 sessionID:(id)a4 fromIdentity:(id)a5 fromURI:(id)a6 fromService:(id)a7 options:(id)a8 connectReadyHandler:(id)a9;
- (id)setupNewAllocationToDevice:(id)a3 options:(id)a4 connectReadyHandler:(id)a5;
- (int64_t)getServerProviderForIDSSessionID:(id)a3;
- (unint64_t)getCountOfPendingRecipientsAcceptedSessions;
- (unint64_t)getCountOfSessionToAllocations;
- (unint64_t)getLocalParticipantIDForRelaySessionID:(id)a3;
- (unsigned)_getErrorCodeFromAllocationStatus:(int)a3;
- (void)_addAllocationForSession:(id)a3 allocation:(id)a4;
- (void)_cleanupResponses;
- (void)_discardAllocation:(id)a3;
- (void)_dispatchIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 connectReadyHandler:(id)a5 requestOptions:(id)a6;
- (void)_handleIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 requestOptions:(id)a5;
- (void)_invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4;
- (void)_notifyParticipantID2PushTokenMappingChange:(id)a3;
- (void)_notifyURIToParticipantIDMappingChange:(id)a3;
- (void)_processAllocationStatusResult:(id)a3;
- (void)_processSelfAllocations:(id)a3 allocation:(id)a4;
- (void)_removeAllAllocationsForSessionID:(id)a3;
- (void)_sendAWDMetricsForAllocation:(id)a3 status:(int64_t)a4 hasRecipientAccepted:(BOOL)a5;
- (void)_sendAllocateRequest:(id)a3;
- (void)_sendIDQueryRequest:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 completionBlock:(id)a7;
- (void)_setResponseForQRGroupID:(id)a3 groupID:(id)a4;
- (void)_setSessionInfoRequiredKeys;
- (void)_startCleanupTimer;
- (void)_startQRConnectionForSession:(id)a3 isInitiatorsAcceptedSession:(BOOL)a4 withLocalInterfacePreference:(int)a5;
- (void)_storeMappingFromPushTokenToURIs:(id)a3 fromID:(id)a4 service:(id)a5 cert:(id)a6 forGroup:(id)a7;
- (void)_triggerSymptomsWithType:(id)a3 subType:(id)a4 subTypeContext:(id)a5;
- (void)cleanUpCachedMappings:(id)a3;
- (void)clearResponseFromQRGroupID:(id)a3;
- (void)dealloc;
- (void)enablePushHandler:(BOOL)a3;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5;
- (void)invalidateAllocation:(id)a3;
- (void)invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4;
- (void)reportAWDAllocatorEvent:(unsigned int)a3 relayProviderType:(int64_t)a4 transport:(int64_t)a5 localRAT:(unsigned int)a6 duration:(unint64_t)a7 idsSessionID:(id)a8 reportingDataBlob:(id)a9 isInitiator:(BOOL)a10;
- (void)requestAllocationForRecipient:(id)a3;
- (void)setInitiatorsAcceptedToken:(id)a3 pushToken:(id)a4;
- (void)setRequestIDToSession:(id)a3 idsSessionID:(id)a4;
- (void)startKeepAliveTimer:(id)a3 relaySessionID:(id)a4;
- (void)stopKeepAliveTimer:(id)a3 relaySessionID:(id)a4;
@end

@implementation IDSQuickRelayAllocator

+ (IDSQuickRelayAllocator)sharedInstance
{
  if (qword_1009C0880 != -1) {
    dispatch_once(&qword_1009C0880, &stru_1008FF5F0);
  }
  return (IDSQuickRelayAllocator *)(id)qword_1009C0888;
}

- (IDSQuickRelayAllocator)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocator;
  v2 = -[IDSQuickRelayAllocator init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    requestIDToSession = v2->_requestIDToSession;
    v2->_requestIDToSession = 0LL;

    sessionToAllocations = v3->_sessionToAllocations;
    v3->_sessionToAllocations = 0LL;

    pendingRecipientsAcceptedSessions = v3->_pendingRecipientsAcceptedSessions;
    v3->_pendingRecipientsAcceptedSessions = 0LL;

    initiatorsAcceptedSessionsWithToken = v3->_initiatorsAcceptedSessionsWithToken;
    v3->_initiatorsAcceptedSessionsWithToken = 0LL;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    idsSessionIDToqrSessionID = v3->_idsSessionIDToqrSessionID;
    v3->_idsSessionIDToqrSessionID = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    allocateResponses = v3->_allocateResponses;
    v3->_allocateResponses = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pushTokenToURIForGroup = v3->_pushTokenToURIForGroup;
    v3->_pushTokenToURIForGroup = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionToLocalParticipantID = v3->_sessionToLocalParticipantID;
    v3->_sessionToLocalParticipantID = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionIDToURIToResponsePayload = v3->_sessionIDToURIToResponsePayload;
    v3->_sessionIDToURIToResponsePayload = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    duplicateAllocateResponses = v3->_duplicateAllocateResponses;
    v3->_duplicateAllocateResponses = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToDuplicateResponseCleanupTimers = v3->_groupIDToDuplicateResponseCleanupTimers;
    v3->_groupIDToDuplicateResponseCleanupTimers = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionToRequestIDToAllocateTime = v3->_sessionToRequestIDToAllocateTime;
    v3->_sessionToRequestIDToAllocateTime = v22;

    pushHandler = v3->_pushHandler;
    v3->_pushHandler = 0LL;

    v3->_lock._os_unfair_lock_opaque = 0;
    -[IDSQuickRelayAllocator _setSessionInfoRequiredKeys](v3, "_setSessionInfoRequiredKeys");
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v3 = OSLogHandleForTransportCategory("QRAllocator");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc IDSQuickRelayAllocator %@.", buf, 0xCu);
  }

  uint64_t v6 = os_log_shim_legacy_logging_enabled(v5);
  if ((_DWORD)v6)
  {
    if (_IDSShouldLogTransport(v6))
    {
      v7 = self;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"Dealloc IDSQuickRelayAllocator %@.");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        v7 = self;
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"Dealloc IDSQuickRelayAllocator %@.");
      }
    }
  }

  -[IDSPushHandler removeListener:](self->_pushHandler, "removeListener:", self, v7);
  -[NSMutableDictionary removeAllObjects](self->_requestIDToSession, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sessionToAllocations, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingRecipientsAcceptedSessions, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_initiatorsAcceptedSessionsWithToken, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_idsSessionIDToqrSessionID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_allocateResponses, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sessionToLocalParticipantID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sessionIDToURIToResponsePayload, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_duplicateAllocateResponses, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_groupIDToDuplicateResponseCleanupTimers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_sessionToRequestIDToAllocateTime, "removeAllObjects");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSQuickRelayAllocator;
  -[IDSQuickRelayAllocator dealloc](&v8, "dealloc");
}

- (id)_getIDSAWDLoggingInstance
{
  return +[IDSAWDLogging sharedInstance](&OBJC_CLASS___IDSAWDLogging, "sharedInstance");
}

- (id)_peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (id)_queryPolicy
{
  v2 = objc_alloc(&OBJC_CLASS___IDSQuickRelayAllocatorQueryPolicy);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v4 = -[IDSQuickRelayAllocatorQueryPolicy initWithServerBag:](v2, "initWithServerBag:", v3);

  return v4;
}

- (BOOL)_sendKeepAliveRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_GroupID]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RelaySessionToken]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RelayAddress]);
    objc_super v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      uint64_t v10 = OSLogHandleForTransportCategory("QRAllocator");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v50 = v6;
        __int16 v51 = 2048;
        v52 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "session token or address not available: %p %p",  buf,  0x16u);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"session token or address not available: %p %p");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"session token or address not available: %p %p");
          }
        }
      }

      BOOL v21 = 0;
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_IDSSessionID]);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v18));
      v20 = (void *)v19;
      BOOL v21 = v19 != 0;
      if (v19)
      {
        id v22 = -[IDSQuickRelayAllocateMessage init:]( objc_alloc(&OBJC_CLASS___IDSQuickRelayAllocateMessage),  "init:",  0LL);
        v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        [v22 setRecipients:v23];

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _uuidFromNSStringToNSData:](self, "_uuidFromNSStringToNSData:", v18));
        [v22 setIDSSessionID:v24];

        v25 = (void *)objc_claimAutoreleasedReturnValue([v20 fromURI]);
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v25 prefixedURI]);
        [v22 setSenderURI:v26];

        v27 = (void *)objc_claimAutoreleasedReturnValue([v20 getAppID]);
        [v22 setAppID:v27];

        [v22 setAllocateType:&off_1009477B8];
        [v22 setGroupID:v5];
        [v22 setActiveRelaySessionToken:v6];
        uint64_t v28 = _IDSAllocateProtocolVersionNumber([v22 setActiveRelayIP:v8]);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        [v22 setAllocateProtocolVersion:v29];

        [v22 setWantsResponse:1];
        [v22 setTopic:kIDSQuickRelayPushTopic];
        uint64_t v30 = OSLogHandleForTransportCategory("QRAllocator");
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
          *(_DWORD *)buf = 138412546;
          id v50 = v5;
          __int16 v51 = 2112;
          v52 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "send keepalive for groupID: %@, sessionID: %@",  buf,  0x16u);
        }

        uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
        if ((_DWORD)v34)
        {
          uint64_t v34 = _IDSShouldLogTransport(v34);
          if ((_DWORD)v34)
          {
            uint64_t v36 = kIDSQRAllocateKey_RelaySessionID;
            v46 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
            _IDSLogTransport(@"QRAllocator", @"IDS", @"send keepalive for groupID: %@, sessionID: %@");

            uint64_t v34 = _IDSShouldLog(0LL, @"QRAllocator");
            if ((_DWORD)v34)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v36, v5, v46));
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"send keepalive for groupID: %@, sessionID: %@");
            }
          }
        }

        uint64_t v38 = im_primary_queue(v34, v35);
        v39 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v38);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1002890A0;
        block[3] = &unk_1008F6010;
        id v48 = v22;
        id v40 = v22;
        dispatch_async(v39, block);
      }

      else
      {
        uint64_t v41 = OSLogHandleForTransportCategory("QRAllocator");
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v18;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
        }

        uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
        if ((_DWORD)v44)
        {
          if (_IDSShouldLogTransport(v44))
          {
            _IDSLogTransport(@"QRAllocator", @"IDS", @"Session not found for %@");
          }
        }
      }
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForTransportCategory("QRAllocator");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "no groupID in %@", buf, 0xCu);
    }

    uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
    if ((_DWORD)v17)
    {
      if (_IDSShouldLogTransport(v17))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"no groupID in %@");
      }
    }

    BOOL v21 = 0;
  }

  return v21;
}

- (void)_sendAllocateRequest:(id)a3
{
  id v3 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  id inited = objc_initWeak(&location, v3);
  uint64_t v6 = im_primary_queue(inited, v5);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100289388;
  block[3] = &unk_1008FF660;
  id v10 = v3;
  id v8 = v3;
  objc_copyWeak(&v11, &location);
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_setupAllocation:(id)a3 fromURI:(id)a4 sessionID:(id)a5 isSessionIDRemoteDeviceID:(BOOL)a6 options:(id)a7 prevConnectStatus:(id *)a8 requestUUID:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11
{
  BOOL v13 = a6;
  v202 = (NSMutableArray *)a3;
  id v194 = a4;
  id v16 = a5;
  uint64_t v17 = ($F011259C41EE040AEEAF8154C0456D79 *)a7;
  id v195 = a9;
  id v193 = a10;
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKeyedSubscript:]( v17,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_IsLightweightParticipant));
    unsigned int v20 = [v19 BOOLValue];
    BOOL v21 = @"NO";
    if (v20) {
      BOOL v21 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation:fromURI:sessionID:isSessionIDRemoteDeviceID:options:prevConnectStatus:requestUUID:connectReadyHan dler: called {sessionID: %@} options[kIDSQRAllocateKey_IsLightweightParticipant] = %@",  buf,  0x16u);
  }

  id v22 = -[IDSQuickRelayAllocateMessage init:](objc_alloc(&OBJC_CLASS___IDSQuickRelayAllocateMessage), "init:", v195);
  v197 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v16);
  v215.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v215.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  -[NSUUID getUUIDBytes:](v197, "getUUIDBytes:", &v215);
  if (!self->_requestIDToPreferredLocalInterface)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    requestIDToPreferredLocalInterface = self->_requestIDToPreferredLocalInterface;
    self->_requestIDToPreferredLocalInterface = Mutable;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a11));
  if (v25)
  {
    objc_super v26 = self->_requestIDToPreferredLocalInterface;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v22 requestIDStr]);
    CFDictionarySetValue((CFMutableDictionaryRef)v26, v27, v25);
  }

  else
  {
    v27 = &_os_log_default;
    id v28 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A5AF0(v22);
    }
  }

  if (v13)
  {
    uint64_t v29 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v197;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "translate deviceID: %@", buf, 0xCu);
    }

    uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
    if ((_DWORD)v32)
    {
      if (_IDSShouldLogTransport(v32))
      {
        v185 = ($F011259C41EE040AEEAF8154C0456D79 *)v197;
        _IDSLogTransport(@"QRAllocator", @"IDS", @"translate deviceID: %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          v185 = ($F011259C41EE040AEEAF8154C0456D79 *)v197;
          _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"translate deviceID: %@");
        }
      }
    }

    memset(buf, 170, 16);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance", v185));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 deviceIdentifier]);

    uint64_t v35 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v34);
    -[NSUUID getUUIDBytes:](v35, "getUUIDBytes:", buf);

    int8x16_t v215 = veorq_s8(v215, *(int8x16_t *)buf);
    uint64_t v36 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v215);
    uint64_t v37 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v36, "UUIDString"));

    id v16 = (id)v37;
  }

  uint64_t v38 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v215, 16LL);
  [v22 setIDSSessionID:v38];

  [v22 setSenderURI:v194];
  uint64_t v39 = objc_claimAutoreleasedReturnValue(-[$F011259C41EE040AEEAF8154C0456D79 objectForKey:](v17, "objectForKey:", kIDSQRAllocateKey_AllocateType));
  v203 = (void *)v39;
  if (v39) {
    id v40 = (_UNKNOWN **)v39;
  }
  else {
    id v40 = &off_1009477D0;
  }
  [v22 setAllocateType:v40];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[IMDeviceSupport sharedInstance](&OBJC_CLASS___IMDeviceSupport, "sharedInstance"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 userAgentString]);
  [v22 setUserAgent:v42];

  if ([v203 intValue] == 3)
  {
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[$F011259C41EE040AEEAF8154C0456D79 objectForKey:](v17, "objectForKey:", kIDSQRAllocateKey_GroupID));
    if (v43)
    {
      uint64_t v44 = OSLogHandleForTransportCategory("QRAllocator");
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a8;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "shared session allocation, previous connect status: %p",  buf,  0xCu);
      }

      uint64_t v47 = os_log_shim_legacy_logging_enabled(v46);
      if ((_DWORD)v47)
      {
        if (_IDSShouldLogTransport(v47))
        {
          v185 = a8;
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"shared session allocation, previous connect status: %p");
          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            v185 = a8;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"shared session allocation, previous connect status: %p");
          }
        }
      }

      objc_msgSend(v22, "setIsSharedSession:", &off_100947770, v185);
      [v22 setGroupID:v43];
      if (a8)
      {
        id v48 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &a8->var2, 4LL);
        v49 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  a8->var5,  a8->var4);
        uint64_t v50 = OSLogHandleForTransportCategory("QRAllocator");
        __int16 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          int var0 = a8->var0;
          int var1 = a8->var1;
          unsigned int var2 = a8->var2;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = var0;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = var1;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = var2;
          *(_WORD *)&buf[20] = 2112;
          *(void *)&buf[22] = v49;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "cached response previous connect status, reason/error/token/ip: %u %u %u %@",  buf,  0x1Eu);
        }

        uint64_t v56 = os_log_shim_legacy_logging_enabled(v55);
        if ((_DWORD)v56)
        {
          if (_IDSShouldLogTransport(v56))
          {
            v188 = (void *)a8->var2;
            v189 = v49;
            v185 = ($F011259C41EE040AEEAF8154C0456D79 *)a8->var0;
            v187 = (__CFString *)a8->var1;
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"cached response previous connect status, reason/error/token/ip: %u %u %u %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              v188 = (void *)a8->var2;
              v189 = v49;
              v185 = ($F011259C41EE040AEEAF8154C0456D79 *)a8->var0;
              v187 = (__CFString *)a8->var1;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"cached response previous connect status, reason/error/token/ip: %u %u %u %@");
            }
          }
        }

        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  a8->var0,  v185,  v187,  v188,  v189));
        [v22 setQrReason:v57];

        if (a8->var1 != 0xFFFF)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:"));
          [v22 setQrError:v58];
        }

        [v22 setPreviousAccessToken:v49];
        [v22 setPreviousRelayIP:v48];
      }

      else
      {
        [v22 setQrReason:&off_1009477E8];
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_IsNewUPlusOneSession));
      unsigned int v64 = [v63 BOOLValue];

      if (v64) {
        [v22 setIsNewUPlusOneSession:&off_100947770];
      }
    }

    else
    {
      uint64_t v59 = OSLogHandleForTransportCategory("QRAllocator");
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "groupID not set for shared session allocation: %@",  buf,  0xCu);
      }

      uint64_t v62 = os_log_shim_legacy_logging_enabled(v61);
      if ((_DWORD)v62)
      {
        if (_IDSShouldLogTransport(v62))
        {
          v185 = v17;
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"groupID not set for shared session allocation: %@");
          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            v185 = v17;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"groupID not set for shared session allocation: %@");
          }
        }
      }
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_GroupMemberCount,  v185));
    if (v65) {
      [v22 setGroupMemberCount:v65];
    }
  }

  if (a8)
  {
    free(a8->var5);
    free(a8);
  }

  if (!v202) {
    v202 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  if (!self->_requestIDToSession)
  {
    v66 = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    requestIDToSession = self->_requestIDToSession;
    self->_requestIDToSession = v66;
  }

  id value = v16;
  if (value)
  {
    v68 = self->_requestIDToSession;
    v69 = (void *)objc_claimAutoreleasedReturnValue([v22 requestIDStr]);
    CFDictionarySetValue((CFMutableDictionaryRef)v68, v69, value);
  }

  else
  {
    v69 = &_os_log_default;
    id v70 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A5A54(v22);
    }
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_QRForceExperiment));
  [v22 setQrForceExperiment:v71];

  if (IMGetDomainIntForKey(@"com.apple.ids", @"QuickRelayServerProvider"))
  {
    uint64_t v72 = OSLogHandleForTransportCategory("QRAllocator");
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "QuickRelayServerProvider switch has been deprecated",  buf,  2u);
    }

    uint64_t v75 = os_log_shim_legacy_logging_enabled(v74);
    if ((_DWORD)v75)
    {
      if (_IDSShouldLogTransport(v75))
      {
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"QuickRelayServerProvider switch has been deprecated");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"QuickRelayServerProvider switch has been deprecated");
        }
      }
    }
  }

  v198 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_RelayAddress));
  id v200 = (id)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_RelaySessionToken));
  id v196 = (id)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_RelaySessionKey));
  if (v198 && v200 && v196)
  {
    [v22 setExistingRelayIP:v198];
    [v22 setExistingRelaySessionToken:v200];
    *(void *)&__int128 v76 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v76 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v76;
    *(_OWORD *)&buf[16] = v76;
    id v77 = v196;
    id v78 = [v77 bytes];
    id v79 = [v77 length];
    id v80 = v200;
    CCHmac(2u, v78, (size_t)v79, [v80 bytes], (size_t)objc_msgSend(v80, "length"), buf);
    v81 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", buf, 32LL);
    [v22 setExistingRelaySignature:v81];
  }

  uint64_t v82 = kIDSQRAllocateKey_SenderExternalAddress;
  v83 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_SenderExternalAddress));

  if (v83)
  {
    uint64_t v84 = OSLogHandleForTransportCategory("QRAllocator");
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      id v86 = (id)objc_claimAutoreleasedReturnValue(-[$F011259C41EE040AEEAF8154C0456D79 objectForKey:](v17, "objectForKey:", v82));
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v86;
      _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "request allocation for a specific address %@",  buf,  0xCu);
    }

    uint64_t v88 = os_log_shim_legacy_logging_enabled(v87);
    if ((_DWORD)v88)
    {
      if (_IDSShouldLogTransport(v88))
      {
        v185 = ($F011259C41EE040AEEAF8154C0456D79 *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  v82));
        _IDSLogTransport(@"QRAllocator", @"IDS", @"request allocation for a specific address %@");

        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          v185 = ($F011259C41EE040AEEAF8154C0456D79 *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  v82,  v185));
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"request allocation for a specific address %@");
        }
      }
    }

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[$F011259C41EE040AEEAF8154C0456D79 objectForKey:](v17, "objectForKey:", v82, v185));
    [v22 setSenderExternalIP:v89];
  }

  uint64_t v90 = kIDSQRAllocateKey_AppID;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[$F011259C41EE040AEEAF8154C0456D79 objectForKey:](v17, "objectForKey:", kIDSQRAllocateKey_AppID));

  if (v91)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[$F011259C41EE040AEEAF8154C0456D79 objectForKey:](v17, "objectForKey:", v90));
    [v22 setAppID:v92];
  }

  else
  {
    [v22 setAppID:kIDSQuickRelayPushTopic];
  }

  v199 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_ConversationID));
  if (v199) {
    [v22 setConversationID:v199];
  }
  v93 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_IsLightweightParticipant));
  [v22 setIsLightweightParticipant:v93];

  if ([v203 intValue] != 3)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_SelfAllocationCount));
    [v22 setSelfAllocationCount:v94];
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  IDSSessionInvitationRetryCountKey));
  [v22 setInvitationRetryCount:v95];

  uint64_t v97 = _IDSAllocateProtocolVersionNumber(v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
  [v22 setAllocateProtocolVersion:v98];

  [v22 setRecipients:v202];
  [v22 setWantsResponse:1];
  [v22 setTopic:kIDSQuickRelayPushTopic];
  v201 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_PreferredRemoteInterface));
  if ([v201 intValue])
  {
    uint64_t v99 = OSLogHandleForTransportCategory("QRAllocator");
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v101 = GLUtilPreferredInterfaceToString([v201 intValue]);
      id v102 = (id)objc_claimAutoreleasedReturnValue(v101);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v102;
      _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation: preferredRemoteInterface %@",  buf,  0xCu);
    }

    uint64_t v104 = os_log_shim_legacy_logging_enabled(v103);
    if ((_DWORD)v104)
    {
      if (_IDSShouldLogTransport(v104))
      {
        uint64_t v105 = GLUtilPreferredInterfaceToString([v201 intValue]);
        v185 = ($F011259C41EE040AEEAF8154C0456D79 *)objc_claimAutoreleasedReturnValue(v105);
        _IDSLogTransport(@"QRAllocator", @"IDS", @"_setupAllocation: preferredRemoteInterface %@");

        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          uint64_t v106 = GLUtilPreferredInterfaceToString(objc_msgSend(v201, "intValue", v185));
          v185 = ($F011259C41EE040AEEAF8154C0456D79 *)objc_claimAutoreleasedReturnValue(v106);
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"_setupAllocation: preferredRemoteInterface %@");
        }
      }
    }

    objc_msgSend(v22, "setInfoAttribute:", v201, v185);
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v108 = [v107 isInternalInstall];

  if (v108)
  {
    if (IMGetDomainBoolForKey(@"com.apple.ids", @"QuickRelayForceTTRAllocationStatus"))
    {
      [v22 setTestOptions:IDSGroupSessionSendDiagnosticIndication];
      uint64_t v110 = OSLogHandleForTransportCategory("QRAllocator");
      v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation test options: IDSGroupSessionSendDiagnosticIndication",  buf,  2u);
      }

      uint64_t v113 = os_log_shim_legacy_logging_enabled(v112);
      if ((_DWORD)v113)
      {
        if (_IDSShouldLogTransport(v113))
        {
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"_setupAllocation test options: IDSGroupSessionSendDiagnosticIndication");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"_setupAllocation test options: IDSGroupSessionSendDiagnosticIndication");
          }
        }
      }
    }

    uint64_t v114 = IMGetDomainValueForKey(@"com.apple.ids", @"QuickRelayServerAddress");
    v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
    if (v115)
    {
      v116 = ($F011259C41EE040AEEAF8154C0456D79 *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@=%@",  kIDSQRAllocateKey_ServerAddress,  v115));
      [v22 setTestOptions:v116];
      uint64_t v117 = OSLogHandleForTransportCategory("QRAllocator");
      v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v116;
        _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation QuickRelayServerAddress test option: %@",  buf,  0xCu);
      }

      uint64_t v120 = os_log_shim_legacy_logging_enabled(v119);
      if ((_DWORD)v120)
      {
        if (_IDSShouldLogTransport(v120))
        {
          v185 = v116;
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"_setupAllocation QuickRelayServerAddress test option: %@");
          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            v185 = v116;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"_setupAllocation QuickRelayServerAddress test option: %@");
          }
        }
      }
    }

    if (IMGetDomainBoolForKey(@"com.apple.ids", @"QuickRelayForceDegraded"))
    {
      [v22 setTestOptions:IDSGroupSessionForceDegraded];
      uint64_t v121 = OSLogHandleForTransportCategory("QRAllocator");
      v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation test options: IDSGroupSessionForceDegraded",  buf,  2u);
      }

      uint64_t v124 = os_log_shim_legacy_logging_enabled(v123);
      if ((_DWORD)v124)
      {
        if (_IDSShouldLogTransport(v124))
        {
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"_setupAllocation test options: IDSGroupSessionForceDegraded");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"_setupAllocation test options: IDSGroupSessionForceDegraded");
          }
        }
      }
    }

    if (IMGetDomainBoolForKey(@"com.apple.ids", @"QuickRelayBlockUPlusOne"))
    {
      [v22 setTestOptions:IDSGroupSessionBlockUPlusOneSession];
      uint64_t v125 = OSLogHandleForTransportCategory("QRAllocator");
      v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation test options: IDSGroupSessionBlockUPlusOneSession",  buf,  2u);
      }

      uint64_t v128 = os_log_shim_legacy_logging_enabled(v127);
      if ((_DWORD)v128)
      {
        if (_IDSShouldLogTransport(v128))
        {
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"_setupAllocation test options: IDSGroupSessionBlockUPlusOneSession");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"_setupAllocation test options: IDSGroupSessionBlockUPlusOneSession");
          }
        }
      }
    }

    if (IMGetDomainBoolForKey(@"com.apple.ids", @"QuickRelayAppleTestingKey"))
    {
      [v22 setTestOptions:IDSGroupSessionAppleTestingKey];
      uint64_t v129 = OSLogHandleForTransportCategory("QRAllocator");
      v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v130,  OS_LOG_TYPE_DEFAULT,  "_setupAllocation test options: IDSGroupSessionAppleTestingKey",  buf,  2u);
      }

      uint64_t v132 = os_log_shim_legacy_logging_enabled(v131);
      if ((_DWORD)v132)
      {
        if (_IDSShouldLogTransport(v132))
        {
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"_setupAllocation test options: IDSGroupSessionAppleTestingKey");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"_setupAllocation test options: IDSGroupSessionAppleTestingKey");
          }
        }
      }
    }
  }

  double v133 = ids_monotonic_time(v109);
  os_unfair_lock_lock(&self->_lock);
  v134 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionToRequestIDToAllocateTime,  "objectForKeyedSubscript:",  value));
  BOOL v135 = v134 == 0LL;

  if (v135)
  {
    CFMutableDictionaryRef v136 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sessionToRequestIDToAllocateTime,  "setObject:forKeyedSubscript:",  v136,  value);
  }

  v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v133, v185));
  if (v137)
  {
    v138 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionToRequestIDToAllocateTime,  "objectForKeyedSubscript:",  value));
    v139 = (void *)objc_claimAutoreleasedReturnValue([v22 requestIDStr]);
    CFDictionarySetValue(v138, v139, v137);
  }

  else
  {
    v138 = (__CFDictionary *)&_os_log_default;
    id v140 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1006A59B8(v22);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v142 = -[NSMutableArray count](v202, "count");
    id v143 = (id)objc_claimAutoreleasedReturnValue([v22 requestIDStr]);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = value;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v142;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v143;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v133;
    _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_DEFAULT,  "Send allocate request, sessionID: %@, recipient count: %u, requestID: %@, time: %.6f.",  buf,  0x26u);
  }

  v144 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
  v206[0] = _NSConcreteStackBlock;
  v206[1] = 3221225472LL;
  v206[2] = sub_10028B430;
  v206[3] = &unk_1008F78B0;
  unsigned int v209 = -[NSMutableArray count](v202, "count");
  id v145 = v144;
  id v207 = v145;
  double v208 = v133;
  cut_dispatch_log_queue(v206);
  v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[IDSQuickRelayAllocator _sendAllocateRequest:](self, "_sendAllocateRequest:", v22);
  v146 = -[QRAllocation initWithRequest:](objc_alloc(&OBJC_CLASS___QRAllocation), "initWithRequest:", v22);
  if ([v203 intValue] == 3)
  {
    v147 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_StreamInfoPublishedStreams));
    v148 = (NSData *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_StreamInfoSubscribedStreams));
    v149 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_StreamInfoGenerationCounter));
    v150 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams));
    v151 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKey:]( v17,  "objectForKey:",  kIDSQRAllocateKey_IsJoinAllocation));
    -[QRAllocation setIsJoinAllocation:](v146, "setIsJoinAllocation:", [v151 BOOLValue]);

    uint64_t v152 = OSLogHandleForTransportCategory("QRAllocator");
    v153 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
    if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v154 = -[QRAllocation isJoinAllocation](v146, "isJoinAllocation");
      v155 = @"NO";
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = value;
      *(_WORD *)&buf[12] = 2112;
      if (v154) {
        v155 = @"YES";
      }
      *(void *)&buf[14] = v155;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v147;
      *(_WORD *)&buf[32] = 2112;
      *(void *)&buf[34] = v148;
      __int16 v211 = 2112;
      v212 = v149;
      __int16 v213 = 2112;
      v214 = v150;
      _os_log_impl( (void *)&_mh_execute_header,  v153,  OS_LOG_TYPE_DEFAULT,  "Stream information to cache, idsSessionID=%@, isJoinAllocation: %@, publishedStreams=%@, subscribedStreams=%@, g enerationCounter=%@, maxConcurrentStreams=%@",  buf,  0x3Eu);
    }

    uint64_t v157 = os_log_shim_legacy_logging_enabled(v156);
    if ((_DWORD)v157 && _IDSShouldLogTransport(v157))
    {
      v158 = -[QRAllocation isJoinAllocation](v146, "isJoinAllocation") ? @"YES" : @"NO";
      v190 = v149;
      v191 = v150;
      v188 = v147;
      v189 = v148;
      id v186 = value;
      v187 = v158;
      _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Stream information to cache, idsSessionID=%@, isJoinAllocation: %@, publishedStreams=%@, subscribedStreams=%@, generationCounter=%@, maxConcurrentStreams=%@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        if (-[QRAllocation isJoinAllocation](v146, "isJoinAllocation", value, v187, v147, v148, v149, v150)) {
          v159 = @"YES";
        }
        else {
          v159 = @"NO";
        }
        v190 = v149;
        v191 = v150;
        v188 = v147;
        v189 = v148;
        id v186 = value;
        v187 = (__CFString *)v159;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Stream information to cache, idsSessionID=%@, isJoinAllocation: %@, publishedStreams=%@, subscribedStreams=%@, generationCounter=%@, maxConcurrentStreams=%@");
      }
    }

    if (v147 || v148 || v149 || v150)
    {
      id v160 = -[QRStreamInfo initQRStreamInfo:subscribedStreams:generationCounter:maxConcurrentStreams:]( objc_alloc(&OBJC_CLASS___QRStreamInfo),  "initQRStreamInfo:subscribedStreams:generationCounter:maxConcurrentStreams:",  v147,  v148,  v149,  v150);
      -[QRAllocation setStreamInfo:](v146, "setStreamInfo:", v160);
    }
  }

  -[QRAllocation setConnectReadyHandler:](v146, "setConnectReadyHandler:", v193, v186, v187, v188, v189, v190, v191);
  -[IDSQuickRelayAllocator _addAllocationForSession:allocation:]( self,  "_addAllocationForSession:allocation:",  value,  v146);
  id v161 = objc_alloc(&OBJC_CLASS___IDSQuickRelayMetric);
  v162 = (void *)objc_claimAutoreleasedReturnValue([v22 provider]);
  v163 = (void *)objc_claimAutoreleasedReturnValue([v22 allocateProtocolVersion]);
  v164 = (void *)objc_claimAutoreleasedReturnValue([v22 appID]);
  id v165 = [v161 initWithType:&off_100947740 eventSubType:&off_100947800 duration:0 resultCode:&off_100947818 providerType:v162 transportType:0 interfaceType:0 skeEnabled:0 isInitiator :&off_100947770 protocolVersion:v163 retryCount:0 serviceName:v164 subServiceName:0 participantCount:0];

  v166 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v166 logMetric:v165];

  v167 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getIDSAWDLoggingInstance](self, "_getIDSAWDLoggingInstance"));
  v168 = (void *)objc_claimAutoreleasedReturnValue([v22 provider]);
  v169 = (void *)objc_claimAutoreleasedReturnValue([v22 allocateProtocolVersion]);
  v170 = (void *)objc_claimAutoreleasedReturnValue([v22 appID]);
  [v167 IDSQuickRelayEventType:&off_100947740 eventSubType:&off_100947800 duration:0 resultCode:&off_100947818 providerType:v168 transportType:0 interfaceType:0 skeEnabled:0 isInitia tor:&off_100947770 protocolVersion:v169 retryCount:0 serviceName:v170 subServiceName:0 participantCount:0];

  v171 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation sessionIDStr](v146, "sessionIDStr"));
  v173 = (void *)objc_claimAutoreleasedReturnValue([v171 sessionWithUniqueID:v172]);

  if (v173)
  {
    CFMutableDictionaryRef v174 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v175 = (void *)objc_claimAutoreleasedReturnValue( -[$F011259C41EE040AEEAF8154C0456D79 objectForKeyedSubscript:]( v17,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_TimeBase));
    if (v175)
    {
      [v192 timeIntervalSinceDate:v175];
      v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v176 * 1000.0));
      -[__CFDictionary setObject:forKeyedSubscript:]( v174,  "setObject:forKeyedSubscript:",  v177,  IDSDSessionTimeDeltaKey);

      objc_storeStrong((id *)&self->_timeBase, v175);
    }

    v178 = (void *)objc_claimAutoreleasedReturnValue([v22 allocateProtocolVersion]);
    -[__CFDictionary setObject:forKeyedSubscript:]( v174,  "setObject:forKeyedSubscript:",  v178,  IDSDSessionReportQRVersionKey);

    -[__CFDictionary setObject:forKeyedSubscript:]( v174,  "setObject:forKeyedSubscript:",  &off_100947800,  IDSDSessionReportQREventSubTypeKey);
    -[__CFDictionary setObject:forKeyedSubscript:]( v174,  "setObject:forKeyedSubscript:",  &off_100947818,  IDSDSessionReportResultCodeKey);
    [v173 addQREventForRTCReport:v174];
  }

  else
  {
    uint64_t v179 = OSLogHandleForTransportCategory("QRAllocator");
    v180 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v180, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", buf, 2u);
    }

    uint64_t v182 = os_log_shim_legacy_logging_enabled(v181);
    if ((_DWORD)v182)
    {
      if (_IDSShouldLogTransport(v182))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Invalid session. Skip AWD report");
      }
    }
  }

  v183 = (void *)objc_claimAutoreleasedReturnValue([v22 requestIDStr]);

  return v183;
}

- (id)setupNewAllocationToDevice:(id)a3 options:(id)a4 connectReadyHandler:(id)a5
{
  id v8 = (__CFString *)a3;
  Mutable = (__CFDictionary *)a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "setupNewAllocationToDevice:options:connectReadyHandler: called {deviceID: %@}",  buf,  0xCu);
  }

  im_assert_primary_base_queue(v12, v13);
  if (!-[IDSQuickRelayAllocator _startQRConnectionWithDefaults:](self, "_startQRConnectionWithDefaults:", v8))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    id v16 = (void *)IDSRegistrationServiceTypeCloudMessaging;
    v53 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceWithPushTopic:IDSRegistrationServiceTypeCloudMessaging]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appleIDAccountOnService:v53]);

    unsigned int v19 = -[__CFString isEqualToString:](v8, "isEqualToString:", kIDSDefaultPairedDeviceID);
    if (v19) {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v18 defaultPairedDependentRegistration]);
    }
    else {
      v52 = (void *)objc_claimAutoreleasedReturnValue([v18 dependentRegistrationMatchingUUID:v8]);
    }
    if (!v52)
    {
      uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = @"No device found";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
      if ((_DWORD)v24)
      {
        if (_IDSShouldLogTransport(v24))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"%@");
        }
      }

      if (v10)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"No device found",  NSLocalizedDescriptionKey));
        valuea = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"QRAllocator",  7002LL,  v25));

        v10[2](v10, valuea, 0LL);
        uint64_t v14 = 0LL;
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      goto LABEL_42;
    }

    id value = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:IDSDevicePropertyPushToken]);
    if (value)
    {
      if (!Mutable) {
        Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RecipientPushToken, value);
      id v20 = v16;
      if (v20)
      {
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v20);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006A5B8C();
      }

      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateType, &off_1009477D0);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v18 unprefixedURIStringsFromRegistration]);
      uint64_t v33 = (void *)_IDSCopyCallerIDWithSelfMessagingHint(0LL, v32, 0LL, 0LL, 0LL, 0LL, 1LL);

      v49 = (__CFString *)objc_claimAutoreleasedReturnValue([v33 _bestGuessURI]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v18 primaryRegistration]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v34 registrationCert]);

      uint64_t v35 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v18 prefixedURIStringsFromRegistration]);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_10028BCD4;
      v54[3] = &unk_1008FF688;
      id v55 = v18;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "__imArrayByApplyingBlock:", v54));
      uint64_t v38 = -[NSMutableArray initWithArray:](v35, "initWithArray:", v37);

      uint64_t v39 = OSLogHandleForTransportCategory("QRAllocator");
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v53 identifier]);
        *(_DWORD *)buf = 138412546;
        v57 = v41;
        __int16 v58 = 2112;
        uint64_t v59 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "setup allocation for %@ service to device %@",  buf,  0x16u);
      }

      uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
      if ((_DWORD)v43)
      {
        if (_IDSShouldLogTransport(v43))
        {
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v53 identifier]);
          uint64_t v47 = v8;
          _IDSLogTransport(@"QRAllocator", @"IDS", @"setup allocation for %@ service to device %@");

          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier", v46, v8));
            uint64_t v47 = v8;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"setup allocation for %@ service to device %@");
          }
        }
      }

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier", v46, v47));
      BYTE4(v48) = 0;
      LODWORD(v48) = 0;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:]( self,  "_setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options :connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:",  v38,  v8,  v19 ^ 1,  v31,  v49,  v44,  Mutable,  v10,  v48));
    }

    else
    {
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No push token for device %@",  v8));
      uint64_t v26 = OSLogHandleForTransportCategory("QRAllocator");
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v49;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v29 = os_log_shim_legacy_logging_enabled(v28);
      if ((_DWORD)v29)
      {
        if (_IDSShouldLogTransport(v29))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"%@");
        }
      }

      if (!v10)
      {
        uint64_t v14 = 0LL;
LABEL_40:

LABEL_42:
        goto LABEL_43;
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v49,  NSLocalizedDescriptionKey));
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"QRAllocator",  7003LL,  v30));

      v10[2](v10, v31, 0LL);
      uint64_t v14 = 0LL;
    }

    goto LABEL_40;
  }

  uint64_t v14 = 0LL;
LABEL_43:

  return v14;
}

- (id)_getResponseFromQRGroupID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_allocateResponses, "objectForKey:", v4));
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    id v7 = *(id *)(v5 + 8);
  }

  else
  {
    uint64_t v8 = OSLogHandleForTransportCategory("QRAllocator");
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No response found for groupID: %@", buf, 0xCu);
    }

    uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
    if ((_DWORD)v11)
    {
      if (_IDSShouldLogTransport(v11))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"No response found for groupID: %@");
      }
    }

    id v7 = 0LL;
  }

  return v7;
}

- (void)clearResponseFromQRGroupID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "clear response for groupID %@", buf, 0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      if (_IDSShouldLogTransport(v8))
      {
        id v9 = v4;
        _IDSLogTransport(@"QRAllocator", @"IDS", @"clear response for groupID %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          id v9 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"clear response for groupID %@");
        }
      }
    }

    -[NSMutableDictionary removeObjectForKey:](self->_allocateResponses, "removeObjectForKey:", v4, v9);
  }
}

- (void)_setResponseForQRGroupID:(id)a3 groupID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_setResponseForQRGroupID:groupID: called {groupID: %@}",  (uint8_t *)&v13,  0xCu);
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_allocateResponses, "objectForKey:", v6));
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    uint64_t v11 = *(void *)(v9 + 16);
  }

  else
  {
    if (qword_1009C0898 != -1) {
      dispatch_once(&qword_1009C0898, &stru_1008FF788);
    }
    uint64_t v11 = mach_absolute_time() * dword_1009C0890 / *(unsigned int *)algn_1009C0894 / 0x3B9ACA00 + 1800;
  }

  uint64_t v12 = -[IDSAllocateResponseWrapper initWithResponse:cleanupTime:]( objc_alloc(&OBJC_CLASS___IDSAllocateResponseWrapper),  "initWithResponse:cleanupTime:",  v7,  v11);

  -[NSMutableDictionary setObject:forKey:](self->_allocateResponses, "setObject:forKey:", v12, v6);
}

- (id)findAllocateResponseForSessionID:(id)a3 FromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator getAllocateResponse:groupID:](self, "getAllocateResponse:groupID:", v6, v6));
  uint64_t v47 = kIDSQRAllocateKey_Allocations;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:"));
  id v10 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v61;
    uint64_t v13 = kIDSQRAllocateKey_RecipientURI;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v60 + 1) + 8 * (void)i) objectForKeyedSubscript:v13]);
        if ([v15 isEqualToIgnoringCase:v7])
        {
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v68 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Main cached allocation response contains fromURI: %@",  buf,  0xCu);
          }

          id v33 = v8;
          id v16 = v9;
          goto LABEL_40;
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = (id)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findAllocationListForSessionID:](self, "_findAllocationListForSessionID:", v6));
  if (v16)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v16 = v16;
    id v18 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v57;
      uint64_t v20 = kIDSQRAllocateKey_RecipientURI;
      uint64_t v44 = v8;
      id v45 = v6;
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v37 = *(void *)v57;
      do
      {
        uint64_t v21 = 0LL;
        id v38 = v18;
        do
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v41 = v21;
          id v22 = *(void **)(*((void *)&v56 + 1) + 8 * v21);
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 responses]);
          id v42 = [v23 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v42)
          {
            uint64_t v24 = *(void *)v53;
            uint64_t v46 = v23;
            uint64_t v39 = *(void *)v53;
            do
            {
              v25 = 0LL;
              do
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v43 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v25);
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v47]);
                __int128 v48 = 0u;
                __int128 v49 = 0u;
                __int128 v50 = 0u;
                __int128 v51 = 0u;
                id v27 = v26;
                id v28 = [v27 countByEnumeratingWithState:&v48 objects:v64 count:16];
                if (v28)
                {
                  id v29 = v28;
                  uint64_t v30 = *(void *)v49;
                  while (2)
                  {
                    for (j = 0LL; j != v29; j = (char *)j + 1)
                    {
                      if (*(void *)v49 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) objectForKeyedSubscript:v20]);
                      if ([v32 isEqualToIgnoringCase:v7])
                      {
                        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog QRAllocator]( &OBJC_CLASS___IDSFoundationLog,  "QRAllocator"));
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v68 = v7;
                          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Current cached allocation response contains fromURI: %@",  buf,  0xCu);
                        }

                        os_unfair_lock_unlock(lock);
                        id v33 = v43;

                        uint64_t v8 = v44;
                        id v6 = v45;
                        goto LABEL_40;
                      }
                    }

                    id v29 = [v27 countByEnumeratingWithState:&v48 objects:v64 count:16];
                    if (v29) {
                      continue;
                    }
                    break;
                  }
                }

                v25 = (char *)v25 + 1;
                uint64_t v8 = v44;
                id v6 = v45;
                uint64_t v23 = v46;
                uint64_t v24 = v39;
              }

              while (v25 != v42);
              p_os_unfair_lock_t lock = lock;
              uint64_t v19 = v37;
              id v42 = [v46 countByEnumeratingWithState:&v52 objects:v65 count:16];
            }

            while (v42);
          }

          uint64_t v21 = v41 + 1;
        }

        while ((id)(v41 + 1) != v38);
        id v18 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }

      while (v18);
    }

    os_unfair_lock_unlock(p_lock);
  }

  id v33 = 0LL;
LABEL_40:

  return v33;
}

- (id)getAllocateResponse:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "getAllocateResponse:groupID called {groupID: %@}",  buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _parseQuickRelayDefaults:gropuID:]( self,  "_parseQuickRelayDefaults:gropuID:",  v6,  v7));
  if (v9)
  {
    uint64_t v10 = OSLogHandleForTransportCategory("QRAllocator");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "use hardcoded session token for group %@, session %@.",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"use hardcoded session token for group %@, session %@.");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"use hardcoded session token for group %@, session %@.");
        }
      }
    }

    id v14 = v9;
  }

  else
  {
    os_unfair_lock_lock(&self->_lock);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v7));
    os_unfair_lock_unlock(&self->_lock);
    id v14 = (id)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _createSessionInfoFromResponsePayload:]( self,  "_createSessionInfoFromResponsePayload:",  v15));
  }

  return v14;
}

- (BOOL)_shouldUseCurrentResponse:(id)a3 cachedMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  id v9 = (void *)kIDSQRAllocateKey_SessionAllocationTime;
  id v10 = sub_10028D3BC(v8, v6, kIDSQRAllocateKey_SessionAllocationTime);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
  id v14 = sub_10028D3BC(v13, v5, v9);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  id v16 = (NSUUID *)v15;
  if (v11) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    uint64_t v18 = OSLogHandleForTransportCategory("QRAllocator");
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v116 = v11;
      *(_WORD *)&v116[8] = 2112;
      uint64_t v117 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No session allocation time: %@ %@",  buf,  0x16u);
    }

    uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
    if ((_DWORD)v21)
    {
      if (_IDSShouldLogTransport(v21))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"No session allocation time: %@ %@");
      }
    }

    LOBYTE(v22) = 0;
  }

  else
  {
    id v23 = [v11 unsignedLongLongValue];
    id v24 = -[NSUUID unsignedLongLongValue](v16, "unsignedLongLongValue");
    if (v23 == v24)
    {
      uint64_t v25 = kIDSQRAllocateKey_RelaySessionID;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
      uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
      if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v25]);
        uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v29));
      }

      else
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v25]);
        uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSData, v31);
        if ((objc_opt_isKindOfClass(v29, v32) & 1) == 0)
        {
          id v33 = 0LL;
LABEL_21:

          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v25]);
          uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString, v35);
          if ((objc_opt_isKindOfClass(v34, v36) & 1) != 0)
          {
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v25]);
            uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v37));
          }

          else
          {
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v25]);
            uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSData, v39);
            if ((objc_opt_isKindOfClass(v37, v40) & 1) == 0)
            {
              uint64_t v41 = 0LL;
              goto LABEL_27;
            }

            uint64_t v38 = objc_claimAutoreleasedReturnValue([v5 objectForKey:v25]);
          }

          uint64_t v41 = (NSUUID *)v38;
LABEL_27:

          if (v33 && v41)
          {
            if ([v33 length] == (id)16 && -[NSUUID length](v41, "length") == (id)16)
            {
              id v42 = objc_alloc(&OBJC_CLASS___NSUUID);
              id v108 = v33;
              uint64_t v43 = -[NSUUID initWithUUIDBytes:](v42, "initWithUUIDBytes:", [v108 bytes]);
              uint64_t v44 = objc_alloc(&OBJC_CLASS___NSUUID);
              id v45 = v41;
              uint64_t v46 = -[NSUUID initWithUUIDBytes:](v44, "initWithUUIDBytes:", -[NSUUID bytes](v45, "bytes"));
              uint64_t v47 = v46;
              uint64_t v114 = v43;
              if (!v43 || !v46)
              {
                uint64_t v61 = OSLogHandleForTransportCategory("QRAllocator");
                __int128 v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)v116 = v43;
                  *(_WORD *)&v116[8] = 2112;
                  uint64_t v117 = v47;
                  _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "Invalid relay session UUID: %@ %@",  buf,  0x16u);
                }

                uint64_t v64 = os_log_shim_legacy_logging_enabled(v63);
                if ((_DWORD)v64)
                {
                  if (_IDSShouldLogTransport(v64))
                  {
                    _IDSLogTransport(@"QRAllocator", @"IDS", @"Invalid relay session UUID: %@ %@");
                    if (_IDSShouldLog(0LL, @"QRAllocator")) {
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Invalid relay session UUID: %@ %@");
                    }
                  }
                }

                LOBYTE(v22) = 0;
                goto LABEL_90;
              }

              uint64_t v104 = v45;
              v107 = v46;
              uint64_t v48 = kIDSQRAllocateKey_RelayAddress;
              uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSQRAllocateKey_RelayAddress]);
              uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSString, v49);
              if ((objc_opt_isKindOfClass(v110, v50) & 1) != 0)
              {
                __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v48]);
                uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSData _IDSDataFromBase64String:]( &OBJC_CLASS___NSData,  "_IDSDataFromBase64String:",  v51));
              }

              else
              {
                __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v48]);
                uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSData, v65);
                if ((objc_opt_isKindOfClass(v51, v66) & 1) != 0) {
                  uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v48]);
                }
                else {
                  uint64_t v109 = 0LL;
                }
              }

              v111 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v48]);
              uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSString, v67);
              if ((objc_opt_isKindOfClass(v111, v68) & 1) != 0)
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v48]);
                uint64_t v70 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v69));
              }

              else
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v48]);
                uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSData, v71);
                if ((objc_opt_isKindOfClass(v69, v72) & 1) == 0)
                {
                  v73 = 0LL;
                  goto LABEL_66;
                }

                uint64_t v70 = objc_claimAutoreleasedReturnValue([v5 objectForKey:v48]);
              }

              v73 = (void *)v70;
LABEL_66:

              uint64_t v74 = v109;
              if ([v109 isEqualToData:v73])
              {
                uint64_t v103 = v73;
                uint64_t v75 = kIDSQRAllocateKey_RelayAddressIPv6;
                uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSQRAllocateKey_RelayAddressIPv6]);
                uint64_t v77 = objc_opt_class(&OBJC_CLASS___NSString, v76);
                if ((objc_opt_isKindOfClass(v112, v77) & 1) != 0)
                {
                  id v78 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v75]);
                  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSData _IDSDataFromBase64String:]( &OBJC_CLASS___NSData,  "_IDSDataFromBase64String:",  v78));
                }

                else
                {
                  id v78 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v75]);
                  uint64_t v80 = objc_opt_class(&OBJC_CLASS___NSData, v79);
                  if ((objc_opt_isKindOfClass(v78, v80) & 1) != 0) {
                    uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v75]);
                  }
                  else {
                    uint64_t v106 = 0LL;
                  }
                }

                uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v75]);
                uint64_t v82 = objc_opt_class(&OBJC_CLASS___NSString, v81);
                if ((objc_opt_isKindOfClass(v113, v82) & 1) != 0)
                {
                  v83 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v75]);
                  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSData _IDSDataFromBase64String:]( &OBJC_CLASS___NSData,  "_IDSDataFromBase64String:",  v83));
                }

                else
                {
                  v83 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v75]);
                  uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSData, v84);
                  if ((objc_opt_isKindOfClass(v83, v85) & 1) != 0) {
                    uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v75]);
                  }
                  else {
                    uint64_t v105 = 0LL;
                  }
                }

                uint64_t v87 = objc_opt_class(&OBJC_CLASS___NSNumber, v86);
                uint64_t v88 = (void *)kIDSQRAllocateKey_RelayPort;
                id v89 = sub_10028D3BC(v87, v6, kIDSQRAllocateKey_RelayPort);
                uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
                unsigned int v91 = [v90 unsignedShortValue];

                uint64_t v93 = objc_opt_class(&OBJC_CLASS___NSNumber, v92);
                id v94 = sub_10028D3BC(v93, v5, v88);
                v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
                LODWORD(v88) = [v95 unsignedShortValue];

                if (v91 == (_DWORD)v88)
                {
                  uint64_t v96 = (unint64_t *)[v108 bytes];
                  uint64_t v97 = (unint64_t *)-[NSUUID bytes](v104, "bytes");
                  uint64_t v47 = v107;
                  v73 = v103;
                  unint64_t v98 = bswap64(*v96);
                  unint64_t v99 = bswap64(*v97);
                  if (v98 == v99 && (v98 = bswap64(v96[1]), unint64_t v99 = bswap64(v97[1]), v98 == v99))
                  {
                    unsigned int v100 = 0;
                    uint64_t v74 = v109;
                  }

                  else
                  {
                    uint64_t v74 = v109;
                    if (v98 < v99) {
                      unsigned int v100 = -1;
                    }
                    else {
                      unsigned int v100 = 1;
                    }
                  }

                  BOOL v22 = v100 >> 31;
                }

                else
                {
LABEL_83:
                  LOBYTE(v22) = 1;
                  uint64_t v47 = v107;
                  uint64_t v74 = v109;
                  v73 = v103;
                }
              }

              else
              {
                LOBYTE(v22) = 1;
                uint64_t v47 = v107;
              }

LABEL_90:
              goto LABEL_48;
            }

            uint64_t v56 = OSLogHandleForTransportCategory("QRAllocator");
            __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v116 = [v33 length];
              *(_WORD *)&v116[4] = 1024;
              *(_DWORD *)&v116[6] = -[NSUUID length](v41, "length");
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "Invalid relay session ID length: %u %u",  buf,  0xEu);
            }

            uint64_t v59 = os_log_shim_legacy_logging_enabled(v58);
            if ((_DWORD)v59)
            {
              if (_IDSShouldLogTransport(v59))
              {
                id v101 = [v33 length];
                id v102 = -[NSUUID length](v41, "length");
                _IDSLogTransport(@"QRAllocator", @"IDS", @"Invalid relay session ID length: %u %u");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  objc_msgSend(v33, "length", v101, v102);
                  -[NSUUID length](v41, "length");
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Invalid relay session ID length: %u %u");
                }
              }
            }
          }

          else
          {
            uint64_t v52 = OSLogHandleForTransportCategory("QRAllocator");
            __int128 v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v116 = v33;
              *(_WORD *)&v116[8] = 2048;
              uint64_t v117 = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "No relay session ID: %p %p",  buf,  0x16u);
            }

            uint64_t v55 = os_log_shim_legacy_logging_enabled(v54);
            if ((_DWORD)v55)
            {
              if (_IDSShouldLogTransport(v55))
              {
                _IDSLogTransport(@"QRAllocator", @"IDS", @"No relay session ID: %p %p");
              }
            }
          }

          LOBYTE(v22) = 0;
LABEL_48:

          goto LABEL_49;
        }

        uint64_t v30 = objc_claimAutoreleasedReturnValue([v6 objectForKey:v25]);
      }

      id v33 = (void *)v30;
      goto LABEL_21;
    }

    LOBYTE(v22) = v23 < v24;
  }

- (id)_getResponseForQRSessionID:(id)a3 sessionID:(id)a4 index:(int64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 count];
  if ((uint64_t)v9 - 1 < 0)
  {
LABEL_5:
    uint64_t v15 = OSLogHandleForTransportCategory("QRAllocator");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No response for relay sessionID %@",  buf,  0xCu);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"No response for relay sessionID %@");
      }
    }

    uint64_t v12 = 0LL;
  }

  else
  {
    int64_t v10 = (int64_t)v9;
    uint64_t v11 = kIDSQRAllocateKey_RelaySessionID;
    while (1)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:--v10]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);
      unsigned int v14 = [v8 isEqualToData:v13];

      if (v14) {
        break;
      }

      if (v10 <= 0) {
        goto LABEL_5;
      }
    }

    if (a5) {
      *a5 = v10;
    }
  }

  return v12;
}

- (BOOL)hasParticipantID:(id)a3 participantID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      uint64_t v11 = kIDSQRAllocateKey_RecipientID;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)i),  "objectForKey:",  v11,  (void)v17));
          if (v13)
          {
            id v14 = [v6 unsignedLongLongValue];
            if (v14 == [v13 unsignedLongLongValue])
            {

              BOOL v15 = 1;
              goto LABEL_14;
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    BOOL v15 = 0;
LABEL_14:
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_mergeParticipantID2PushTokenMapping:(id)a3 sourceResponse:(id)a4 mappingChange:(BOOL *)a5
{
  id v54 = a3;
  id v49 = a4;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_mergeParticipantID2PushTokenMapping:destinationResponse:sourceResponse:mappingChange: called",  buf,  2u);
  }

  uint64_t v50 = kIDSQRAllocateKey_Allocations;
  id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKey:"));
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:v50]);
  *a5 = 0;
  if (v48)
  {
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id obj = v48;
    id v8 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v8)
    {
      int v51 = 0;
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v56 = *(void *)v58;
      uint64_t v9 = kIDSQRAllocateKey_RecipientID;
      uint64_t v10 = kIDSQRAllocateKey_RecipientPushToken;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v58 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v9, v46));
          id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v13 unsignedLongLongValue]));
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 objectForKey:v10]);
          id v16 = (void *)v15;
          if (v14) {
            BOOL v17 = v15 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            uint64_t v18 = OSLogHandleForTransportCategory("QRAllocator");
            __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v62[0] = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No recipientID or push token in %@",  buf,  0xCu);
            }

            uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
            if ((_DWORD)v21)
            {
              if (_IDSShouldLogTransport(v21))
              {
                uint64_t v46 = v12;
                _IDSLogTransport(@"QRAllocator", @"IDS", @"No recipientID or push token in %@");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  uint64_t v46 = v12;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"No recipientID or push token in %@");
                }
              }
            }
          }

          else
          {
            os_unfair_lock_lock(lock);
            if (!-[IDSQuickRelayAllocator hasParticipantID:participantID:]( self,  "hasParticipantID:participantID:",  v7,  v14))
            {
              uint64_t v22 = OSLogHandleForTransportCategory("QRAllocator");
              id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v62[0] = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "merge new participant id %@",  buf,  0xCu);
              }

              uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
              if ((_DWORD)v25)
              {
                if (_IDSShouldLogTransport(v25))
                {
                  uint64_t v46 = v14;
                  _IDSLogTransport(@"QRAllocator", @"IDS", @"merge new participant id %@");
                  if (_IDSShouldLog(0LL, @"QRAllocator"))
                  {
                    uint64_t v46 = v14;
                    _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"merge new participant id %@");
                  }
                }
              }

              if (!v7)
              {
                id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v27);
                if ((objc_opt_isKindOfClass(v54, v28) & 1) != 0)
                {
                  id v29 = v54;
                }

                else
                {
                  id v30 = [v54 mutableCopy];

                  id v29 = v30;
                }

                id v54 = v29;
                objc_msgSend(v29, "setObject:forKey:", v7, v50, v46);
              }

              uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v26);
              if ((objc_opt_isKindOfClass(v7, v31) & 1) != 0)
              {
                id v33 = v7;
              }

              else
              {
                uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v32);
                if ((objc_opt_isKindOfClass(v54, v34) & 1) == 0)
                {
                  id v35 = [v54 mutableCopy];

                  id v54 = v35;
                }

                id v33 = (NSMutableArray *)-[NSMutableArray mutableCopy](v7, "mutableCopy", v46);

                [v54 setObject:v33 forKey:v50];
              }

              -[NSMutableArray addObject:](v33, "addObject:", v12, v46);
              ++v51;
              id v7 = v33;
            }

            os_unfair_lock_unlock(lock);
          }
        }

        id v8 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      }

      while (v8);

      if (v51)
      {
        *a5 = 1;
        uint64_t v36 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v62[0]) = v51;
          WORD2(v62[0]) = 2112;
          *(void *)((char *)v62 + 6) = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%u new participant-id to push token mappings added, %@",  buf,  0x12u);
        }

        uint64_t v39 = os_log_shim_legacy_logging_enabled(v38);
        if ((_DWORD)v39)
        {
          if (_IDSShouldLogTransport(v39))
          {
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"%u new participant-id to push token mappings added, %@");
            if (_IDSShouldLog(0LL, @"QRAllocator")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"%u new participant-id to push token mappings added, %@");
            }
          }
        }
      }
    }

    else
    {
    }
  }

  else
  {
    uint64_t v40 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62[0] = v49;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No participant information in %@", buf, 0xCu);
    }

    uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
    if ((_DWORD)v43)
    {
      if (_IDSShouldLogTransport(v43))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"No participant information in %@");
      }
    }
  }

  id v44 = v54;

  return v44;
}

- (void)_notifyParticipantID2PushTokenMappingChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_notifyParticipantID2PushTokenMappingChange: called",  buf,  2u);
  }

  uint64_t v6 = kIDSQRAllocateKey_IDSSessionID;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_IDSSessionID]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v6]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v10));
    id v12 = sub_1002872C0(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v6]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData, v14);
    if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v6]);
      id v17 = sub_1002872C0(v16);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
    }

    else
    {
      id v18 = sub_1002872C0(0LL);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v18);
    }
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v13));
  uint64_t v20 = v19;
  if (v19)
  {
    [v19 onParticipantID2PushTokenMappingChange:v4];
  }

  else
  {
    uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Session not found for %@");
      }
    }
  }
}

- (void)_notifyURIToParticipantIDMappingChange:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = IDSLoggableDescriptionForObjectOnService(v4, 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_notifyURIToParticipantIDMappingChange: %@",  buf,  0xCu);
  }

  uint64_t v8 = kIDSQRAllocateKey_IDSSessionID;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_IDSSessionID]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v8]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v12));
    id v14 = sub_1002872C0(v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v8]);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSData, v16);
    if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v8]);
      id v19 = sub_1002872C0(v18);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
    }

    else
    {
      id v20 = sub_1002872C0(0LL);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v15));
  if (v21)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _createSessionInfoFromResponsePayload:]( self,  "_createSessionInfoFromResponsePayload:",  v4));
    [v21 onURI2ParticipantIDMappingChange:v22 allocateResponse:v4];
  }

  else
  {
    uint64_t v23 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
    }

    uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
    if ((_DWORD)v26)
    {
      if (_IDSShouldLogTransport(v26))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Session not found for %@");
      }
    }
  }
}

- (BOOL)_addResponseToCache:(id)a3 sessionInfo:(id)a4 modifiedMessage:(id *)a5
{
  id v8 = a3;
  id v134 = a4;
  id v9 = v8;
  *a5 = v9;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  id v12 = sub_10028D3BC(v11, v9, kIDSQRAllocateKey_GroupID);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    uint64_t v14 = kIDSQRAllocateKey_RelaySessionID;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v16);
    if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
      BOOL v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v18));
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSData, v24);
      if ((objc_opt_isKindOfClass(v18, v25) & 1) != 0) {
        BOOL v135 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
      }
      else {
        BOOL v135 = 0LL;
      }
    }

    if (!v135)
    {
      uint64_t v64 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v140 = v9;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "No QR sessionID in %@", buf, 0xCu);
      }

      uint64_t v67 = os_log_shim_legacy_logging_enabled(v66);
      if ((_DWORD)v67)
      {
        if (_IDSShouldLogTransport(v67))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"No QR sessionID in %@");
        }
      }

      BOOL v23 = 0;
      goto LABEL_148;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v13));
    char v138 = 0;
    double v133 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v13));
    if (!v26)
    {
      -[IDSQuickRelayAllocator _setResponseForQRGroupID:groupID:](self, "_setResponseForQRGroupID:groupID:", v9, v13);
      goto LABEL_65;
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v14]);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString, v28);
    if ((objc_opt_isKindOfClass(v27, v29) & 1) != 0)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v14]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v30));
      unsigned int v32 = [v135 isEqualToData:v31];

      if (v32) {
        goto LABEL_18;
      }
      goto LABEL_57;
    }

    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v14]);
    uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSData, v69);
    if ((objc_opt_isKindOfClass(v68, v70) & 1) != 0)
    {
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:v14]);
      unsigned __int8 v72 = [v135 isEqualToData:v71];

      if ((v72 & 1) == 0) {
        goto LABEL_57;
      }
    }

    else
    {
      unsigned __int8 v73 = [v135 isEqualToData:0];

      if ((v73 & 1) == 0)
      {
LABEL_57:
        if (!-[IDSQuickRelayAllocator _shouldUseCurrentResponse:cachedMessage:]( self,  "_shouldUseCurrentResponse:cachedMessage:",  v9,  v26))
        {
          uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _mergeParticipantID2PushTokenMapping:sourceResponse:mappingChange:]( self,  "_mergeParticipantID2PushTokenMapping:sourceResponse:mappingChange:",  v26,  v9,  &v138));
          if (v79 != v26) {
            -[IDSQuickRelayAllocator _setResponseForQRGroupID:groupID:]( self,  "_setResponseForQRGroupID:groupID:",  v79,  v13);
          }
          if (v138)
          {
            -[IDSQuickRelayAllocator _notifyParticipantID2PushTokenMappingChange:]( self,  "_notifyParticipantID2PushTokenMappingChange:",  v79);
            -[IDSQuickRelayAllocator _notifyURIToParticipantIDMappingChange:]( self,  "_notifyURIToParticipantIDMappingChange:",  v79);
          }

          BOOL v23 = 0;
          goto LABEL_71;
        }

        uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _mergeParticipantID2PushTokenMapping:sourceResponse:mappingChange:]( self,  "_mergeParticipantID2PushTokenMapping:sourceResponse:mappingChange:",  v9,  v26,  &v138));

        id v9 = v74;
        *a5 = v9;
        uint64_t v75 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v140 = v26;
          __int16 v141 = 2112;
          id v142 = v9;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Should switch from %@ to %@", buf, 0x16u);
        }

        uint64_t v78 = os_log_shim_legacy_logging_enabled(v77);
        if ((_DWORD)v78)
        {
          if (_IDSShouldLogTransport(v78))
          {
            uint64_t v127 = v26;
            id v129 = v9;
            _IDSLogTransport(@"QRAllocator", @"IDS", @"Should switch from %@ to %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              uint64_t v127 = v26;
              id v129 = v9;
              _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"Should switch from %@ to %@");
            }
          }
        }

        -[IDSQuickRelayAllocator _setResponseForQRGroupID:groupID:]( self,  "_setResponseForQRGroupID:groupID:",  v9,  v13,  v127,  v129);
LABEL_65:
        BOOL v23 = 1;
LABEL_71:
        uint64_t v80 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v140 = v9;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "message added to cache: %@", buf, 0xCu);
        }

        uint64_t v83 = os_log_shim_legacy_logging_enabled(v82);
        if ((_DWORD)v83)
        {
          if (_IDSShouldLogTransport(v83))
          {
            _IDSLogTransport(@"QRAllocator", @"IDS", @"message added to cache: %@");
          }
        }

        goto LABEL_147;
      }
    }

- (id)_getURIForRecipientFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kIDSQRAllocateKey_RecipientID;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kIDSQRAllocateKey_RecipientID]);
  id v6 = [v5 unsignedLongLongValue];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kIDSQRAllocateKey_Allocations]);
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v4, (void)v17));
        id v14 = [v13 unsignedLongLongValue];

        if (v6 == v14)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kIDSQRAllocateKey_RecipientURI]);
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = 0LL;
LABEL_11:

  return v15;
}

- (BOOL)_addConnectStatus:(id)a3 relaySessionID:(id)a4 previousTime:(unint64_t)a5 qrReason:(unsigned __int16)a6 previousError:(unsigned __int16)a7 previousRelayIP:(unsigned int)a8 previousAccessToken:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = a7;
  uint64_t v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v51 = a9;
  uint64_t v17 = OSLogHandleForTransportCategory("QRAllocator");
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    id v53 = v15;
    __int16 v54 = 2112;
    id v55 = v16;
    __int16 v56 = 1024;
    int v57 = v11;
    __int16 v58 = 1024;
    int v59 = v10;
    __int16 v60 = 1024;
    int v61 = v9;
    __int16 v62 = 2112;
    id v63 = v51;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "addConnectStatus, groupID: %@, relaySessionID: %@i, data: %u %u %u %@",  buf,  0x32u);
  }

  uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
  if ((_DWORD)v20)
  {
    if (_IDSShouldLogTransport(v20))
    {
      uint64_t v49 = v9;
      id v50 = v51;
      uint64_t v47 = v11;
      uint64_t v48 = v10;
      id v45 = v15;
      id v46 = v16;
      _IDSLogTransport( @"QRAllocator",  @"IDS",  @"addConnectStatus, groupID: %@, relaySessionID: %@i, data: %u %u %u %@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        uint64_t v49 = v9;
        id v50 = v51;
        uint64_t v47 = v11;
        uint64_t v48 = v10;
        id v45 = v15;
        id v46 = v16;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"addConnectStatus, groupID: %@, relaySessionID: %@i, data: %u %u %u %@");
      }
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getResponseFromQRGroupID:]( self,  "_getResponseFromQRGroupID:",  v15,  v45,  v46,  v47,  v48,  v49,  v50));
  uint64_t v22 = v21;
  if (!v21)
  {
    uint64_t v31 = OSLogHandleForTransportCategory("QRAllocator");
    unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v15;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No response for groupID: %@", buf, 0xCu);
    }

    uint64_t v34 = os_log_shim_legacy_logging_enabled(v33);
    if ((_DWORD)v34)
    {
      if (_IDSShouldLogTransport(v34))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"No response for groupID: %@");
      }
    }

    uint64_t v22 = 0LL;
    goto LABEL_24;
  }

  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
  unsigned __int8 v24 = [v16 isEqualToData:v23];

  if ((v24 & 1) == 0)
  {
    uint64_t v35 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v53 = v16;
      __int16 v54 = 2112;
      id v55 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Response is not for sessionID %@, response %@",  buf,  0x16u);
    }

    uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
    if ((_DWORD)v38)
    {
      if (_IDSShouldLogTransport(v38))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Response is not for sessionID %@, response %@");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Response is not for sessionID %@, response %@");
        }
      }
    }

- (BOOL)invalidateLatestResponse:(id)a3 qrReason:(unsigned __int16)a4 previousError:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned __int8 v10 = [v9 isInternalInstall];

  if ((v10 & 1) != 0)
  {
    uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getResponseFromQRGroupID:]( self,  "_getResponseFromQRGroupID:",  v8));
    id v12 = v11;
    if (v11)
    {
      *(_DWORD *)buf = -1431655766;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v11, "objectForKey:", kIDSQRAllocateKey_RelaySessionID));
      if (kIDSQRAllocateKey_RelaySessionToken) {
        Value = (void *)CFDictionaryGetValue(v12, kIDSQRAllocateKey_RelaySessionToken);
      }
      else {
        Value = 0LL;
      }
      id v24 = Value;
      if (kIDSQRAllocateKey_RelayAddress) {
        uint64_t v25 = (void *)CFDictionaryGetValue(v12, kIDSQRAllocateKey_RelayAddress);
      }
      else {
        uint64_t v25 = 0LL;
      }
      double v26 = ids_monotonic_time([v25 getBytes:buf length:4]);
      BOOL v19 = -[IDSQuickRelayAllocator _addConnectStatus:relaySessionID:previousTime:qrReason:previousError:previousRelayIP:previousAccessToken:]( self,  "_addConnectStatus:relaySessionID:previousTime:qrReason:previousError:previousRelayIP:previousAccessToken:",  v8,  v13,  (unint64_t)v26,  v6,  v5,  *(unsigned int *)buf,  v24);
    }

    else
    {
      uint64_t v20 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "no response for groupID %@", buf, 0xCu);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"no response for groupID %@");
        }
      }

      BOOL v19 = 0;
    }
  }

  else
  {
    uint64_t v15 = OSLogHandleForTransportCategory("QRAllocator");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "response invalidation is supported on internal install only",  buf,  2u);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"response invalidation is supported on internal install only");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"response invalidation is supported on internal install only");
        }
      }
    }

    BOOL v19 = 0;
  }

  return v19;
}

- (void)_dispatchIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 connectReadyHandler:(id)a5 requestOptions:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v14 = im_primary_queue(v12, v13);
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100290548;
  block[3] = &unk_1008F8788;
  void block[4] = self;
  id v20 = v10;
  BOOL v23 = a4;
  id v21 = v12;
  id v22 = v11;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v15, block);
}

- (id)_getSelfAllocationFromCache:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v4));
  uint64_t v6 = v5;
  if (v5)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)i) getAllocation]);
          if (v11)
          {
            uint64_t v13 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "self allocation in cache: %@",  buf,  0xCu);
            }

            uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
            if ((_DWORD)v16)
            {
              if (_IDSShouldLogTransport(v16))
              {
                id v20 = v11;
                _IDSLogTransport(@"QRAllocator", @"IDS", @"self allocation in cache: %@");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  id v20 = v11;
                  _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"self allocation in cache: %@");
                }
              }
            }

            -[IDSQuickRelayAllocator _dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:]( self,  "_dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:",  v11,  1LL,  0LL,  0LL,  v20);
            os_unfair_lock_unlock(&self->_lock);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:kIDSQRAllocateKey_RequestID]);
            id v18 = sub_1002872C0(v17);
            id v12 = (void *)objc_claimAutoreleasedReturnValue(v18);

            goto LABEL_21;
          }
        }

        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "_getSelfAllocationFromCache: allocation is nil {sessinID: %@}",  buf,  0xCu);
  }

  id v12 = 0LL;
LABEL_21:

  return v12;
}

- (void)_sendIDQueryRequest:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _queryPolicy](self, "_queryPolicy"));
  id v18 = [v17 shouldQueryOnEveryQRAllocationForServiceIdentifier:v15];

  BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = @"NO";
    *(_DWORD *)buf = 138413314;
    id v25 = v15;
    if ((_DWORD)v18) {
      id v20 = @"YES";
    }
    __int16 v26 = 2112;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "_sendIDQueryRequest:fromIdentity:fromURI:fromService:completionBlock: called { fromService: %@, shouldForceQuery: %@, fromURI: %@, fromIdentity: %p, recipientIDs: %@ }",  buf,  0x34u);
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _peerIDManager](self, "_peerIDManager"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v14,  v15));
  LOBYTE(v23) = 0;
  [v21 startQueryForURIs:v12 fromIdentity:v13 fromURI:v22 fromService:v15 forSending:1 forRefresh:v18 isForced:v23 reason:@"QRAlloc" completionBlock:v16];
}

- (id)_setupNewAllocation:(id)a3 sessionID:(id)a4 isSessionIDRemoteDeviceID:(BOOL)a5 fromIdentity:(id)a6 fromURI:(id)a7 fromService:(id)a8 options:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11 forAdditionalAllocation:(BOOL)a12
{
  BOOL v135 = a5;
  id v138 = a3;
  id v16 = a4;
  id v139 = a6;
  __int16 v141 = (__CFString *)a7;
  id v137 = a8;
  id v17 = a9;
  id v136 = a10;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kIDSQRAllocateKey_IsLightweightParticipant]);
  unsigned int v19 = [v18 BOOLValue];

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v21 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v156 = v16;
    __int16 v157 = 2112;
    if (v19) {
      __int128 v21 = @"YES";
    }
    time_t v158 = (time_t)v21;
    __int16 v159 = 2112;
    id v160 = v141;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "_setupNewAllocation: called {sessionID: %@}, isLightweightParticipant = %@, fromURI: %@",  buf,  0x20u);
  }

  im_assert_primary_base_queue(v22, v23);
  if (!v139 || !v141)
  {
    uint64_t v24 = OSLogHandleForTransportCategory("QRAllocator");
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v156 = v137;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Unable to setup QR allocation for unregistered account for %@ service",  buf,  0xCu);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        id v126 = v137;
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Unable to setup QR allocation for unregistered account for %@ service");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          id v126 = v137;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Unable to setup QR allocation for unregistered account for %@ service");
        }
      }
    }
  }

  if (!v16)
  {
    uint64_t v28 = OSLogHandleForTransportCategory("QRAllocator");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "missing sessionID to setup a QR allocation",  buf,  2u);
    }

    uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
    if ((_DWORD)v31)
    {
      if (_IDSShouldLogTransport(v31))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"missing sessionID to setup a QR allocation");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"missing sessionID to setup a QR allocation");
        }
      }
    }
  }

  if (-[IDSQuickRelayAllocator _startQRConnectionWithDefaults:](self, "_startQRConnectionWithDefaults:", v16, v126))
  {
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v16));
    id v33 = v32;
    if (v32 && a12) {
      [v32 setHasPendingAllocation:0 forIDSSession:v16];
    }

    goto LABEL_25;
  }

  uint64_t v35 = kIDSQRAllocateKey_AllocateType;
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:"));
  if ([v36 intValue] == 3)
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:kIDSQRAllocateKey_TestOptions]);
    unsigned __int8 v38 = [v37 isEqualToString:IDSGroupSessionForceQRSession];

    if ((v38 & 1) != 0)
    {
      id v134 = 0LL;
      goto LABEL_90;
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:kIDSQRAllocateKey_GroupID]);
    if (!v36)
    {
      uint64_t v40 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v156 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "No groupID for shared session %@",  buf,  0xCu);
      }

      uint64_t v43 = os_log_shim_legacy_logging_enabled(v42);
      if ((_DWORD)v43)
      {
        if (_IDSShouldLogTransport(v43))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"No groupID for shared session %@");
        }
      }

      goto LABEL_25;
    }

    BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pushTokenToURIForGroup,  "setObject:forKeyedSubscript:",  v39,  v36);

    CFDictionaryRef theDict = (CFDictionaryRef)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getResponseFromQRGroupID:]( self,  "_getResponseFromQRGroupID:",  v36));
    if (theDict)
    {
LABEL_56:
      id v55 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:kIDSQRAllocateKey_AllocateRequestForUnauthorizedUser]);
      unsigned int v56 = [v55 BOOLValue];

      if (theDict)
      {
        int v57 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getURIForRecipientFromResponse:]( self,  "_getURIForRecipientFromResponse:"));
        __int16 v58 = v57;
        if (v141) {
          unsigned int v59 = [v57 isEqualToString:v141];
        }
        else {
          unsigned int v59 = 1;
        }

        if (((v59 ^ 1 | v56) & 1) == 0)
        {
          id v134 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( theDict,  "objectForKey:",  kIDSQRAllocateKey_QRConnectStatus));
          uint64_t v99 = OSLogHandleForTransportCategory("QRAllocator");
          unsigned int v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v156 = v16;
            __int16 v157 = 2112;
            time_t v158 = (time_t)theDict;
            __int16 v159 = 2112;
            id v160 = v134;
            _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "found cached allocation response for %@: %@, previous connect status %@",  buf,  0x20u);
          }

          uint64_t v102 = os_log_shim_legacy_logging_enabled(v101);
          if ((_DWORD)v102)
          {
            if (_IDSShouldLogTransport(v102))
            {
              uint64_t v128 = theDict;
              id v129 = v134;
              uint64_t v127 = v16;
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"found cached allocation response for %@: %@, previous connect status %@");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v128 = theDict;
                id v129 = v134;
                uint64_t v127 = v16;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"found cached allocation response for %@: %@, previous connect status %@");
              }
            }
          }

          -[IDSQuickRelayAllocator _storeMappingFromPushTokenToURIs:fromID:service:cert:forGroup:]( self,  "_storeMappingFromPushTokenToURIs:fromID:service:cert:forGroup:",  v138,  v141,  v137,  v139,  v36,  v127,  v128,  v129);
          if (v134)
          {
            uint64_t v103 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v156 = v16;
              __int16 v157 = 2112;
              time_t v158 = (time_t)v134;
              _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_DEFAULT,  "cached allocation response has issue: %@ %@",  buf,  0x16u);
            }

            uint64_t v106 = os_log_shim_legacy_logging_enabled(v105);
            if ((_DWORD)v106)
            {
              if (_IDSShouldLogTransport(v106))
              {
                uint64_t v127 = v16;
                uint64_t v128 = v134;
                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"cached allocation response has issue: %@ %@");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  uint64_t v127 = v16;
                  uint64_t v128 = v134;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"cached allocation response has issue: %@ %@");
                }
              }
            }
          }

          else
          {
            uint64_t v107 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( theDict,  "objectForKey:",  kIDSQRAllocateKey_RelayExpiryTimestamp));
            id v108 = v107;
            if (!v107) {
              goto LABEL_154;
            }
            id v109 = [v107 unsignedLongLongValue];
            time_t v110 = 1000 * time(0LL);
            uint64_t v111 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              id v156 = v109;
              __int16 v157 = 2048;
              time_t v158 = v110;
              _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEFAULT,  "Expired time: %llu, current time: %llu",  buf,  0x16u);
            }

            uint64_t v114 = os_log_shim_legacy_logging_enabled(v113);
            if ((_DWORD)v114)
            {
              if (_IDSShouldLogTransport(v114))
              {
                uint64_t v127 = v109;
                uint64_t v128 = (void *)v110;
                _IDSLogTransport(@"QRAllocator", @"IDS", @"Expired time: %llu, current time: %llu");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  uint64_t v127 = v109;
                  uint64_t v128 = (void *)v110;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Expired time: %llu, current time: %llu");
                }
              }
            }

            uint64_t v115 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "Response has expired or about to expire",  buf,  2u);
            }

            uint64_t v118 = os_log_shim_legacy_logging_enabled(v117);
            if ((_DWORD)v118)
            {
              if (_IDSShouldLogTransport(v118))
              {
                _IDSLogTransport(@"QRAllocator", @"IDS", @"Response has expired or about to expire");
                if (_IDSShouldLog(0LL, @"QRAllocator")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Response has expired or about to expire");
                }
              }
            }

            uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_duplicateAllocateResponses,  "objectForKey:",  v36,  v127,  v128));
            id v130 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getURIForRecipientFromResponse:]( self,  "_getURIForRecipientFromResponse:",  v131));
            if (v131 && (!v141 || [v130 isEqualToString:v141]))
            {
              CFDictionaryRef v119 = theDict;
              CFDictionaryRef theDict = v131;
              id v134 = 0LL;
            }

            else
            {
              uint64_t v120 = kIDSQRAllocateKey_RelaySessionID
              CFDictionaryRef v119 = v120;
              uint64_t v121 = kIDSQRAllocateKey_RelayAddress
              id v122 = v121;
              *(_DWORD *)buf = -1431655766;
              double v123 = ids_monotonic_time([v122 getBytes:buf length:4]);
              uint64_t v124 = (void **)sub_100290030((unint64_t)v123, 1, 0xFFFF, *(int *)buf, v119);
              uint64_t v125 = sub_1002900D8((uint64_t)v124);
              id v134 = (__CFString *)objc_claimAutoreleasedReturnValue(v125);
              sub_10028B400(v124);
            }

            -[NSMutableDictionary removeObjectForKey:](self->_allocateResponses, "removeObjectForKey:", v36);
            if (!v134)
            {
LABEL_154:
              -[IDSQuickRelayAllocator _dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:]( self,  "_dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:",  v127);

LABEL_25:
              uint64_t v34 = 0LL;
              goto LABEL_113;
            }
          }

          goto LABEL_80;
        }
      }

      else
      {
        unsigned int v59 = 0;
      }

      uint64_t v60 = OSLogHandleForTransportCategory("QRAllocator");
      int v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v62 = @"NO";
        if (v56) {
          id v63 = @"YES";
        }
        else {
          id v63 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        id v156 = v16;
        time_t v158 = (time_t)v63;
        __int16 v157 = 2112;
        if (v59) {
          __int16 v62 = @"YES";
        }
        __int16 v159 = 2112;
        id v160 = v62;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "found no cached allocation response for %@, isAllocateRequestForUnauthorizedUser: %@, shouldUseCachedResponse: %@",  buf,  0x20u);
      }

      uint64_t v65 = os_log_shim_legacy_logging_enabled(v64);
      if ((_DWORD)v65 && _IDSShouldLogTransport(v65))
      {
        uint64_t v67 = v56 ? @"YES" : @"NO";
        uint64_t v68 = v59 ? @"YES" : @"NO";
        uint64_t v128 = v67;
        id v129 = v68;
        uint64_t v127 = v16;
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"found no cached allocation response for %@, isAllocateRequestForUnauthorizedUser: %@, shouldUseCachedResponse: %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          uint64_t v128 = v67;
          id v129 = v68;
          uint64_t v127 = v16;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"found no cached allocation response for %@, isAllocateRequestForUnauthorizedUser: %@, shouldUseCachedResponse: %@");
        }
      }

      id v134 = 0LL;
LABEL_80:
      uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v66);
      if ((objc_opt_isKindOfClass(v17, v69) & 1) == 0)
      {
        uint64_t v70 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "trying to change a read-only dictionary",  buf,  2u);
        }

        uint64_t v73 = os_log_shim_legacy_logging_enabled(v72);
        if ((_DWORD)v73)
        {
          if (_IDSShouldLogTransport(v73))
          {
            _IDSLogTransport(@"QRAllocator", @"IDS", @"trying to change a read-only dictionary");
            if (_IDSShouldLog(0LL, @"QRAllocator")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"trying to change a read-only dictionary");
            }
          }
        }

        id v74 = objc_msgSend(v17, "mutableCopy", v127, v128, v129);

        id v17 = v74;
      }

      uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend(v138, "count", v127)));
      [v17 setObject:v75 forKey:kIDSQRAllocateKey_GroupMemberCount];

      goto LABEL_89;
    }

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionIDToURIToResponsePayload, "objectForKey:", v16));
    id v45 = v44;
    if (!v44)
    {
      CFDictionaryRef theDict = 0LL;
LABEL_55:

      goto LABEL_56;
    }

    id v46 = (void *)objc_claimAutoreleasedReturnValue([v44 allKeys]);
    uint64_t v47 = v46;
    if (v141)
    {
      CFDictionaryRef theDict = (CFDictionaryRef)objc_claimAutoreleasedReturnValue([v45 objectForKey:v141]);
    }

    else
    {
      if (![v46 count]) {
        goto LABEL_53;
      }
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectAtIndexedSubscript:0]);
      CFDictionaryRef theDict = (CFDictionaryRef)objc_claimAutoreleasedReturnValue([v45 objectForKey:v48]);
    }

    if (theDict)
    {
      uint64_t v49 = OSLogHandleForTransportCategory("QRAllocator");
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        id v51 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( theDict,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_RecipientID));
        *(_DWORD *)buf = 138412290;
        id v156 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Setting allocate response for participantID: %@!",  buf,  0xCu);
      }

      uint64_t v53 = os_log_shim_legacy_logging_enabled(v52);
      if ((_DWORD)v53)
      {
        if (_IDSShouldLogTransport(v53))
        {
          uint64_t v54 = kIDSQRAllocateKey_RecipientID;
          uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( theDict,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_RecipientID));
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Setting allocate response for participantID: %@!");

          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](theDict, "objectForKeyedSubscript:", v54, v127));
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Setting allocate response for participantID: %@!");
          }
        }
      }

      -[NSMutableDictionary removeAllObjects](self->_sessionIDToURIToResponsePayload, "removeAllObjects", v127);
      goto LABEL_54;
    }

- (id)_tokenURIForToken:(id)a3 uri:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imHexString"));
    uint64_t v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"token:%@/%@", v8, v6);
  }

  else
  {
    _IMWarn(@"Invalid token %@ or idsID %@");
    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)setupNewAllocation:(id)a3 sessionID:(id)a4 fromIdentity:(id)a5 fromURI:(id)a6 fromService:(id)a7 options:(id)a8 connectReadyHandler:(id)a9
{
  BYTE4(v10) = 0;
  LODWORD(v10) = 0;
  return -[IDSQuickRelayAllocator _setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:]( self,  "_setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReady Handler:withPreferredLocalInterface:forAdditionalAllocation:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8,  a9,  v10);
}

- (BOOL)_startQRConnectionWithDefaults:(id)a3
{
  id v4 = a3;
  id v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _parseQuickRelayDefaults:gropuID:]( self,  "_parseQuickRelayDefaults:gropuID:",  v4,  0LL));
  if (v5)
  {
    uint64_t v6 = OSLogHandleForTransportCategory("QRAllocator");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "use QR session info from user defaults: %@.",  buf,  0xCu);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9)
    {
      if (_IDSShouldLogTransport(v9))
      {
        id v16 = v5;
        _IDSLogTransport(@"QRAllocator", @"IDS", @"use QR session info from user defaults: %@.");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          id v16 = v5;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"use QR session info from user defaults: %@.");
        }
      }
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID", v16));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

    if (v11)
    {
      CFDictionarySetValue(v5, kIDSQRAllocateKey_RequestID, v11);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A5D0C();
    }

    id v12 = v4;
    if (v12)
    {
      CFDictionarySetValue(v5, kIDSQRAllocateKey_IDSSessionID, v12);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A5C8C();
    }

    CFDictionarySetValue(v5, kIDSQRAllocateKey_isInitiator, &__kCFBooleanTrue);
    idsSessionIDToqrSessionID = self->_idsSessionIDToqrSessionID;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v5, "objectForKey:", kIDSQRAllocateKey_RelaySessionID));
    -[NSMutableDictionary setObject:forKey:](idsSessionIDToqrSessionID, "setObject:forKey:", v14, v12);

    -[IDSQuickRelayAllocator _startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:]( self,  "_startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:",  v5,  0LL,  0LL);
  }

  return v5 != 0LL;
}

- (id)_getPushTokenFromParticipantID:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    uint64_t v12 = kIDSQRAllocateKey_RecipientID;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);
        id v16 = v15;
        if (v15)
        {
          id v17 = [v15 unsignedLongLongValue];
          if (v17 == [v7 unsignedLongLongValue])
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kIDSQRAllocateKey_RecipientPushToken]);
            os_unfair_lock_unlock(p_lock);

            goto LABEL_18;
          }
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v18 = OSLogHandleForTransportCategory("QRAllocator");
  unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v7 unsignedLongLongValue];
    *(_DWORD *)buf = 134217984;
    id v31 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "no push token for participantID %llu",  buf,  0xCu);
  }

  uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
  if ((_DWORD)v22)
  {
    if (_IDSShouldLogTransport(v22))
    {
      id v25 = [v7 unsignedLongLongValue];
      _IDSLogTransport(@"QRAllocator", @"IDS", @"no push token for participantID %llu");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        objc_msgSend(v7, "unsignedLongLongValue", v25);
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"no push token for participantID %llu");
      }
    }
  }

  uint64_t v23 = 0LL;
LABEL_18:

  return v23;
}

- (id)getPushTokensFromParticipantIDs:(id)a3 participantIDs:(id)a4
{
  id v35 = a3;
  id v36 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v35));
  uint64_t v37 = v6;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kIDSQRAllocateKey_Allocations]);
    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v36 count]));
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v9 = v36;
      id v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v39;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v39 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
            id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getPushTokenFromParticipantID:participantID:]( self,  "_getPushTokenFromParticipantID:participantID:",  v7,  v13));
            if (v14)
            {
              [v8 addObject:v14];
            }

            else
            {
              uint64_t v15 = OSLogHandleForTransportCategory("QRAllocator");
              id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v43 = v13;
                __int16 v44 = 2112;
                id v45 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "no push token for participantID %@ in response %@",  buf,  0x16u);
              }

              uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
              if ((_DWORD)v18)
              {
                if (_IDSShouldLogTransport(v18))
                {
                  id v33 = v13;
                  uint64_t v34 = v37;
                  _IDSLogTransport( @"QRAllocator",  @"IDS",  @"no push token for participantID %@ in response %@");
                  if (_IDSShouldLog(0LL, @"QRAllocator"))
                  {
                    id v33 = v13;
                    uint64_t v34 = v37;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"no push token for participantID %@ in response %@");
                  }
                }
              }

              unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v33, v34));
              [v8 addObject:v19];
            }
          }

          id v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }

        while (v10);
      }

      uint64_t v20 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v43 = v9;
        __int16 v44 = 2112;
        id v45 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "participantID to push token mapping: %@ %@",  buf,  0x16u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"participantID to push token mapping: %@ %@");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"participantID to push token mapping: %@ %@");
          }
        }
      }
    }

    else
    {
      uint64_t v28 = OSLogHandleForTransportCategory("QRAllocator");
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v37;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        if (_IDSShouldLogTransport(v31))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"no participant list in %@");
        }
      }

      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v24 = OSLogHandleForTransportCategory("QRAllocator");
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v35;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"no response for %@");
      }
    }

    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)getPushTokenFromParticipantID:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v6));
  id v9 = v8;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kIDSQRAllocateKey_Allocations]);
    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getPushTokenFromParticipantID:participantID:]( self,  "_getPushTokenFromParticipantID:participantID:",  v10,  v7));
      if (v11)
      {
        uint64_t v12 = OSLogHandleForTransportCategory("QRAllocator");
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          id v33 = [v7 unsignedLongLongValue];
          __int16 v34 = 2112;
          id v35 = v11;
          __int16 v36 = 2112;
          id v37 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "participantID: %llu, pushToken: %@, group: %@",  buf,  0x20u);
        }

        uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
        if ((_DWORD)v15)
        {
          if (_IDSShouldLogTransport(v15))
          {
            id v30 = [v7 unsignedLongLongValue];
            _IDSLogTransport(@"QRAllocator", @"IDS", @"participantID: %llu, pushToken: %@, group: %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              objc_msgSend(v7, "unsignedLongLongValue", v30, v11, v6);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"participantID: %llu, pushToken: %@, group: %@");
            }
          }
        }

        id v16 = v11;
      }

      else
      {
        uint64_t v25 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          id v33 = [v7 unsignedLongLongValue];
          __int16 v34 = 2112;
          id v35 = v9;
          __int16 v36 = 2112;
          id v37 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "no push token for participantID %llu in response %@ for group: %@",  buf,  0x20u);
        }

        uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
        if ((_DWORD)v28)
        {
          if (_IDSShouldLogTransport(v28))
          {
            id v31 = [v7 unsignedLongLongValue];
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"no push token for participantID %llu in response %@ for group: %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              objc_msgSend(v7, "unsignedLongLongValue", v31, v9, v6);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"no push token for participantID %llu in response %@ for group: %@");
            }
          }
        }
      }
    }

    else
    {
      uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
      }

      uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
      if ((_DWORD)v24)
      {
        if (_IDSShouldLogTransport(v24))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"no participant list in %@");
        }
      }

      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v17 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
    }

    uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
    if ((_DWORD)v20)
    {
      if (_IDSShouldLogTransport(v20))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"no response for %@");
      }
    }

    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)getURIFromParticipantID:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v47 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v6));
  id v9 = v8;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kIDSQRAllocateKey_Allocations]);
    id v46 = v10;
    if (v10)
    {
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v49;
        uint64_t v14 = kIDSQRAllocateKey_RecipientID;
        while (2)
        {
          for (i = 0LL; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v49 != v13) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v14]);
            uint64_t v18 = v17;
            if (v17)
            {
              id v19 = [v17 unsignedLongLongValue];
              if (v19 == [v7 unsignedLongLongValue])
              {
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:kIDSQRAllocateKey_RecipientURI]);
                uint64_t v33 = OSLogHandleForTransportCategory("QRAllocator");
                __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  id v35 = [v7 unsignedLongLongValue];
                  uint64_t v36 = IDSLoggableDescriptionForHandleOnService(v28, 0LL);
                  id v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                  *(_DWORD *)buf = 134218498;
                  id v53 = v35;
                  __int16 v54 = 2112;
                  id v55 = v47;
                  __int16 v56 = 2112;
                  int v57 = v37;
                  _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "URI for participant ID %llu in group %@: %@",  buf,  0x20u);
                }

                uint64_t v39 = os_log_shim_legacy_logging_enabled(v38);
                if ((_DWORD)v39)
                {
                  if (_IDSShouldLogTransport(v39))
                  {
                    id v40 = [v7 unsignedLongLongValue];
                    uint64_t v41 = IDSLoggableDescriptionForHandleOnService(v28, 0LL);
                    __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(v41);
                    _IDSLogTransport( @"QRAllocator",  @"IDS",  @"URI for participant ID %llu in group %@: %@");

                    if (_IDSShouldLog(0LL, @"QRAllocator"))
                    {
                      objc_msgSend(v7, "unsignedLongLongValue", v40, v47, v44);
                      uint64_t v42 = IDSLoggableDescriptionForHandleOnService(v28, 0LL);
                      id v45 = (void *)objc_claimAutoreleasedReturnValue(v42);
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"URI for participant ID %llu in group %@: %@");
                    }
                  }
                }

                goto LABEL_39;
              }
            }
          }

          id v12 = [v11 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      uint64_t v20 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v53 = v7;
        __int16 v54 = 2112;
        id v55 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No URI for participant %@ in group %@",  buf,  0x16u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"No URI for participant %@ in group %@");
        }
      }
    }

    else
    {
      uint64_t v29 = OSLogHandleForTransportCategory("QRAllocator");
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
      }

      uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
      if ((_DWORD)v32)
      {
        if (_IDSShouldLogTransport(v32))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"no participant list in %@");
        }
      }
    }

    uint64_t v28 = 0LL;
LABEL_39:
  }

  else
  {
    uint64_t v24 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
    }

    uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
    if ((_DWORD)v27)
    {
      if (_IDSShouldLogTransport(v27))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"no response for %@");
      }
    }

    uint64_t v28 = 0LL;
  }

  return v28;
}

- (BOOL)isURIAvailabeInAllocateResponse:(id)a3 uri:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v6));
  id v9 = v8;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kIDSQRAllocateKey_Allocations]);
    id v11 = v10;
    if (v10)
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v31;
        uint64_t v15 = kIDSQRAllocateKey_RecipientURI;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v30 + 1) + 8 * (void)i) objectForKey:v15]);
            unsigned __int8 v18 = [v7 isEqualToString:v17];

            if ((v18 & 1) != 0)
            {

              BOOL v23 = 1;
              goto LABEL_27;
            }
          }

          id v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      uint64_t v24 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
      }

      uint64_t v27 = os_log_shim_legacy_logging_enabled(v26);
      if ((_DWORD)v27)
      {
        if (_IDSShouldLogTransport(v27))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"no participant list in %@");
        }
      }
    }

    BOOL v23 = 0;
LABEL_27:
  }

  else
  {
    uint64_t v19 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"no response for %@");
      }
    }

    BOOL v23 = 0;
  }

  return v23;
}

- (id)getAdditionalAllocationForAddress:(id)a3 selfAddress:(unsigned int)a4 relaySessionID:(id)a5 allocateType:(int64_t)a6 qrReason:(unsigned __int16)a7 previousTime:(unint64_t)a8 previousError:(unsigned __int16)a9 previousRelayIP:(unsigned int)a10 previousAccessToken:(id)a11 requestSelfAllocation:(BOOL)a12 isSessionIDRemoteDeviceID:(BOOL)a13 withPreferredRemoteInterface:(int)a14 withPreferredLocalInterface:(int)a15
{
  uint64_t v15 = a7;
  uint64_t v120 = (NSMutableDictionary *)a3;
  unsigned int v125 = a4;
  id v20 = a5;
  id v115 = a11;
  im_assert_primary_base_queue(v115, v21);
  uint64_t v116 = v20;
  uint64_t v22 = OSLogHandleForTransportCategory("QRAllocator");
  BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)uint64_t v127 = v120;
    *(_WORD *)&v127[8] = 2112;
    *(void *)&v127[10] = v20;
    *(_WORD *)&v127[18] = 1024;
    *(_DWORD *)&v127[20] = a6;
    __int16 v128 = 1024;
    LODWORD(v129) = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "IDSSession ID %@ requested additional allocation for QR Session ID %@, allocateType %d, reason %d",  buf,  0x22u);
  }

  uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
  if ((_DWORD)v25)
  {
    if (_IDSShouldLogTransport(v25))
    {
      int64_t v105 = a6;
      uint64_t v108 = v15;
      unsigned int v100 = v120;
      id v103 = v20;
      _IDSLogTransport( @"QRAllocator",  @"IDS",  @"IDSSession ID %@ requested additional allocation for QR Session ID %@, allocateType %d, reason %d");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        int64_t v105 = a6;
        uint64_t v108 = v15;
        unsigned int v100 = v120;
        id v103 = v20;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"IDSSession ID %@ requested additional allocation for QR Session ID %@, allocateType %d, reason %d");
      }
    }
  }

  CFDictionaryRef v119 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _filterSelfAllocationsForSessionID:]( self,  "_filterSelfAllocationsForSessionID:",  v120,  v100,  v103,  v105,  v108));
  if (![v119 count])
  {
    uint64_t v26 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      sessionToAllocations = self->_sessionToAllocations;
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v127 = sessionToAllocations;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "could not find original allocate request to clone %@",  buf,  0xCu);
    }

    uint64_t v30 = os_log_shim_legacy_logging_enabled(v29);
    if ((_DWORD)v30)
    {
      if (_IDSShouldLogTransport(v30))
      {
        uint64_t v101 = self->_sessionToAllocations;
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"could not find original allocate request to clone %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          uint64_t v101 = self->_sessionToAllocations;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"could not find original allocate request to clone %@");
        }
      }
    }
  }

  os_unfair_lock_lock(&self->_lock);
  if ([v119 count])
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v119 objectAtIndex:0]);
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getGroupID:](self, "_getGroupID:", v31));

    os_unfair_lock_unlock(&self->_lock);
    if (v32)
    {
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _uuidFromNSStringToNSData:](self, "_uuidFromNSStringToNSData:", v116));
      -[IDSQuickRelayAllocator _addConnectStatus:relaySessionID:previousTime:qrReason:previousError:previousRelayIP:previousAccessToken:]( self,  "_addConnectStatus:relaySessionID:previousTime:qrReason:previousError:previousRelayIP:previousAccessToken:",  v32,  v33,  a8,  v15,  a9,  a10,  v115);

      goto LABEL_24;
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  uint64_t v34 = OSLogHandleForTransportCategory("QRAllocator");
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v127 = v120;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No groupID for %@", buf, 0xCu);
  }

  uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
  if ((_DWORD)v37)
  {
    if (_IDSShouldLogTransport(v37))
    {
      uint64_t v101 = v120;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"No groupID for %@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        uint64_t v101 = v120;
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"No groupID for %@");
      }
    }
  }

- (void)_handleIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 requestOptions:(id)a5
{
  BOOL v397 = a4;
  id v6 = (NSMutableDictionary *)a3;
  id v393 = a5;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  id v9 = (const void *)kIDSQRAllocateKey_RequestID;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", kIDSQRAllocateKey_RequestID));
    id v11 = sub_1002872C0(v10);
    id v12 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = kIDSQRAllocateKey_IDSSessionID;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", kIDSQRAllocateKey_IDSSessionID));
    id v15 = sub_1002872C0(v14);
    id v16 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v15);
    key = (void *)kIDSQRAllocateKey_RelaySessionID;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:"));
    id v18 = sub_1002872C0(v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v18);
    id v20 = v19;
    uint64_t v21 = @"NO";
    *(_DWORD *)buf = 138413058;
    v420 = v12;
    if (v397) {
      uint64_t v21 = @"YES";
    }
    __int16 v421 = 2112;
    v422 = v16;
    __int16 v423 = 2112;
    *(void *)v424 = v19;
    *(_WORD *)&v424[8] = 2112;
    v425 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received allocate response for RequestID: %@ IDSSessionID: %@ QRSessionID: %@ from cache: %@",  buf,  0x2Au);
  }

  else
  {
    uint64_t v13 = kIDSQRAllocateKey_IDSSessionID;
    key = (void *)kIDSQRAllocateKey_RelaySessionID;
  }

  v394 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _translateParticipantIDtoUINT64ForResponse:]( self,  "_translateParticipantIDtoUINT64ForResponse:",  v6));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v9));
  id v23 = sub_1002872C0(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", v13));
  id v26 = sub_1002872C0(v25);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", key));
  id v29 = sub_1002872C0(v28);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  uint64_t v31 = IDSLoggableDescriptionForObjectOnService(v394, 0LL);
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v412[0] = _NSConcreteStackBlock;
  v412[1] = 3221225472LL;
  v412[2] = sub_100298AC0;
  v412[3] = &unk_1008FC640;
  id v387 = v24;
  id v413 = v387;
  id v388 = v27;
  id v414 = v388;
  id v389 = v30;
  id v415 = v389;
  BOOL v417 = v397;
  id v390 = v32;
  id v416 = v390;
  cut_dispatch_log_queue(v412);
  __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v6,  "objectForKey:",  kIDSQRAllocateKey_RelayAddress));
    id v35 = (__CFString *)(id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v6,  "objectForKey:",  kIDSQRAllocateKey_RelayPort));
    id v36 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v6,  "objectForKey:",  kIDSQRAllocateKey_RelayAddressIPv6));
    *(_DWORD *)buf = 138412802;
    v420 = v34;
    __int16 v421 = 2112;
    v422 = v35;
    __int16 v423 = 2112;
    *(void *)v424 = v36;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "QRserver ipv4: %@:%@, ipv6: %@", buf, 0x20u);
  }

  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v6,  "objectForKey:",  kIDSQRAllocateKey_RelayHighPriorityPort));
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", kIDSQRAllocateKey_RelayIPPreference));
    uint64_t v40 = (__CFString *)(id)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _getQuickRelayIPPreference:]( self,  "_getQuickRelayIPPreference:",  [v39 unsignedIntegerValue]));
    *(_DWORD *)buf = 138412546;
    v420 = v38;
    __int16 v421 = 2112;
    v422 = v40;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "QRserver hpp: %@, ipp: %@", buf, 0x16u);
  }

  uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", kIDSQRAllocateKey_RelayServerType));
    unsigned int v43 = [v42 unsignedIntValue];
    __int16 v44 = @"Multi-Server Configuration";
    if (!v43) {
      __int16 v44 = @"Single-Server Configuration";
    }
    *(_DWORD *)buf = 138412290;
    v420 = (NSMutableDictionary *)v44;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "QRserver type: %@", buf, 0xCu);
  }

  id v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _createSessionInfoFromResponsePayload:]( self,  "_createSessionInfoFromResponsePayload:",  v6));
  CFMutableDictionaryRef theDict = v45;
  if (v45)
  {
    v399 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v45, "objectForKey:", v13));
    if (v9)
    {
      id v46 = (id)CFDictionaryGetValue(theDict, v9);
      Value = 0LL;
      requestIDToPreferredLocalInterface = self->_requestIDToPreferredLocalInterface;
      v391 = v46;
      if (requestIDToPreferredLocalInterface && v46) {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToPreferredLocalInterface, v46);
      }
    }

    else
    {
      v391 = 0LL;
      Value = 0LL;
    }

    id v385 = Value;
    unsigned int v384 = [v385 intValue];
    v398 = (QRAllocation *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationForSessionID:requestIDStr:]( self,  "_findAllocationForSessionID:requestIDStr:",  v399,  v391));
    v386 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v399));
    id v53 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation request](v398, "request"));
    if (v53) {
      char v54 = v397;
    }
    else {
      char v54 = 1;
    }

    if ((v54 & 1) == 0) {
      -[QRAllocation cancelAllocationTimeoutTimer](v398, "cancelAllocationTimeoutTimer");
    }
    uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSNumber, v55);
    int v57 = (void *)kIDSQRAllocateKey_AllocateType;
    id v58 = sub_10028D3BC(v56, v6, kIDSQRAllocateKey_AllocateType);
    BOOL v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    id v392 = [v59 integerValue];

    if (v392 != (id)3)
    {
LABEL_93:
      uint64_t v106 = objc_opt_class(&OBJC_CLASS___NSNumber, v60);
      id v107 = sub_10028D3BC(v106, v6, v57);
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue(v107);
      BOOL v109 = [v108 integerValue] == (id)2;

      if (!v109)
      {
        if (!self->_sessionToLocalParticipantID)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          sessionToLocalParticipantID = self->_sessionToLocalParticipantID;
          self->_sessionToLocalParticipantID = Mutable;
        }

        uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", kIDSQRAllocateKey_RecipientID, v370));
        uint64_t v113 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v112 unsignedLongLongValue]));
        uint64_t v114 = v113;
        if (v399)
        {
          id v115 = v113;
          if (v115) {
            CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionToLocalParticipantID, v399, v115);
          }
        }

        uint64_t v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v117 = self->_sessionToLocalParticipantID;
          *(_DWORD *)buf = 138412802;
          v420 = v114;
          __int16 v421 = 2112;
          v422 = (const __CFString *)v399;
          __int16 v423 = 2112;
          *(void *)v424 = v117;
          _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "add localParticipantID: %@ to sessionID: %@ _sessionToLocalParticipantID: %@",  buf,  0x20u);
        }
      }

      uint64_t v118 = theDict;
      if (v398)
      {
        if (v392 != (id)3)
        {
          unsigned int v119 = -[IDSQuickRelayAllocator _isDuplicateResponse:newResponse:](self, "_isDuplicateResponse:newResponse:");
          uint64_t v118 = theDict;
          if (v119)
          {
            uint64_t v120 = OSLogHandleForTransportCategory("QRAllocator");
            __int128 v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "detected duplicate response. Ignore it.",  buf,  2u);
            }

            uint64_t v123 = os_log_shim_legacy_logging_enabled(v122);
            if ((_DWORD)v123)
            {
              if (_IDSShouldLogTransport(v123))
              {
                _IDSLogTransport(@"QRAllocator", @"IDS", @"detected duplicate response. Ignore it.");
                if (_IDSShouldLog(0LL, @"QRAllocator")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"detected duplicate response. Ignore it.");
                }
              }
            }

            goto LABEL_461;
          }
        }
      }

      if (v397 || v392 != (id)3)
      {
        int v382 = 0;
      }

      else
      {
        id v410 = 0LL;
        unsigned __int8 v124 = -[IDSQuickRelayAllocator _addResponseToCache:sessionInfo:modifiedMessage:]( self,  "_addResponseToCache:sessionInfo:modifiedMessage:",  v6,  v118,  &v410);
        unsigned int v125 = (NSMutableDictionary *)v410;
        if (v125 == v6)
        {
          id v130 = v6;
        }

        else
        {
          uint64_t v126 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v420 = v125;
            _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "allocate response modified %@",  buf,  0xCu);
          }

          uint64_t v129 = os_log_shim_legacy_logging_enabled(v128);
          if ((_DWORD)v129)
          {
            if (_IDSShouldLogTransport(v129))
            {
              v370 = v125;
              _IDSLogTransport(@"QRAllocator", @"IDS", @"allocate response modified %@");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                v370 = v125;
                _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"allocate response modified %@");
              }
            }
          }

          id v130 = v125;

          uint64_t v131 = objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _createSessionInfoFromResponsePayload:]( self,  "_createSessionInfoFromResponsePayload:",  v130));
          CFMutableDictionaryRef theDict = (const __CFDictionary *)v131;
        }

        v226 = v398;
        if (!v398)
        {
          uint64_t v227 = OSLogHandleForTransportCategory("QRAllocator");
          v228 = (os_log_s *)objc_claimAutoreleasedReturnValue(v227);
          if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v228,  OS_LOG_TYPE_DEFAULT,  "no allocation for shared session",  buf,  2u);
          }

          uint64_t v230 = os_log_shim_legacy_logging_enabled(v229);
          if ((_DWORD)v230)
          {
            if (_IDSShouldLogTransport(v230))
            {
              _IDSLogTransport(@"QRAllocator", @"IDS", @"no allocation for shared session");
            }
          }

          CFDictionarySetValue(theDict, kIDSQRAllocateKey_isInitiator, &__kCFBooleanFalse);
          v231 = -[QRAllocation initWithResponse:](objc_alloc(&OBJC_CLASS___QRAllocation), "initWithResponse:", theDict);
          -[IDSQuickRelayAllocator _addAllocationForSession:allocation:]( self,  "_addAllocationForSession:allocation:",  v399,  v231);
          v226 = v231;
        }

        v398 = v226;
        if ((v124 & 1) == 0)
        {
          uint64_t v232 = OSLogHandleForTransportCategory("QRAllocator");
          v233 = (os_log_s *)objc_claimAutoreleasedReturnValue(v232);
          if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEFAULT, "current response ignored", buf, 2u);
          }

          uint64_t v235 = os_log_shim_legacy_logging_enabled(v234);
          if ((_DWORD)v235)
          {
            if (_IDSShouldLogTransport(v235))
            {
              _IDSLogTransport(@"QRAllocator", @"IDS", @"current response ignored");
            }
          }

          objc_msgSend(v386, "qrAllocatorDidReceiveAllocateResponse:", v130, v370);

          id v6 = v130;
          goto LABEL_461;
        }

        int v382 = 1;
        id v6 = v130;
        uint64_t v118 = theDict;
      }

      uint64_t v132 = kIDSQRAllocateKey_AppID;
      CFMutableDictionaryRef theDict = v118;
      double v133 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v118, "objectForKey:", kIDSQRAllocateKey_AppID, v370));
      unsigned int v383 = [v133 isEqualToString:IDSRegistrationServiceTypeCloudMessaging];

      if (-[NSMutableDictionary isEqualToString:](v399, "isEqualToString:", kIDSDefaultPairedDeviceID))
      {
        uint64_t v135 = OSLogHandleForTransportCategory("QRAllocator");
        id v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
        if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        {
          id v137 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( theDict,  "objectForKey:",  v132));
          *(_DWORD *)buf = 138412290;
          v420 = v137;
          _os_log_impl( (void *)&_mh_execute_header,  v136,  OS_LOG_TYPE_DEFAULT,  "Recieved allocation from DefaultPairedDeviceID {appID: %@}",  buf,  0xCu);
        }

        uint64_t v139 = os_log_shim_legacy_logging_enabled(v138);
        if ((_DWORD)v139)
        {
          if (_IDSShouldLogTransport(v139))
          {
            v371 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](theDict, "objectForKey:", v132));
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Recieved allocation from DefaultPairedDeviceID {appID: %@}");

            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              v371 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](theDict, "objectForKey:", v132, v371));
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Recieved allocation from DefaultPairedDeviceID {appID: %@}");
            }
          }
        }
      }

      if (!v383)
      {
LABEL_143:
        if (v398)
        {
          BOOL v154 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation request](v398, "request"));

          if (v154)
          {
            uint64_t v155 = OSLogHandleForTransportCategory("QRAllocator");
            id v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
            if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
            {
              -[QRAllocation duration](v398, "duration");
              *(_DWORD *)buf = 138412546;
              v420 = v391;
              __int16 v421 = 2048;
              v422 = v157;
              _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  "allocate response ID %@ is for initiator and took %0.6lf ms.",  buf,  0x16u);
            }

            uint64_t v159 = os_log_shim_legacy_logging_enabled(v158);
            if ((_DWORD)v159)
            {
              if (_IDSShouldLogTransport(v159))
              {
                -[QRAllocation duration](v398, "duration");
                v373 = v160;
                v371 = v391;
                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"allocate response ID %@ is for initiator and took %0.6lf ms.");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  -[QRAllocation duration](v398, "duration", v391, v373);
                  v373 = v161;
                  v371 = v391;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"allocate response ID %@ is for initiator and took %0.6lf ms.");
                }
              }
            }

            v162 = 0LL;
            if (theDict && kIDSQRAllocateKey_RelayExpiryTimestamp) {
              v162 = (void *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelayExpiryTimestamp);
            }
            id v378 = v162;
            [v378 doubleValue];
            -[QRAllocation setPurgeAtExpiration:](v398, "setPurgeAtExpiration:");
            v163 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](v398, "responses"));
            [v163 addObject:theDict];

            id v164 = -[QRAllocation startTime](v398, "startTime");
            if (v165 == 0.0)
            {
              double v168 = 0.0;
            }

            else
            {
              double v166 = ids_monotonic_time(v164);
              -[QRAllocation startTime](v398, "startTime");
              double v168 = v166 - v167;
            }

            -[QRAllocation setDuration:](v398, "setDuration:", v168 * 1000.0, v371, v373);
            uint64_t v181 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
            if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
            {
              -[QRAllocation duration](v398, "duration");
              v184 = v183;
              v185 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation request](v398, "request"));
              id v186 = (void *)objc_claimAutoreleasedReturnValue([v185 recipients]);
              unsigned int v187 = [v186 count];
              v188 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](v398, "responses"));
              unsigned int v189 = [v188 count];
              *(_DWORD *)buf = 138413058;
              v420 = v391;
              __int16 v421 = 2048;
              v422 = v184;
              __int16 v423 = 1024;
              *(_DWORD *)v424 = v187;
              *(_WORD *)&v424[4] = 1024;
              *(_DWORD *)&v424[6] = v189;
              _os_log_impl( (void *)&_mh_execute_header,  v182,  OS_LOG_TYPE_DEFAULT,  "allocate response ID %@ is for initiator and took %0.6lf ms, recipient count: %u, response count: %u.",  buf,  0x22u);
            }

            uint64_t v191 = os_log_shim_legacy_logging_enabled(v190);
            if ((_DWORD)v191)
            {
              if (_IDSShouldLogTransport(v191))
              {
                -[QRAllocation duration](v398, "duration");
                id v194 = v193;
                id v195 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation request](v398, "request"));
                id v196 = (void *)objc_claimAutoreleasedReturnValue([v195 recipients]);
                v197 = (__CFString *)[v196 count];
                v198 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](v398, "responses"));
                v374 = v197;
                v375 = (__CFString *)[v198 count];
                v373 = v194;
                v371 = v391;
                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"allocate response ID %@ is for initiator and took %0.6lf ms, recipient count: %u, response count: %u.");

                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  -[QRAllocation duration](v398, "duration", v391, v194, v197, v375);
                  id v200 = v199;
                  v201 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation request](v398, "request"));
                  v202 = (void *)objc_claimAutoreleasedReturnValue([v201 recipients]);
                  v203 = (__CFString *)[v202 count];
                  v204 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation responses](v398, "responses"));
                  v374 = v203;
                  v375 = (__CFString *)[v204 count];
                  v373 = v200;
                  v371 = v391;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"allocate response ID %@ is for initiator and took %0.6lf ms, recipient count: %u, response count: %u.");
                }
              }
            }

            uint64_t v205 = objc_opt_class(&OBJC_CLASS___NSArray, v192);
            id v206 = sub_10028D3BC(v205, v6, kIDSQRAllocateKey_Allocations);
            id v207 = (void *)objc_claimAutoreleasedReturnValue(v206);
            if (!v207)
            {
              uint64_t v222 = OSLogHandleForTransportCategory("QRAllocator");
              v223 = (os_log_s *)objc_claimAutoreleasedReturnValue(v222);
              if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v223,  OS_LOG_TYPE_DEFAULT,  "missing allocation status result for initiator",  buf,  2u);
              }

              uint64_t v225 = os_log_shim_legacy_logging_enabled(v224);
              if ((_DWORD)v225)
              {
                if (_IDSShouldLogTransport(v225))
                {
                  _IDSLogTransport( @"QRAllocator",  @"IDS",  @"missing allocation status result for initiator");
                  if (_IDSShouldLog(0LL, @"QRAllocator")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"missing allocation status result for initiator");
                  }
                }
              }

              goto LABEL_461;
            }

            __int128 v408 = 0u;
            __int128 v409 = 0u;
            __int128 v406 = 0u;
            __int128 v407 = 0u;
            id obj = v207;
            char v208 = 0;
            id v209 = [obj countByEnumeratingWithState:&v406 objects:v430 count:16];
            if (v209)
            {
              uint64_t v210 = *(void *)v407;
              uint64_t v211 = kIDSQRAllocateKey_RecipientPushToken;
              while (2)
              {
                for (i = 0LL; i != v209; i = (char *)i + 1)
                {
                  if (*(void *)v407 != v210) {
                    objc_enumerationMutation(obj);
                  }
                  __int16 v213 = (__CFString *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v406 + 1) + 8 * (void)i),  "objectForKey:",  v211,  v371,  v373,  v374,  v375));
                  if (!v213)
                  {
                    uint64_t v240 = OSLogHandleForTransportCategory("QRAllocator");
                    v241 = (os_log_s *)objc_claimAutoreleasedReturnValue(v240);
                    if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v241,  OS_LOG_TYPE_DEFAULT,  "missing recipient push token in allocation status result",  buf,  2u);
                    }

                    uint64_t v243 = os_log_shim_legacy_logging_enabled(v242);
                    if ((_DWORD)v243)
                    {
                      if (_IDSShouldLogTransport(v243))
                      {
                        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"missing recipient push token in allocation status result");
                        if (_IDSShouldLog(0LL, @"QRAllocator")) {
                          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"missing recipient push token in allocation status result");
                        }
                      }
                    }

                    goto LABEL_250;
                  }

                  v214 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](theDict, "objectForKey:", key));
                  if (!v214)
                  {
                    uint64_t v244 = OSLogHandleForTransportCategory("QRAllocator");
                    v245 = (os_log_s *)objc_claimAutoreleasedReturnValue(v244);
                    if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl( (void *)&_mh_execute_header,  v245,  OS_LOG_TYPE_DEFAULT,  "missing QR session ID",  buf,  2u);
                    }

                    uint64_t v247 = os_log_shim_legacy_logging_enabled(v246);
                    if ((_DWORD)v247)
                    {
                      if (_IDSShouldLogTransport(v247))
                      {
                        _IDSLogTransport(@"QRAllocator", @"IDS", @"missing QR session ID");
                      }
                    }

                    goto LABEL_250;
                  }

                  if ((v208 & 1) == 0)
                  {
                    int8x16_t v215 = 0LL;
                    initiatorsAcceptedSessionsWithToken = self->_initiatorsAcceptedSessionsWithToken;
                    if (initiatorsAcceptedSessionsWithToken)
                    {
                      if (v399)
                      {
                        int8x16_t v215 = (id)CFDictionaryGetValue( (CFDictionaryRef)initiatorsAcceptedSessionsWithToken,  v399);
                        if (v215)
                        {
                          if (-[__CFString isEqual:](v213, "isEqual:", v215))
                          {
                            uint64_t v217 = OSLogHandleForTransportCategory("QRAllocator");
                            v218 = (os_log_s *)objc_claimAutoreleasedReturnValue(v217);
                            if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412546;
                              v420 = v399;
                              __int16 v421 = 2112;
                              v422 = v213;
                              _os_log_impl( (void *)&_mh_execute_header,  v218,  OS_LOG_TYPE_DEFAULT,  "detects that session %@ has been accepted by device with token %@",  buf,  0x16u);
                            }

                            uint64_t v220 = os_log_shim_legacy_logging_enabled(v219);
                            if ((_DWORD)v220)
                            {
                              if (_IDSShouldLogTransport(v220))
                              {
                                v371 = v399;
                                v373 = v213;
                                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"detects that session %@ has been accepted by device with token %@");
                                if (_IDSShouldLog(0LL, @"QRAllocator"))
                                {
                                  v371 = v399;
                                  v373 = v213;
                                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"detects that session %@ has been accepted by device with token %@");
                                }
                              }
                            }

                            char v208 = 1;
                          }
                        }
                      }
                    }
                  }

                  v221 = (void *)objc_claimAutoreleasedReturnValue(-[QRAllocation pushTokenToQRSessionID](v398, "pushTokenToQRSessionID", v371));
                  [v221 setObject:v214 forKey:v213];
                }

                id v209 = [obj countByEnumeratingWithState:&v406 objects:v430 count:16];
                if (v209) {
                  continue;
                }
                break;
              }
            }

- (id)_translateParticipantIDtoUINT64ForResponse:(id)a3
{
  id v3 = a3;
  id v4 = (__CFDictionary *)[v3 mutableCopy];
  id v5 = (const void *)kIDSQRAllocateKey_RecipientID;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSQRAllocateKey_RecipientID]);
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v6 unsignedLongLongValue]));
    if (v8)
    {
      CFDictionarySetValue(v4, v5, v8);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1006A5E0C();
    }
  }

  id v9 = (void *)kIDSQRAllocateKey_Allocations;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:kIDSQRAllocateKey_Allocations]);
  id v11 = v10;
  if (v10 && [v10 count])
  {
    key = v9;
    id v27 = v3;
    CFMutableDictionaryRef theDict = v4;
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v26 = v11;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v19 = (__CFDictionary *)[v18 mutableCopy];
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v5]);
          uint64_t v21 = v20;
          if (v20)
          {
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v20 unsignedLongLongValue]));
            if (v22)
            {
              CFDictionarySetValue(v19, v5, v22);
            }

            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v34 = v5;
              __int16 v35 = 2080;
              id v36 = "newParticipant";
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s",  buf,  0x16u);
            }
          }

          -[NSMutableArray addObject:](v12, "addObject:", v19);
        }

        id v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v15);
    }

    id v23 = v12;
    if (v23)
    {
      id v4 = theDict;
      CFDictionarySetValue(theDict, key, v23);
      id v3 = v27;
    }

    else
    {
      id v3 = v27;
      id v4 = theDict;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1006A5E0C();
      }
    }

    id v11 = v26;
  }

  return v4;
}

- (BOOL)_isDuplicateResponse:(id)a3 newResponse:(id)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    id v6 = (const void *)kIDSQRAllocateKey_RelaySessionID;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([a4 objectForKey:kIDSQRAllocateKey_RelaySessionID]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "responses", 0));
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          Value = 0LL;
          if (v6 && *(void *)(*((void *)&v18 + 1) + 8LL * (void)i)) {
            Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v18 + 1) + 8LL * (void)i), v6);
          }
          id v14 = Value;
          if ([v14 isEqualToString:v7])
          {
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "_isDuplicateResponse:newResponse: found duplicate response for QRSessionID: %@",  buf,  0xCu);
            }

            BOOL v15 = 1;
            goto LABEL_23;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "_isDuplicateResponse:newResponse: duplicate response not found.",  buf,  2u);
    }

    BOOL v15 = 0;
LABEL_23:
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "_isDuplicateResponse:newResponse: invalid parameters!",  buf,  2u);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (void)_processSelfAllocations:(id)a3 allocation:(id)a4
{
  id v41 = a3;
  id v40 = a4;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_processSelfAllocations:allocation: called",  buf,  2u);
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
  uint64_t v39 = kIDSQRAllocateKey_SelfAllocationArray;
  id v8 = sub_10028D3BC(v7, v41, kIDSQRAllocateKey_SelfAllocationArray);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v34)
  {
    uint64_t v9 = OSLogHandleForTransportCategory("QRAllocator");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [v34 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v52) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "self allocation count in response: %u",  buf,  8u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        id v33 = [v34 count];
        _IDSLogTransport(@"QRAllocator", @"IDS", @"self allocation count in response: %u");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          id v33 = objc_msgSend(v34, "count", v33);
          _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"self allocation count in response: %u");
        }
      }
    }

    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id obj = v34;
    id v14 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v14)
    {
      uint64_t v37 = kIDSQRAllocateKey_Allocations;
      uint64_t v38 = *(void *)v47;
      uint64_t v36 = kIDSQRAllocateKey_AllocateType;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v47 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          uint64_t v17 = OSLogHandleForTransportCategory("QRAllocator");
          __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "self allocation: %@", buf, 0xCu);
          }

          uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
          if ((_DWORD)v20)
          {
            if (_IDSShouldLogTransport(v20))
            {
              id v33 = v16;
              _IDSLogTransport(@"QRAllocator", @"IDS", @"self allocation: %@");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                id v33 = v16;
                _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"self allocation: %@");
              }
            }
          }

          id v21 = objc_msgSend(v41, "mutableCopy", v33);
          [v21 removeObjectForKey:v39];
          uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          [v21 setObject:v22 forKey:v37];

          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          id v23 = v16;
          id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v43;
            do
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v43 != v25) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)j);
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v27]);
                [v21 setObject:v28 forKey:v27];
              }

              id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }

            while (v24);
          }

          [v21 setObject:&off_100947848 forKey:v36];
          [v40 addAllocation:v21];
          uint64_t v29 = OSLogHandleForTransportCategory("QRAllocator");
          __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v52 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "transformed self allocation: %@",  buf,  0xCu);
          }

          uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
          if ((_DWORD)v32)
          {
            if (_IDSShouldLogTransport(v32))
            {
              id v33 = v21;
              _IDSLogTransport(@"QRAllocator", @"IDS", @"transformed self allocation: %@");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                id v33 = v21;
                _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"transformed self allocation: %@");
              }
            }
          }
        }

        id v14 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      }

      while (v14);
    }
  }
}

- (id)_getCombinedSoftwareID:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_getCombinedSoftwareID: called", buf, 2u);
  }

  id v5 = [v3 length];
  if (v5)
  {
    uint64_t v6 = _IDSAllocateProtocolVersionNumber(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    unsigned __int8 v8 = [v7 unsignedShortValue];

    unsigned __int8 v15 = v8;
    uint64_t v9 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v3);
    -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", &v15, 1LL);
  }

  else
  {
    uint64_t v10 = OSLogHandleForTransportCategory("QRAllocator");
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "failed to get combined-software-id due to invalid parameter.",  v16,  2u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"failed to get combined-software-id due to invalid parameter.");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"failed to get combined-software-id due to invalid parameter.");
        }
      }
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_createSessionInfoFromResponsePayload:(id)a3
{
  id v4 = (const __CFDictionary *)a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_createSessionInfoFromResponsePayload: called",  buf,  2u);
  }

  if (v4)
  {
    uint64_t v6 = -[IDSQuickRelayAllocateMessage initWithDictionary:]( objc_alloc(&OBJC_CLASS___IDSQuickRelayAllocateMessage),  "initWithDictionary:",  v4);
    v214 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage IDSSessionID](v6, "IDSSessionID"));
    __int16 v213 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](v6, "appID"));
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v8 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayBuildVersion](v6, "relayBuildVersion"));
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "QR Build Version: %@", buf, 0xCu);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        v203 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayBuildVersion](v6, "relayBuildVersion"));
        _IDSLogTransport(@"QRAllocator", @"IDS", @"QR Build Version: %@");

        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          v203 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayBuildVersion](v6, "relayBuildVersion", v203));
          _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"QR Build Version: %@");
        }
      }
    }

    if (objc_msgSend(v213, "isEqualToString:", IDSRegistrationServiceTypeCloudMessaging, v203))
    {
      id v13 = sub_1002872C0(v214);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (([v14 isEqualToString:kIDSDefaultPairedDeviceID] & 1) == 0)
      {
        id v15 = v214;
        memset(buf, 170, 16);
        v221.i64[0] = 0xAAAAAAAAAAAAAAAALL;
        v221.i64[1] = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCurrentDevice sharedInstance](&OBJC_CLASS___IDSCurrentDevice, "sharedInstance"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceIdentifier]);

        if ([v15 length] == (id)16)
        {
          *(_OWORD *)unsigned int keya = *(_OWORD *)[v15 bytes];
          __int128 v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v17);
          -[NSUUID getUUIDBytes:](v18, "getUUIDBytes:", buf);

          int8x16_t v221 = veorq_s8(*(int8x16_t *)keya, *(int8x16_t *)buf);
          id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v221, 16LL));
        }

        else
        {
          uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v219 = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not an UUID", v219, 2u);
          }

          uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
          if ((_DWORD)v24)
          {
            if (_IDSShouldLogTransport(v24))
            {
              _IDSLogTransport(@"QRAllocator", @"IDS", @"Not an UUID");
            }
          }

          id v19 = v15;
        }

        uint64_t v25 = v19;

        id v26 = sub_1002872C0(v25);
        id v27 = (id)objc_claimAutoreleasedReturnValue(v26);
        if (v27)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RemoteDeviceIDKey, v27);
        }

        else
        {
          id v28 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6784();
          }
        }

        uint64_t v29 = OSLogHandleForTransportCategory("QRAllocator");
        __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v27;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "remote deviceID: %@", buf, 0xCu);
        }

        uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
        if ((_DWORD)v32)
        {
          if (_IDSShouldLogTransport(v32))
          {
            id v204 = v27;
            _IDSLogTransport(@"QRAllocator", @"IDS", @"remote deviceID: %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              id v204 = v27;
              _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"remote deviceID: %@");
            }
          }
        }
      }
    }

    else
    {
      id v14 = 0LL;
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage requestID](v6, "requestID", v204));
    id v34 = sub_1002872C0(v33);
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    id v36 = v35;
    key = v36;
    if (v36)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RequestID, v36);
    }

    else
    {
      id v37 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1006A6704();
      }
    }

    if (v14)
    {
      id v38 = v14;
    }

    else
    {
      id v39 = sub_1002872C0(v214);
      id v38 = (id)objc_claimAutoreleasedReturnValue(v39);
      if (!v38)
      {
        id v38 = &_os_log_default;
        id v73 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A6684();
        }
        v216 = 0LL;
LABEL_44:

        id v40 = [v216 isEqualToString:kIDSDefaultPairedDeviceID];
        if ((_DWORD)v40) {
          CFDictionarySetValue(Mutable, IDSGlobalLinkOptionForceRelayKey, &__kCFBooleanTrue);
        }
        uint64_t v41 = _IDSAllocateProtocolVersionNumber(v40);
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        if (v42)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateProtocolVersion, v42);
        }

        else
        {
          id v43 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6604();
          }
        }

        os_unfair_lock_lock(&self->_lock);
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionToRequestIDToAllocateTime,  "objectForKeyedSubscript:",  v216));
        if (v44) {
          BOOL v45 = key != 0LL;
        }
        else {
          BOOL v45 = 0;
        }
        if (v45)
        {
          __int128 v46 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_sessionToRequestIDToAllocateTime,  "objectForKeyedSubscript:",  v216));
          objc_msgSend((id)CFDictionaryGetValue(v46, key), "doubleValue");
          double v48 = v47;
        }

        else
        {
          [0 doubleValue];
          double v48 = v49;
        }

        os_unfair_lock_unlock(&self->_lock);
        if (v48 > 0.0)
        {
          double v51 = ids_monotonic_time(v50) - v48;
          id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v51));
          if (v52)
          {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateTime, v52);
          }

          else
          {
            id v53 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6584();
            }
          }

          char v54 = (const void *)kIDSQRAllocateKey_InferredExternalAddress;
          if (kIDSQRAllocateKey_InferredExternalAddress
            && (uint64_t v55 = (id)(id)CFDictionaryGetValue( v4,  kIDSQRAllocateKey_InferredExternalAddress)) != 0LL)
          {
            uint64_t v56 = v55;
            CFDictionarySetValue(Mutable, v54, v55);
            int v57 = v56;
          }

          else
          {
            uint64_t v56 = &_os_log_default;
            id v58 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6488();
            }
            int v57 = 0LL;
          }

          uint64_t v59 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(double *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v57;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "allocate request took: %.6f seconds, extIPAddr: %@.",  buf,  0x16u);
          }

          uint64_t v62 = os_log_shim_legacy_logging_enabled(v61);
          if ((_DWORD)v62)
          {
            if (_IDSShouldLogTransport(v62))
            {
              id v209 = v57;
              double v205 = v51;
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"allocate request took: %.6f seconds, extIPAddr: %@.");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                id v209 = v57;
                double v205 = v51;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"allocate request took: %.6f seconds, extIPAddr: %@.");
              }
            }
          }
        }

        int8x16_t v215 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationForSessionID:requestIDStr:]( self,  "_findAllocationForSessionID:requestIDStr:",  v216,  key,  *(void *)&v205,  v209));
        if (!v215
          || (id v63 = (void *)objc_claimAutoreleasedReturnValue([v215 request]),
              BOOL v64 = v63 == 0LL,
              v63,
              v64))
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_isInitiator, &__kCFBooleanFalse);
        }

        else
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_isInitiator, &__kCFBooleanTrue);
          id v65 = (void *)objc_claimAutoreleasedReturnValue([v215 request]);
          unsigned __int8 v66 = (void *)objc_claimAutoreleasedReturnValue([v65 senderExternalIP]);

          if (v66)
          {
            uint64_t v67 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "allocate response is for an auxiliary connection",  buf,  2u);
            }

            uint64_t v70 = os_log_shim_legacy_logging_enabled(v69);
            if ((_DWORD)v70)
            {
              if (_IDSShouldLogTransport(v70))
              {
                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"allocate response is for an auxiliary connection");
                if (_IDSShouldLog(0LL, @"QRAllocator")) {
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"allocate response is for an auxiliary connection");
                }
              }
            }

            int v71 = (void *)objc_claimAutoreleasedReturnValue([v215 request]);
            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v71 senderExternalIP]);

            if (v72)
            {
              CFDictionarySetValue(Mutable, kIDSQRAllocateKey_SenderExternalAddress, v72);
            }

            else
            {
              id v74 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1006A6504();
              }
            }
          }
        }

        uint64_t v75 = (const void *)kIDSQRAllocateKey_Provider;
        if (kIDSQRAllocateKey_Provider
          && (uint64_t v76 = (id)(id)CFDictionaryGetValue( v4,  kIDSQRAllocateKey_Provider)) != 0LL)
        {
          uint64_t v77 = v76;
          CFDictionarySetValue(Mutable, v75, v76);
          v212 = v77;
        }

        else
        {
          uint64_t v77 = &_os_log_default;
          id v78 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6488();
          }
          v212 = 0LL;
        }

        uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySoftwareVersion](v6, "relaySoftwareVersion"));
        uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getCombinedSoftwareID:](self, "_getCombinedSoftwareID:", v79));

        id v81 = v80;
        if (v81)
        {
          id v82 = v81;
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayCombinedSoftwareID, v81);
          id v81 = v82;
        }

        uint64_t v211 = v81;

        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayPort](v6, "relayPort"));
        if (v83)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayPort, v83);
        }

        else
        {
          id v84 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6408();
          }
        }

        uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayIP](v6, "relayIP"));
        if (v85)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayAddress, v85);
        }

        else
        {
          id v86 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6388();
          }
        }

        uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayIPv6](v6, "relayIPv6"));
        if (v87) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayAddressIPv6, v87);
        }

        uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayHighPriorityPort](v6, "relayHighPriorityPort"));
        if (v88) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayHighPriorityPort, v88);
        }

        uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionToken](v6, "relaySessionToken"));
        if (v89)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionToken, v89);
        }

        else
        {
          id v90 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6308();
          }
        }

        uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage infoAttribute](v6, "infoAttribute"));
        if (v91) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_PreferredRemoteInterface, v91);
        }

        uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage pskTransportParameters](v6, "pskTransportParameters"));
        if (v92) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_PSKTransportParameters, v92);
        }

        uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage pskH3Settings](v6, "pskH3Settings"));
        if (v93) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_PSKH3Settings, v93);
        }

        uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage reportingDataBlob](v6, "reportingDataBlob"));
        if (v94) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_ReportingDataBlob, v94);
        }

        uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage isInternal](v6, "isInternal"));
        if (v95) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IsInternal, v95);
        }

        uint64_t v96 = IMGetCachedDomainIntForKeyWithDefaultValue(@"com.apple.ids", @"IPv6Preferred", -1LL);
        if ((v96 & 0x80000000) != 0)
        {
          uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage ipPreference](v6, "ipPreference"));
          if (v98) {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayIPPreference, v98);
          }
        }

        else
        {
          uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v96));
          if (v97)
          {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayIPPreference, v97);
          }

          else
          {
            id v99 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6288();
            }
          }

          uint64_t v100 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v101 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v96;
            _os_log_impl( (void *)&_mh_execute_header,  v101,  OS_LOG_TYPE_DEFAULT,  "defaults write to set ipPreference: %d",  buf,  8u);
          }

          uint64_t v103 = os_log_shim_legacy_logging_enabled(v102);
          if ((_DWORD)v103)
          {
            if (_IDSShouldLogTransport(v103))
            {
              uint64_t v206 = v96;
              _IDSLogTransport(@"QRAllocator", @"IDS", @"defaults write to set ipPreference: %d");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v206 = v96;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"defaults write to set ipPreference: %d");
              }
            }
          }
        }

        uint64_t v104 = IMGetCachedDomainIntForKeyWithDefaultValue(@"com.apple.ids", @"linkSuggestion", -1LL);
        if ((v104 & 0x80000000) != 0)
        {
          uint64_t v106 = (const void *)kIDSQRAllocateKey_LinkSuggestion;
          if (kIDSQRAllocateKey_LinkSuggestion)
          {
            id v107 = (id)(id)CFDictionaryGetValue( v4,  kIDSQRAllocateKey_LinkSuggestion);
            if (v107)
            {
              uint64_t v108 = v107;
              CFDictionarySetValue(Mutable, v106, v107);
            }
          }
        }

        else
        {
          int64_t v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v104));
          if (v105)
          {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_LinkSuggestion, v105);
          }

          else
          {
            id v109 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6208();
            }
          }

          uint64_t v110 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v104;
            _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "defaults write to set linkSuggestionValue: %d",  buf,  8u);
          }

          uint64_t v113 = os_log_shim_legacy_logging_enabled(v112);
          if ((_DWORD)v113)
          {
            if (_IDSShouldLogTransport(v113))
            {
              uint64_t v206 = v104;
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"defaults write to set linkSuggestionValue: %d");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v206 = v104;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"defaults write to set linkSuggestionValue: %d");
              }
            }
          }
        }

        uint64_t v114 = IMGetCachedDomainIntForKeyWithDefaultValue(@"com.apple.ids", @"linkScore", -1LL);
        if ((v114 & 0x80000000) != 0)
        {
          uint64_t v116 = (const void *)kIDSQRAllocateKey_LinkScore;
          if (kIDSQRAllocateKey_LinkScore)
          {
            uint64_t v117 = (id)(id)CFDictionaryGetValue( v4,  kIDSQRAllocateKey_LinkScore);
            if (v117)
            {
              uint64_t v118 = v117;
              CFDictionarySetValue(Mutable, v116, v117);
            }
          }
        }

        else
        {
          id v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v114));
          if (v115)
          {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_LinkScore, v115);
          }

          else
          {
            id v119 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6188();
            }
          }

          uint64_t v120 = OSLogHandleForTransportCategory("QRAllocator");
          __int128 v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v114;
            _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "defaults write to set linkScoreValue: %d",  buf,  8u);
          }

          uint64_t v123 = os_log_shim_legacy_logging_enabled(v122);
          if ((_DWORD)v123)
          {
            if (_IDSShouldLogTransport(v123))
            {
              uint64_t v206 = v114;
              _IDSLogTransport(@"QRAllocator", @"IDS", @"defaults write to set linkScoreValue: %d");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v206 = v114;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"defaults write to set linkScoreValue: %d");
              }
            }
          }
        }

        unsigned __int8 v124 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage qrExperiments](v6, "qrExperiments", v206));
        if (IMGetDomainBoolForKey(@"com.apple.ids", @"h2DisabledFromQRA"))
        {
          unsigned int v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          if (v125)
          {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_HTTP2Disabled, v125);
          }

          else
          {
            id v128 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6108();
            }
          }

          uint64_t v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v127,  OS_LOG_TYPE_DEFAULT,  "Disable HTTP2 due to user defaults",  buf,  2u);
          }
        }

        else
        {
          uint64_t v126 = (const void *)kIDSQRAllocateKey_HTTP2Disabled;
          uint64_t v127 = (os_log_s *)objc_claimAutoreleasedReturnValue([v124 objectForKey:kIDSQRAllocateKey_HTTP2Disabled]);
          if (v127) {
            CFDictionarySetValue(Mutable, v126, v127);
          }
        }

        if (IMGetDomainBoolForKey(@"com.apple.ids", @"isIPDiscoverDisabled"))
        {
          uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
          if (v129)
          {
            CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IPDiscoveryDisabled, v129);
          }

          else
          {
            id v132 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1006A6088();
            }
          }

          uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
          if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v131,  OS_LOG_TYPE_DEFAULT,  "Disable ip discovery due to user defaults",  buf,  2u);
          }
        }

        else
        {
          id v130 = (const void *)kIDSQRAllocateKey_IPDiscoveryDisabled;
          uint64_t v131 = (os_log_s *)objc_claimAutoreleasedReturnValue([v124 objectForKey:kIDSQRAllocateKey_IPDiscoveryDisabled]);
          if (v131) {
            CFDictionarySetValue(Mutable, v130, v131);
          }
        }

        double v133 = (const void *)kIDSQRAllocateKey_UplinkNackDisabled;
        uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKey:kIDSQRAllocateKey_UplinkNackDisabled]);
        if (v134) {
          CFDictionarySetValue(Mutable, v133, v134);
        }

        uint64_t v135 = (const void *)kIDSQRAllocateKey_TransportLayerEncryptionDisabled;
        id v136 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKey:kIDSQRAllocateKey_TransportLayerEncryptionDisabled]);
        if (v136) {
          CFDictionarySetValue(Mutable, v135, v136);
        }

        id v137 = (const void *)kIDSQRAllocateKey_IPDiscoveryDisabled;
        uint64_t v138 = (void *)objc_claimAutoreleasedReturnValue([v124 objectForKey:kIDSQRAllocateKey_IPDiscoveryDisabled]);
        if (v138) {
          CFDictionarySetValue(Mutable, v137, v138);
        }

        id v139 = v124;
        if (v139) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_QRExperiments, v139);
        }

        uint64_t v140 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionID](v6, "relaySessionID"));
        BOOL v141 = [v140 length] == (id)16;

        if (v141)
        {
          uint64_t v142 = objc_alloc(&OBJC_CLASS___NSUUID);
          id v143 = objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionID](v6, "relaySessionID"));
          uint64_t v144 = -[NSUUID initWithUUIDBytes:](v142, "initWithUUIDBytes:", [v143 bytes]);
        }

        else
        {
          uint64_t v145 = OSLogHandleForTransportCategory("QRAllocator");
          unint64_t v146 = (os_log_s *)objc_claimAutoreleasedReturnValue(v145);
          if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
          {
            id v147 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionID](v6, "relaySessionID"));
            id v148 = [v147 length];
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v148;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = 16LL;
            _os_log_impl( (void *)&_mh_execute_header,  v146,  OS_LOG_TYPE_DEFAULT,  "Warning: invalid response relaySessionID length = %lu != sizeof(uuid_t) = %lu",  buf,  0x16u);
          }

          uint64_t v150 = os_log_shim_legacy_logging_enabled(v149);
          if (!(_DWORD)v150
            || !_IDSShouldLogTransport(v150)
            || (uint64_t v151 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionID](v6, "relaySessionID")),
                id v207 = [v151 length],
                uint64_t v210 = 16LL,
                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Warning: invalid response relaySessionID length = %lu != sizeof(uuid_t) = %lu"),  v151,  !_IDSShouldLog(0LL, @"QRAllocator")))
          {
            uint64_t v144 = 0LL;
LABEL_215:
            id v152 = (id)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v144, "UUIDString", v207, v210));
            if (v152)
            {
              CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionID, v152);
            }

            else
            {
              id v153 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1006A6008();
              }
            }

            BOOL v154 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionKey](v6, "relaySessionKey"));
            if (v154)
            {
              CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionKey, v154);
            }

            else
            {
              id v155 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1006A5F88();
              }
            }

            id v156 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage appID](v6, "appID"));
            if (v156)
            {
              CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v156);
            }

            else
            {
              id v157 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1006A5F08();
              }
            }

            uint64_t v158 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relayExpiryTimeStamp](v6, "relayExpiryTimeStamp"));
            [v158 doubleValue];
            double v160 = v159;

            id v161 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", v160);
            if (v161)
            {
              CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayExpiryTimestamp, v161);
            }

            else
            {
              id v162 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_1006A5E88();
              }
            }

            uint64_t v164 = objc_opt_class(&OBJC_CLASS___NSNumber, v163);
            double v165 = (const void *)kIDSQRAllocateKey_AllocateType;
            id v166 = sub_10028D3BC(v164, v4, kIDSQRAllocateKey_AllocateType);
            double v167 = (void *)objc_claimAutoreleasedReturnValue(v166);
            double v168 = v167;
            if (v167)
            {
              id v169 = v167;
              CFDictionarySetValue(Mutable, v165, v169);

              if ([v169 intValue] == 3)
              {
                uint64_t v171 = objc_opt_class(&OBJC_CLASS___NSArray, v170);
                uint64_t v172 = (const void *)kIDSQRAllocateKey_Allocations;
                id v173 = sub_10028D3BC(v171, v4, kIDSQRAllocateKey_Allocations);
                CFMutableDictionaryRef v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
                id v175 = v174;
                if (v174)
                {
                  id v176 = v174;
                  CFDictionarySetValue(Mutable, v172, v176);
                }

                else
                {
                  uint64_t v189 = OSLogHandleForTransportCategory("QRAllocator");
                  uint64_t v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v189);
                  if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v190,  OS_LOG_TYPE_DEFAULT,  "missing allocation status result",  buf,  2u);
                  }

                  uint64_t v192 = os_log_shim_legacy_logging_enabled(v191);
                  if ((_DWORD)v192)
                  {
                    if (_IDSShouldLogTransport(v192))
                    {
                      _IDSLogTransport(@"QRAllocator", @"IDS", @"missing allocation status result");
                      if (_IDSShouldLog(0LL, @"QRAllocator")) {
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"missing allocation status result");
                      }
                    }
                  }
                }
              }
            }

            else
            {
              uint64_t v177 = OSLogHandleForTransportCategory("QRAllocator");
              v178 = (os_log_s *)objc_claimAutoreleasedReturnValue(v177);
              if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v178,  OS_LOG_TYPE_DEFAULT,  "missing allocateType in response",  buf,  2u);
              }

              uint64_t v180 = os_log_shim_legacy_logging_enabled(v179);
              if ((_DWORD)v180)
              {
                if (_IDSShouldLogTransport(v180))
                {
                  _IDSLogTransport(@"QRAllocator", @"IDS", @"missing allocateType in response");
                  if (_IDSShouldLog(0LL, @"QRAllocator")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"missing allocateType in response");
                  }
                }
              }

              uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage allocateProtocolVersion](v6, "allocateProtocolVersion"));
              BOOL v182 = (int)[v181 intValue] > 1;

              if (v182)
              {
                uint64_t v183 = OSLogHandleForTransportCategory("QRAllocator");
                v184 = (os_log_s *)objc_claimAutoreleasedReturnValue(v183);
                if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
                {
                  id v185 = (id)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocateMessage allocateProtocolVersion]( v6,  "allocateProtocolVersion"));
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v185;
                  _os_log_impl( (void *)&_mh_execute_header,  v184,  OS_LOG_TYPE_DEFAULT,  "allocate type is required for allocate protocol version %@",  buf,  0xCu);
                }

                uint64_t v187 = os_log_shim_legacy_logging_enabled(v186);
                if (!(_DWORD)v187
                  || !_IDSShouldLogTransport(v187)
                  || (char v208 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocateMessage allocateProtocolVersion]( v6,  "allocateProtocolVersion")),  _IDSLogTransport( @"QRAllocator",  @"IDS",  @"allocate type is required for allocate protocol version %@"),  v208,  !_IDSShouldLog(0LL, @"QRAllocator")))
                {
                  uint64_t v20 = 0LL;
LABEL_273:

                  goto LABEL_274;
                }

                v188 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocateMessage allocateProtocolVersion]( v6,  "allocateProtocolVersion",  v208));
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"allocate type is required for allocate protocol version %@");
                uint64_t v20 = 0LL;
LABEL_272:

                goto LABEL_273;
              }

              CFDictionarySetValue(Mutable, v165, &off_1009477D0);
            }

            uint64_t v193 = kIDSQRAllocateKey_SessionAllocationTime;
            id v194 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( v4,  "objectForKey:",  kIDSQRAllocateKey_SessionAllocationTime));
            if (v194) {
              -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v194, v193);
            }

            uint64_t v195 = kIDSQRAllocateKey_RecipientID;
            id v196 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v4, "objectForKey:", kIDSQRAllocateKey_RecipientID));
            v188 = v196;
            if (v196)
            {
              v197 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v196 unsignedLongLongValue]));
              if (v197) {
                -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v197, v195);
              }
            }

            uint64_t v198 = kIDSQRAllocateKey_GroupID;
            v199 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v4, "objectForKey:", kIDSQRAllocateKey_GroupID));
            if (v199) {
              -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v199, v198);
            }

            uint64_t v200 = kIDSQRAllocateKey_GroupMemberCount;
            v201 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v4, "objectForKey:", kIDSQRAllocateKey_GroupMemberCount));
            if (v201) {
              -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v201, v200);
            }

            uint64_t v20 = Mutable;
            goto LABEL_272;
          }

          id v143 = (id)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocateMessage relaySessionID](v6, "relaySessionID", v207, 16LL, v211, v212));
          id v207 = [v143 length];
          uint64_t v210 = 16LL;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Warning: invalid response relaySessionID length = %lu != sizeof(uuid_t) = %lu");
          uint64_t v144 = 0LL;
        }

        goto LABEL_215;
      }
    }

    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IDSSessionID, v38);
    v216 = v38;
    goto LABEL_44;
  }

  uint64_t v20 = 0LL;
LABEL_274:

  return v20;
}

- (void)_setSessionInfoRequiredKeys
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_setSessionInfoRequiredKeys called", v7, 2u);
  }

  sessionInfoRequiredKeys = self->_sessionInfoRequiredKeys;
  if (!sessionInfoRequiredKeys)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v6 = self->_sessionInfoRequiredKeys;
    self->_sessionInfoRequiredKeys = v5;

    sessionInfoRequiredKeys = self->_sessionInfoRequiredKeys;
  }

  -[NSMutableArray addObject:](sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_RequestID);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_IDSSessionID);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_RelayPort);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_RelayAddress);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_RelaySessionToken);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_RelaySessionID);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_RelaySessionKey);
  -[NSMutableArray addObject:](self->_sessionInfoRequiredKeys, "addObject:", kIDSQRAllocateKey_isInitiator);
}

- (BOOL)_hasSessionInfoRequiredKeys:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[NSMutableArray count](self->_sessionInfoRequiredKeys, "count"))
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v5 = self->_sessionInfoRequiredKeys;
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
      if (v6)
      {
        uint64_t v7 = *(void *)v21;
        char v8 = 1;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v21 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v10, v18, v19));
            BOOL v12 = v11 == 0LL;

            if (v12)
            {
              uint64_t v13 = OSLogHandleForTransportCategory("QRAllocator");
              id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v25 = v10;
                __int16 v26 = 2112;
                id v27 = v4;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  " is missing required attributes %@ in sessionInfo %@",  buf,  0x16u);
              }

              uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
              if ((_DWORD)v16)
              {
                if (_IDSShouldLogTransport(v16))
                {
                  uint64_t v18 = v10;
                  id v19 = v4;
                  _IDSLogTransport( @"QRAllocator",  @"IDS",  @" is missing required attributes %@ in sessionInfo %@");
                  if (_IDSShouldLog(0LL, @"QRAllocator"))
                  {
                    uint64_t v18 = v10;
                    id v19 = v4;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @" is missing required attributes %@ in sessionInfo %@");
                  }
                }
              }

              char v8 = 0;
            }
          }

          id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
        }

        while (v6);
      }

      else
      {
        char v8 = 1;
      }
    }

    else
    {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)_triggerSymptomsWithType:(id)a3 subType:(id)a4 subTypeContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  unsigned int v11 = [v10 isInternalInstall];

  if (v11)
  {
    id v12 = objc_alloc_init((Class)IMWeakLinkClass(@"SDRDiagnosticReporter", @"SymptomDiagnosticReporter"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 signatureWithDomain:@"IDSQuickRelay" type:v7 subType:v8 subtypeContext:v9 detectedProcess:@"identityservicesd" triggerThresholdValues:0]);
    uint64_t v15 = im_primary_queue(v13, v14);
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10029BB50;
    v19[3] = &unk_1008FF718;
    id v20 = v12;
    id v21 = v13;
    id v22 = 0LL;
    uint64_t v23 = 0x402E000000000000LL;
    id v17 = v13;
    id v18 = v12;
    dispatch_async(v16, v19);
  }
}

- (unsigned)_getErrorCodeFromAllocationStatus:(int)a3
{
  if (a3 <= 5000)
  {
    if (a3 == 1000)
    {
      return 32;
    }

    else if (a3 == 1001)
    {
      return 33;
    }

    else
    {
      return 38;
    }
  }

  else
  {
    switch(a3)
    {
      case 5001:
        return 34;
      case 5002:
      case 5003:
      case 5005:
      case 5006:
      case 5007:
      case 5009:
        return 38;
      case 5004:
        return 35;
      case 5008:
        return 36;
      case 5010:
        return 45;
      default:
        if (a3 == 5032)
        {
          unsigned int result = 37;
        }

        else
        {
          if (a3 != 7000) {
            return 38;
          }
          unsigned int result = 42;
        }

        break;
    }
  }

  return result;
}

- (void)_processAllocationStatusResult:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "_processAllocationStatusResult: called",  buf,  2u);
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
  id v8 = sub_10028D3BC(v7, v4, @"s");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  signed int v10 = [v9 intValue];

  if (v10)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
    id v13 = sub_10028D3BC(v12, v4, @"p");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = v10;
    if (v14)
    {
      uint64_t v16 = OSLogHandleForTransportCategory("QRAllocator");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kIDSQRAllocateKey_RecipientPushToken]);
        *(_DWORD *)buf = 138412546;
        id v81 = v18;
        __int16 v82 = 2048;
        *(void *)uint64_t v83 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate QR for recipient with token %@ with error %lu",  buf,  0x16u);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          uint64_t v21 = kIDSQRAllocateKey_RecipientPushToken;
          id v73 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kIDSQRAllocateKey_RecipientPushToken]);
          uint64_t v75 = v15;
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Failed to allocate QR for recipient with token %@ with error %lu");

          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            id v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v21, v73, v15));
            uint64_t v75 = v15;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Failed to allocate QR for recipient with token %@ with error %lu");
          }
        }
      }
    }

    uint64_t v22 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v81 = v4;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Allocation error response: %@", buf, 0xCu);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      if (_IDSShouldLogTransport(v25))
      {
        id v73 = v4;
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Allocation error response: %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          id v73 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"Allocation error response: %@");
        }
      }
    }

    uint64_t v26 = -[IDSQuickRelayAllocator _getErrorCodeFromAllocationStatus:]( self,  "_getErrorCodeFromAllocationStatus:",  v15,  v73,  v75);
    uint64_t v27 = kIDSQRAllocateKey_RequestID;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_RequestID]);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString, v29);
    if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0)
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v27]);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v31));
      id v33 = sub_1002872C0(v32);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    }

    else
    {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v27]);
      uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSData, v35);
      if ((objc_opt_isKindOfClass(v31, v36) & 1) != 0)
      {
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v27]);
        id v38 = sub_1002872C0(v37);
        id v34 = (void *)objc_claimAutoreleasedReturnValue(v38);
      }

      else
      {
        id v39 = sub_1002872C0(0LL);
        id v34 = (void *)objc_claimAutoreleasedReturnValue(v39);
      }
    }

    if (v34)
    {
      requestIDToSession = self->_requestIDToSession;
      if (requestIDToSession
        && (uint64_t v41 = (id)CFDictionaryGetValue((CFDictionaryRef)requestIDToSession, v34)) != 0LL)
      {
        __int128 v42 = v41;
        if ((_DWORD)v15 == 5001)
        {
          uint64_t v43 = OSLogHandleForTransportCategory("QRAllocator");
          __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v81 = v42;
            __int16 v82 = 1024;
            *(_DWORD *)uint64_t v83 = 5001;
            *(_WORD *)&v83[4] = 1024;
            *(_DWORD *)&v83[6] = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Allocation failure for session %@, status = %d, code = %d, attempting to retry!",  buf,  0x18u);
          }

          uint64_t v46 = os_log_shim_legacy_logging_enabled(v45);
          if ((_DWORD)v46)
          {
            if (_IDSShouldLogTransport(v46))
            {
              uint64_t v76 = 5001LL;
              uint64_t v77 = v26;
              id v74 = v42;
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Allocation failure for session %@, status = %d, code = %d, attempting to retry!");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v76 = 5001LL;
                uint64_t v77 = v26;
                id v74 = v42;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Allocation failure for session %@, status = %d, code = %d, attempting to retry!");
              }
            }
          }

          double v47 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationForSessionID:requestIDStr:]( self,  "_findAllocationForSessionID:requestIDStr:",  v42,  v34,  v74,  v76,  v77));
          double v48 = (void *)objc_claimAutoreleasedReturnValue([v47 request]);

          -[IDSQuickRelayAllocator _sendAllocateRequest:](self, "_sendAllocateRequest:", v48);
          goto LABEL_60;
        }

        int v57 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v41));
        id v58 = v57;
        if (v57)
        {
          [v57 processAllocationErrorStatus:v15 errorCode:v26];
        }

        else
        {
          uint64_t v59 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v81 = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "No ids session for ids session id %@",  buf,  0xCu);
          }

          uint64_t v62 = os_log_shim_legacy_logging_enabled(v61);
          if ((_DWORD)v62)
          {
            if (_IDSShouldLogTransport(v62))
            {
              _IDSLogTransport(@"QRAllocator", @"IDS", @"No ids session for ids session id %@");
              if (_IDSShouldLog(0LL, @"QRAllocator")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"No ids session for ids session id %@");
              }
            }
          }
        }
      }

      else
      {
        uint64_t v49 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "No ids session id for request id %@",  buf,  0xCu);
        }

        uint64_t v52 = os_log_shim_legacy_logging_enabled(v51);
        if ((_DWORD)v52)
        {
          if (_IDSShouldLogTransport(v52))
          {
            _IDSLogTransport(@"QRAllocator", @"IDS", @"No ids session id for request id %@");
          }
        }
      }
    }

    else
    {
      uint64_t v53 = OSLogHandleForTransportCategory("QRAllocator");
      char v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "No request id", buf, 2u);
      }

      uint64_t v56 = os_log_shim_legacy_logging_enabled(v55);
      if ((_DWORD)v56)
      {
        if (_IDSShouldLogTransport(v56))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"No request id");
        }
      }
    }
  }

  uint64_t v63 = objc_opt_class(&OBJC_CLASS___NSString, v11);
  id v64 = sub_10028D3BC(v63, v4, kIDSQRAllocateKey_QRFailureSubType);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v64);
  uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSString, v65);
  id v67 = sub_10028D3BC(v66, v4, kIDSQRAllocateKey_QRFailureContext);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(v67);
  uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSNumber, v68);
  id v70 = sub_10028D3BC(v69, v4, kIDSQRAllocateKey_AllocateType);
  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(v70);
  v78[0] = &off_1009477D0;
  v78[1] = &off_100947848;
  v79[0] = @"IDSQuickRelayTwoWay";
  v79[1] = @"IDSQuickRelaySelf";
  v78[2] = &off_100947860;
  v78[3] = &off_1009477B8;
  v79[2] = @"IDSQuickRelayShared";
  v79[3] = @"IDSQuickRelayKeepAlive";
  v78[4] = &off_100947878;
  v79[4] = @"IDSQuickRelayMax";
  double v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  5LL));
  uint64_t v71 = objc_claimAutoreleasedReturnValue([v48 objectForKey:v42]);
  uint64_t v72 = (void *)v71;
  if (v14 && v34 && v71) {
    -[IDSQuickRelayAllocator _triggerSymptomsWithType:subType:subTypeContext:]( self,  "_triggerSymptomsWithType:subType:subTypeContext:",  v71,  v14,  v34);
  }

LABEL_60:
}

- (void)_sendAWDMetricsForAllocation:(id)a3 status:(int64_t)a4 hasRecipientAccepted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_sendAWDMetricsForAllocation:status:hasRecipientAccepted: called",  buf,  2u);
  }

  signed int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 responses]);
  id v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 appID]);
    }

    else
    {
      uint64_t v14 = &stru_100912B50;
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
      id v21 = [v20 requestLength];
    }

    else
    {
      id v21 = 0LL;
    }

    id v22 = objc_alloc(&OBJC_CLASS___IDSQRAllocationMetric);
    [v8 duration];
    id v24 = [v22 initWithDuration:(unint64_t)v23 result:a4 hasRecipientAccepted:v5 payloadSize:v21 topic:v14 service:v14];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
    [v25 logMetric:v24];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getIDSAWDLoggingInstance](self, "_getIDSAWDLoggingInstance"));
    [v8 duration];
    [v26 IDSQRAllocation:(unint64_t)v27 result:a4 hasRecipientAccepted:v5 payloadSize:v21 topic:v14 service:v14];

    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionIDStr]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v28 sessionWithUniqueID:v29]);

    if (v30)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v8 request]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 allocateProtocolVersion]);
      -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v33,  IDSDSessionReportQRVersionKey);

      -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100947890,  IDSDSessionReportQREventSubTypeKey);
      [v8 duration];
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v34,  IDSDSessionReportDurationKey);

      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
      -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v35,  IDSDSessionReportResultCodeKey);

      [v30 addQREventForRTCReport:Mutable];
    }

    else
    {
      uint64_t v36 = OSLogHandleForTransportCategory("QRAllocator");
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", v40, 2u);
      }

      uint64_t v39 = os_log_shim_legacy_logging_enabled(v38);
      if ((_DWORD)v39)
      {
        if (_IDSShouldLogTransport(v39))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"Invalid session. Skip AWD report");
        }
      }
    }
  }

  else
  {
    uint64_t v15 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "missing response. Skip AWD report", v41, 2u);
    }

    uint64_t v18 = os_log_shim_legacy_logging_enabled(v17);
    if ((_DWORD)v18)
    {
      if (_IDSShouldLogTransport(v18))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"missing response. Skip AWD report");
      }
    }
  }
}

- (id)_getStatusMessageFromStatusCode:(unint64_t)a3
{
  if ((uint64_t)a3 > 5040)
  {
    if (a3 == 5041)
    {
      return @"BadSessionToken";
    }

    else if (a3 == 5042)
    {
      return @"ExpiredSessionToken";
    }

    else
    {
      return @"Unknown status";
    }
  }

  else
  {
    switch(a3)
    {
      case 0x1389uLL:
        id result = @"ServerInternalError";
        break;
      case 0x138AuLL:
      case 0x138DuLL:
      case 0x138EuLL:
      case 0x138FuLL:
        return @"Unknown status";
      case 0x138BuLL:
        id result = @"BadRequest";
        break;
      case 0x138CuLL:
        id result = @"ServerBusy";
        break;
      case 0x1390uLL:
        id result = @"MissingRequiredKey";
        break;
      default:
        if (a3) {
          return @"Unknown status";
        }
        id result = @"Success";
        break;
    }
  }

  return result;
}

- (void)_startQRConnectionForSession:(id)a3 isInitiatorsAcceptedSession:(BOOL)a4 withLocalInterfacePreference:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = (const __CFDictionary *)a3;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    signed int v10 = @"NO";
    if (v6) {
      signed int v10 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v76 = v10;
    __int16 v77 = 2112;
    id v78 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_startQRConnectionForSession:isInitiatorsAcceptedSession: called {isInitiator: %@} sessionInfo %@",  buf,  0x16u);
  }

  if (-[IDSQuickRelayAllocator _hasSessionInfoRequiredKeys:](self, "_hasSessionInfoRequiredKeys:", v8))
  {
    Value = 0LL;
    uint64_t v12 = (const __CFString *)kIDSQRAllocateKey_RequestID;
    if (v8 && kIDSQRAllocateKey_RequestID) {
      Value = (void *)CFDictionaryGetValue(v8, kIDSQRAllocateKey_RequestID);
    }
    key = Value;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v8, "objectForKey:", kIDSQRAllocateKey_IDSSessionID));
    uint64_t v14 = (__CFString *)v13;
    if (key)
    {
      if (v13
        || (id v22 = self->_requestIDToSession) != 0LL
        && (uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)v22, key)) != 0LL)
      {
        if ((-[__CFString isEqualToString:](v14, "isEqualToString:", kIDSDefaultPairedDeviceID) & 1) != 0
          || (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v8, "objectForKey:", kIDSQRAllocateKey_AppID)),
              unsigned __int8 v16 = [v15 isEqualToString:IDSRegistrationServiceTypeCloudMessaging],
              v15,
              (v16 & 1) != 0))
        {
          id v73 = 0LL;
          int v17 = 1;
        }

        else
        {
          id v73 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _findSessionWithID:](self, "_findSessionWithID:", v14));
          int v17 = 0;
        }

        uint64_t v27 = objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationForSessionID:requestIDStr:]( self,  "_findAllocationForSessionID:requestIDStr:",  v14,  key));
        id v28 = (void *)v27;
        if (v73)
        {
          if (!v27) {
            -[IDSQuickRelayAllocator _sendAWDMetricsForAllocation:status:hasRecipientAccepted:]( self,  "_sendAWDMetricsForAllocation:status:hasRecipientAccepted:",  0LL,  0LL,  1LL);
          }
          uint64_t v72 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v8, "objectForKey:", kIDSQRAllocateKey_GroupID));
          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v8, "objectForKey:", kIDSQRAllocateKey_AllocateType));
          uint64_t v29 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v73 uniqueID]);
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v28 connectReadyHandler]);
            id v33 = objc_retainBlock(v32);
            unsigned int v34 = [v73 shouldConnectToQRServer];
            uint64_t v35 = @"NO";
            *(_DWORD *)buf = 138413058;
            uint64_t v76 = v31;
            __int16 v77 = 2048;
            if (v34) {
              uint64_t v35 = @"YES";
            }
            id v78 = (const __CFDictionary *)v28;
            __int16 v79 = 2048;
            id v80 = v33;
            __int16 v81 = 2112;
            __int16 v82 = v35;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "passed sessionInfo to IDSSession ID %@ to connect, allocation: %p, %p, session should connectToQRServer: %@",  buf,  0x2Au);
          }

          uint64_t v37 = os_log_shim_legacy_logging_enabled(v36);
          if ((_DWORD)v37 && _IDSShouldLogTransport(v37))
          {
            uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue([v73 uniqueID]);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v28 connectReadyHandler]);
            id v40 = [v73 shouldConnectToQRServer] ? @"YES" : @"NO";
            uint64_t v69 = v39;
            id v70 = v40;
            uint64_t v66 = v38;
            uint64_t v68 = v28;
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"passed sessionInfo to IDSSession ID %@ to connect, allocation: %p, %p, session should connectToQRServer: %@");

            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "uniqueID", v38, v28, v39, v70));
              __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v28 connectReadyHandler]);
              else {
                uint64_t v43 = @"NO";
              }
              uint64_t v69 = v42;
              id v70 = (__CFString *)v43;
              uint64_t v66 = v41;
              uint64_t v68 = v28;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"passed sessionInfo to IDSSession ID %@ to connect, allocation: %p, %p, session should connectToQRServer: %@");
            }
          }

          if (!v28
            || (__int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v28 connectReadyHandler]),
                BOOL v45 = v44 == 0LL,
                v44,
                v45)
            || (uint64_t v46 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v28 connectReadyHandler]),
                ((void (**)(void, void, const __CFDictionary *))v46)[2](v46, 0LL, v8),
                v46,
                [v28 setConnectReadyHandler:0],
                -[NSMutableSet containsObject:]( self->_pendingRecipientsAcceptedSessions,  "containsObject:",  v14)))
          {
            objc_msgSend(v73, "setShouldConnectToQRServer:", 0, v66, v68, v69, v70);
            [v73 connectQRServer:v8 withPreferredLocalInterface:v5];
          }

          if (v72 && v71 && [v71 intValue] == 3)
          {
            uint64_t v47 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_allocateResponses, "objectForKey:", v72));
            double v48 = (void *)v47;
            if (v47)
            {
              *(void *)(v47 + 16) = -1LL;
            }

            else
            {
              uint64_t v60 = OSLogHandleForTransportCategory("QRAllocator");
              uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v76 = v72;
                _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "failed to find response for groupID %@",  buf,  0xCu);
              }

              uint64_t v63 = os_log_shim_legacy_logging_enabled(v62);
              if ((_DWORD)v63)
              {
                if (_IDSShouldLogTransport(v63))
                {
                  _IDSLogTransport(@"QRAllocator", @"IDS", @"failed to find response for groupID %@");
                  if (_IDSShouldLog(0LL, @"QRAllocator")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"failed to find response for groupID %@");
                  }
                }
              }
            }
          }

          if (v6)
          {
            id v64 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v8, "objectForKey:", kIDSQRAllocateKey_RelaySessionID));
            [v73 setAcceptedRelaySession:v64];
          }

          requestIDToSession = self->_requestIDToSession;
          if (requestIDToSession) {
            CFDictionaryRemoveValue((CFMutableDictionaryRef)requestIDToSession, key);
          }
        }

        else
        {
          uint64_t v49 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v76 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "cannot find existing IDSSession %@ to start a connection",  buf,  0xCu);
          }

          uint64_t v52 = os_log_shim_legacy_logging_enabled(v51);
          if ((_DWORD)v52)
          {
            if (_IDSShouldLogTransport(v52))
            {
              uint64_t v66 = v14;
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"cannot find existing IDSSession %@ to start a connection");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v66 = v14;
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"cannot find existing IDSSession %@ to start a connection");
              }
            }
          }

          objc_msgSend(v28, "setConnectReadyHandler:", 0, v66);
          if (v17)
          {
            uint64_t v53 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKey:]( v8,  "objectForKey:",  kIDSQRAllocateKey_RemoteDeviceIDKey));
            if (!v53) {
              uint64_t v53 = v14;
            }
            uint64_t v54 = OSLogHandleForTransportCategory("QRAllocator");
            uint64_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v76 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "bring up GlobalLink link for cloud messaging to %@",  buf,  0xCu);
            }

            uint64_t v57 = os_log_shim_legacy_logging_enabled(v56);
            if ((_DWORD)v57)
            {
              if (_IDSShouldLogTransport(v57))
              {
                id v67 = v53;
                _IDSLogTransport( @"QRAllocator",  @"IDS",  @"bring up GlobalLink link for cloud messaging to %@");
                if (_IDSShouldLog(0LL, @"QRAllocator"))
                {
                  id v67 = v53;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"bring up GlobalLink link for cloud messaging to %@");
                }
              }
            }

            id v58 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunController sharedInstance](&OBJC_CLASS___IDSUTunController, "sharedInstance", v67));
            [v58 connectGlobalLinkForDevice:v53 sessionInfo:v8 connectReadyHandler:0 withLocalInterfacePreference:0];

            uint64_t v59 = self->_requestIDToSession;
            if (v59) {
              CFDictionaryRemoveValue((CFMutableDictionaryRef)v59, key);
            }
          }

          -[IDSQuickRelayAllocator _sendAWDMetricsForAllocation:status:hasRecipientAccepted:]( self,  "_sendAWDMetricsForAllocation:status:hasRecipientAccepted:",  v28,  0LL,  0LL);
        }
      }

      else
      {
        uint64_t v23 = OSLogHandleForTransportCategory("QRAllocator");
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v76 = key;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "No IDSSessionID found for this requestID %@, bailing...",  buf,  0xCu);
        }

        uint64_t v26 = os_log_shim_legacy_logging_enabled(v25);
        if ((_DWORD)v26)
        {
          if (_IDSShouldLogTransport(v26))
          {
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"No IDSSessionID found for this requestID %@, bailing...");
            if (_IDSShouldLog(0LL, @"QRAllocator")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"No IDSSessionID found for this requestID %@, bailing...");
            }
          }
        }

        uint64_t v14 = 0LL;
      }
    }

    else
    {
      uint64_t v18 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v76 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " is missing %@, bailling...", buf, 0xCu);
      }

      uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
      if ((_DWORD)v21)
      {
        if (_IDSShouldLogTransport(v21))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @" is missing %@, bailling...");
        }
      }
    }
  }
}

- (id)_findSessionWithID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionWithUniqueID:v3]);

  return v5;
}

- (void)_storeMappingFromPushTokenToURIs:(id)a3 fromID:(id)a4 service:(id)a5 cert:(id)a6 forGroup:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "_storeMappingFromPushTokenToURIs:fromURI:service:cert:forGroup: called {groupID: %@}",  buf,  0xCu);
  }

  uint64_t v32 = v16;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pushTokenToURIForGroup,  "objectForKeyedSubscript:",  v16));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _peerIDManager](self, "_peerIDManager"));
  uint64_t v35 = v13;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v13,  v14));
  uint64_t v36 = v12;
  id v33 = v15;
  unsigned int v34 = v14;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( [v19 sessionTokensForURIs:v12 fromURI:v20 service:v14 fromIdentity:v15 includeSelfDevice:1 fullyRemoveSelfDevice:0]);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = v21;
  id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v23]);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"push-tokens"]);
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v41;
          do
          {
            for (j = 0LL; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)j);
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v23 prefixedURI]);
              [v18 setObject:v31 forKeyedSubscript:v30];
            }

            id v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }

          while (v27);
        }
      }

      id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v38);
  }
}

- (id)_uriToParticipantID:(id)a3
{
  uint64_t v29 = (NSMutableDictionary *)a3;
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v41 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "_uriToParticipantID: called sessionInfo %@",  buf,  0xCu);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_GroupID));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v29,  "objectForKeyedSubscript:",  kIDSQRAllocateKey_Allocations));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pushTokenToURIForGroup,  "objectForKeyedSubscript:",  v28));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    uint64_t v31 = *(void *)v36;
    uint64_t v7 = kIDSQRAllocateKey_RecipientPushToken;
    uint64_t v8 = kIDSQRAllocateKey_RecipientID;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        signed int v10 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v11]);
        if (!v13)
        {
          uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            pushTokenToURIForGroup = self->_pushTokenToURIForGroup;
            *(_DWORD *)buf = 138412290;
            __int128 v41 = pushTokenToURIForGroup;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "there is no URI list yet. stopped converting URI to Participant ID - %@",  buf,  0xCu);
          }

          uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
          if ((_DWORD)v25)
          {
            if (_IDSShouldLogTransport(v25))
            {
              _IDSLogTransport( @"QRAllocator",  @"IDS",  @"there is no URI list yet. stopped converting URI to Participant ID - %@");
              if (_IDSShouldLog(0LL, @"QRAllocator")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"there is no URI list yet. stopped converting URI to Participant ID - %@");
              }
            }
          }

          id v19 = 0LL;
          uint64_t v20 = obj;
          goto LABEL_21;
        }

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v13]);
        BOOL v15 = v14 == 0LL;

        if (v15)
        {
          id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          [v5 setObject:v16 forKeyedSubscript:v13];
        }

        int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v13]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v12 unsignedLongLongValue]));
        [v17 addObject:v18];
      }

      id v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10029E034;
  v33[3] = &unk_1008FF740;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v34 = v19;
  [v5 enumerateKeysAndObjectsUsingBlock:v33];
  uint64_t v20 = v34;
LABEL_21:

  return v19;
}

- (id)getRelaySessionIDForIDSSessionID:(id)a3 pushToken:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v27;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "getRelaySessionIDForIDSSessionID:pushToken: called {sessionID: %@, pushToken: %@}",  buf,  0x16u);
  }

  im_assert_primary_base_queue(v8, v9);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v27));
  if ([v11 count])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pushTokenToQRSessionID]);
          uint64_t v18 = v17;
          if (v17) {
            BOOL v19 = v6 != 0LL;
          }
          else {
            BOOL v19 = 0;
          }
          if (v19)
          {
            uint64_t v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v16 pushTokenToQRSessionID]);
            uint64_t v21 = (id)CFDictionaryGetValue(v20, v6);

            if (v21)
            {
              os_unfair_lock_unlock(p_lock);

              goto LABEL_27;
            }
          }

          else
          {
          }
        }

        id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v13);
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_idsSessionIDToqrSessionID, "objectForKey:", v27));
    if (v21) {
      goto LABEL_27;
    }
  }

  uint64_t v22 = OSLogHandleForTransportCategory("QRAllocator");
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "failed to find allocation for session %@",  buf,  0xCu);
  }

  uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
  if ((_DWORD)v25)
  {
    if (_IDSShouldLogTransport(v25))
    {
      _IDSLogTransport(@"QRAllocator", @"IDS", @"failed to find allocation for session %@");
    }
  }

  uint64_t v21 = 0LL;
LABEL_27:

  return v21;
}

- (id)getPushTokenForRelaySessionID:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "getPushTokenForRelaySessionID:relaySessionID called {sessionID: %@, relaySessionID: %@}",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _filterSelfAllocationsForSessionID:]( self,  "_filterSelfAllocationsForSessionID:",  v6));
  if ([v9 count])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * (void)v14) pushTokenToQRSessionID]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeysForObject:v7]);

          if ([v16 count])
          {
            os_unfair_lock_unlock(p_lock);
            int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

            goto LABEL_21;
          }

          uint64_t v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v18 = OSLogHandleForTransportCategory("QRAllocator");
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "failed to find allocation for session %@",  buf,  0xCu);
    }

    uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
    if ((_DWORD)v21)
    {
      if (_IDSShouldLogTransport(v21))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"failed to find allocation for session %@");
      }
    }
  }

  int v17 = 0LL;
LABEL_21:

  return v17;
}

- (void)requestAllocationForRecipient:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue(v4, v5);
  id value = v4;
  uint64_t v6 = OSLogHandleForTransportCategory("QRAllocator");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v70 = (__CFDictionary *)v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "IDSSession ID %@ requested for a QR allocation",  buf,  0xCu);
  }

  uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
  if ((_DWORD)v9)
  {
    if (_IDSShouldLogTransport(v9))
    {
      uint64_t v53 = (__CFDictionary *)v4;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"IDSSession ID %@ requested for a QR allocation");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        uint64_t v53 = (__CFDictionary *)v4;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"IDSSession ID %@ requested for a QR allocation");
      }
    }
  }

  if (v4)
  {
    CFMutableDictionaryRef theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _parseQuickRelayDefaults:gropuID:]( self,  "_parseQuickRelayDefaults:gropuID:",  v4,  0LL));
    if (theDict)
    {
      uint64_t v10 = OSLogHandleForTransportCategory("QRAllocator");
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v70 = theDict;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "use QR session info from user defaults: %@.",  buf,  0xCu);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          uint64_t v53 = theDict;
          _IDSLogTransport(@"QRAllocator", @"IDS", @"use QR session info from user defaults: %@.");
          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            uint64_t v53 = theDict;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"use QR session info from user defaults: %@.");
          }
        }
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID", v53));
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUIDString]);

      if (v15)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_RequestID, v15);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1006A6704();
      }

      CFDictionarySetValue(theDict, kIDSQRAllocateKey_IDSSessionID, value);
      CFDictionarySetValue(theDict, kIDSQRAllocateKey_isInitiator, &__kCFBooleanFalse);
      -[IDSQuickRelayAllocator _startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:]( self,  "_startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:",  theDict,  0LL,  0LL);
    }

    else
    {
      os_unfair_lock_lock(&self->_lock);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v4));
      uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      id v22 = v20;
      id v23 = [v22 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v66;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v66 != v24) {
              objc_enumerationMutation(v22);
            }
            __int128 v26 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "responses", v53));
            id v28 = [v27 countByEnumeratingWithState:&v61 objects:v74 count:16];
            if (v28)
            {
              uint64_t v29 = *(void *)v62;
              do
              {
                for (j = 0LL; j != v28; j = (char *)j + 1)
                {
                  if (*(void *)v62 != v29) {
                    objc_enumerationMutation(v27);
                  }
                  if (v21)
                  {
                    id v31 = *(const void **)(*((void *)&v61 + 1) + 8LL * (void)j);
                    if (v31) {
                      CFArrayAppendValue((CFMutableArrayRef)v21, v31);
                    }
                  }
                }

                id v28 = [v27 countByEnumeratingWithState:&v61 objects:v74 count:16];
              }

              while (v28);
            }
          }

          id v23 = [v22 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }

        while (v23);
      }

      os_unfair_lock_unlock(&self->_lock);
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      uint64_t v32 = v21;
      id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v57,  v73,  16LL);
      if (v33)
      {
        uint64_t v34 = *(void *)v58;
        __int16 v35 = (const void *)kIDSQRAllocateKey_RelaySessionID;
        do
        {
          for (k = 0LL; k != v33; k = (char *)k + 1)
          {
            if (*(void *)v58 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)k);
            if (v37) {
              BOOL v38 = v35 == 0LL;
            }
            else {
              BOOL v38 = 1;
            }
            if (v38)
            {
              uint64_t v39 = 0LL;
            }

            else
            {
              __int128 v40 = (id)CFDictionaryGetValue( *(CFDictionaryRef *)(*((void *)&v57 + 1) + 8LL * (void)k),  v35);
              uint64_t v39 = v40;
              if (v40)
              {
                uint64_t v41 = OSLogHandleForTransportCategory("QRAllocator");
                __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v70 = (__CFDictionary *)value;
                  __int16 v71 = 2112;
                  uint64_t v72 = v39;
                  _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "found a pending QR allocation for IDSSession %@ with QR session ID %@",  buf,  0x16u);
                }

                uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
                if ((_DWORD)v44)
                {
                  if (_IDSShouldLogTransport(v44))
                  {
                    uint64_t v53 = (__CFDictionary *)value;
                    uint64_t v54 = v39;
                    _IDSLogTransport( @"QRAllocator",  @"IDS",  @"found a pending QR allocation for IDSSession %@ with QR session ID %@");
                    if (_IDSShouldLog(0LL, @"QRAllocator"))
                    {
                      uint64_t v53 = (__CFDictionary *)value;
                      uint64_t v54 = v39;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"found a pending QR allocation for IDSSession %@ with QR session ID %@");
                    }
                  }
                }
              }
            }

            -[IDSQuickRelayAllocator _startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:]( self,  "_startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:",  v37,  0LL,  0LL,  v53,  v54);
          }

          id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v57,  v73,  16LL);
        }

        while (v33);
      }

      else
      {

        uint64_t v45 = OSLogHandleForTransportCategory("QRAllocator");
        __int128 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = (__CFDictionary *)value;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "there's no pending QR allocation for IDSSession %@",  buf,  0xCu);
        }

        uint64_t v48 = os_log_shim_legacy_logging_enabled(v47);
        if ((_DWORD)v48)
        {
          if (_IDSShouldLogTransport(v48))
          {
            uint64_t v53 = (__CFDictionary *)value;
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"there's no pending QR allocation for IDSSession %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              uint64_t v53 = (__CFDictionary *)value;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"there's no pending QR allocation for IDSSession %@");
            }
          }
        }
      }

      pendingRecipientsAcceptedSessions = self->_pendingRecipientsAcceptedSessions;
      if (!pendingRecipientsAcceptedSessions)
      {
        uint64_t v50 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        uint64_t v52 = self->_pendingRecipientsAcceptedSessions;
        p_pendingRecipientsAcceptedSessions = &self->_pendingRecipientsAcceptedSessions;
        *p_pendingRecipientsAcceptedSessions = v50;

        pendingRecipientsAcceptedSessions = *p_pendingRecipientsAcceptedSessions;
      }

      -[NSMutableSet addObject:](pendingRecipientsAcceptedSessions, "addObject:", value, v53);
    }
  }

  else
  {
    uint64_t v16 = OSLogHandleForTransportCategory("QRAllocator");
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "missing sessionID in requestAllocationForRecipient",  buf,  2u);
    }

    uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
    if ((_DWORD)v19)
    {
      if (_IDSShouldLogTransport(v19))
      {
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"missing sessionID in requestAllocationForRecipient");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"missing sessionID in requestAllocationForRecipient");
        }
      }
    }
  }
}

- (void)setInitiatorsAcceptedToken:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "setInitiatorsAcceptedToken:pushToken: called {pushToken: %@}",  buf,  0xCu);
  }

  im_assert_primary_base_queue(v9, v10);
  if (v6 && v7)
  {
    uint64_t v11 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "add accepted session %@ with token %@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"add accepted session %@ with token %@");
      }
    }

    if (!self->_initiatorsAcceptedSessionsWithToken)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      initiatorsAcceptedSessionsWithToken = self->_initiatorsAcceptedSessionsWithToken;
      self->_initiatorsAcceptedSessionsWithToken = Mutable;
    }

    CFDictionarySetValue((CFMutableDictionaryRef)self->_initiatorsAcceptedSessionsWithToken, v6, v7);
  }
}

- (int64_t)getServerProviderForIDSSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "getServerProviderForIDSSessionID: called {sessionID: %@}",  (uint8_t *)&v16,  0xCu);
  }

  im_assert_primary_base_queue(v6, v7);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v4));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 responses]);
  uint64_t v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v11 anyObject]);

  os_unfair_lock_unlock(p_lock);
  Value = 0LL;
  if (v12 && kIDSQRAllocateKey_Provider) {
    Value = (void *)CFDictionaryGetValue(v12, kIDSQRAllocateKey_Provider);
  }
  unsigned int v14 = [Value unsignedIntValue];

  return v14;
}

- (void)reportAWDAllocatorEvent:(unsigned int)a3 relayProviderType:(int64_t)a4 transport:(int64_t)a5 localRAT:(unsigned int)a6 duration:(unint64_t)a7 idsSessionID:(id)a8 reportingDataBlob:(id)a9 isInitiator:(BOOL)a10
{
  uint64_t v61 = *(void *)&a3;
  id v57 = a8;
  id v56 = a9;
  uint64_t v11 = OSLogHandleForTransportCategory("QRAllocator");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = _IDSStunTransportStrings[a5];
    uint64_t v14 = IDSRadioAccessTechnologyToString(a6);
    BOOL v15 = @"NO";
    *(_DWORD *)buf = 67110402;
    int v63 = v61;
    if (a10) {
      BOOL v15 = @"YES";
    }
    __int16 v64 = 2080;
    uint64_t v65 = v13;
    __int16 v66 = 2080;
    uint64_t v67 = v14;
    __int16 v68 = 1024;
    int v69 = a7;
    __int16 v70 = 2112;
    id v71 = v57;
    __int16 v72 = 2112;
    id v73 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "report AWD allocator event %u, transport [%s], RAT [%s], duration %u ms, idsSessionID %@, isInitiator:%@",  buf,  0x36u);
  }

  uint64_t v17 = os_log_shim_legacy_logging_enabled(v16);
  if ((_DWORD)v17)
  {
    if (_IDSShouldLogTransport(v17))
    {
      IDSRadioAccessTechnologyToString(a6);
      _IDSLogTransport( @"QRAllocator",  @"IDS",  @"report AWD allocator event %u, transport [%s], RAT [%s], duration %u ms, idsSessionID %@, isInitiator:%@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        IDSRadioAccessTechnologyToString(a6);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"report AWD allocator event %u, transport [%s], RAT [%s], duration %u ms, idsSessionID %@, isInitiator:%@");
      }
    }
  }

  id v18 = objc_alloc(&OBJC_CLASS___IDSQuickRelayMetric);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v61));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a7));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a6));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a10));
  uint64_t v25 = _IDSAllocateProtocolVersionNumber(v24);
  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v27 = [v18 initWithType:&off_100947740 eventSubType:v19 duration:v20 resultCode:0 providerType:v21 transportType:v22 interfaceType:v23 skeEnabled:0 isInitiator:v24  protocolVersion:v26 retryCount:0 serviceName:0 subServiceName:0 participantCount:0];

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v28 logMetric:v27];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getIDSAWDLoggingInstance](self, "_getIDSAWDLoggingInstance"));
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v61));
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a7));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a6));
  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a10));
  uint64_t v36 = _IDSAllocateProtocolVersionNumber(v35);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  [v29 IDSQuickRelayEventType:&off_100947740 eventSubType:v30 duration:v31 resultCode:0 providerType:v32 transportType:v33 interfaceType:v34 skeEnabled:0 isInitia tor:v35 protocolVersion:v37 retryCount:0 serviceName:0 subServiceName:0 participantCount:0];

  BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 sessionWithUniqueID:v57]);

  if (v39)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v41 = _IDSAllocateProtocolVersionNumber(Mutable);
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v42,  IDSDSessionReportQRVersionKey);

    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v61));
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v43,  IDSDSessionReportQREventSubTypeKey);

    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a7));
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v44,  IDSDSessionReportDurationKey);

    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  &off_100947818,  IDSDSessionReportResultCodeKey);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v45,  IDSDSessionReportTransportTypeKey);

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a6));
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v46,  IDSDSessionReportLocalInterfaceTypeKey);

    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v56,  IDSDSessionReportReportingDataBlobKey);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a10));
    -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v47,  IDSDSessionReportIsInitiatorKey);

    if ((_DWORD)v61 == 402 && self->_timeBase)
    {
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v48 timeIntervalSinceDate:self->_timeBase];
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v49 * 1000.0));
      -[__CFDictionary setObject:forKeyedSubscript:]( Mutable,  "setObject:forKeyedSubscript:",  v50,  IDSDSessionTimeDeltaKey);
    }

    [v39 addQREventForRTCReport:Mutable];
  }

  else
  {
    uint64_t v51 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", buf, 2u);
    }

    uint64_t v54 = os_log_shim_legacy_logging_enabled(v53);
    if ((_DWORD)v54)
    {
      if (_IDSShouldLogTransport(v54))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Invalid session. Skip AWD report");
      }
    }
  }
}

- (void)cleanUpCachedMappings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory("QRAllocator");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cleanUpCachedMappings for group %@", buf, 0xCu);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v9 = v4;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"cleanUpCachedMappings for group %@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        id v9 = v4;
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"cleanUpCachedMappings for group %@");
      }
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pushTokenToURIForGroup,  "setObject:forKeyedSubscript:",  0LL,  v4,  v9);
}

- (void)invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4
{
  id v6 = a3;
  uint64_t v8 = im_primary_queue(v6, v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10029FB90;
  block[3] = &unk_1008F7DE0;
  void block[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)_invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4
{
  id v6 = a3;
  im_assert_primary_base_queue(v6, v7);
  uint64_t v8 = OSLogHandleForTransportCategory("QRAllocator");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "invalidate all allocations for IDSSession ID %@",  buf,  0xCu);
  }

  uint64_t v11 = os_log_shim_legacy_logging_enabled(v10);
  if ((_DWORD)v11)
  {
    if (_IDSShouldLogTransport(v11))
    {
      id v14 = v6;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"invalidate all allocations for IDSSession ID %@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        id v14 = v6;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"invalidate all allocations for IDSSession ID %@");
      }
    }
  }

  -[IDSQuickRelayAllocator _removeAllAllocationsForSessionID:](self, "_removeAllAllocationsForSessionID:", v6, v14);
  if (!a4)
  {
    -[NSMutableSet removeObject:](self->_pendingRecipientsAcceptedSessions, "removeObject:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_initiatorsAcceptedSessionsWithToken, "removeObjectForKey:", v6);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_requestIDToSession, "allKeysForObject:", v6));
  -[NSMutableDictionary removeObjectsForKeys:](self->_requestIDToSession, "removeObjectsForKeys:", v12);
  -[NSMutableDictionary removeObjectForKey:](self->_idsSessionIDToqrSessionID, "removeObjectForKey:", v6);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_sessionToRequestIDToAllocateTime, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_allocateResponses, "objectForKey:", v6));
  if (v13)
  {
    if (qword_1009C0898 != -1) {
      dispatch_once(&qword_1009C0898, &stru_1008FF788);
    }
    v13[2] = mach_absolute_time() * dword_1009C0890 / *(unsigned int *)algn_1009C0894 / 0x3B9ACA00 + 1800;
    -[IDSQuickRelayAllocator _startCleanupTimer](self, "_startCleanupTimer");
  }
}

- (void)invalidateAllocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "invalidateAllocation: called", buf, 2u);
  }

  uint64_t v8 = im_primary_queue(v6, v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10029FEC8;
  v11[3] = &unk_1008F5F80;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(v9, v11);
}

- (void)_addAllocationForSession:(id)a3 allocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionWithUniqueID:v6]);

  unsigned int v10 = [v9 sharedSessionHasJoined];
  uint64_t v11 = OSLogHandleForTransportCategory("QRAllocator");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = @"NO";
    if (v10) {
      BOOL v13 = @"YES";
    }
    *(_DWORD *)buf = 138412802;
    id v21 = v6;
    if (!v7) {
      BOOL v13 = @"invalid";
    }
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Add allocation For Session: %@, _sharedSessionHasJoined=%@, %@",  buf,  0x20u);
  }

  uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
  if ((_DWORD)v15)
  {
    if (_IDSShouldLogTransport(v15))
    {
      _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Add allocation For Session: %@, _sharedSessionHasJoined=%@, %@");
      if (_IDSShouldLog(0LL, @"QRAllocator")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Add allocation For Session: %@, _sharedSessionHasJoined=%@, %@");
      }
    }
  }

  os_unfair_lock_lock(&self->_lock);
  id v16 = (__CFArray *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v6));
  if (v16)
  {
    if (!v7) {
      goto LABEL_18;
    }
LABEL_16:
    if (v16) {
      CFArrayAppendValue(v16, v7);
    }
    goto LABEL_18;
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v7) {
    goto LABEL_16;
  }
LABEL_18:
  if (!self->_sessionToAllocations)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    sessionToAllocations = self->_sessionToAllocations;
    self->_sessionToAllocations = Mutable;
  }

  __int16 v19 = v16;
  if (v16)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionToAllocations, v6, v19);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6804();
  }

  os_unfair_lock_unlock(&self->_lock);
LABEL_25:
}

- (void)_discardAllocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionIDStr]);
    id v7 = -[NSString initWithString:](v5, "initWithString:", v6);

    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v7));
    uint64_t v9 = OSLogHandleForTransportCategory("QRAllocator");
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v7;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Discard allocation For Session: %@, %@",  buf,  0x16u);
    }

    uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
    if ((_DWORD)v12)
    {
      if (_IDSShouldLogTransport(v12))
      {
        id v21 = v7;
        id v22 = v4;
        _IDSLogTransport(@"QRAllocator", @"IDS", @"Discard allocation For Session: %@, %@");
        if (_IDSShouldLog(0LL, @"QRAllocator"))
        {
          id v21 = v7;
          id v22 = v4;
          _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"Discard allocation For Session: %@, %@");
        }
      }
    }

    if (v8)
    {
      [v8 removeObject:v4];
      os_unfair_lock_unlock(&self->_lock);
      if (![v8 count])
      {
        uint64_t v13 = OSLogHandleForTransportCategory("QRAllocator");
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v24 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_invalidateSession: %@", buf, 0xCu);
        }

        uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
        if ((_DWORD)v16)
        {
          if (_IDSShouldLogTransport(v16))
          {
            id v21 = v7;
            _IDSLogTransport(@"QRAllocator", @"IDS", @"_invalidateSession: %@");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              id v21 = v7;
              _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"_invalidateSession: %@");
            }
          }
        }

        -[IDSQuickRelayAllocator _invalidateSession:isExpiryPurging:]( self,  "_invalidateSession:isExpiryPurging:",  v7,  1LL,  v21,  v22);
      }
    }

    else
    {
      os_unfair_lock_unlock(&self->_lock);
      uint64_t v17 = OSLogHandleForTransportCategory("QRAllocator");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "invalid allocationList", buf, 2u);
      }

      uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
      if ((_DWORD)v20)
      {
        if (_IDSShouldLogTransport(v20))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"invalid allocationList");
        }
      }
    }
  }
}

- (void)_removeAllAllocationsForSessionID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v29 = self;
  key = v4;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v4));
  uint64_t v5 = OSLogHandleForTransportCategory("QRAllocator");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v49 = key;
    __int16 v50 = 2112;
    uint64_t v51 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_removeAllAllocationsForSessionID: %@, %@",  buf,  0x16u);
  }

  uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
  if ((_DWORD)v8)
  {
    if (_IDSShouldLogTransport(v8))
    {
      id v27 = key;
      id v28 = v32;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"_removeAllAllocationsForSessionID: %@, %@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        id v27 = key;
        id v28 = v32;
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"_removeAllAllocationsForSessionID: %@, %@");
      }
    }
  }

  uint64_t v9 = v32;
  if (v32)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obj = v32;
    id v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v43;
      uint64_t v10 = kIDSQRAllocateKey_KeepAliveTimer;
      uint64_t v11 = kIDSQRAllocateKey_RelaySessionID;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v43 != v34)
          {
            uint64_t v13 = v12;
            objc_enumerationMutation(obj);
            uint64_t v12 = v13;
          }

          uint64_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          uint64_t v36 = v12;
          uint64_t v37 = v14;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "responses", v27, v28));
          id v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v39;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v39 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
                uint64_t v20 = (dispatch_source_t *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v10, v27));
                if (v20)
                {
                  [v19 removeObjectForKey:v10];
                  dispatch_source_cancel(v20[1]);
                  uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
                  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v11]);
                    *(_DWORD *)buf = 138412290;
                    double v49 = v23;
                    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "keepalive timer stopped for %@",  buf,  0xCu);
                  }

                  uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
                  if ((_DWORD)v25)
                  {
                    if (_IDSShouldLogTransport(v25))
                    {
                      id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v11]);
                      _IDSLogTransport(@"QRAllocator", @"IDS", @"keepalive timer stopped for %@");

                      if (_IDSShouldLog(0LL, @"QRAllocator"))
                      {
                        id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v11, v27));
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"keepalive timer stopped for %@");
                      }
                    }
                  }
                }
              }

              id v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }

            while (v16);
          }

          [v37 cancelAllocationTimeoutTimer];
          uint64_t v12 = v36 + 1;
        }

        while ((id)(v36 + 1) != v35);
        id v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }

      while (v35);
    }

    [obj removeAllObjects];
    uint64_t v9 = v32;
    if (key)
    {
      sessionToAllocations = (__CFDictionary *)v29->_sessionToAllocations;
      if (sessionToAllocations)
      {
        CFDictionaryRemoveValue(sessionToAllocations, key);
        uint64_t v9 = v32;
      }
    }
  }

  os_unfair_lock_unlock(lock);
}

- (id)_filterSelfAllocationsForSessionID:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v4));
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  if ([v6 count])
  {
    unint64_t v8 = 0LL;
    do
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v8]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 request]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allocateType]);
      unsigned int v12 = [v11 intValue];

      if (v12 == 2) {
        -[NSMutableIndexSet addIndex:](v7, "addIndex:", v8);
      }
      ++v8;
    }

    while ((unint64_t)[v6 count] > v8);
  }

  id v13 = [v6 mutableCopy];
  [v13 removeObjectsAtIndexes:v7];
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (id)_findAllocationListForSessionID:(id)a3
{
  Value = 0LL;
  if (a3)
  {
    sessionToAllocations = self->_sessionToAllocations;
    if (sessionToAllocations) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)sessionToAllocations, a3);
    }
  }

  return Value;
}

- (id)_findAllocationForSessionID:(id)a3 requestIDStr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "_findAllocationForSessionID:requestIDStr called {sessionID: %@, requestID: %@}",  buf,  0x16u);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v6));
  uint64_t v11 = v10;
  if (v10)
  {
    id v22 = v6;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 requestIDStr]);
          unsigned __int8 v19 = [v18 isEqualToIgnoringCase:v7];

          if ((v19 & 1) != 0)
          {
            os_unfair_lock_unlock(p_lock);
            id v20 = v17;
            id v6 = v22;
            goto LABEL_17;
          }
        }

        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v6 = v22;
  }

  os_unfair_lock_unlock(p_lock);
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "_findAllocationForSessionID, {sessionID: %@, requestID: %@} not found",  buf,  0x16u);
  }

  id v20 = 0LL;
LABEL_17:

  return v20;
}

- (id)_parseQuickRelayDefaults:(id)a3 gropuID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = IMGetDomainValueForKey(@"com.apple.ids", @"FixedQuickRelayServerAddress");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@":"]);
  if ([v10 count] == (id)2)
  {
    v93[0] = 0xAAAAAAAAAAAAAAAALL;
    v93[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v87 = (NSData *) objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);
    if (inet_pton(2, (const char *)-[NSData UTF8String](v87, "UTF8String"), (char *)v93 + 4) == 1)
    {
      id v84 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  (char *)v93 + 4,  4LL);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:1]);
      unsigned __int16 v83 = (unsigned __int16)[v11 integerValue];

      uint64_t v12 = OSLogHandleForTransportCategory("QRAllocator");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v90 = v87;
        __int16 v91 = 1024;
        LODWORD(v92) = v83;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "decoded relay-server-address %@:%u",  buf,  0x12u);
      }

      uint64_t v15 = os_log_shim_legacy_logging_enabled(v14);
      if ((_DWORD)v15)
      {
        if (_IDSShouldLogTransport(v15))
        {
          id v78 = v87;
          uint64_t v79 = v83;
          _IDSLogTransport(@"QRAllocator", @"IDS", @"decoded relay-server-address %@:%u");
          if (_IDSShouldLog(0LL, @"QRAllocator"))
          {
            id v78 = v87;
            uint64_t v79 = v83;
            _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"decoded relay-server-address %@:%u");
          }
        }
      }

      uint64_t v16 = IMGetDomainValueForKey(@"com.apple.ids", @"FixedQuickRelaySessionID");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v85 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v17,  0LL);
      if ((id)-[NSData length](v85, "length") == (id)16)
      {
        id v18 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", -[NSData bytes](v85, "bytes"));
      }

      else
      {
        uint64_t v24 = OSLogHandleForTransportCategory("QRAllocator");
        __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          NSUInteger v26 = -[NSData length](v85, "length");
          *(_DWORD *)buf = 134218240;
          id v90 = (NSData *)v26;
          __int16 v91 = 2048;
          uint64_t v92 = 16LL;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Warning: [decodedUUIDData length]: %lu != sizeof(uuid_t): %lu",  buf,  0x16u);
        }

        uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
        if ((_DWORD)v28)
        {
          if (_IDSShouldLogTransport(v28))
          {
            id v78 = -[NSData length](v85, "length");
            uint64_t v79 = 16LL;
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Warning: [decodedUUIDData length]: %lu != sizeof(uuid_t): %lu");
            if (_IDSShouldLog(0LL, @"QRAllocator"))
            {
              id v78 = -[NSData length](v85, "length", v78, 16LL);
              uint64_t v79 = 16LL;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Warning: [decodedUUIDData length]: %lu != sizeof(uuid_t): %lu");
            }
          }
        }

        id v18 = 0LL;
      }

      id v80 = v18;
      id v86 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v18, "UUIDString", v78, v79));
      uint64_t v29 = OSLogHandleForTransportCategory("QRAllocator");
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v90 = v86;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "decoded base64 relay-session-id %@",  buf,  0xCu);
      }

      uint64_t v32 = os_log_shim_legacy_logging_enabled(v31);
      if ((_DWORD)v32)
      {
        if (_IDSShouldLogTransport(v32))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"decoded base64 relay-session-id %@");
        }
      }

      uint64_t v33 = IMGetDomainValueForKey(@"com.apple.ids", @"FixedQuickRelaySessionToken");
      __int16 v82 = (void *)objc_claimAutoreleasedReturnValue(v33);
      uint64_t v34 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v82,  0LL);
      uint64_t v35 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v90 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "decoded base64 relay-session-token %@",  buf,  0xCu);
      }

      uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
      if ((_DWORD)v38)
      {
        if (_IDSShouldLogTransport(v38))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"decoded base64 relay-session-token %@");
        }
      }

      uint64_t v39 = IMGetDomainValueForKey(@"com.apple.ids", @"FixedQuickRelaySessionKey");
      __int16 v81 = (void *)objc_claimAutoreleasedReturnValue(v39);
      __int128 v40 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v81,  0LL);
      uint64_t v41 = OSLogHandleForTransportCategory("QRAllocator");
      __int128 v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v90 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "decoded base64 relay-session-key %@",  buf,  0xCu);
      }

      uint64_t v44 = os_log_shim_legacy_logging_enabled(v43);
      if ((_DWORD)v44)
      {
        if (_IDSShouldLogTransport(v44))
        {
          _IDSLogTransport(@"QRAllocator", @"IDS", @"decoded base64 relay-session-key %@");
        }
      }

      if (v84 && v83 && v86 && v34 && v40)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        __int128 v46 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", ids_monotonic_time(Mutable));
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (v47)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_SessionAllocationTime, v47);
        }

        else
        {
          id v52 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6900();
          }
        }

        uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        if (v53)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RequestID, v53);
        }

        else
        {
          id v54 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6704();
          }
        }

        id v55 = v6;
        if (v55)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IDSSessionID, v55);
        }

        else
        {
          id v56 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6684();
          }
        }

        id v57 = v7;
        if (v57) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_GroupID, v57);
        }

        *(_WORD *)buf = 769;
        buf[2] = 0;
        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 3LL));
        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getCombinedSoftwareID:](self, "_getCombinedSoftwareID:", v58));

        id v60 = v59;
        if (v60) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayCombinedSoftwareID, v60);
        }

        uint64_t v61 = v84;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayAddress, v61);

        __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v83));
        if (v62)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayPort, v62);
        }

        else
        {
          id v63 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6408();
          }
        }

        __int16 v64 = v86;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionID, v64);

        uint64_t v65 = v34;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionToken, v65);

        __int16 v66 = v40;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionKey, v66);

        uint64_t v68 = _IDSAllocateProtocolVersionNumber(v67);
        int v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
        if (v69)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateProtocolVersion, v69);
        }

        else
        {
          id v70 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6604();
          }
        }

        id v71 = kIDSQuickRelayPushTopic;
        if (v71)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v71);
        }

        else
        {
          id v72 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1006A6880();
          }
        }

        uint64_t v73 = OSLogHandleForTransportCategory("QRAllocator");
        id v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v88 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  " using preallocated tokens from user defaults",  v88,  2u);
        }

        uint64_t v76 = os_log_shim_legacy_logging_enabled(v75);
        if ((_DWORD)v76)
        {
          if (_IDSShouldLogTransport(v76))
          {
            _IDSLogTransport(@"QRAllocator", @"IDS", @" using preallocated tokens from user defaults");
            if (_IDSShouldLog(0LL, @"QRAllocator")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @" using preallocated tokens from user defaults");
            }
          }
        }
      }

      else
      {
        uint64_t v48 = OSLogHandleForTransportCategory("QRAllocator");
        double v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Missing a defaults for hardcoded QR session info",  buf,  2u);
        }

        uint64_t v51 = os_log_shim_legacy_logging_enabled(v50);
        if ((_DWORD)v51)
        {
          if (_IDSShouldLogTransport(v51))
          {
            _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Missing a defaults for hardcoded QR session info");
            if (_IDSShouldLog(0LL, @"QRAllocator")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Missing a defaults for hardcoded QR session info");
            }
          }
        }

        CFMutableDictionaryRef Mutable = 0LL;
      }

      unsigned __int8 v19 = Mutable;
    }

    else
    {
      uint64_t v20 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "faied to get address in FixedQuickRelayServerAddress defaults",  buf,  2u);
      }

      uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
      if ((_DWORD)v23)
      {
        if (_IDSShouldLogTransport(v23))
        {
          _IDSLogTransport( @"QRAllocator",  @"IDS",  @"faied to get address in FixedQuickRelayServerAddress defaults");
          if (_IDSShouldLog(0LL, @"QRAllocator")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"faied to get address in FixedQuickRelayServerAddress defaults");
          }
        }
      }

      unsigned __int8 v19 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v19 = 0LL;
  }

  return v19;
}

- (void)enablePushHandler:(BOOL)a3
{
  uint64_t v5 = im_primary_queue(self, a2);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002A1B58;
  v7[3] = &unk_1008F6418;
  BOOL v8 = a3;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (unint64_t)getLocalParticipantIDForRelaySessionID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessionToLocalParticipantID, "objectForKey:", a3));
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "handler:didReceiveMessage:forTopic:fromID:messageContext: called",  buf,  2u);
  }

  im_assert_primary_base_queue(v18, v19);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
  id v22 = sub_10028D3BC(v21, v13, @"c");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  unsigned int v24 = [v23 intValue];

  if (v24 == 255)
  {
    -[IDSQuickRelayAllocator _processAllocationStatusResult:](self, "_processAllocationStatusResult:", v13);
  }

  else if (v24 == 200)
  {
    -[IDSQuickRelayAllocator _handleIncomingAllocateResponse:isFromCache:requestOptions:]( self,  "_handleIncomingAllocateResponse:isFromCache:requestOptions:",  v13,  0LL,  0LL);
  }

  else
  {
    uint64_t v25 = OSLogHandleForTransportCategory("QRAllocator");
    NSUInteger v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "received an unexpected message %@",  buf,  0xCu);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      if (_IDSShouldLogTransport(v28))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"received an unexpected message %@");
      }
    }
  }
}

- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForTransportCategory("QRAllocator");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "receivedOfflineMessagePendingForTopic: %@",  buf,  0xCu);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      id v15 = v8;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"receivedOfflineMessagePendingForTopic: %@");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        id v15 = v8;
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"receivedOfflineMessagePendingForTopic: %@");
      }
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerStorageStateMachine sharedInstance]( &OBJC_CLASS___IDSServerStorageStateMachine,  "sharedInstance",  v15));
  [v14 incomingStorageRequestForTopic:v8 primary:1 messageContext:v9];
}

- (id)_getGroupID:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_getGroupID called", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 request]);
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 groupID]);
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responses", 0));
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      uint64_t v12 = kIDSQRAllocateKey_GroupID;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) objectForKey:v12]);
          if (v14)
          {
            id v7 = (void *)v14;

            goto LABEL_15;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0LL;
  }

- (id)_uuidFromNSStringToNSData:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "_uuidFromNSStringToNSData called",  (uint8_t *)v8,  2u);
  }

  uint64_t v5 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v3);
  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = 0xAAAAAAAAAAAAAAAALL;
  -[NSUUID getUUIDBytes:](v5, "getUUIDBytes:", v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, 16LL));

  return v6;
}

- (id)_getResponse:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v34 = v6;
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuickRelayAllocator _findAllocationListForSessionID:]( self,  "_findAllocationListForSessionID:",  v6));
  if ([v35 count])
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = v35;
    id v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v31)
    {
      uint64_t v8 = *(void *)v41;
      uint64_t v9 = kIDSQRAllocateKey_RelaySessionID;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 responses]);
          id v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v37;
            while (2)
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v37 != v14) {
                  objc_enumerationMutation(v12);
                }
                __int128 v16 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)j);
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v9]);
                unsigned __int8 v18 = [v7 isEqualToString:v17];

                if ((v18 & 1) != 0)
                {
                  os_unfair_lock_unlock(lock);
                  id v23 = v16;

                  goto LABEL_32;
                }
              }

              id v13 = [v12 countByEnumeratingWithState:&v36 objects:v44 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v30;
        }

        id v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        uint64_t v8 = v30;
      }

      while (v31);
    }

    os_unfair_lock_unlock(lock);
    uint64_t v19 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
    }

    uint64_t v22 = os_log_shim_legacy_logging_enabled(v21);
    if ((_DWORD)v22)
    {
      if (_IDSShouldLogTransport(v22))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"no response for %@");
      }
    }
  }

  else
  {
    uint64_t v24 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      sessionToAllocations = self->_sessionToAllocations;
      *(_DWORD *)buf = 138412546;
      id v47 = v6;
      __int16 v48 = 2112;
      double v49 = sessionToAllocations;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Cannot find allocation for session %@, all allocations: %@",  buf,  0x16u);
    }

    uint64_t v28 = os_log_shim_legacy_logging_enabled(v27);
    if ((_DWORD)v28)
    {
      if (_IDSShouldLogTransport(v28))
      {
        _IDSLogTransport( @"QRAllocator",  @"IDS",  @"Cannot find allocation for session %@, all allocations: %@");
        if (_IDSShouldLog(0LL, @"QRAllocator")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"QRAllocator",  @"Cannot find allocation for session %@, all allocations: %@");
        }
      }
    }

    os_unfair_lock_unlock(lock);
  }

  id v23 = 0LL;
LABEL_32:

  return v23;
}

- (void)startKeepAliveTimer:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "startKeepAliveTimer:relaySessionID called - {sessionID: %@, relaySessionID %@}",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponse:relaySessionID:](self, "_getResponse:relaySessionID:", v6, v7));
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = kIDSQRAllocateKey_KeepAliveTimer;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectForKey:kIDSQRAllocateKey_KeepAliveTimer]);
    uint64_t v14 = (void *)v12;
    if (v12) {
      dispatch_source_cancel(*(dispatch_source_t *)(v12 + 8));
    }
    uint64_t v15 = im_primary_queue(v12, v13);
    __int128 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    __int128 v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v16);

    dispatch_time_t v18 = dispatch_time(0LL, 1790000000000LL);
    dispatch_source_set_timer(v17, v18, 0x1A0C4506C00uLL, 0x5F5E100uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002A2BEC;
    handler[3] = &unk_1008F5F80;
    handler[4] = self;
    id v19 = v10;
    id v26 = v19;
    dispatch_source_set_event_handler(v17, handler);
    uint64_t v20 = -[TimerWrapper initWithTimer:](objc_alloc(&OBJC_CLASS___TimerWrapper), "initWithTimer:", v17);
    [v19 setObject:v20 forKey:v11];

    dispatch_resume(v17);
    uint64_t v21 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "keepalive timer started for %@", buf, 0xCu);
    }

    uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
    if ((_DWORD)v24)
    {
      if (_IDSShouldLogTransport(v24))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"keepalive timer started for %@");
      }
    }
  }
}

- (void)stopKeepAliveTimer:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog QRAllocator](&OBJC_CLASS___IDSFoundationLog, "QRAllocator"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "stopKeepAliveTimer:relaySessionID: called {sessionID: %@, relaySessionID %@}",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSQuickRelayAllocator _getResponse:relaySessionID:](self, "_getResponse:relaySessionID:", v6, v7));
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = kIDSQRAllocateKey_KeepAliveTimer;
    uint64_t v12 = (dispatch_source_t *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kIDSQRAllocateKey_KeepAliveTimer]);
    if (v12)
    {
      [v10 removeObjectForKey:v11];
      dispatch_source_cancel(v12[1]);
      uint64_t v13 = OSLogHandleForTransportCategory("QRAllocator");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "keepalive timer stopped for %@", buf, 0xCu);
      }

      uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
      if (!(_DWORD)v16) {
        goto LABEL_18;
      }
      _IDSLogTransport(@"QRAllocator", @"IDS", @"keepalive timer stopped for %@");
      if ((_IDSShouldLog(0LL, @"QRAllocator") & 1) == 0) {
        goto LABEL_18;
      }
      __int128 v17 = @"keepalive timer stopped for %@";
    }

    else
    {
      uint64_t v18 = OSLogHandleForTransportCategory("QRAllocator");
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "keepalive timer not found for %@",  buf,  0xCu);
      }

      uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
      if (!(_DWORD)v21) {
        goto LABEL_18;
      }
      _IDSLogTransport(@"QRAllocator", @"IDS", @"keepalive timer not found for %@");
      if ((_IDSShouldLog(0LL, @"QRAllocator") & 1) == 0) {
        goto LABEL_18;
      }
      __int128 v17 = @"keepalive timer not found for %@";
    }

    _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", v17);
LABEL_18:
  }
}

- (void)_cleanupResponses
{
  if (qword_1009C0898 != -1) {
    dispatch_once(&qword_1009C0898, &stru_1008FF788);
  }
  uint64_t v3 = mach_absolute_time();
  uint64_t v5 = dword_1009C0890;
  unint64_t v4 = *(unsigned int *)algn_1009C0894;
  id v6 = -[NSMutableDictionary count](self->_allocateResponses, "count");
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  __int128 v36 = sub_1002A33AC;
  __int128 v37 = sub_1002A33BC;
  id v38 = 0LL;
  uint64_t v7 = OSLogHandleForTransportCategory("QRAllocator");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cleanup response count: %zu", buf, 0xCu);
  }

  uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
  if ((_DWORD)v10)
  {
    if (_IDSShouldLogTransport(v10))
    {
      id v26 = v6;
      _IDSLogTransport(@"QRAllocator", @"IDS", @"cleanup response count: %zu");
      if (_IDSShouldLog(0LL, @"QRAllocator"))
      {
        id v26 = v6;
        _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"cleanup response count: %zu");
      }
    }
  }

  allocateResponses = self->_allocateResponses;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1002A33C4;
  v32[3] = &unk_1008FF768;
  v32[5] = &v33;
  v32[6] = v3 * v5 / v4 / 0x3B9ACA00;
  v32[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( allocateResponses,  "enumerateKeysAndObjectsUsingBlock:",  v32,  v26);
  if (v34[5])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v12 = (id)v34[5];
    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          uint64_t v17 = OSLogHandleForTransportCategory("QRAllocator");
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "clean up response for groupID %@",  buf,  0xCu);
          }

          uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
          if ((_DWORD)v20)
          {
            if (_IDSShouldLogTransport(v20))
            {
              uint64_t v27 = v16;
              _IDSLogTransport(@"QRAllocator", @"IDS", @"clean up response for groupID %@");
              if (_IDSShouldLog(0LL, @"QRAllocator"))
              {
                uint64_t v27 = v16;
                _IDSLogV(0LL, @"IDSFoundation", @"QRAllocator", @"clean up response for groupID %@");
              }
            }
          }

          -[NSMutableDictionary removeObjectForKey:](self->_allocateResponses, "removeObjectForKey:", v16, v27);
        }

        id v13 = [v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
      }

      while (v13);
    }
  }

  if (!-[NSMutableDictionary count](self->_allocateResponses, "count"))
  {
    dispatch_source_cancel((dispatch_source_t)self->_responseCleanupTimer);
    responseCleanupTimer = self->_responseCleanupTimer;
    self->_responseCleanupTimer = 0LL;

    uint64_t v22 = OSLogHandleForTransportCategory("QRAllocator");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "cleanup timer disabled", buf, 2u);
    }

    uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
    if ((_DWORD)v25)
    {
      if (_IDSShouldLogTransport(v25))
      {
        _IDSLogTransport(@"QRAllocator", @"IDS", @"cleanup timer disabled");
      }
    }
  }

  _Block_object_dispose(&v33, 8);
}

- (void)_startCleanupTimer
{
  if (!self->_responseCleanupTimer)
  {
    uint64_t v3 = im_primary_queue(self, a2);
    unint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v4);
    responseCleanupTimer = self->_responseCleanupTimer;
    self->_responseCleanupTimer = v5;

    uint64_t v7 = self->_responseCleanupTimer;
    dispatch_time_t v8 = dispatch_time(0LL, 300000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v7, v8, 0x45D964B800uLL, 0x5F5E100uLL);
    uint64_t v9 = self->_responseCleanupTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002A3620;
    handler[3] = &unk_1008F6010;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
    dispatch_resume((dispatch_object_t)self->_responseCleanupTimer);
    uint64_t v10 = OSLogHandleForTransportCategory("QRAllocator");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "cleanup timer started", v14, 2u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13 && _IDSShouldLogTransport(v13))
    {
      _IDSLogTransport(@"QRAllocator", @"IDS", @"cleanup timer started");
    }
  }

- (id)_getQuickRelayIPPreference:(unint64_t)a3
{
  uint64_t v3 = @"Unknown preference";
  if (a3 == 1) {
    uint64_t v3 = @"Prefer IPV6";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Prefer IPV4";
  }
}

- (unint64_t)getCountOfPendingRecipientsAcceptedSessions
{
  return (unint64_t)-[NSMutableSet count](self->_pendingRecipientsAcceptedSessions, "count");
}

- (unint64_t)getCountOfSessionToAllocations
{
  return (unint64_t)-[NSMutableDictionary count](self->_sessionToAllocations, "count");
}

- (void)setRequestIDToSession:(id)a3 idsSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_requestIDToSession)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    requestIDToSession = self->_requestIDToSession;
    self->_requestIDToSession = Mutable;
  }

  id v10 = v7;
  if (v10)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToSession, v6, v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A6980();
  }
}

- (void).cxx_destruct
{
}

@end