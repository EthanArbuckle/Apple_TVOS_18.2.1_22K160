@interface IDSDSessionController
+ (IDSDSessionController)sharedInstance;
- (BOOL)_isCleanupMeantForTheRightSession:(id)a3 clientChannelUUID:(id)a4;
- (BOOL)endAllSessionsForService:(id)a3 withReason:(unsigned int)a4;
- (FTMessageDelivery)messageDelivery;
- (IDSDSessionController)init;
- (id)_specificOriginatorFromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5;
- (id)groupSessionGroupIDs;
- (id)sessionIDForAlias:(id)a3 salt:(id)a4;
- (id)sessionWithGroupID:(id)a3;
- (id)sessionWithGroupUUID:(id)a3;
- (id)sessionWithInstanceID:(id)a3;
- (id)sessionWithUniqueID:(id)a3;
- (id)setupNewIncomingSessionWithOptions:(id)a3;
- (id)setupNewOutgoingSessionWithOptions:(id)a3;
- (void)_handleClientDeath:(id)a3;
- (void)cleanupSession:(id)a3 shouldCleanSessionStatus:(BOOL)a4;
- (void)cleanupSessionWithChannelDestination:(id)a3 clientChannelUUID:(id)a4;
- (void)cleanupSessionWithInstanceID:(id)a3;
- (void)cleanupSessionsForClient:(id)a3;
- (void)dealloc;
- (void)processIncomingGroupSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8;
- (void)processIncomingInvitationWithPayload:(id)a3 topic:(id)a4 fromToken:(id)a5 fromURI:(id)a6 toURI:(id)a7 idsMessageContext:(id)a8 messageContext:(id)a9;
- (void)processIncomingSessionAcceptMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionCancelMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionDeclineMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionEndMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionReinitiateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)updateCriticalReliabilityState;
@end

@implementation IDSDSessionController

+ (IDSDSessionController)sharedInstance
{
  if (qword_1009BEE18 != -1) {
    dispatch_once(&qword_1009BEE18, &stru_1008FD740);
  }
  return (IDSDSessionController *)(id)qword_1009BEE20;
}

- (IDSDSessionController)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IDSDSessionController;
  v2 = -[IDSDSessionController init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessions = v3->_sessions;
    v3->_sessions = v4;

    v6 = objc_alloc(&OBJC_CLASS___IMMultiQueue);
    uint64_t v8 = im_primary_queue(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[IMMultiQueue initWithQueue:](v6, "initWithQueue:", v9);
    sessionIDMultiQueue = v3->_sessionIDMultiQueue;
    v3->_sessionIDMultiQueue = v10;

    uint64_t v12 = OSLogHandleForIDSCategory("SessionController");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Building Message delivery", v18, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v14)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"SessionController", @"Building Message delivery");
    }

    v15 = (FTMessageDelivery *)objc_alloc_init((Class)+[FTMessageDelivery APNSMessageDeliveryClass]( &OBJC_CLASS___FTMessageDelivery,  "APNSMessageDeliveryClass"));
    messageDelivery = v3->_messageDelivery;
    v3->_messageDelivery = v15;

    -[FTMessageDelivery setUserAgent:](v3->_messageDelivery, "setUserAgent:", @"com.apple.invitation-service");
  }

  return v3;
}

- (void)dealloc
{
  messageDelivery = self->_messageDelivery;
  self->_messageDelivery = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDSessionController;
  -[IDSDSessionController dealloc](&v4, "dealloc");
}

- (id)setupNewOutgoingSessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionAccountIDKey]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionDestinationsKey]);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionUniqueIDKey]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionInstanceIDKey]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionTransportTypeKey]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountWithUniqueID:v5]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 service]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 displayName]);
  if (![v5 length])
  {
    uint64_t v19 = OSLogHandleForIDSCategory("Warning");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Missing accountID for outgoing session, bailing...",  buf,  2u);
    }

    DLCWarn(v11, @"SessionController", 0LL, @"Missing accountID for outgoing session, bailing...");
    goto LABEL_38;
  }

  if (![v39 count])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kIDSQRAllocateKey_AllocateType]);
    if (!v12 && [0 intValue] != 2)
    {
      uint64_t v30 = OSLogHandleForIDSCategory("Warning");
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Missing destinations for outgoing session, bailing...",  buf,  2u);
      }

      DLCWarn(v11, @"SessionController", 0LL, @"Missing destinations for outgoing session, bailing...");
      goto LABEL_38;
    }
  }

  if (!v38)
  {
    uint64_t v21 = OSLogHandleForIDSCategory("Warning");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Missing transport type for outgoing session, bailing...",  buf,  2u);
    }

    DLCWarn(v11, @"SessionController", 0LL, @"Missing transport type for outgoing session, bailing...");
    goto LABEL_38;
  }

  if (![v7 length])
  {
    uint64_t v23 = OSLogHandleForIDSCategory("Warning");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Missing uniqueID for outgoing session, bailing...",  buf,  2u);
    }

    DLCWarn(v11, @"SessionController", 0LL, @"Missing uniqueID for outgoing session, bailing...");
LABEL_38:
    v27 = 0LL;
    goto LABEL_39;
  }

  os_unfair_lock_lock(&self->_lock);
  v13 = (IDSDSession *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v7));
  os_unfair_lock_unlock(&self->_lock);
  if (v13)
  {
    if (!v37)
    {
      uint64_t v28 = OSLogHandleForIDSCategory("Warning");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "Already have an existing session with uniqueID %@, bailing...",  buf,  0xCu);
      }

      DLCWarn( v11,  @"SessionController",  0LL,  @"Already have an existing session with uniqueID %@, bailing...");
      v27 = 0LL;
      goto LABEL_34;
    }

    uint64_t v14 = OSLogHandleForIDSCategory("SessionController");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v43 = v7;
      __int16 v44 = 2112;
      uint64_t v45 = objc_claimAutoreleasedReturnValue(-[IDSDSession instanceID](v13, "instanceID"));
      __int16 v46 = 2112;
      v47 = v37;
      v36 = (void *)v45;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Found existing session matching uniqueID -- replacing with new instance { uniqueID: %@, oldInstanceID: %@, newInstanceID: %@ }",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSession instanceID](v13, "instanceID"));
      v35 = v37;
      v33 = v7;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Found existing session matching uniqueID -- replacing with new instance { uniqueID: %@, oldInstanceID: %@, newInstanceID: %@ }");
    }

    -[IDSDSessionController cleanupSession:shouldCleanSessionStatus:]( self,  "cleanupSession:shouldCleanSessionStatus:",  v7,  1LL,  v33,  v34,  v35);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1001D2600;
  v40[3] = &unk_1008F64D0;
  id v41 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "__imSetByApplyingBlock:", v40));
  v13 = -[IDSDSession initWithAccount:destinations:options:]( objc_alloc(&OBJC_CLASS___IDSDSession),  "initWithAccount:destinations:options:",  v5,  v17,  v4);
  if (v13)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKey:](self->_sessions, "setObject:forKey:", v13, v7);
    os_unfair_lock_unlock(&self->_lock);
    v18 = v13;
  }

  else
  {
    uint64_t v25 = OSLogHandleForIDSCategory("Warning");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to create outgoing session.", buf, 2u);
    }

    DLCWarn(v11, @"SessionController", 0LL, @"Failed to create outgoing session.");
  }

  v27 = v13;
LABEL_34:

LABEL_39:
  return v27;
}

- (id)setupNewIncomingSessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionAccountIDKey]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionDestinationsKey]);
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionUniqueIDKey]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSSessionTransportTypeKey]);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IDSDSessionMessageBlob]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountWithUniqueID:v5]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayName]);
  if (![v5 length])
  {
    uint64_t v16 = OSLogHandleForIDSCategory("Warning");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Missing accountID for incoming session, bailing...",  buf,  2u);
    }

    DLCWarn(v10, @"SessionController", 0LL, @"Missing accountID for incoming session, bailing...");
    goto LABEL_23;
  }

  if (![v6 count])
  {
    uint64_t v18 = OSLogHandleForIDSCategory("Warning");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Missing destinations for incoming session, bailing...",  buf,  2u);
    }

    DLCWarn(v10, @"SessionController", 0LL, @"Missing destinations for incoming session, bailing...");
    goto LABEL_23;
  }

  if (!v31)
  {
    uint64_t v20 = OSLogHandleForIDSCategory("Warning");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Missing transport type for incoming session, bailing...",  buf,  2u);
    }

    DLCWarn(v10, @"SessionController", 0LL, @"Missing transport type for incoming session, bailing...");
    goto LABEL_23;
  }

  if (!-[__CFString length](v32, "length"))
  {
    uint64_t v22 = OSLogHandleForIDSCategory("Warning");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Missing uniqueID for incoming session, bailing...",  buf,  2u);
    }

    DLCWarn(v10, @"SessionController", 0LL, @"Missing uniqueID for incoming session, bailing...");
    goto LABEL_23;
  }

  os_unfair_lock_lock(&self->_lock);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessions, "allKeys"));
  unsigned int v12 = [v11 containsObject:v32];

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "We already have an existing session with unique ID %@, ignoring self invite...",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(1LL, @"SessionController"))
    {
      _IDSLogV( 1LL,  @"IDSFoundation",  @"SessionController",  @"We already have an existing session with unique ID %@, ignoring self invite...");
    }

- (void)processIncomingInvitationWithPayload:(id)a3 topic:(id)a4 fromToken:(id)a5 fromURI:(id)a6 toURI:(id)a7 idsMessageContext:(id)a8 messageContext:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v104 = a5;
  id v16 = a6;
  id v106 = a7;
  id v17 = a8;
  id v100 = a9;
  v99 = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:IDSMessageContextFromServerStorageKey]);
  unsigned int v19 = [v18 BOOLValue];

  uint64_t v20 = OSLogHandleForTransportCategory("SessionController");
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = @"NO";
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v118 = 2112;
    if (v19) {
      uint64_t v22 = @"YES";
    }
    id v119 = v15;
    __int16 v120 = 2112;
    id v121 = v104;
    __int16 v122 = 2112;
    id v123 = v16;
    __int16 v124 = 2112;
    id v125 = v106;
    __int16 v126 = 2112;
    v127 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received incoming invitation with payload %@ topic %@ fromToken %@ fromURI %@ toURI %@ fromStorage %@",  buf,  0x3Eu);
  }

  uint64_t v24 = os_log_shim_legacy_logging_enabled(v23);
  if ((_DWORD)v24 && _IDSShouldLogTransport(v24))
  {
    uint64_t v25 = v19 ? @"YES" : @"NO";
    id v96 = v106;
    v97 = v25;
    id v94 = v104;
    id v95 = v16;
    id v92 = v14;
    id v93 = v15;
    _IDSLogTransport( @"SessionController",  @"IDS",  @"Received incoming invitation with payload %@ topic %@ fromToken %@ fromURI %@ toURI %@ fromStorage %@");
    if (_IDSShouldLog(0LL, @"SessionController"))
    {
      id v96 = v106;
      v97 = v25;
      id v94 = v104;
      id v95 = v16;
      id v92 = v14;
      id v93 = v15;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Received incoming invitation with payload %@ topic %@ fromToken %@ fromURI %@ toURI %@ fromStorage %@");
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDServiceController sharedInstance]( &OBJC_CLASS___IDSDServiceController,  "sharedInstance",  v92,  v93,  v94,  v95,  v96,  v97));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v26 serviceWithPushTopic:v15]);

  v102 = (void *)objc_claimAutoreleasedReturnValue([v105 displayName]);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v27);
  id v29 = sub_1001D39BC(v28, v14, IDSDSessionMessageSessionID);
  v103 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if ([v103 length])
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v106 prefixedURI]);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 accountOnService:v105 withAliasURI:v31]);

    v33 = (void *)objc_claimAutoreleasedReturnValue([v16 prefixedURI]);
    LODWORD(v31) = [v33 hasPrefix:@"device:"];

    if ((_DWORD)v31)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue([v16 unprefixedURI]);
      if (v32) {
        goto LABEL_27;
      }
    }

    else
    {
      v98 = 0LL;
      if (v32) {
        goto LABEL_27;
      }
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v106 prefixedURI]);
    if ([v36 length])
    {
      v32 = 0LL;
    }

    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v16 prefixedURI]);
      if ([v37 isEqualToIgnoringCase:IDSDefaultPairedDevice])
      {
      }

      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 pairedDeviceUniqueID]);
        unsigned int v40 = [v98 isEqualToIgnoringCase:v39];

        if (!v40)
        {
          v32 = 0LL;
          goto LABEL_27;
        }
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v36 localAccountOnService:v105]);
    }

LABEL_27:
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v32 uniqueID]);
    v42 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v16,  v104,  v41));

    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 prefixedURI]);
    BOOL v44 = [v43 length] == 0;

    if (v44)
    {
      uint64_t v50 = OSLogHandleForIDSCategory("Warning");
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Missing originator for session invitation, bailing...",  buf,  2u);
      }

      DLCWarn(v102, @"SessionController", 0LL, @"Missing originator for session invitation, bailing...");
    }

    else
    {
      uint64_t v45 = OSLogHandleForIDSCategory("IDSDaemon");
      __int16 v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Creating IDSSession for incoming invite",  buf,  2u);
      }

      v48 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v32 uniqueID]);
      if (v49)
      {
        CFDictionarySetValue(v48, IDSSessionAccountIDKey, v49);
      }

      else
      {
        id v52 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0B10();
        }
      }

      id v53 = v106;
      if (v53)
      {
        CFDictionarySetValue(v48, IDSSessionToIDKey, v53);
      }

      else
      {
        id v54 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0A90();
        }
      }

      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v42));
      if (v55)
      {
        CFDictionarySetValue(v48, IDSSessionDestinationsKey, v55);
      }

      else
      {
        id v56 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0A10();
        }
      }

      id v57 = v103;
      if (v57)
      {
        CFDictionarySetValue(v48, IDSSessionUniqueIDKey, v57);
      }

      else
      {
        id v58 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0990();
        }
      }

      CFDictionarySetValue(v48, IDSSessionIsInitiatorKey, &__kCFBooleanFalse);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageTransportType]);
      if (v59)
      {
        CFDictionarySetValue(v48, IDSSessionTransportTypeKey, v59);
      }

      else
      {
        id v60 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0910();
        }
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageVersion]);
      if (v61)
      {
        CFDictionarySetValue(v48, IDSSessionPeerProtocolVersionKey, v61);
      }

      else
      {
        id v62 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0890();
        }
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageConnectionCountHint]);
      if (v63)
      {
        CFDictionarySetValue(v48, IDSSessionConnectionCountHintKey, v63);
      }

      else
      {
        id v64 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0810();
        }
      }

      v65 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageNeedsToWaitForPreConnectionData]);
      if (v65)
      {
        CFDictionarySetValue(v48, IDSSessionWaitForPreConnectionDataKey, v65);
      }

      else
      {
        id v66 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0790();
        }
      }

      v67 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageDisableEncryption]);
      if (v67) {
        CFDictionarySetValue(v48, IDSSessionDisableEncryptionKey, v67);
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageSingleChannelDirectMode]);
      if (v68) {
        CFDictionarySetValue(v48, IDSSessionSingleChannelDirectModeKey, v68);
      }

      v69 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageUseStunMessageIntegrity]);
      if (v69) {
        CFDictionarySetValue(v48, IDSSessionUseStunMessageIntegrityKey, v69);
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageUseSecureQRControlMessage]);
      if (v70) {
        CFDictionarySetValue(v48, IDSSessionUseSecureQRControlMessageKey, v70);
      }

      v71 = (const void *)IDSDSessionMessageBlob;
      v72 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageBlob]);
      if (v72)
      {
        CFDictionarySetValue(v48, v71, v72);
      }

      else
      {
        id v73 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1006A0710((uint64_t)v71, v74, v75, v76, v77, v78, v79, v80);
        }
      }

      v81 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageIsRealTime]);
      if (v81) {
        CFDictionarySetValue(v48, IDSSessionIsRealTimeKey, v81);
      }

      v82 = (const void *)IDSSessionUnauthenticatedPublicKey;
      v83 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionUnauthenticatedPublicKey]);
      if (v83) {
        CFDictionarySetValue(v48, v82, v83);
      }

      v84 = (const void *)IDSDSessionMessageAssumeRemoteDeviceEncryption;
      v85 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSDSessionMessageAssumeRemoteDeviceEncryption]);
      if (v85) {
        CFDictionarySetValue(v48, v84, v85);
      }

      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v42;
        __int16 v118 = 2112;
        id v119 = v57;
        _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session invitation block from %@ with key %@",  buf,  0x16u);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      sessionIDMultiQueue = self->_sessionIDMultiQueue;
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472LL;
      v107[2] = sub_1001D3A64;
      v107[3] = &unk_1008FD7E0;
      objc_copyWeak(&v116, (id *)buf);
      v88 = v48;
      v108 = v88;
      id v109 = v102;
      id v110 = v14;
      id v111 = v15;
      id v89 = v57;
      v90 = v53;
      id v91 = v89;
      id v112 = v89;
      id v113 = v90;
      id v114 = v42;
      id v115 = v100;
      -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v107,  v91,  @"Process incoming session %@ accept message",  65.0);

      objc_destroyWeak(&v116);
      objc_destroyWeak((id *)buf);
    }

    goto LABEL_99;
  }

  uint64_t v34 = OSLogHandleForIDSCategory("Warning");
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "No sessionID provided in invitation, bailing...",  buf,  2u);
  }

  DLCWarn(v102, @"SessionController", 0LL, @"No sessionID provided in invitation, bailing...");
LABEL_99:
}

- (void)processIncomingSessionAcceptMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  id v16 = sub_1001D39BC(v15, v10, IDSDSessionMessageSessionID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v17]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v12,  v11,  v20));

    uint64_t v22 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session accept block from %@ with key %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v24)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming session accept block from %@ with key %@");
    }

    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001D4BC4;
    v27[3] = &unk_1008FD808;
    id v28 = v19;
    id v29 = v10;
    id v30 = v21;
    id v26 = v21;
    -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v27,  v17,  @"Process incoming session %@ accept message",  10.0);
  }
}

- (void)processIncomingSessionDeclineMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  id v16 = sub_1001D39BC(v15, v10, IDSDSessionMessageSessionID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v17]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v12,  v11,  v20));

    uint64_t v22 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session decline block from %@ with key %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v24)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming session decline block from %@ with key %@");
    }

    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001D4EA0;
    v27[3] = &unk_1008FD808;
    id v28 = v19;
    id v29 = v10;
    id v30 = v21;
    id v26 = v21;
    -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v27,  v17,  @"Process incoming session %@ decline message",  10.0);
  }
}

- (void)processIncomingSessionCancelMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  id v16 = sub_1001D39BC(v15, v10, IDSDSessionMessageSessionID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v17]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v12,  v11,  v20));

    uint64_t v22 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session cancel block from %@ with key %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v24)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming session cancel block from %@ with key %@");
    }

    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001D517C;
    v27[3] = &unk_1008FD808;
    id v28 = v19;
    id v29 = v10;
    id v30 = v21;
    id v26 = v21;
    -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v27,  v17,  @"Process incoming session %@ cancel message",  10.0);
  }
}

- (void)processIncomingSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  id v16 = sub_1001D39BC(v15, v10, IDSDSessionMessageSessionID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v17]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v12,  v11,  v20));

    uint64_t v22 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session message block from %@ with key %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v24)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming session message block from %@ with key %@");
    }

    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001D5458;
    v27[3] = &unk_1008FD808;
    id v28 = v19;
    id v29 = v10;
    id v30 = v21;
    id v26 = v21;
    -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v27,  v17,  @"Process incoming session %@ session message",  10.0);
  }
}

- (void)processIncomingSessionEndMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  id v16 = sub_1001D39BC(v15, v10, IDSDSessionMessageSessionID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v17]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v12,  v11,  v20));

    uint64_t v22 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session end block from %@ with key %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v24)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming session end block from %@ with key %@");
    }

    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001D5734;
    v27[3] = &unk_1008FD808;
    id v28 = v19;
    id v29 = v10;
    id v30 = v21;
    id v26 = v21;
    -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v27,  v17,  @"Process incoming session %@ end message",  10.0);
  }
}

- (void)processIncomingSessionReinitiateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  id v16 = sub_1001D39BC(v15, v10, IDSDSessionMessageSessionID);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionWithUniqueID:v17]);

  if (v19)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountID]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v12,  v11,  v20));

    uint64_t v22 = OSLogHandleForIDSCategory("SessionController");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming session reinitiate block from %@ with key %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v24)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming session reinitiate block from %@ with key %@");
    }

    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1001D5A10;
    v27[3] = &unk_1008FD808;
    id v28 = v19;
    id v29 = v10;
    id v30 = v21;
    id v26 = v21;
    -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v27,  v17,  @"Process incoming session %@ reinitiate teardown message",  10.0);
  }
}

- (void)processIncomingGroupSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v56 = a6;
  id v17 = a7;
  id v18 = a8;
  v59 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:IDSMessageContextServerTimestampKey]);
  [v59 doubleValue];
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v19);
  id v21 = sub_1001D39BC(v20, v14, IDSFanoutMessageGroupIDKey);
  id v58 = (void *)objc_claimAutoreleasedReturnValue(v21);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString, v22);
  id v24 = sub_1001D39BC(v23, v14, IDSDSessionMessageSessionID);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sessionWithUniqueID:v25]);

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 accountID]);
  id v53 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDSessionController _specificOriginatorFromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorFromURI:senderToken:accountUniqueID:",  v16,  v15,  v28));

  char v54 = IMGetDomainBoolForKey(@"com.apple.ids", @"disableReceivingMaterialsOverPush");
  if (v17) {
    BOOL v29 = v18 == 0LL;
  }
  else {
    BOOL v29 = 1;
  }
  char v30 = v29;
  char v52 = v30;
  v31 = @"Push";
  if (v29) {
    v31 = @"QR";
  }
  v51 = v31;
  uint64_t v32 = OSLogHandleForIDSCategory("SessionController");
  __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = IDSLoggableDescriptionForObjectOnService(v14, v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v77 = 2112;
    uint64_t v78 = v58;
    __int16 v79 = 2112;
    uint64_t v80 = v25;
    __int16 v81 = 2112;
    v82 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Enqueuing incoming group session message block fromID %@ with the group %@ sessionID %@ (message %@)",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v36)
    && _IDSShouldLog(0LL, @"SessionController"))
  {
    uint64_t v37 = IDSLoggableDescriptionForObjectOnService(v14, v17);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v37);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Enqueuing incoming group session message block fromID %@ with the group %@ sessionID %@ (message %@)");
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  sessionIDMultiQueue = self->_sessionIDMultiQueue;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1001D5F54;
  v60[3] = &unk_1008FD850;
  id v48 = v14;
  id v61 = v48;
  id v49 = v15;
  id v62 = v49;
  id v50 = v16;
  id v63 = v50;
  id v57 = v56;
  id v64 = v57;
  id v39 = v17;
  id v65 = v39;
  id v40 = v18;
  id v66 = v40;
  char v74 = v54;
  objc_copyWeak(&v73, (id *)buf);
  id v41 = v51;
  v67 = v41;
  char v75 = v52;
  id v42 = v27;
  id v68 = v42;
  id v43 = v53;
  id v69 = v43;
  id v44 = v58;
  id v70 = v44;
  id v45 = v25;
  id v71 = v45;
  id v46 = v55;
  id v72 = v46;
  -[IMMultiQueue addBlock:withTimeout:forKey:description:]( sessionIDMultiQueue,  "addBlock:withTimeout:forKey:description:",  v60,  v44,  @"Process incoming group session %@ session message",  10.0);

  objc_destroyWeak(&v73);
  objc_destroyWeak((id *)buf);
}

- (void)cleanupSession:(id)a3 shouldCleanSessionStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6
    && (os_unfair_lock_lock(&self->_lock),
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v6)),
        os_unfair_lock_unlock(&self->_lock),
        v7))
  {
    uint64_t v8 = OSLogHandleForIDSCategory("SessionController");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      if (v4) {
        id v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session %@, shouldCleanSessionStatus: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      id v12 = @"NO";
      if (v4) {
        id v12 = @"YES";
      }
      id v16 = v6;
      id v17 = v12;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Cleaning up session %@, shouldCleanSessionStatus: %@");
    }

    objc_msgSend(v7, "cleanupSessionWithCleanStatus:", v4, v16, v17);
    if (v4)
    {
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v6);
      os_unfair_lock_unlock(&self->_lock);
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForIDSCategory("SessionController");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Couldn't find the session %@ to clean up!",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"SessionController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Couldn't find the session %@ to clean up!");
    }

    uint64_t v7 = 0LL;
  }
}

- (void)cleanupSessionWithInstanceID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDSessionController sessionWithInstanceID:](self, "sessionWithInstanceID:", v4));
  uint64_t v6 = OSLogHandleForIDSCategory("SessionController");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
    *(_DWORD *)buf = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session based on instanceID { instanceID: %@, correspondingUniqueID: %@ }",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v9)
    && _IDSShouldLog(0LL, @"SessionController"))
  {
    id v11 = v4;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
    _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Cleaning up session based on instanceID { instanceID: %@, correspondingUniqueID: %@ }");
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueID", v11, v12));
  -[IDSDSessionController cleanupSession:shouldCleanSessionStatus:]( self,  "cleanupSession:shouldCleanSessionStatus:",  v10,  1LL);
}

- (BOOL)_isCleanupMeantForTheRightSession:(id)a3 clientChannelUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v6));
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientChannelUUID]);
  unsigned __int8 v11 = [v7 isEqual:v10];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)cleanupSessionWithChannelDestination:(id)a3 clientChannelUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@":"]);
  if ((unint64_t)[v8 count] >= 2)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:1]);
    if (-[IDSDSessionController _isCleanupMeantForTheRightSession:clientChannelUUID:]( self,  "_isCleanupMeantForTheRightSession:clientChannelUUID:",  v9,  v7))
    {
      -[IDSDSessionController cleanupSession:shouldCleanSessionStatus:]( self,  "cleanupSession:shouldCleanSessionStatus:",  v9,  0LL);
    }

    else
    {
      uint64_t v10 = OSLogHandleForTransportCategory("IDSDSessionController");
      unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "skip cleanupSessionWithChannelDestination for destination %@ and clientChannelUUID %@",  buf,  0x16u);
      }

      uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
      if ((_DWORD)v13)
      {
        if (_IDSShouldLogTransport(v13))
        {
          _IDSLogTransport( @"IDSDSessionController",  @"IDS",  @"skip cleanupSessionWithChannelDestination for destination %@ and clientChannelUUID %@");
          if (_IDSShouldLog(0LL, @"IDSDSessionController")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSessionController",  @"skip cleanupSessionWithChannelDestination for destination %@ and clientChannelUUID %@");
          }
        }
      }
    }
  }
}

- (void)cleanupSessionsForClient:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = OSLogHandleForTransportCategory("IDSDSessionController");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session(s) for client ID: %@ because it died",  buf,  0xCu);
    }

    uint64_t v8 = os_log_shim_legacy_logging_enabled(v7);
    if ((_DWORD)v8)
    {
      if (_IDSShouldLogTransport(v8))
      {
        id v21 = v4;
        _IDSLogTransport( @"IDSDSessionController",  @"IDS",  @"Cleaning up session(s) for client ID: %@ because it died");
        if (_IDSShouldLog(0LL, @"IDSDSessionController"))
        {
          id v21 = v4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSessionController",  @"Cleaning up session(s) for client ID: %@ because it died");
        }
      }
    }

    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessions, "allKeys"));
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v13, v21));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientID]);
          unsigned int v16 = [v15 isEqualToIgnoringCase:v4];

          if (v16)
          {
            uint64_t v17 = OSLogHandleForTransportCategory("SessionController");
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v31 = v13;
              __int16 v32 = 2112;
              id v33 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session: %@ for client ID: %@",  buf,  0x16u);
            }

            uint64_t v20 = os_log_shim_legacy_logging_enabled(v19);
            if ((_DWORD)v20)
            {
              if (_IDSShouldLogTransport(v20))
              {
                id v21 = v13;
                id v22 = v4;
                _IDSLogTransport( @"SessionController",  @"IDS",  @"Cleaning up session: %@ for client ID: %@");
                if (_IDSShouldLog(0LL, @"SessionController"))
                {
                  id v21 = v13;
                  id v22 = v4;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Cleaning up session: %@ for client ID: %@");
                }
              }
            }

            -[NSMutableArray addObject:](v25, "addObject:", v13, v21, v22);
            -[NSMutableArray addObject:](v24, "addObject:", v14);
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v10);
    }

    os_unfair_lock_unlock(lock);
    -[NSMutableArray enumerateObjectsUsingBlock:](v24, "enumerateObjectsUsingBlock:", &stru_1008FD890);
    os_unfair_lock_lock(lock);
    -[NSMutableDictionary removeObjectsForKeys:](self->_sessions, "removeObjectsForKeys:", v25);
    os_unfair_lock_unlock(lock);
  }
}

- (BOOL)endAllSessionsForService:(id)a3 withReason:(unsigned int)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = OSLogHandleForTransportCategory("IDSDSessionController");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v5;
      __int16 v39 = 2048;
      unint64_t v40 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session(s) for service: %@ with reason %ld",  buf,  0x16u);
    }

    uint64_t v9 = os_log_shim_legacy_logging_enabled(v8);
    if ((_DWORD)v9)
    {
      if (_IDSShouldLogTransport(v9))
      {
        id v24 = v5;
        id v25 = (id)a4;
        _IDSLogTransport( @"IDSDSessionController",  @"IDS",  @"Cleaning up session(s) for service: %@ with reason %ld");
        if (_IDSShouldLog(0LL, @"IDSDSessionController"))
        {
          id v24 = v5;
          id v25 = (id)a4;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDSessionController",  @"Cleaning up session(s) for service: %@ with reason %ld");
        }
      }
    }

    __int128 v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessions, "allKeys"));
    id v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v14, v24, v25));
          unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 getFromService]);
          unsigned int v17 = [v16 isEqualToIgnoringCase:v5];

          if (v17)
          {
            uint64_t v18 = OSLogHandleForTransportCategory("SessionController");
            uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v38 = v14;
              __int16 v39 = 2112;
              unint64_t v40 = (unint64_t)v5;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session: %@ for service: %@",  buf,  0x16u);
            }

            uint64_t v21 = os_log_shim_legacy_logging_enabled(v20);
            if ((_DWORD)v21)
            {
              if (_IDSShouldLogTransport(v21))
              {
                id v24 = v14;
                id v25 = v5;
                _IDSLogTransport( @"SessionController",  @"IDS",  @"Cleaning up session: %@ for service: %@");
                if (_IDSShouldLog(0LL, @"SessionController"))
                {
                  id v24 = v14;
                  id v25 = v5;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Cleaning up session: %@ for service: %@");
                }
              }
            }

            -[NSMutableArray addObject:](v29, "addObject:", v14, v24, v25);
            -[NSMutableArray addObject:](v28, "addObject:", v15);
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v11);
    }

    os_unfair_lock_unlock(lock);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001D8200;
    v30[3] = &unk_1008FD8B0;
    unsigned int v31 = a4;
    -[NSMutableArray enumerateObjectsUsingBlock:](v28, "enumerateObjectsUsingBlock:", v30);
    os_unfair_lock_lock(lock);
    -[NSMutableDictionary removeObjectsForKeys:](self->_sessions, "removeObjectsForKeys:", v29);
    os_unfair_lock_unlock(lock);
    BOOL v22 = -[NSMutableArray count](v29, "count") != 0LL;
  }

  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_handleClientDeath:(id)a3
{
  id v20 = a3;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 userInfo]);
  if (v21)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"IDSDaemonClientID"]);
    if (v4)
    {
      uint64_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      BOOL v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_sessions, "allKeys"));
      id v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v25 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
            id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v9));
            id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientID]);
            unsigned int v12 = [v11 isEqualToIgnoringCase:v4];

            if (v12)
            {
              uint64_t v13 = OSLogHandleForTransportCategory("IDSSessionController");
              id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v29 = v9;
                __int16 v30 = 2112;
                unsigned int v31 = v4;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cleaning up session: %@ for client ID: %@",  buf,  0x16u);
              }

              uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
              if ((_DWORD)v16)
              {
                if (_IDSShouldLogTransport(v16))
                {
                  uint64_t v17 = v9;
                  uint64_t v18 = v4;
                  _IDSLogTransport( @"IDSSessionController",  @"IDS",  @"Cleaning up session: %@ for client ID: %@");
                  if (_IDSShouldLog(0LL, @"IDSSessionController"))
                  {
                    uint64_t v17 = v9;
                    uint64_t v18 = v4;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSSessionController",  @"Cleaning up session: %@ for client ID: %@");
                  }
                }
              }

              -[NSMutableArray addObject:](v23, "addObject:", v9, v17, v18);
              -[NSMutableArray addObject:](v22, "addObject:", v10);
            }
          }

          id v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }

        while (v6);
      }

      os_unfair_lock_unlock(lock);
      -[NSMutableArray enumerateObjectsUsingBlock:](v22, "enumerateObjectsUsingBlock:", &stru_1008FD8D0);
      os_unfair_lock_lock(lock);
      -[NSMutableDictionary removeObjectsForKeys:](self->_sessions, "removeObjectsForKeys:", v23);
      os_unfair_lock_unlock(lock);
    }
  }
}

- (id)_specificOriginatorFromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5
{
  uint64_t v7 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v7, "prefixedURI"));
  unsigned int v11 = [v10 hasPrefix:@"device:"];

  if (v11) {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString unprefixedURI](v7, "unprefixedURI"));
  }
  else {
    unsigned int v12 = 0LL;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pairedDeviceUniqueID]);
  unsigned int v15 = [v12 isEqualToIgnoringCase:v14];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v7, "prefixedURI"));
  unsigned int v17 = [v16 isEqualToIgnoringCase:IDSDefaultPairedDevice];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountWithUniqueID:v9]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
  id v21 = [v20 length];

  if (v21)
  {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
    if ([v22 length])
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v7, "prefixedURI"));
      id v24 = [v23 length];

      if (v24)
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
        __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v7, "prefixedURI"));
        __int128 v27 = (void *)_IDSCopyIDForTokenWithURI(v25, v26);

        goto LABEL_13;
      }
    }

    else
    {
    }

    __int128 v27 = 0LL;
    goto LABEL_13;
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v7, "prefixedURI"));
  __int128 v27 = v28;
  if (((v17 | v15) & 1) == 0)
  {
    unsigned int v29 = [v28 hasPrefix:@"guest-device:"];

    if (!v29)
    {
      if (v19)
      {
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v19 dependentRegistrationMatchingUUID:v12]);
        __int128 v35 = v34;
        if (v34)
        {
          id v63 = (void *)objc_claimAutoreleasedReturnValue([v34 _dataForKey:IDSDevicePropertyPushToken]);
          if ([v63 length])
          {
            id v62 = (void *)objc_claimAutoreleasedReturnValue([v35 _arrayForKey:IDSDevicePropertyIdentities]);
            if ([v62 count])
            {
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v62 firstObject]);
              id v61 = (void *)objc_claimAutoreleasedReturnValue([v36 _stringForKey:@"uri"]);

              __int128 v27 = (void *)_IDSCopyIDForTokenWithURI(v63, v61);
              uint64_t v37 = OSLogHandleForIDSCategory("SessionController");
              id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                id v60 = (void *)objc_claimAutoreleasedReturnValue([v19 service]);
                __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v60 identifier]);
                uint64_t v40 = IDSLoggableDescriptionForHandleOnService(v27, v39);
                id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                *(_DWORD *)buf = 138412546;
                id v65 = v7;
                __int16 v66 = 2112;
                v67 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "original fromID %@ -> resulting specificOriginator %@",  buf,  0x16u);
              }

              if (os_log_shim_legacy_logging_enabled(v42)
                && _IDSShouldLog(0LL, @"SessionController"))
              {
                id v43 = (void *)objc_claimAutoreleasedReturnValue([v19 service]);
                id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 identifier]);
                uint64_t v45 = IDSLoggableDescriptionForHandleOnService(v27, v44);
                id v58 = v7;
                v59 = (void *)objc_claimAutoreleasedReturnValue(v45);
                _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"original fromID %@ -> resulting specificOriginator %@");
              }

              goto LABEL_13;
            }

            uint64_t v55 = OSLogHandleForIDSCategory("Warning");
            id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v65 = @"SessionController";
              _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "%@ - No device identity found to build specificOriginator, bailing...",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v57))
            {
              _IDSWarnV( @"IDSFoundation",  @"%@ - No device identity found to build specificOriginator, bailing...");
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No device identity found to build specificOriginator, bailing...");
              _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No device identity found to build specificOriginator, bailing...");
            }
          }

          else
          {
            uint64_t v52 = OSLogHandleForIDSCategory("Warning");
            id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v65 = @"SessionController";
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%@ - No device push token found to build specificOriginator, bailing...",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v54))
            {
              _IDSWarnV( @"IDSFoundation",  @"%@ - No device push token found to build specificOriginator, bailing...");
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No device push token found to build specificOriginator, bailing...");
              _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No device push token found to build specificOriginator, bailing...");
            }
          }
        }

        else
        {
          uint64_t v49 = OSLogHandleForIDSCategory("Warning");
          id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v65 = @"SessionController";
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%@ - No device found to build specificOriginator, bailing...",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v51))
          {
            _IDSWarnV(@"IDSFoundation", @"%@ - No device found to build specificOriginator, bailing...");
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No device found to build specificOriginator, bailing...");
            _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No device found to build specificOriginator, bailing...");
          }
        }
      }

      else
      {
        uint64_t v46 = OSLogHandleForIDSCategory("Warning");
        uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v65 = @"SessionController";
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%@ - No account found to build specificOriginator, bailing...",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v48))
        {
          _IDSWarnV(@"IDSFoundation", @"%@ - No account found to build specificOriginator, bailing...");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No account found to build specificOriginator, bailing...");
          _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No account found to build specificOriginator, bailing...");
        }
      }

      __int128 v32 = 0LL;
      goto LABEL_14;
    }

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString prefixedURI](v7, "prefixedURI"));
  }

- (id)sessionWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v4));
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v7 = OSLogHandleForIDSCategory("Warning");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v12 = @"SessionController";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ - No unique ID provided to lookup session, bailing...",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v9))
    {
      _IDSWarnV(@"IDSFoundation", @"%@ - No unique ID provided to lookup session, bailing...");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No unique ID provided to lookup session, bailing...");
      _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No unique ID provided to lookup session, bailing...");
    }

    id v6 = 0LL;
  }

  return v6;
}

- (id)sessionWithInstanceID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sessions, "allValues"));
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          if (v4)
          {
            id v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
            unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 instanceID]);
            unsigned int v12 = [v11 isEqualToString:v4];

            if (v12)
            {
              id v7 = v10;
              goto LABEL_18;
            }
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

- (id)sessionWithGroupID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000LL;
    __int128 v17 = sub_1001D93F4;
    __int128 v18 = sub_1001D9404;
    id v19 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sessions, "allValues"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001D940C;
    v12[3] = &unk_1008FD8F8;
    id v13 = v4;
    p___int128 buf = &buf;
    [v6 enumerateObjectsUsingBlock:v12];

    id v7 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&buf, 8);

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v8 = OSLogHandleForIDSCategory("Warning");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"SessionController";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ - No group ID provided to lookup session, bailing...",  (uint8_t *)&buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v10))
    {
      _IDSWarnV(@"IDSFoundation", @"%@ - No group ID provided to lookup session, bailing...");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No group ID provided to lookup session, bailing...");
      _IDSLogTransport(@"Warning", @"IDS", @"%@ - No group ID provided to lookup session, bailing...");
    }

    id v7 = 0LL;
  }

  return v7;
}

- (id)sessionWithGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = [v5 length];

  if (v6)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000LL;
    id v19 = sub_1001D93F4;
    __int128 v20 = sub_1001D9404;
    id v21 = 0LL;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sessions, "allValues"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001D96F8;
    v14[3] = &unk_1008FD8F8;
    id v15 = v4;
    p___int128 buf = &buf;
    [v8 enumerateObjectsUsingBlock:v14];

    id v9 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&buf, 8);

    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v10 = OSLogHandleForIDSCategory("Warning");
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"SessionController";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ - No group UUID provided to lookup session, bailing...",  (uint8_t *)&buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12))
    {
      _IDSWarnV(@"IDSFoundation", @"%@ - No group UUID provided to lookup session, bailing...");
      _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%@ - No group UUID provided to lookup session, bailing...");
      _IDSLogTransport( @"Warning",  @"IDS",  @"%@ - No group UUID provided to lookup session, bailing...");
    }

    id v9 = 0LL;
  }

  return v9;
}

- (id)groupSessionGroupIDs
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sessions, "allValues", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupID]);
        BOOL v11 = v10 == 0LL;

        if (!v11)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 groupID]);
          [v4 addObject:v12];
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)sessionIDForAlias:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = self->_sessions;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        uint64_t v14 = IDSIDAliasHashUUIDString(v13, v7);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        unsigned __int8 v16 = objc_msgSend(v15, "isEqualToString:", v13, (void)v18);

        if ((v16 & 1) != 0)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }

      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (void)updateCriticalReliabilityState
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_sessions, "allValues"));
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v8 state] - 8 >= 0xFFFFFFF9)
        {
          id v5 = v8;
          uint64_t v9 = 1LL;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0LL;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = OSLogHandleForIDSCategory("SessionController");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = @"NO";
    if ((_DWORD)v9) {
      uint64_t v12 = @"YES";
    }
    *(_DWORD *)__int128 buf = 138412546;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating critical reliability {needsCritical: %@, session: %@}",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v13)
    && _IDSShouldLog(0LL, @"SessionController"))
  {
    uint64_t v14 = @"NO";
    if ((_DWORD)v9) {
      uint64_t v14 = @"YES";
    }
    unsigned __int8 v16 = v14;
    id v17 = v5;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"SessionController",  @"Updating critical reliability {needsCritical: %@, session: %@}");
  }

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTNetworkSupport sharedInstance](&OBJC_CLASS___FTNetworkSupport, "sharedInstance", v16, v17));
  [v15 setEnableCriticalReliability:v9];
}

- (FTMessageDelivery)messageDelivery
{
  return (FTMessageDelivery *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end