@interface CSDAbstractIDSProviderDelegate
+ (id)handleByFullyQualifyingHandle:(id)a3 usingCountryCode:(id)a4;
- (BOOL)isCellularDataAllowedForChat:(id)a3;
- (BOOL)isCellularDataPreferredForChat:(id)a3;
- (BOOL)isMediaAllowedForChat:(id)a3;
- (BOOL)isWiFiAllowedForChat:(id)a3;
- (BOOL)shouldAcceptIncomingInvite;
- (BOOL)shouldOverrideNetworkAsAvailable;
- (CGSize)localPortraitAspectRatioForChat:(id)a3;
- (CSDAbstractIDSProviderDelegate)init;
- (CSDAbstractIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4;
- (CSDIDSProviderDelegateCapabilities)capabilities;
- (CXProvider)provider;
- (NSMutableOrderedSet)mutableChats;
- (OS_dispatch_queue)queue;
- (id)callUpdateForChat:(id)a3;
- (id)callUpdateForPendingChat:(id)a3;
- (id)chatWithUUID:(id)a3;
- (id)chats;
- (id)incomingChatGenerator;
- (id)incomingSessionProviderGenerator;
- (id)providerDidBegin;
- (id)waitingChatWithHandle:(id)a3 isOutgoing:(BOOL)a4;
- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3;
- (void)chat:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)chat:(id)a3 inputFrequencyLevelChangedTo:(id)a4;
- (void)chat:(id)a3 inputLevelChangedTo:(float)a4;
- (void)chat:(id)a3 outputFrequencyLevelChangedTo:(id)a4;
- (void)chat:(id)a3 outputLevelChangedTo:(float)a4;
- (void)chatConnected:(id)a3;
- (void)chatEnded:(id)a3;
- (void)chatSentInvitation:(id)a3;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)setIncomingChatGenerator:(id)a3;
- (void)setIncomingSessionProviderGenerator:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderDidBegin:(id)a3;
- (void)updateCacheWithChat:(id)a3;
@end

@implementation CSDAbstractIDSProviderDelegate

- (CSDAbstractIDSProviderDelegate)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___CSDIDSProviderDelegateCapabilities);
  v4 = -[CSDAbstractIDSProviderDelegate initWithCapabilities:queue:]( self,  "initWithCapabilities:queue:",  v3,  &_dispatch_main_q);

  return v4;
}

- (CSDAbstractIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CSDAbstractIDSProviderDelegate;
  v9 = -[CSDAbstractIDSProviderDelegate init](&v24, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_capabilities, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](&OBJC_CLASS___NSMutableOrderedSet, "orderedSet"));
    mutableChats = v10->_mutableChats;
    v10->_mutableChats = (NSMutableOrderedSet *)v11;

    id incomingSessionProviderGenerator = v10->_incomingSessionProviderGenerator;
    v10->_id incomingSessionProviderGenerator = &stru_1003D8CD0;

    objc_initWeak(&location, v10);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_1000869A8;
    v21 = &unk_1003D8CF8;
    objc_copyWeak(&v22, &location);
    v14 = objc_retainBlock(&v18);
    id incomingChatGenerator = v10->_incomingChatGenerator;
    v10->_id incomingChatGenerator = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults", v18, v19, v20, v21));
    v10->_shouldOverrideNetworkAsAvailable = [v16 BOOLForKey:@"NetworkAvailabilityCheckOverrideValue"];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)chats
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate mutableChats](self, "mutableChats"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 array]);
  id v4 = [v3 copy];

  return v4;
}

- (id)chatWithUUID:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate mutableChats](self, "mutableChats", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)updateCacheWithChat:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateEnded]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate mutableChats](self, "mutableChats"));
  id v7 = v6;
  if (v5) {
    [v6 removeObject:v4];
  }
  else {
    [v6 addObject:v4];
  }
}

+ (id)handleByFullyQualifyingHandle:(id)a3 usingCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (TUHandle *)v5;
  id v8 = v7;
  if (-[TUHandle type](v7, "type") == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUHandle value](v7, "value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TUPhoneNumber phoneNumberWithDigits:countryCode:]( &OBJC_CLASS___TUPhoneNumber,  "phoneNumberWithDigits:countryCode:",  v9,  v6));

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unformattedInternationalRepresentation]);
    id v12 = sub_1001704C4();
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Used country code '%@' to determine international phone number representation: %@",  (uint8_t *)&v15,  0x16u);
    }

    id v8 = v7;
    if (v11)
    {
      id v8 = -[TUHandle initWithType:value:]( objc_alloc(&OBJC_CLASS___TUHandle),  "initWithType:value:",  -[TUHandle type](v7, "type"),  v11);
    }
  }

  return v8;
}

- (BOOL)shouldAcceptIncomingInvite
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities"));
  unsigned int v4 = [v3 isWiFiAvailable];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities"));
  unsigned int v6 = [v5 isWiFiAllowed];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities"));
  unsigned int v8 = [v7 isCellularDataAvailable];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities"));
  unsigned int v10 = [v9 isCellularDataAllowed];

  BOOL v11 = (v4 & v6 & 1) != 0
     || (v8 & v10 & 1) != 0
     || -[CSDAbstractIDSProviderDelegate shouldOverrideNetworkAsAvailable](self, "shouldOverrideNetworkAsAvailable");
  id v12 = sub_1001704C4();
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      __int128 v14 = @"allowed";
    }
    else {
      __int128 v14 = @"ignored";
    }
    int v16 = 138413570;
    __int16 v17 = v14;
    __int16 v18 = 1024;
    unsigned int v19 = v4;
    __int16 v20 = 1024;
    unsigned int v21 = v6;
    __int16 v22 = 1024;
    unsigned int v23 = v8;
    __int16 v24 = 1024;
    unsigned int v25 = v10;
    __int16 v26 = 1024;
    unsigned int v27 = -[CSDAbstractIDSProviderDelegate shouldOverrideNetworkAsAvailable](self, "shouldOverrideNetworkAsAvailable");
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Determined that invite should be %@ - (isWiFiAvailable=%d isWiFiAllowed=%d isCellularDataAvailable=%d isCellularDa taAllowed=%d shouldOverrideNetworkAsAvailable=%d)",  (uint8_t *)&v16,  0x2Au);
  }

  return v11;
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = sub_1001704C4();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    int64_t v36 = (int64_t)v12;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Invite received for service %@ account %@ from (fromID=%@) with context: %@",  buf,  0x2Au);
  }

  id v18 = sub_1001704C4();
  unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    id v32 = v12;
    if (v20)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v36 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Recieved pending message of type %ld",  buf,  0xCu);
    }

    unsigned int v21 = (void *)IDSCopyAddressDestinationForDestination(v14);
    unsigned int v19 = (os_log_s *)IDSCopyRawAddressForDestination();

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](&OBJC_CLASS___TUHandle, "handleWithDestinationID:", v19));
    unsigned int v23 = objc_alloc(&OBJC_CLASS___CSDIDSPendingChat);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceIdentifier]);
    __int16 v26 = -[CSDIDSPendingChat initWithUUID:isVideo:handle:]( v23,  "initWithUUID:isVideo:handle:",  v24,  [v25 containsString:@"audio"] ^ 1,  v22);

    if (a5 == 6)
    {
      if (!-[CSDAbstractIDSProviderDelegate shouldAcceptIncomingInvite](self, "shouldAcceptIncomingInvite"))
      {
LABEL_13:

        id v12 = v32;
        goto LABEL_14;
      }

      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractIDSProviderDelegate callUpdateForPendingChat:]( self,  "callUpdateForPendingChat:",  v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSPendingChat uuid](v26, "uuid"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000872A4;
      v33[3] = &unk_1003D8600;
      v34 = v26;
      [v28 reportNewIncomingCallWithUUID:v29 update:v27 completion:v33];

      v30 = v34;
    }

    else
    {
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
      v30 = (CSDIDSPendingChat *)objc_claimAutoreleasedReturnValue(-[CSDIDSPendingChat uuid](v26, "uuid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v27 reportCallWithUUID:v30 endedAtDate:v31 reason:3];
    }

    goto LABEL_13;
  }

  if (v20)
  {
    *(_DWORD *)buf = 134217984;
    int64_t v36 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Not handling pending message of type: %ld",  buf,  0xCu);
  }

- (id)callUpdateForPendingChat:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_alloc_init(&OBJC_CLASS___CXCallUpdate);
  -[CXCallUpdate setHasVideo:](v4, "setHasVideo:", [v3 isVideo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v5));
  -[CXCallUpdate setRemoteHandle:](v4, "setRemoteHandle:", v6);

  -[CXCallUpdate setRequiresAuthentication:](v4, "setRequiresAuthentication:", 1LL);
  return v4;
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = -[CSDMessagingCallMessage initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingCallMessage),  "initWithData:",  v14);
  id v16 = sub_1001704C4();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v102 = 2112;
    id v103 = v11;
    __int16 v104 = 2112;
    id v105 = v13;
    __int16 v106 = 2112;
    v107 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Invite received for session %@ account %@ from (fromID=%@) with data: %@",  buf,  0x2Au);
  }

  if (-[CSDMessagingCallMessage type](v15, "type") != 1)
  {
    id v65 = sub_1001704C4();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    BOOL v66 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v66)
      {
        id v67 = (id)-[CSDMessagingCallMessage type](v15, "type");
        if (v67 >= 3) {
          v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v67));
        }
        else {
          v68 = *(&off_1003D8D18 + (int)v67);
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v68;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Ignoring incoming invite since message with type=%@ was not an invite.",  buf,  0xCu);
      }

      goto LABEL_35;
    }

    if (!v66) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v70 = "[WARN] Ignoring incoming invite since accompanying message was nil";
    v71 = v21;
    uint32_t v72 = 2;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, v70, buf, v72);
    goto LABEL_35;
  }

  if (!-[CSDAbstractIDSProviderDelegate shouldAcceptIncomingInvite](self, "shouldAcceptIncomingInvite"))
  {
    id v69 = sub_1001704C4();
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(void *)buf = 67109120LL;
    v70 = "Ignoring incoming invite since shouldAcceptIncomingInvite is %d";
    v71 = v21;
    uint32_t v72 = 8;
    goto LABEL_25;
  }

  id v18 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[CSDAbstractIDSProviderDelegate incomingSessionProviderGenerator]( self,  "incomingSessionProviderGenerator"));
  unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate queue](self, "queue"));
  uint64_t v20 = ((uint64_t (**)(void, id, void *))v18)[2](v18, v12, v19);
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

  id v22 = -[CSDExternalIDSDualSession initAsReceiverWithSessionProvider:remoteFromID:remoteProtocolVersion:]( objc_alloc(&OBJC_CLASS___CSDExternalIDSDualSession),  "initAsReceiverWithSessionProvider:remoteFromID:remoteProtocolVersion:",  v21,  v13,  -[CSDMessagingCallMessage protocolVersion](v15, "protocolVersion"));
  [v22 setInvitationTimeout:(double)TUIncomingInvitationTimeout(v22)];
  unsigned int v23 = (void *)IDSCopyAddressDestinationForDestination(v13);
  uint64_t v24 = IDSCopyRawAddressForDestination();

  v89 = (void *)v24;
  v91 = -[CXHandle initWithDestinationID:](objc_alloc(&OBJC_CLASS___CXHandle), "initWithDestinationID:", v24);
  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractIDSProviderDelegate waitingChatWithHandle:isOutgoing:]( self,  "waitingChatWithHandle:isOutgoing:"));
  __int16 v26 = v25;
  v92 = self;
  v90 = v22;
  if (!v25) {
    goto LABEL_7;
  }
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v25 sessionUUID]);
  uint64_t v28 = objc_claimAutoreleasedReturnValue([v22 UUID]);
  id v29 = v14;
  v30 = v15;
  id v31 = v13;
  id v32 = v11;
  id v33 = v12;
  v34 = v26;
  v35 = (void *)v28;
  int64_t v36 = (char *)[v27 caseInsensitiveCompare:v28];

  __int16 v26 = v34;
  id v12 = v33;
  id v11 = v32;
  id v13 = v31;
  id v15 = v30;
  id v14 = v29;
  id v22 = v90;

  BOOL v37 = v36 + 1 == 0LL;
  self = v92;
  if (v37)
  {
    id v79 = sub_1001704C4();
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "Declining this invite because we found a sending chat with the same destination: %@",  buf,  0xCu);
    }

    [v90 declineInvitation];
  }

  else
  {
LABEL_7:
    v86 = v26;
    v87 = v21;
    id v88 = v14;
    id v38 = (uint64_t (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[CSDAbstractIDSProviderDelegate incomingChatGenerator]( self,  "incomingChatGenerator"));
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(-[CXHandle tuHandle](v91, "tuHandle"));
    BOOL v40 = -[CSDMessagingCallMessage protoWantsVideo](v15, "protoWantsVideo");
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingCallMessage inviteData](v15, "inviteData"));
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 faceTimeInviteDictionary]);
    id v43 = v22;
    v44 = v92;
    uint64_t v45 = ((uint64_t (**)(void, id, void *, BOOL, void *))v38)[2](v38, v43, v39, v40, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

    [v46 setDelegate:v92];
    objc_msgSend( v46,  "setRemoteMomentsAvailable:",  -[CSDMessagingCallMessage isMomentsAvailable](v15, "isMomentsAvailable"));
    objc_msgSend( v46,  "setShouldSuppressInCallUI:",  -[CSDMessagingCallMessage shouldSuppressInCallUI](v15, "shouldSuppressInCallUI"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate callUpdateForChat:](v92, "callUpdateForChat:", v46));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v11 loginID]);
    id v49 = [v48 length];

    if (v49)
    {
      id v84 = v11;
      v85 = v47;
      v81 = v46;
      id v82 = v13;
      id v83 = v12;
      v50 = (void *)objc_claimAutoreleasedReturnValue([v11 loginID]);
      uint64_t v51 = TUHandleForIDSCanonicalAddress(v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](v92, "provider"));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v53 configuration]);
      v55 = (void *)objc_claimAutoreleasedReturnValue([v54 prioritizedSenderIdentities]);

      __int128 v98 = 0u;
      __int128 v99 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      id v56 = v55;
      id v57 = [v56 countByEnumeratingWithState:&v96 objects:v100 count:16];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v97;
        while (2)
        {
          for (i = 0LL; i != v58; i = (char *)i + 1)
          {
            if (*(void *)v97 != v59) {
              objc_enumerationMutation(v56);
            }
            v61 = *(void **)(*((void *)&v96 + 1) + 8LL * (void)i);
            v62 = (void *)objc_claimAutoreleasedReturnValue([v61 handle]);
            v63 = (void *)objc_claimAutoreleasedReturnValue([v62 tuHandle]);
            unsigned int v64 = [v63 isEqualToHandle:v52];

            if (v64)
            {
              v73 = (void *)objc_claimAutoreleasedReturnValue([v61 UUID]);
              [v85 setLocalSenderIdentityUUID:v73];

              v74 = (void *)objc_claimAutoreleasedReturnValue([v61 account]);
              v75 = (void *)objc_claimAutoreleasedReturnValue([v74 UUID]);
              [v85 setLocalSenderIdentityAccountUUID:v75];

              goto LABEL_29;
            }
          }

          id v58 = [v56 countByEnumeratingWithState:&v96 objects:v100 count:16];
          if (v58) {
            continue;
          }
          break;
        }
      }

- (id)waitingChatWithHandle:(id)a3 isOutgoing:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate mutableChats](self, "mutableChats", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dateStartedConnecting]);
      if (v13) {
        goto LABEL_11;
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 handle]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 tuHandle]);
      if ((TUHandlesAreCanonicallyEqual(v13, v14) & 1) == 0)
      {

LABEL_11:
        continue;
      }

      unsigned int v15 = [v12 isOutgoing];

      if (v15 == v4)
      {
        id v16 = v12;
        goto LABEL_15;
      }
    }

    id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }

  while (v9);
LABEL_14:
  id v16 = 0LL;
LABEL_15:

  return v16;
}

- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3
{
  else {
    return 0;
  }
}

- (id)callUpdateForChat:(id)a3
{
  id v3 = a3;
  int v4 = -[CXCallUpdate initWithIDSChat:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithIDSChat:", v3);

  return v4;
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "provider: %@", (uint8_t *)&v9, 0xCu);
  }

  -[CSDAbstractIDSProviderDelegate setProvider:](self, "setProvider:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate providerDidBegin](self, "providerDidBegin"));

  if (v7)
  {
    id v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate providerDidBegin](self, "providerDidBegin"));
    v8[2]();
  }
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate mutableChats](self, "mutableChats", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) end];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v21, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateConnected]);
  if (v10)
  {
    id v11 = sub_1001704C4();
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B3F40((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  else
  {
    if ([v5 downgradeToAudio])
    {
      [v9 setVideo:0];
      [v9 setSendingVideo:0];
    }

    id v19 = sub_1001704C4();
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Calling answer on chat %@",  (uint8_t *)&v21,  0xCu);
    }

    [v9 answerWithVideoAspectRatioDescriptor:v5];
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v12, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling end on chat %@", (uint8_t *)&v12, 0xCu);
  }

  [v9 end];
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v24, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dateConnected]);
  if (v10)
  {
    unsigned int v11 = [v5 isOnHold];
    id v12 = sub_1001704C4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (!v14) {
        goto LABEL_14;
      }
      int v24 = 138412290;
      id v25 = v9;
      uint64_t v15 = "Setting sendingAudio to NO for chat %@";
    }

    else
    {
      if (!v14) {
        goto LABEL_14;
      }
      int v24 = 138412290;
      id v25 = v9;
      uint64_t v15 = "Setting sendingAudio to YES for chat %@";
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v24, 0xCu);
LABEL_14:

    [v9 setSendingAudio:v11 ^ 1];
    goto LABEL_16;
  }

  id v16 = sub_1001704C4();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_1002B3FA8((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);
  }

LABEL_16:
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    v14[0] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v13, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  id v10 = sub_1001704C4();
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v5 isSendingVideo];
    int v13 = 67109378;
    LODWORD(v14[0]) = v12;
    WORD2(v14[0]) = 2112;
    *(void *)((char *)v14 + 6) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Calling setIsSendingVideo with %d for chat %@",  (uint8_t *)&v13,  0x12u);
  }

  objc_msgSend(v9, "setSendingVideo:", objc_msgSend(v5, "isSendingVideo"));
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  [v5 videoPresentationSize];
  objc_msgSend(v9, "setRemoteVideoPresentationSize:");
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  objc_msgSend( v9,  "setRemoteVideoPresentationState:",  -[CSDAbstractIDSProviderDelegate TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:]( self,  "TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:",  objc_msgSend(v5, "videoPresentationState")));
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  objc_msgSend(v9, "setRelaying:", objc_msgSend(v5, "isRelaying"));
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v10, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v8));

  objc_msgSend(v9, "setMuted:", objc_msgSend(v5, "isMuted"));
}

- (BOOL)isMediaAllowedForChat:(id)a3
{
  return 1;
}

- (BOOL)isWiFiAllowedForChat:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities", a3));
  unsigned __int8 v4 = [v3 isWiFiAllowed];

  return v4;
}

- (BOOL)isCellularDataAllowedForChat:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities", a3));
  unsigned __int8 v4 = [v3 isCellularDataAllowed];

  return v4;
}

- (BOOL)isCellularDataPreferredForChat:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate capabilities](self, "capabilities", a3));
  unsigned __int8 v4 = [v3 isCellularDataPreferred];

  return v4;
}

- (CGSize)localPortraitAspectRatioForChat:(id)a3
{
  id v3 = objc_msgSend((id)CUTWeakLinkClass(@"CADisplay", @"QuartzCore"), "mainDisplay");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v4 bounds];
  if (v5 <= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  if (v5 <= v6) {
    double v8 = v5;
  }
  else {
    double v8 = v6;
  }
  unsigned int v9 = TUBinaryGCD((int)v8, (int)v7);
  double v10 = v8 / (double)v9;
  double v11 = v7 / (double)v9;

  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)chatSentInvitation:(id)a3
{
  id v9 = a3;
  if ([v9 isOutgoing])
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    [v4 reportOutgoingCallWithUUID:v5 sentInvitationAtDate:0];

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate callUpdateForChat:](self, "callUpdateForChat:", v9));
    objc_msgSend(v6, "setMayRequireBreakBeforeMake:", objc_msgSend(v9, "mayRequireBreakBeforeMake"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    [v7 reportCallWithUUID:v8 updated:v6];
  }
}

- (void)chatConnected:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate callUpdateForChat:](self, "callUpdateForChat:", v4));
  objc_msgSend(v5, "setVideoStreamToken:", objc_msgSend(v4, "videoStreamToken"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  [v6 reportCallWithUUID:v7 updated:v5];

  LODWORD(v7) = [v4 isOutgoing];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  if ((_DWORD)v7)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 dateConnected]);
    [v9 reportOutgoingCallWithUUID:v10 connectedAtDate:v11];
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___CXAnswerCallAction, v8);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v9 pendingCallActionsOfClass:v12 withCallUUID:v13]);

    if ([v14 count])
    {
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v28 = v5;
        uint64_t v18 = *(void *)v30;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
            id v21 = sub_1001704C4();
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Chat with matching UUID connected; attempting to fulfill pending answer call action %@",
                buf,
                0xCu);
            }

            if (([v20 isComplete] & 1) == 0)
            {
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 dateConnected]);
              if (v23)
              {
                [v20 fulfillWithDateConnected:v23];
              }

              else
              {
                id v24 = sub_1001704C4();
                id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v34 = v20;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Chat did not provide a connection date; Failing answer call action %@",
                    buf,
                    0xCu);
                }

                [v20 fail];
              }
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }

        while (v17);
        double v5 = v28;
      }
    }

    else
    {
      id v26 = sub_1001704C4();
      id v15 = (id)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] No pending answer call actions found with UUID: %@",  buf,  0xCu);
      }
    }
  }
}

- (void)chatEnded:(id)a3
{
  id v4 = a3;
  -[CSDAbstractIDSProviderDelegate updateCacheWithChat:](self, "updateCacheWithChat:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CXAnswerCallAction, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 pendingCallActionsOfClass:v7 withCallUUID:v8]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v16 = sub_1001704C4();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failing answer call action for call because it disconnected before connecting: %@",  buf,  0xCu);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v12);
  }
}

- (void)chat:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 crossDeviceIdentifier]);

  [v9 reportCallWithUUID:v7 crossDeviceIdentifier:v8 changedBytesOfDataUsed:a4];
}

- (void)chat:(id)a3 inputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);

  [v9 reportCallWithUUID:v8 changedFrequencyData:v6 forDirection:2];
}

- (void)chat:(id)a3 outputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);

  [v9 reportCallWithUUID:v8 changedFrequencyData:v6 forDirection:1];
}

- (void)chat:(id)a3 inputLevelChangedTo:(float)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);

  *(float *)&double v8 = a4;
  [v9 reportCallWithUUID:v7 changedMeterLevel:2 forDirection:v8];
}

- (void)chat:(id)a3 outputLevelChangedTo:(float)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUID]);

  *(float *)&double v8 = a4;
  [v9 reportCallWithUUID:v7 changedMeterLevel:1 forDirection:v8];
}

- (CSDIDSProviderDelegateCapabilities)capabilities
{
  return self->_capabilities;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSMutableOrderedSet)mutableChats
{
  return self->_mutableChats;
}

- (BOOL)shouldOverrideNetworkAsAvailable
{
  return self->_shouldOverrideNetworkAsAvailable;
}

- (id)providerDidBegin
{
  return self->_providerDidBegin;
}

- (void)setProviderDidBegin:(id)a3
{
}

- (id)incomingSessionProviderGenerator
{
  return self->_incomingSessionProviderGenerator;
}

- (void)setIncomingSessionProviderGenerator:(id)a3
{
}

- (id)incomingChatGenerator
{
  return self->_incomingChatGenerator;
}

- (void)setIncomingChatGenerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end