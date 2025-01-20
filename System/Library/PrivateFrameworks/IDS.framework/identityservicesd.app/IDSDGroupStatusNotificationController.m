@interface IDSDGroupStatusNotificationController
+ (IDSDGroupStatusNotificationController)sharedInstance;
- (IDSDGroupStatusNotificationController)init;
- (IDSDGroupStatusNotificationController)initWithSessionController:(id)a3 realTimeEncryptionController:(id)a4 broadcaster:(id)a5;
- (IDSDGroupStatusNotificationControllerBroadcaster)broadcaster;
- (IDSDSessionController)sessionController;
- (IDSGroupEncryptionController)realTimeEncryptionController;
- (NSMutableDictionary)events;
- (NSMutableDictionary)groupIDToCapabilityToParticipantPushTokens;
- (NSMutableDictionary)groupMemberPushTokens;
- (NSMutableSet)groups;
- (OS_dispatch_queue)queue;
- (double)_multiwayFTMessageSendTimeout;
- (id)_currentDateString;
- (id)_specificOriginatorfromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5;
- (id)getURIFromPushToken:(id)a3 forGroup:(id)a4;
- (id)participantsForGroupID:(id)a3;
- (id)pushTokensForGroupID:(id)a3 capability:(id)a4;
- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 commandContext:(id)a8 toGroup:(id)a9 sessionID:(id)a10 reason:(unsigned __int8)a11 waitForMadridAcks:(BOOL)a12 isUPlusOne:(BOOL)a13 isInitiator:(id)a14 quickRelayUserType:(id)a15 requiredCapabilites:(id)a16 requiredLackOfCapabilities:(id)a17 completionBlock:(id)a18;
- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13;
- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13 requiredCapabilites:(id)a14 requiredLackOfCapabilities:(id)a15;
- (void)dealloc;
- (void)notifyJoinToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 completionBlock:(id)a10;
- (void)notifyJoinToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11;
- (void)notifyLeaveToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9;
- (void)notifyLeaveToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11;
- (void)processIncomingParticipantDataUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8;
- (void)processIncomingParticipantUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8;
- (void)pushTokenLookup:(id)a3 forGroup:(id)a4 sessionID:(id)a5 fromURI:(id)a6 account:(id)a7 completionBlock:(id)a8;
- (void)updateMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 messagingCapabilities:(id)a10 reason:(unsigned __int8)a11 isUPlusOne:(BOOL)a12 completionBlock:(id)a13;
- (void)updateParticipantDataToMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 isUPlusOne:(BOOL)a10;
@end

@implementation IDSDGroupStatusNotificationController

+ (IDSDGroupStatusNotificationController)sharedInstance
{
  if (qword_1009BE980 != -1) {
    dispatch_once(&qword_1009BE980, &stru_1008F9470);
  }
  return (IDSDGroupStatusNotificationController *)(id)qword_1009BE988;
}

- (IDSDGroupStatusNotificationController)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDSessionController sharedInstance](&OBJC_CLASS___IDSDSessionController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionController sharedInstance]( &OBJC_CLASS___IDSGroupEncryptionController,  "sharedInstance"));
  v5 = objc_alloc_init(&OBJC_CLASS___IDSDGroupStatusNotificationControllerBroadcaster);
  v6 = -[IDSDGroupStatusNotificationController initWithSessionController:realTimeEncryptionController:broadcaster:]( self,  "initWithSessionController:realTimeEncryptionController:broadcaster:",  v3,  v4,  v5);

  return v6;
}

- (IDSDGroupStatusNotificationController)initWithSessionController:(id)a3 realTimeEncryptionController:(id)a4 broadcaster:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___IDSDGroupStatusNotificationController;
  v12 = -[IDSDGroupStatusNotificationController init](&v27, "init");
  if (v12)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notifiers = v12->_notifiers;
    v12->_notifiers = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    groups = v12->_groups;
    v12->_groups = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    events = v12->_events;
    v12->_events = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    groupIDToCapabilityToParticipantPushTokens = v12->_groupIDToCapabilityToParticipantPushTokens;
    v12->_groupIDToCapabilityToParticipantPushTokens = v19;

    objc_storeStrong((id *)&v12->_sessionController, a3);
    objc_storeStrong((id *)&v12->_realTimeEncryptionController, a4);
    objc_storeStrong((id *)&v12->_broadcaster, a5);
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.ids.IDSDGroupStatusNotificationController");
    dispatch_queue_t v24 = dispatch_queue_create(-[NSString UTF8String](v23, "UTF8String"), v22);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v24;
  }

  return v12;
}

- (void)dealloc
{
  queue = self->_queue;
  self->_queue = 0LL;

  notifiers = self->_notifiers;
  self->_notifiers = 0LL;

  groups = self->_groups;
  self->_groups = 0LL;

  events = self->_events;
  self->_events = 0LL;

  groupMemberPushTokens = self->_groupMemberPushTokens;
  self->_groupMemberPushTokens = 0LL;

  groupIDToCapabilityToParticipantPushTokens = self->_groupIDToCapabilityToParticipantPushTokens;
  self->_groupIDToCapabilityToParticipantPushTokens = 0LL;

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSDGroupStatusNotificationController;
  -[IDSDGroupStatusNotificationController dealloc](&v9, "dealloc");
}

- (id)pushTokensForGroupID:(id)a3 capability:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupIDToCapabilityToParticipantPushTokens,  "objectForKeyedSubscript:",  a3));
  v8 = v7;
  if (v7)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v11 = v9;
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  (void)v18));
            [v10 addObject:v16];
          }

          id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v13);
      }
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v10;
}

- (id)participantsForGroupID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v5 = self->_groups;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      uint64_t v8 = IDSGroupStatusNotificationControllerGroupIDKey;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);

        if (v6 == (id)++v9)
        {
          id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v28,  v34,  16LL);
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:IDSGroupStatusNotificationControllerGroupParticipantsKey]);

      if (v12) {
        goto LABEL_21;
      }
    }

    else
    {
LABEL_19:
    }
  }

  else
  {
    uint64_t v13 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Cannot get participantsForGroupID, no groupID!",  buf,  2u);
    }

    uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
    if ((_DWORD)v16)
    {
      if (_IDSShouldLogTransport(v16))
      {
        _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Cannot get participantsForGroupID, no groupID!");
        if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Cannot get participantsForGroupID, no groupID!");
        }
      }
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
LABEL_21:
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found participants for group %@", buf, 0xCu);
  }

  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  dispatch_queue_t v24 = sub_1000C5EA8;
  v25 = &unk_1008F5F80;
  id v26 = [v4 copy];
  id v27 = (id)objc_claimAutoreleasedReturnValue([v12 description]);
  id v18 = v27;
  id v19 = v26;
  cut_dispatch_log_queue(&v22);
  id v20 = objc_msgSend(v12, "copy", v22, v23, v24, v25);

  return v20;
}

- (id)_currentDateString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy-MM-dd HH:mm:ssz");
  id v4 = -[NSLocale initWithLocaleIdentifier:]( objc_alloc(&OBJC_CLASS___NSLocale),  "initWithLocaleIdentifier:",  @"en_US");
  -[NSDateFormatter setLocale:](v3, "setLocale:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v2));
  return v5;
}

- (void)notifyJoinToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 completionBlock:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v61 = a6;
  id v60 = a7;
  id v18 = a8;
  id v58 = a10;
  uint64_t v19 = im_primary_base_queue(v58);
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v19);
  dispatch_assert_queue_V2(v20);

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 1LL));
  if (v22)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v22);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699D4C();
  }

  id v23 = v15;
  if (v23)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v23);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699CCC();
  }

  dispatch_queue_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByApplyingBlock:", &stru_1008F95E8));
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v24);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699C4C();
  }

  id v25 = v18;
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v25);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699BCC();
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 isInitiator]);
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v26);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699B4C();
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699ACC();
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 sessionWithUniqueID:v25]);

  if (v29 && [v29 handOffOverQREnabled])
  {
    [v29 getIDSContextTimeStamp];
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    if (v30)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v30);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100699A4C();
    }
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v17 participantID]);
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v31);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006999CC();
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v17 participantData]);
  if (v32)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v32);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069994C();
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 urisToParticipantIDs]);
  if (v33) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v33);
  }
  v57 = v29;

  v34 = (void *)objc_claimAutoreleasedReturnValue([v17 clientJoinContextData]);
  if (v34) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v34);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v61 primaryRegistration]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 pushToken]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v61 service]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v36,  v38));

  BOOL v39 = a9;
  if (a9)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue([v17 commandContext]);
    v41 = v16;
  }

  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v17 joinType]);
    id v43 = [v42 integerValue];

    v41 = v16;
    if (v43 == (id)1) {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1LL));
    }
    else {
      v40 = 0LL;
    }
    BOOL v39 = 0;
  }

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_1000C6694;
  v63[3] = &unk_1008F9498;
  v63[4] = self;
  v64 = Mutable;
  id v65 = v61;
  id v66 = v41;
  uint64_t v73 = 207LL;
  id v67 = v60;
  id v68 = v40;
  id v69 = v23;
  id v70 = v25;
  BOOL v74 = v39;
  id v71 = v17;
  id v72 = v58;
  id v59 = v58;
  id v56 = v17;
  id v54 = v25;
  id v44 = v23;
  id v45 = v40;
  id v46 = v60;
  id v47 = v41;
  id v48 = v61;
  v49 = Mutable;
  v50 = objc_retainBlock(v63);
  v51 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDGroupStatusNotificationController realTimeEncryptionController]( self,  "realTimeEncryptionController"));
  id v52 = [v51 createRealTimeEncryptionFullIdentityForDevice:v55 completionBlock:v50];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  [v53 updateCriticalReliabilityState];
}

- (void)notifyJoinToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v66 = a6;
  id v65 = a7;
  id v19 = a8;
  id v63 = a10;
  id v61 = a11;
  uint64_t v20 = im_primary_base_queue(v61);
  __int128 v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
  dispatch_assert_queue_V2(v21);

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 1LL));
  if (v23)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v23);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699D4C();
  }

  id v24 = v16;
  if (v24)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v24);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699CCC();
  }

  id v59 = v24;

  id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_1008F95E8));
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v25);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699C4C();
  }

  id v26 = v19;
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v26);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699BCC();
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v18 isInitiator]);
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699B4C();
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v28);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699ACC();
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  v57 = v26;
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 sessionWithUniqueID:v26]);

  if (v30 && [v30 handOffOverQREnabled])
  {
    [v30 getIDSContextTimeStamp];
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    if (v31)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v31);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100699A4C();
    }
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v18 participantID]);
  if (v32)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v32);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006999CC();
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v18 participantData]);
  if (v33)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v33);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069994C();
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v18 urisToParticipantIDs]);
  if (v34) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v34);
  }
  id v60 = v30;

  v35 = (void *)objc_claimAutoreleasedReturnValue([v18 clientJoinContextData]);
  if (v35) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v35);
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v66 primaryRegistration]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 pushToken]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v66 service]);
  BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
  id v56 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v37,  v39));

  if (a9)
  {
    v40 = v17;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v18 commandContext]);
    v42 = v18;
  }

  else
  {
    v42 = v18;
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v18 joinType]);
    id v44 = [v43 integerValue];

    if (v44 == (id)1)
    {
      v40 = v17;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1LL));
    }

    else
    {
      v40 = v17;
      v41 = 0LL;
    }
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1000C6EC4;
  v68[3] = &unk_1008F94C0;
  v68[4] = self;
  id v69 = Mutable;
  id v70 = v66;
  id v71 = v40;
  id v72 = v65;
  id v73 = v41;
  id v74 = v59;
  id v75 = v57;
  BOOL v80 = a9;
  id v76 = v42;
  id v77 = v63;
  uint64_t v79 = 207LL;
  id v78 = v61;
  id v62 = v61;
  id v64 = v63;
  id v55 = v42;
  id v58 = v57;
  id v45 = v59;
  id v46 = v41;
  id v47 = v65;
  id v48 = v40;
  id v49 = v66;
  v50 = Mutable;
  v51 = objc_retainBlock(v68);
  id v52 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDGroupStatusNotificationController realTimeEncryptionController]( self,  "realTimeEncryptionController"));
  id v53 = [v52 createRealTimeEncryptionFullIdentityForDevice:v56 completionBlock:v51];

  id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  [v54 updateCriticalReliabilityState];
}

- (void)notifyLeaveToGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9
{
  id v15 = a3;
  id v43 = a4;
  id v16 = a5;
  id v42 = a6;
  id v41 = a7;
  id v17 = a8;
  uint64_t v18 = im_primary_base_queue(v17);
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
  dispatch_assert_queue_V2(v19);

  uint64_t v20 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "notify Leave To Group", buf, 2u);
  }

  uint64_t v23 = os_log_shim_legacy_logging_enabled(v22);
  if ((_DWORD)v23)
  {
    if (_IDSShouldLogTransport(v23))
    {
      _IDSLogTransport(@"GroupStatusNotificationController", @"IDS", @"notify Leave To Group");
      if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"notify Leave To Group");
      }
    }
  }

  if (a9) {
    v40 = (void *)objc_claimAutoreleasedReturnValue([v16 commandContext]);
  }
  else {
    v40 = 0LL;
  }
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 2LL));
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v25);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699D4C();
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v16 clientLeaveContextData]);
  if (v26) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v26);
  }

  id v27 = v17;
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699BCC();
  }

  id v28 = v15;
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v28);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699CCC();
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "__imArrayByApplyingBlock:", &stru_1008F95E8));
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v29);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699C4C();
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v16 participantID]);
  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v30);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006999CC();
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v16 isInitiator]);
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v31);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699B4C();
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  if (v32)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v32);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699ACC();
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 sessionWithUniqueID:v27]);

  if (v34 && [v34 handOffOverQREnabled])
  {
    [v34 getIDSContextTimeStamp];
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    if (v35)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v35);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100699A4C();
    }
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v16 isInitiator]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v16 quickRelayUserType]);
  BYTE2(v39) = a9;
  LOWORD(v39) = 0;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:]( self,  "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks: isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:",  Mutable,  v42,  v43,  v41,  208LL,  v40,  v28,  v27,  v39,  v36,  v37,  0LL,  0LL,  0LL);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  [v38 updateCriticalReliabilityState];
}

- (void)notifyLeaveToSpecificMembersOfGroup:(id)a3 members:(id)a4 params:(id)a5 fromAccount:(id)a6 fromURI:(id)a7 sessionID:(id)a8 isUPlusOne:(BOOL)a9 requiredCapabilites:(id)a10 requiredLackOfCapabilities:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v45 = a6;
  id v44 = a7;
  id v19 = a8;
  id v43 = a10;
  id v42 = a11;
  uint64_t v20 = im_primary_base_queue(v42);
  __int128 v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
  dispatch_assert_queue_V2(v21);

  uint64_t v22 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "notify Leave To Group", buf, 2u);
  }

  uint64_t v25 = os_log_shim_legacy_logging_enabled(v24);
  if ((_DWORD)v25)
  {
    if (_IDSShouldLogTransport(v25))
    {
      _IDSLogTransport(@"GroupStatusNotificationController", @"IDS", @"notify Leave To Group");
      if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"notify Leave To Group");
      }
    }
  }

  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 2LL));
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699D4C();
  }

  id v28 = v19;
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v28);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699BCC();
  }

  id v29 = v16;
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v29);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699CCC();
  }

  id v41 = v29;

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "__imArrayByApplyingBlock:", &stru_1008F95E8));
  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v30);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699C4C();
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v18 participantID]);
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v31);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006999CC();
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v18 isInitiator]);
  if (v32)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v32);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699B4C();
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  if (v33)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsUPlusOneKey, v33);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699ACC();
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 sessionWithUniqueID:v28]);

  if (v35 && [v35 handOffOverQREnabled])
  {
    [v35 getIDSContextTimeStamp];
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    if (v36)
    {
      CFDictionarySetValue(Mutable, IDSContextTimeStamp, v36);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100699A4C();
    }
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue([v18 isInitiator]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v18 quickRelayUserType]);
  BYTE1(v40) = a9;
  LOBYTE(v40) = 0;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:]( self,  "_sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelay UserType:requiredCapabilites:requiredLackOfCapabilities:",  Mutable,  v45,  v17,  v44,  208LL,  v41,  v28,  v40,  v37,  v38,  v43,  v42);

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
  [v39 updateCriticalReliabilityState];
}

- (void)updateMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 messagingCapabilities:(id)a10 reason:(unsigned __int8)a11 isUPlusOne:(BOOL)a12 completionBlock:(id)a13
{
  id v47 = a3;
  id v18 = a4;
  id v46 = a5;
  id v19 = a6;
  id v20 = a9;
  id v44 = a13;
  id v21 = a10;
  id v42 = a8;
  id v41 = a7;
  uint64_t v22 = im_primary_base_queue(v41);
  uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v22);
  dispatch_assert_queue_V2(v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 3LL));
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v26 = v18;
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v26);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699CCC();
  }

  id v27 = v20;
  id v43 = v26;
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699BCC();
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "__imArrayByApplyingBlock:", &stru_1008F95E8));
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupMembersKey, v28);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699C4C();
  }

  id v29 = v24;
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v29);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699D4C();
  }

  uint64_t v40 = v29;

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v19 isInitiator]);
  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v30);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699B4C();
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v19 participantID]);
  if (v31)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v31);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006999CC();
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v19 participantData]);
  if (v32)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v32);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069994C();
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue([v19 urisToParticipantIDs]);
  if (v33) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v33);
  }

  if (v46) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v46);
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue([v19 isInitiator]);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v21 requiredCapabilities]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v39 allObjects]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v21 requiredMissingCapabilities]);

  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 allObjects]);
  BYTE2(v37) = a12;
  BYTE1(v37) = 1;
  LOBYTE(v37) = a11;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:]( self,  "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks: isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:",  Mutable,  v41,  v47,  v42,  209LL,  0LL,  v43,  v27,  v37,  v38,  0LL,  v34,  v36,  v44);
}

- (void)updateParticipantDataToMembers:(id)a3 toGroup:(id)a4 withContext:(id)a5 params:(id)a6 fromAccount:(id)a7 fromURI:(id)a8 sessionID:(id)a9 isUPlusOne:(BOOL)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v34 = a8;
  id v19 = a7;
  id v20 = a3;
  uint64_t v21 = im_primary_base_queue(v20);
  uint64_t v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v21);
  dispatch_assert_queue_V2(v22);

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", 4LL));
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v25 = v15;
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSFanoutMessageGroupIDKey, v25);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699CCC();
  }

  id v26 = v18;
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageSessionID, v26);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699BCC();
  }

  id v27 = v23;
  if (v27)
  {
    CFDictionarySetValue(Mutable, IDSDSessionMessageJoinNotificationKey, v27);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699D4C();
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v17 isInitiator]);
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionIsInitiatorKey, v28);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100699B4C();
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v17 participantID]);
  if (v29)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantIDKey, v29);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006999CC();
  }

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v17 participantData]);
  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSGroupSessionParticipantDataKey, v30);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10069994C();
  }

  if (v16) {
    CFDictionarySetValue(Mutable, IDSGroupSessionClientContextDataKey, v16);
  }
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v17 urisToParticipantIDs]);
  if (v31) {
    CFDictionarySetValue(Mutable, IDSGroupSessionURIToParticipantID, v31);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v17 isInitiator]);
  BYTE1(v33) = a10;
  LOBYTE(v33) = 0;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:]( self,  "_sendFanoutMessage:account:toGroupMembers:fromURI:command:toGroup:sessionID:reason:isUPlusOne:isInitiator:quickRelayUserType:",  Mutable,  v19,  v20,  v34,  239LL,  v25,  v26,  v33,  v32,  0LL);
}

- (double)_multiwayFTMessageSendTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-multiway-ftmessage-send-timeout"]);

  double v5 = 605.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      if (v7 > 0.0)
      {
        double v8 = v7;
        uint64_t v9 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v15 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Server Bag provided us with a send timeout of %f ",  buf,  0xCu);
        }

        uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
        if ((_DWORD)v12)
        {
          if (_IDSShouldLogTransport(v12))
          {
            _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Server Bag provided us with a send timeout of %f ");
            if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Server Bag provided us with a send timeout of %f ");
            }
          }
        }

        double v5 = v8;
      }
    }
  }

  return v5;
}

- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13
{
  BYTE2(v13) = a11;
  LOWORD(v13) = a10;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:]( self,  "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks: isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:",  a3,  a4,  a5,  a6,  a7,  0LL,  a8,  a9,  v13,  a12,  a13,  0LL,  0LL,  0LL);
}

- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 toGroup:(id)a8 sessionID:(id)a9 reason:(unsigned __int8)a10 isUPlusOne:(BOOL)a11 isInitiator:(id)a12 quickRelayUserType:(id)a13 requiredCapabilites:(id)a14 requiredLackOfCapabilities:(id)a15
{
  BYTE2(v15) = a11;
  LOWORD(v15) = a10;
  -[IDSDGroupStatusNotificationController _sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks:isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:]( self,  "_sendFanoutMessage:account:toGroupMembers:fromURI:command:commandContext:toGroup:sessionID:reason:waitForMadridAcks: isUPlusOne:isInitiator:quickRelayUserType:requiredCapabilites:requiredLackOfCapabilities:completionBlock:",  a3,  a4,  a5,  a6,  a7,  0LL,  a8,  a9,  v15,  a12,  a13,  a14,  a15,  0LL);
}

- (void)_sendFanoutMessage:(id)a3 account:(id)a4 toGroupMembers:(id)a5 fromURI:(id)a6 command:(int64_t)a7 commandContext:(id)a8 toGroup:(id)a9 sessionID:(id)a10 reason:(unsigned __int8)a11 waitForMadridAcks:(BOOL)a12 isUPlusOne:(BOOL)a13 isInitiator:(id)a14 quickRelayUserType:(id)a15 requiredCapabilites:(id)a16 requiredLackOfCapabilities:(id)a17 completionBlock:(id)a18
{
  id v63 = a3;
  id v66 = (__CFString *)a4;
  id v22 = a5;
  id v67 = a6;
  id v69 = a8;
  id v62 = a9;
  id v70 = a10;
  id v64 = a14;
  id v65 = a15;
  unint64_t v23 = (unint64_t)a16;
  unint64_t v24 = (unint64_t)a17;
  id v68 = a18;
  if (v22)
  {
    id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));
    id v60 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDestination destinationWithDestinations:]( &OBJC_CLASS___IDSDestination,  "destinationWithDestinations:",  v59));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
    id v26 = objc_alloc_init(&OBJC_CLASS___IDSSendParameters);
    [v26 setQuickRelayUserType:v65];
    [v26 setMessage:v63];
    [v26 setEncryptPayload:1];
    [v26 setPriority:300];
    [v26 setDestinations:v60];
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
    [v26 setCommand:v27];

    [v26 setCommandContext:v69];
    [v26 setIdentifier:v25];
    [v26 setAlwaysSkipSelf:1];
    uint64_t v28 = IDSGetUUIDData(v25);
    id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    [v26 setMessageUUID:v29];

    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v67 unprefixedURI]);
    [v26 setFromID:v30];

    -[IDSDGroupStatusNotificationController _multiwayFTMessageSendTimeout](self, "_multiwayFTMessageSendTimeout");
    objc_msgSend(v26, "setTimeout:");
    [v26 setIgnoreMaxRetryCount:1];
    [v26 setWantsResponse:1];
    [v26 setIsUPlusOne:a13];
    [v26 setIsInitiator:v64];
    if (_os_feature_enabled_impl("IDS", "PrioritizedActiveParticipants"))
    {
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDSessionActiveParticipantsCache sharedInstance]( &OBJC_CLASS___IDSDSessionActiveParticipantsCache,  "sharedInstance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 vendTokenListForSessionID:v70]);
      [v26 setPrioritizedTokenList:v32];
    }

    if (v23 | v24)
    {
      if ([(id)v23 count])
      {
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v82 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Group status notification requires properties -- manual {requiredCapabilites: %@}",  buf,  0xCu);
        }

        [v26 setRequireAllRegistrationProperties:v23];
      }

      if ([(id)v24 count])
      {
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v82 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Group status notification requires lack of properties -- manual {requiredLackOfCapabilities: %@}",  buf,  0xCu);
        }

        [v26 setRequireLackOfRegistrationProperties:v24];
      }
    }

    else
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 sessionWithUniqueID:v70]);

      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 requiredLackOfCapabilities]);
      id v42 = [v41 count];

      if (v42)
      {
        id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v40 requiredLackOfCapabilities]);
          *(_DWORD *)buf = 138412290;
          unint64_t v82 = (unint64_t)v44;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Group status notification requires lack of properties {requiredLackOfCapabilities: %@}",  buf,  0xCu);
        }

        id v45 = (void *)objc_claimAutoreleasedReturnValue([v40 requiredLackOfCapabilities]);
        [v26 setRequireLackOfRegistrationProperties:v45];
      }

      id v46 = (void *)objc_claimAutoreleasedReturnValue([v40 requiredCapabilities]);
      id v47 = [v46 count];

      if (v47)
      {
        id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = (void *)objc_claimAutoreleasedReturnValue([v40 requiredCapabilities]);
          *(_DWORD *)buf = 138412290;
          unint64_t v82 = (unint64_t)v49;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Group status notification requires properties {requiredCapabilities: %@}",  buf,  0xCu);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue([v40 requiredCapabilities]);
        [v26 setRequireAllRegistrationProperties:v50];
      }
    }

    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      id v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
      if (a12) {
        id v53 = @"YES";
      }
      else {
        id v53 = @"NO";
      }
      id v54 = objc_retainBlock(v68);
      *(_DWORD *)buf = 138413314;
      unint64_t v82 = (unint64_t)v25;
      __int16 v83 = 2112;
      v84 = v52;
      __int16 v85 = 2112;
      id v86 = v69;
      __int16 v87 = 2112;
      v88 = v53;
      __int16 v89 = 2112;
      id v90 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Sending group status notification fanout message { GUID: %@, command: %@, commandContext: %@, waitForMadridAcks: %@, completionBlock: %@ }",  buf,  0x34u);
    }

    v79[0] = 0LL;
    v79[1] = v79;
    v79[2] = 0x3032000000LL;
    v79[3] = sub_1000C8D88;
    v79[4] = sub_1000C8DB0;
    id v80 = (id)0xAAAAAAAAAAAAAAAALL;
    id v80 = objc_retainBlock(v68);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_1000C8DB8;
    v71[3] = &unk_1008F94E8;
    id v55 = v25;
    BOOL v77 = a12;
    id v72 = v55;
    id v76 = v79;
    id v73 = v22;
    id v74 = v62;
    id v75 = v70;
    unsigned __int8 v78 = a11;
    -[__CFString sendMessageWithSendParameters:willSendBlock:completionBlock:]( v66,  "sendMessageWithSendParameters:willSendBlock:completionBlock:",  v26,  0LL,  v71);
    id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a7));
      *(_DWORD *)buf = 138413314;
      unint64_t v82 = (unint64_t)v55;
      __int16 v83 = 2112;
      v84 = v60;
      __int16 v85 = 2112;
      id v86 = v57;
      __int16 v87 = 2112;
      v88 = v66;
      __int16 v89 = 2112;
      id v90 = v67;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "Sent messageID %@ to the destination %@ command %@ (account %@, fromURI %@)",  buf,  0x34u);
    }

    _Block_object_dispose(v79, 8);
  }

  else
  {
    uint64_t v35 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "No Group, bailing...", buf, 2u);
    }

    uint64_t v38 = os_log_shim_legacy_logging_enabled(v37);
    if ((_DWORD)v38)
    {
      if (_IDSShouldLogTransport(v38))
      {
        _IDSLogTransport(@"GroupStatusNotificationController", @"IDS", @"No Group, bailing...");
        if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"No Group, bailing...");
        }
      }
    }
  }
}

- (void)processIncomingParticipantUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8
{
  id v14 = a3;
  v179 = (__CFString *)a4;
  v180 = (__CFString *)a5;
  id v172 = a6;
  id v177 = a7;
  id v181 = a8;
  uint64_t v15 = objc_alloc_init(&OBJC_CLASS___IDSGroupStatusNotificationParameters);
  v174 = self;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self->_account, "uniqueID"));
  v173 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDGroupStatusNotificationController _specificOriginatorfromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorfromURI:senderToken:accountUniqueID:",  v180,  v179,  v16));

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
  id v19 = sub_1000CA504(v18, v14, IDSFanoutMessageGroupIDKey);
  v178 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
  id v22 = sub_1000CA504(v21, v14, IDSDSessionMessageJoinNotificationKey);
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v176 = (char *)[v23 unsignedIntegerValue];

  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v181 objectForKey:IDSMessageContextCommandContextKey]);
  id v25 = [v24 integerValue];
  else {
    id v26 = v25;
  }
  id v165 = v26;

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSNumber, v27);
  id v29 = (void *)IDSMessageContextFromServerStorageKey;
  id v30 = sub_1000CA504(v28, v181, IDSMessageContextFromServerStorageKey);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v33 = &OBJC_CLASS___NSString_ptr;
  if (v32) {
    uint64_t v33 = &OBJC_CLASS___NSNumber_ptr;
  }
  uint64_t v34 = objc_opt_class(*v33, v31);
  id v35 = sub_1000CA504(v34, v181, v29);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  unsigned int v166 = [v36 BOOLValue];

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v181 objectForKey:IDSMessageContextServerTimestampKey]);
  [v37 doubleValue];
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));

  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber, v38);
  id v40 = sub_1000CA504(v39, v14, IDSSessionParticipantIDKey);
  id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  -[IDSGroupStatusNotificationParameters setParticipantID:](v15, "setParticipantID:", v41);

  uint64_t v42 = IDSSessionParticipantDataKey;
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionParticipantDataKey]);
  uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString, v44);
  if ((objc_opt_isKindOfClass(v43, v45) & 1) != 0)
  {
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v42]);
    uint64_t v47 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v46));
LABEL_10:
    v50 = (void *)v47;
    -[IDSGroupStatusNotificationParameters setParticipantData:](v15, "setParticipantData:", v47);

    goto LABEL_12;
  }

  id v46 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v42]);
  uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSData, v48);
  if ((objc_opt_isKindOfClass(v46, v49) & 1) != 0)
  {
    uint64_t v47 = objc_claimAutoreleasedReturnValue([v14 objectForKey:v42]);
    goto LABEL_10;
  }

  -[IDSGroupStatusNotificationParameters setParticipantData:](v15, "setParticipantData:", 0LL);
LABEL_12:

  uint64_t v51 = IDSGroupSessionClientContextDataKey;
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionClientContextDataKey]);
  uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString, v53);
  if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0)
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v51]);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v55));
LABEL_16:
    id v59 = (void *)v56;
    -[IDSGroupStatusNotificationParameters setClientJoinContextData:](v15, "setClientJoinContextData:", v56);

    goto LABEL_18;
  }

  id v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v51]);
  uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSData, v57);
  if ((objc_opt_isKindOfClass(v55, v58) & 1) != 0)
  {
    uint64_t v56 = objc_claimAutoreleasedReturnValue([v14 objectForKey:v51]);
    goto LABEL_16;
  }

  -[IDSGroupStatusNotificationParameters setClientJoinContextData:](v15, "setClientJoinContextData:", 0LL);
LABEL_18:

  uint64_t v61 = objc_opt_class(&OBJC_CLASS___NSDictionary, v60);
  id v62 = sub_1000CA504(v61, v14, IDSGroupSessionURIToParticipantID);
  id v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  -[IDSGroupStatusNotificationParameters setUrisToParticipantIDs:](v15, "setUrisToParticipantIDs:", v63);

  uint64_t v65 = objc_opt_class(&OBJC_CLASS___NSNumber, v64);
  id v66 = sub_1000CA504(v65, v14, IDSGroupSessionIsInitiatorKey);
  id v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
  -[IDSGroupStatusNotificationParameters setIsInitiator:](v15, "setIsInitiator:", v67);

  uint64_t v69 = objc_opt_class(&OBJC_CLASS___NSNumber, v68);
  id v70 = sub_1000CA504(v69, v14, IDSContextTimeStamp);
  v167 = (void *)objc_claimAutoreleasedReturnValue(v70);
  uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSNumber, v71);
  id v73 = (void *)IDSGroupSessionIsUPlusOneKey;
  id v74 = sub_1000CA504(v72, v14, IDSGroupSessionIsUPlusOneKey);
  id v76 = (void *)objc_claimAutoreleasedReturnValue(v74);
  BOOL v77 = &OBJC_CLASS___NSString_ptr;
  if (v76) {
    BOOL v77 = &OBJC_CLASS___NSNumber_ptr;
  }
  uint64_t v78 = objc_opt_class(*v77, v75);
  id v79 = sub_1000CA504(v78, v14, v73);
  id v80 = (void *)objc_claimAutoreleasedReturnValue(v79);
  unsigned int v81 = [v80 BOOLValue];

  uint64_t v82 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
  __int16 v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v84 = IDSLoggableDescriptionForObjectOnService(v14, v177);
    __int16 v85 = (__CFString *)objc_claimAutoreleasedReturnValue(v84);
    id v86 = @"NO";
    *(_DWORD *)buf = 138413570;
    v183 = v85;
    if (v166) {
      __int16 v87 = @"YES";
    }
    else {
      __int16 v87 = @"NO";
    }
    if (v81) {
      id v86 = @"YES";
    }
    __int16 v184 = 2112;
    v185 = v179;
    __int16 v186 = 2112;
    v187 = v180;
    __int16 v188 = 2112;
    v189 = v173;
    __int16 v190 = 2112;
    v191 = v87;
    __int16 v192 = 2112;
    v193 = v86;
    _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "Process incoming fanout message: %@, fromToken: %@, fromURI: %@, specificOriginator: %@ fromStorage %@ isUPlusOne %@",  buf,  0x3Eu);
  }

  uint64_t v89 = os_log_shim_legacy_logging_enabled(v88);
  if ((_DWORD)v89 && _IDSShouldLogTransport(v89))
  {
    uint64_t v91 = IDSLoggableDescriptionForObjectOnService(v14, v177);
    v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
    v93 = v166 ? @"YES" : @"NO";
    v94 = v81 ? @"YES" : @"NO";
    v162 = v93;
    v163 = v94;
    v161 = v173;
    v156 = v179;
    v160 = v180;
    v154 = v92;
    _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Process incoming fanout message: %@, fromToken: %@, fromURI: %@, specificOriginator: %@ fromStorage %@ isUPlusOne %@");

    if (_IDSShouldLog(0LL, @"GroupStatusNotificationController"))
    {
      uint64_t v95 = IDSLoggableDescriptionForObjectOnService(v14, v177);
      v162 = v93;
      v163 = v94;
      v161 = v173;
      v156 = v179;
      v160 = v180;
      v154 = (void *)objc_claimAutoreleasedReturnValue(v95);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Process incoming fanout message: %@, fromToken: %@, fromURI: %@, specificOriginator: %@ fromStorage %@ isUPlusOne %@");
    }
  }

  uint64_t v96 = objc_opt_class(&OBJC_CLASS___NSArray, v90);
  id v97 = sub_1000CA504(v96, v14, IDSFanoutMessageGroupMembersKey);
  v175 = (void *)objc_claimAutoreleasedReturnValue(v97);
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "__imArrayByApplyingBlock:", &stru_1008F9508));
  v98 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v178);
  else {
    v168 = 0LL;
  }
  v169 = (void *)objc_claimAutoreleasedReturnValue( -[IDSGroupStatusNotificationParameters clientJoinContextData]( v15,  "clientJoinContextData",  v154,  v156,  v160,  v161,  v162,  v163));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v98, "UUIDString"));
  unsigned __int8 v100 = [v99 isEqualToString:v178];

  if ((v100 & 1) != 0)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](v174, "sessionController"));
    v102 = (void *)objc_claimAutoreleasedReturnValue([v101 sessionWithGroupUUID:v98]);

    if (v102
      && (v103 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString URIByAddingOptionalPushToken:](v180, "URIByAddingOptionalPushToken:", v179)),
          unsigned __int8 v104 = [v102 destinationsContainFromURI:v103],
          v103,
          (v104 & 1) == 0))
    {
      uint64_t v116 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
      v117 = (os_log_s *)objc_claimAutoreleasedReturnValue(v116);
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v183 = v178;
        __int16 v184 = 2112;
        v185 = v180;
        _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_DEFAULT,  "processIncomingParticipantUpdateMessage: We'll drop this participant update message for group %@ since %@ is n ot in this group!",  buf,  0x16u);
      }

      uint64_t v119 = os_log_shim_legacy_logging_enabled(v118);
      if ((_DWORD)v119)
      {
        if (_IDSShouldLogTransport(v119))
        {
          v155 = v178;
          v157 = v180;
          _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"processIncomingParticipantUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!");
          if (_IDSShouldLog(0LL, @"GroupStatusNotificationController"))
          {
            v155 = v178;
            v157 = v180;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"processIncomingParticipantUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!");
          }
        }
      }

      v120 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog SessionController]( &OBJC_CLASS___IDSFoundationLog,  "SessionController",  v155,  v157));
      if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
      {
        v153 = (__CFString *)objc_claimAutoreleasedReturnValue([v102 destinations]);
        *(_DWORD *)buf = 134218498;
        v183 = (const __CFString *)v176;
        __int16 v184 = 2112;
        v185 = v180;
        __int16 v186 = 2112;
        v187 = v153;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_FAULT,  "Dropping group session participant update due to membership mismatch { type: %lu, fromURI: %@, destinations: %@ }",  buf,  0x20u);
      }
    }

    else
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters isInitiator](v15, "isInitiator"));
      unsigned int v164 = [v105 BOOLValue];

      if (v176 == (char *)2)
      {
        v106 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDGroupStatusNotificationController realTimeEncryptionController]( v174,  "realTimeEncryptionController"));
        [v106 removeActiveParticipant:v179 forGroup:v178];

        goto LABEL_63;
      }

      if (v176 != (char *)1)
      {
LABEL_63:
        if (!v102) {
          goto LABEL_96;
        }
        goto LABEL_64;
      }

      if (v102)
      {
        uint64_t v107 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
        v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          v109 = @"NO";
          if (v164) {
            v109 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v183 = v109;
          _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "Receive join from initiator: %@",  buf,  0xCu);
        }

        uint64_t v111 = os_log_shim_legacy_logging_enabled(v110);
        if ((_DWORD)v111 && _IDSShouldLogTransport(v111))
        {
          v112 = v164 ? @"YES" : @"NO";
          v155 = v112;
          _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Receive join from initiator: %@");
          if (_IDSShouldLog(0LL, @"GroupStatusNotificationController"))
          {
            v155 = v112;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Receive join from initiator: %@");
          }
        }

        if ((v164 & 1) == 0) {
          [v102 receiveJoinNotificationFromAParticipant];
        }
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString rawToken](v179, "rawToken", v155));
        [v102 reportJoinReceivedOverPushFromToken:v113];

LABEL_64:
        if ([v102 handOffOverQREnabled])
        {
          if ((unint64_t)(v176 - 1) <= 1 && v167)
          {
            v114 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters participantID](v15, "participantID"));
            [v167 doubleValue];
            unsigned __int8 v115 = objc_msgSend(v102, "shouldReportToClient:timeStamp:type:", v114, v176);

            if ((v115 & 1) == 0) {
              goto LABEL_114;
            }
          }

          else
          {
            uint64_t v121 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
            v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
            if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
            {
              [v167 doubleValue];
              *(_DWORD *)buf = 134218240;
              v183 = (const __CFString *)v176;
              __int16 v184 = 2048;
              v185 = v123;
              _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "Should not dedup, updateType: %lu, timeStamp: %f",  buf,  0x16u);
            }

            uint64_t v125 = os_log_shim_legacy_logging_enabled(v124);
            if ((_DWORD)v125)
            {
              if (_IDSShouldLogTransport(v125))
              {
                [v167 doubleValue];
                uint64_t v158 = v126;
                v155 = (__CFString *)v176;
                _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Should not dedup, updateType: %lu, timeStamp: %f");
                if (_IDSShouldLog(0LL, @"GroupStatusNotificationController"))
                {
                  objc_msgSend(v167, "doubleValue", v176, v158);
                  v155 = (__CFString *)v176;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Should not dedup, updateType: %lu, timeStamp: %f");
                }
              }
            }
          }

          goto LABEL_113;
        }

- (void)processIncomingParticipantDataUpdateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8
{
  id v14 = a3;
  id v112 = a4;
  id v114 = a5;
  id v105 = a6;
  id v110 = a7;
  id v113 = a8;
  unsigned __int8 v115 = objc_alloc_init(&OBJC_CLASS___IDSGroupStatusNotificationParameters);
  uint64_t v107 = self;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDAccount uniqueID](self->_account, "uniqueID"));
  v108 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDGroupStatusNotificationController _specificOriginatorfromURI:senderToken:accountUniqueID:]( self,  "_specificOriginatorfromURI:senderToken:accountUniqueID:",  v114,  v112,  v15));

  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString, v16);
  id v18 = sub_1000CA504(v17, v14, IDSFanoutMessageGroupIDKey);
  uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v19);
  id v21 = sub_1000CA504(v20, v14, IDSDSessionMessageJoinNotificationKey);
  id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v100 = [v22 unsignedIntegerValue];

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber, v23);
  id v25 = (void *)IDSMessageContextFromServerStorageKey;
  id v26 = sub_1000CA504(v24, v113, IDSMessageContextFromServerStorageKey);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v26);
  id v29 = &OBJC_CLASS___NSString_ptr;
  if (v28) {
    id v29 = &OBJC_CLASS___NSNumber_ptr;
  }
  uint64_t v30 = objc_opt_class(*v29, v27);
  id v31 = sub_1000CA504(v30, v113, v25);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  unsigned int v101 = [v32 BOOLValue];

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v113 objectForKey:IDSMessageContextServerTimestampKey]);
  [v33 doubleValue];
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));

  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber, v34);
  id v36 = sub_1000CA504(v35, v14, IDSGroupSessionIsInitiatorKey);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  -[IDSGroupStatusNotificationParameters setIsInitiator:](v115, "setIsInitiator:", v37);

  uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber, v38);
  id v40 = sub_1000CA504(v39, v14, IDSSessionParticipantIDKey);
  id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  -[IDSGroupStatusNotificationParameters setParticipantID:](v115, "setParticipantID:", v41);

  uint64_t v42 = IDSSessionParticipantDataKey;
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSSessionParticipantDataKey]);
  uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSString, v44);
  if ((objc_opt_isKindOfClass(v43, v45) & 1) != 0)
  {
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v42]);
    uint64_t v47 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v46));
LABEL_7:
    v50 = (void *)v47;
    -[IDSGroupStatusNotificationParameters setParticipantData:](v115, "setParticipantData:", v47);

    goto LABEL_9;
  }

  id v46 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v42]);
  uint64_t v49 = objc_opt_class(&OBJC_CLASS___NSData, v48);
  if ((objc_opt_isKindOfClass(v46, v49) & 1) != 0)
  {
    uint64_t v47 = objc_claimAutoreleasedReturnValue([v14 objectForKey:v42]);
    goto LABEL_7;
  }

  -[IDSGroupStatusNotificationParameters setParticipantData:](v115, "setParticipantData:", 0LL);
LABEL_9:

  uint64_t v51 = IDSGroupSessionClientContextDataKey;
  id v52 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:IDSGroupSessionClientContextDataKey]);
  uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSString, v53);
  if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0)
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v51]);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v55));
LABEL_13:
    id v59 = (void *)v56;
    -[IDSGroupStatusNotificationParameters setClientJoinContextData:](v115, "setClientJoinContextData:", v56);

    goto LABEL_15;
  }

  id v55 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v51]);
  uint64_t v58 = objc_opt_class(&OBJC_CLASS___NSData, v57);
  if ((objc_opt_isKindOfClass(v55, v58) & 1) != 0)
  {
    uint64_t v56 = objc_claimAutoreleasedReturnValue([v14 objectForKey:v51]);
    goto LABEL_13;
  }

  -[IDSGroupStatusNotificationParameters setClientJoinContextData:](v115, "setClientJoinContextData:", 0LL);
LABEL_15:

  uint64_t v60 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
  uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = IDSLoggableDescriptionForObjectOnService(v14, v110);
    id v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    uint64_t v64 = @"NO";
    *(_DWORD *)buf = 138413314;
    id v117 = v63;
    if (v101) {
      uint64_t v64 = @"YES";
    }
    __int16 v118 = 2112;
    id v119 = v112;
    __int16 v120 = 2112;
    id v121 = v114;
    __int16 v122 = 2112;
    v123 = v108;
    __int16 v124 = 2112;
    uint64_t v125 = v64;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Process incoming fanout message: %@, fromToken: %@, fromID: %@, specificOriginator: %@ fromStorage %@",  buf,  0x34u);
  }

  uint64_t v66 = os_log_shim_legacy_logging_enabled(v65);
  if ((_DWORD)v66 && _IDSShouldLogTransport(v66))
  {
    uint64_t v68 = IDSLoggableDescriptionForObjectOnService(v14, v110);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    id v70 = v101 ? @"YES" : @"NO";
    v98 = v108;
    v99 = v70;
    id v96 = v112;
    id v97 = v114;
    uint64_t v95 = v69;
    _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Process incoming fanout message: %@, fromToken: %@, fromID: %@, specificOriginator: %@ fromStorage %@");

    if (_IDSShouldLog(0LL, @"GroupStatusNotificationController"))
    {
      uint64_t v71 = IDSLoggableDescriptionForObjectOnService(v14, v110);
      v98 = v108;
      v99 = v70;
      id v96 = v112;
      id v97 = v114;
      uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(v71);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Process incoming fanout message: %@, fromToken: %@, fromID: %@, specificOriginator: %@ fromStorage %@");
    }
  }

  uint64_t v72 = objc_opt_class(&OBJC_CLASS___NSArray, v67);
  id v73 = sub_1000CA504(v72, v14, IDSFanoutMessageGroupMembersKey);
  v109 = (void *)objc_claimAutoreleasedReturnValue(v73);
  unsigned __int8 v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "__imArrayByApplyingBlock:", &stru_1008F9528));
  id v74 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v111);
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters participantData](v115, "participantData"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters clientJoinContextData](v115, "clientJoinContextData"));
  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v74, "UUIDString"));
  unsigned __int8 v76 = [v75 isEqualToString:v111];

  if ((v76 & 1) != 0)
  {
    BOOL v77 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController sessionController](self, "sessionController"));
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue([v77 sessionWithGroupUUID:v74]);

    if (v78
      && (id v79 = (void *)objc_claimAutoreleasedReturnValue([v114 URIByAddingOptionalPushToken:v112]),
          unsigned __int8 v80 = [v78 destinationsContainFromURI:v79],
          v79,
          (v80 & 1) == 0))
    {
      uint64_t v90 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
      uint64_t v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v117 = v111;
        __int16 v118 = 2112;
        id v119 = v114;
        _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "processIncomingParticipantDataUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!",  buf,  0x16u);
      }

      uint64_t v93 = os_log_shim_legacy_logging_enabled(v92);
      if ((_DWORD)v93)
      {
        if (_IDSShouldLogTransport(v93))
        {
          uint64_t v95 = v111;
          id v96 = v114;
          _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"processIncomingParticipantDataUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!");
          if (_IDSShouldLog(0LL, @"GroupStatusNotificationController"))
          {
            uint64_t v95 = v111;
            id v96 = v114;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"processIncomingParticipantDataUpdateMessage: We'll drop this participant update message for group %@ since %@ is not in this group!");
          }
        }
      }

      uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog SessionController]( &OBJC_CLASS___IDSFoundationLog,  "SessionController",  v95,  v96,  v97,  v98,  v99));
      if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue([v78 destinations]);
        *(_DWORD *)buf = 134218498;
        id v117 = v100;
        __int16 v118 = 2112;
        id v119 = v114;
        __int16 v120 = 2112;
        id v121 = v94;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_FAULT,  "Dropping group session participant data update due to membership mismatch { type: %lu, fromURI: %@, destinations: %@ }",  buf,  0x20u);
      }
    }

    else
    {
      id v81 = objc_alloc(&OBJC_CLASS___IDSGroupSessionParticipantUpdate);
      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters isInitiator](v115, "isInitiator"));
      id v83 = [v82 BOOLValue];
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters participantID](v115, "participantID"));
      id v85 = [v84 unsignedLongLongValue];
      id v86 = (void *)objc_claimAutoreleasedReturnValue([v114 URIByAddingPushToken:v112]);
      __int16 v87 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupStatusNotificationParameters urisToParticipantIDs](v115, "urisToParticipantIDs"));
      LOBYTE(v95) = v101;
      uint64_t v88 = (os_log_s *)[v81 initWithGroupUUID:v74 isInitiator:v83 participantIdentifier:v85 participantDestinationURI:v86 participantUpdat eType:v100 participantUpdateSubtype:0 fromServer:v95 serverDate:v106 participantData:v103 clientContextData:v102 members :v104 participantIDs:v87 relaySessionID:0];

      uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupStatusNotificationController broadcaster](v107, "broadcaster"));
      [v89 broadcastGroupSessionParticipantDataUpdate:v88 onTopic:v110 toURI:v105 fromURI:v114];
    }
  }

  else
  {
    uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog SessionController](&OBJC_CLASS___IDSFoundationLog, "SessionController"));
    if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_FAULT)) {
      sub_100699ED4(v74);
    }
  }
}

- (void)pushTokenLookup:(id)a3 forGroup:(id)a4 sessionID:(id)a5 fromURI:(id)a6 account:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v38 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = v14;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v17 _registrationCert]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 service]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);

  if (!self->_groupMemberPushTokens)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    groupMemberPushTokens = self->_groupMemberPushTokens;
    self->_groupMemberPushTokens = Mutable;
  }

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000CB2FC;
  v46[3] = &unk_1008F9550;
  objc_copyWeak(&v52, location);
  id v24 = v16;
  id v47 = v24;
  id v25 = v15;
  id v48 = v25;
  id v26 = v19;
  id v49 = v26;
  v50 = self;
  id v27 = v18;
  id v51 = v27;
  uint64_t v28 = objc_retainBlock(v46);
  id v29 = [v26 count];
  if (v29)
  {
    uint64_t v31 = im_primary_queue(v29, v30);
    v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v31);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000CBD78;
    block[3] = &unk_1008F9578;
    id v41 = v26;
    id v42 = v37;
    id v43 = v38;
    id v44 = v21;
    uint64_t v45 = v28;
    dispatch_async(v32, block);
  }

  else
  {
    uint64_t v33 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Cannot find the push tokens, missing recipientIDs.",  buf,  2u);
    }

    uint64_t v36 = os_log_shim_legacy_logging_enabled(v35);
    if ((_DWORD)v36)
    {
      if (_IDSShouldLogTransport(v36))
      {
        _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Cannot find the push tokens, missing recipientIDs.");
        if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Cannot find the push tokens, missing recipientIDs.");
        }
      }
    }
  }

  objc_destroyWeak(&v52);
  objc_destroyWeak(location);
}

- (id)_specificOriginatorfromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  unsigned int v11 = [v10 hasPrefix:@"device:"];

  if (v11) {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 unprefixedURI]);
  }
  else {
    uint64_t v12 = 0LL;
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pairedDeviceUniqueID]);
  unsigned int v15 = [v12 isEqualToIgnoringCase:v14];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  unsigned int v17 = [v16 isEqualToIgnoringCase:IDSDefaultPairedDevice];

  if (!v8)
  {
    if ((v17 | v15) == 1)
    {
      id v18 = v7;
      goto LABEL_9;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountWithUniqueID:v9]);

    if (v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dependentRegistrationMatchingUUID:v12]);
      id v25 = v24;
      if (v24)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 _dataForKey:IDSDevicePropertyPushToken]);
        if ([v26 length])
        {
          id v46 = (void *)objc_claimAutoreleasedReturnValue([v25 _arrayForKey:IDSDevicePropertyIdentities]);
          if ([v46 count])
          {
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v46 firstObject]);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 _stringForKey:@"uri"]);

            id v29 = (void *)_IDSCopyIDForTokenWithURI(v26, v28);
            id v19 = (id)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v29));

            uint64_t v30 = OSLogHandleForIDSCategory("GroupStatusNotificationController");
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v48 = (const char *)v7;
              __int16 v49 = 2112;
              id v50 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "original fromID %@ -> resulting specificOriginator %@",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v32)
              && _IDSShouldLog(0LL, @"GroupStatusNotificationController"))
            {
              _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"original fromID %@ -> resulting specificOriginator %@");
            }

            int v33 = 0;
          }

          else
          {
            uint64_t v43 = OSLogHandleForIDSCategory("Warning");
            id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              id v48 = "GroupStatusNotificationController";
              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%s - No device identity found to build specificOriginator, bailing...",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v45))
            {
              _IDSWarnV( @"IDSFoundation",  @"%s - No device identity found to build specificOriginator, bailing...");
              _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%s - No device identity found to build specificOriginator, bailing...");
              _IDSLogTransport( @"Warning",  @"IDS",  @"%s - No device identity found to build specificOriginator, bailing...");
            }

            id v19 = 0LL;
            int v33 = 1;
          }
        }

        else
        {
          uint64_t v40 = OSLogHandleForIDSCategory("Warning");
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            id v48 = "GroupStatusNotificationController";
            _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s - No device push token found to build specificOriginator, bailing...",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v42))
          {
            _IDSWarnV( @"IDSFoundation",  @"%s - No device push token found to build specificOriginator, bailing...");
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%s - No device push token found to build specificOriginator, bailing...");
            _IDSLogTransport( @"Warning",  @"IDS",  @"%s - No device push token found to build specificOriginator, bailing...");
          }

          id v19 = 0LL;
          int v33 = 1;
        }

        if (!v33) {
          goto LABEL_11;
        }
LABEL_45:
        uint64_t v20 = 0LL;
        goto LABEL_12;
      }

      uint64_t v37 = OSLogHandleForIDSCategory("Warning");
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v48 = "GroupStatusNotificationController";
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s - No device found to build specificOriginator, bailing...",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v39))
      {
        _IDSWarnV(@"IDSFoundation", @"%s - No device found to build specificOriginator, bailing...");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%s - No device found to build specificOriginator, bailing...");
        _IDSLogTransport( @"Warning",  @"IDS",  @"%s - No device found to build specificOriginator, bailing...");
      }
    }

    else
    {
      uint64_t v34 = OSLogHandleForIDSCategory("Warning");
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v48 = "GroupStatusNotificationController";
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s - No account found to build specificOriginator, bailing...",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v36))
      {
        _IDSWarnV(@"IDSFoundation", @"%s - No account found to build specificOriginator, bailing...");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"%s - No account found to build specificOriginator, bailing...");
        _IDSLogTransport( @"Warning",  @"IDS",  @"%s - No account found to build specificOriginator, bailing...");
      }
    }

    id v19 = 0LL;
    goto LABEL_45;
  }

  if (!v7)
  {
    id v19 = 0LL;
    goto LABEL_11;
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue([v7 URIByAddingPushToken:v8]);
LABEL_9:
  id v19 = v18;
LABEL_11:
  id v19 = v19;
  uint64_t v20 = v19;
LABEL_12:

  return v20;
}

- (id)getURIFromPushToken:(id)a3 forGroup:(id)a4
{
  id v33 = a3;
  id v31 = a4;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupMemberPushTokens,  "objectForKeyedSubscript:"));
  if (v32)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v33 rawToken]);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData, v7);
    char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

    if ((isKindOfClass & 1) != 0)
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      id v10 = v32;
      id v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v35;
        uint64_t v13 = kIDSQRAllocateKey_RecipientPushToken;
        uint64_t v14 = kIDSQRAllocateKey_RecipientURI;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v10);
            }
            id v16 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v13]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v14]);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v33 rawToken]);
            unsigned __int8 v20 = [v19 isEqualToData:v17];

            if ((v20 & 1) != 0)
            {

              goto LABEL_27;
            }
          }

          id v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      uint64_t v21 = OSLogHandleForIDSCategory("GroupStatusNotificationController");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v39 = v33;
        __int16 v40 = 2112;
        id v41 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Coudln't find the URI for the given token %@ for group %@.",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v23)
        && _IDSShouldLog(0LL, @"GroupStatusNotificationController"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Coudln't find the URI for the given token %@ for group %@.");
      }
    }

    else
    {
      uint64_t v27 = OSLogHandleForIDSCategory("GroupStatusNotificationController");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Coudln't find the URI for the given token for group %@. the pushToken is not NSData.",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v29)
        && _IDSShouldLog(0LL, @"GroupStatusNotificationController"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Coudln't find the URI for the given token for group %@. the pushToken is not NSData.");
      }
    }
  }

  else
  {
    uint64_t v24 = OSLogHandleForIDSCategory("GroupStatusNotificationController");
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Couldn't find the tokens for group %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v26)
      && _IDSShouldLog(0LL, @"GroupStatusNotificationController"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Couldn't find the tokens for group %@");
    }
  }

  id v18 = 0LL;
LABEL_27:

  return v18;
}

- (NSMutableSet)groups
{
  return self->_groups;
}

- (NSMutableDictionary)events
{
  return self->_events;
}

- (NSMutableDictionary)groupMemberPushTokens
{
  return self->_groupMemberPushTokens;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSDSessionController)sessionController
{
  return self->_sessionController;
}

- (IDSGroupEncryptionController)realTimeEncryptionController
{
  return self->_realTimeEncryptionController;
}

- (IDSDGroupStatusNotificationControllerBroadcaster)broadcaster
{
  return self->_broadcaster;
}

- (NSMutableDictionary)groupIDToCapabilityToParticipantPushTokens
{
  return self->_groupIDToCapabilityToParticipantPushTokens;
}

- (void).cxx_destruct
{
}

@end