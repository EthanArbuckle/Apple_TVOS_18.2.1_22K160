@interface CSDGFTServiceConversationProviderDelegate
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isProviderForeground:(id)a3;
- (BOOL)shouldHandleProvider:(id)a3;
- (BOOL)shouldHandleProviderWithIdentifier:(id)a3;
- (CSDGFTServiceConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5;
- (CSDProcessObserverProtocol)processObserver;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
@end

@implementation CSDGFTServiceConversationProviderDelegate

- (CSDGFTServiceConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CSDGFTServiceConversationProviderDelegate;
  v11 = -[CSDAbstractFaceTimeConversationProviderDelegate initWithConversationManager:queue:invitationResolver:]( &v18,  "initWithConversationManager:queue:invitationResolver:",  v8,  v9,  v10);
  if (v11)
  {
    v12 = -[CSDProcessObserver initWithQueue:](objc_alloc(&OBJC_CLASS___CSDProcessObserver), "initWithQueue:", v9);
    processObserver = v11->_processObserver;
    v11->_processObserver = (CSDProcessObserverProtocol *)v12;

    objc_initWeak(&location, v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10014ED74;
    v15[3] = &unk_1003DB2E0;
    objc_copyWeak(&v16, &location);
    -[CSDProcessObserverProtocol setProcessStateChanged:](v11->_processObserver, "setProcessStateChanged:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (BOOL)isProviderForeground:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDGFTServiceConversationProviderDelegate processObserver](self, "processObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchCurrentProcessStatesForBundleIdentifier:v4]);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues", 0));
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) integerValue] == (id)4)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001704C4();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v75 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 conversationProviderIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 tuConversationProviderForIdentifier:v9]);

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  if (v11
    && (__int128 v12 = (void *)v11,
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]),
        unsigned __int8 v14 = -[CSDGFTServiceConversationProviderDelegate isProviderForeground:](self, "isProviderForeground:", v13),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    id v20 = sub_1001704C4();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
      *(_DWORD *)buf = 138412290;
      id v75 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] bundleIdentifer: %@ not in the foreground, failing join call action",  buf,  0xCu);
    }

    [v5 fail];
  }

  else
  {
    v54 = v10;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 callerID]);
    id v16 = &OBJC_CLASS___IDSMessageContext_ptr;
    v53 = self;
    if (v15)
    {
      v17 = objc_alloc(&OBJC_CLASS___TUConversationMember);
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v5 callerID]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 tuHandle]);
      v56 = -[TUConversationMember initWithHandle:nickname:](v17, "initWithHandle:nickname:", v19, 0LL);
    }

    else
    {
      v56 = 0LL;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteMembers]);
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v23 count]));

    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 otherInvitedHandles]);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v24 count]));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    v55 = v5;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 remoteMembers]);
    id v27 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
    v57 = v26;
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v70;
      do
      {
        v30 = 0LL;
        id v59 = v28;
        do
        {
          if (*(void *)v70 != v29) {
            objc_enumerationMutation(obj);
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v69 + 1) + 8 * (void)v30) tuHandle]);
          if ([v26 containsObject:v31])
          {
            id v32 = sub_1001704C4();
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v75 = v31;
              __int16 v76 = 2112;
              v77 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[WARN] Skipping member with handle %@ because it already exists in seen handles: %@",  buf,  0x16u);
            }
          }

          else
          {
            v34 = v16;
            v33 = (os_log_s *)[objc_alloc((Class)v16[122]) initWithHandle:v31 nickname:0];
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            v35 = v25;
            id v36 = v25;
            id v37 = [v36 countByEnumeratingWithState:&v65 objects:v78 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v66;
              do
              {
                for (i = 0LL; i != v38; i = (char *)i + 1)
                {
                  if (*(void *)v66 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  if ([*(id *)(*((void *)&v65 + 1) + 8 * (void)i) isEquivalentToHandle:v31]) {
                    -[os_log_s setIsOtherInvitedHandle:](v33, "setIsOtherInvitedHandle:", 1LL);
                  }
                }

                id v38 = [v36 countByEnumeratingWithState:&v65 objects:v78 count:16];
              }

              while (v38);
            }

            [v58 addObject:v33];
            v26 = v57;
            [v57 addObject:v31];
            v25 = v35;
            id v16 = v34;
            id v28 = v59;
          }

          v30 = (char *)v30 + 1;
        }

        while (v30 != v28);
        id v28 = [obj countByEnumeratingWithState:&v69 objects:v79 count:16];
      }

      while (v28);
    }

    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v5 = v55;
    v41 = (void *)objc_claimAutoreleasedReturnValue([v55 otherInvitedHandles]);
    id v42 = [v41 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v62;
      do
      {
        for (j = 0LL; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v62 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v61 + 1) + 8 * (void)j) tuHandle]);
          [v25 addObject:v46];
        }

        id v43 = [v41 countByEnumeratingWithState:&v61 objects:v73 count:16];
      }

      while (v43);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](v53, "conversationManager"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v55 groupUUID]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v55 messagesGroupUUID]);
    v50 = (void *)objc_claimAutoreleasedReturnValue([v55 remotePushTokens]);
    else {
      uint64_t v51 = 1LL;
    }
    id v10 = v54;
    v52 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v47,  "findOrCreateConversationWithGroupUUID:messagesGroupUUID:remoteMembers:otherInvitedHandles:localMem ber:remotePushTokens:link:activity:avMode:presentationMode:conversationProvider:screenSharingRequest:",  v48,  v49,  v58,  v25,  v56,  v50,  0,  0,  v51,  objc_msgSend(v55, "presentationMode"),  v54,  0));

    if (v52) {
      -[CSDAbstractFaceTimeConversationProviderDelegate proceedToJoinForConversation:action:]( v53,  "proceedToJoinForConversation:action:",  v52,  v55);
    }
    else {
      [v55 fail];
    }
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Performing end call action %@",  (uint8_t *)&v20,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 conversationsByUUID]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v11]);

  if (v14)
  {
    -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversation:withCallUUID:reason:]( self,  "leaveConversation:withCallUUID:reason:",  v14,  v9,  -1LL);
    [v5 fulfill];
  }

  else
  {
    id v15 = sub_1001704C4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationManager]( self,  "conversationManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 conversationsByUUID]);
      int v20 = 138412802;
      id v21 = v9;
      __int16 v22 = 2112;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find conversation for end call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.c onversationManager.conversationsByUUID: %@",  (uint8_t *)&v20,  0x20u);
    }

    [v5 fail];
  }

  -[CSDAbstractFaceTimeConversationProviderDelegate leaveConversationForCallUUID:endedReason:]( self,  "leaveConversationForCallUUID:endedReason:",  v9,  -1LL);
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failing %@ It is not supported by GFTaaS",  (uint8_t *)&v9,  0xCu);
  }

  [v5 fail];
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failing %@ It is not supported by GFTaaS",  (uint8_t *)&v9,  0xCu);
  }

  [v5 fail];
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v10 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate conversationUUIDsByCallUUID]( self,  "conversationUUIDsByCallUUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate conversationManager](self, "conversationManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 conversationsByUUID]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSDGFTServiceConversationProviderDelegate;
  LODWORD(self) = -[CSDAbstractFaceTimeConversationProviderDelegate isManagingCallWithUUID:]( &v13,  "isManagingCallWithUUID:",  v10);

  LOBYTE(v10) = 0;
  if ((_DWORD)self && v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 provider]);
    LODWORD(v10) = [v11 isDefaultProvider] ^ 1;
  }

  return (char)v10;
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDAbstractFaceTimeConversationProviderDelegate queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v60 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDAbstractFaceTimeConversationProviderDelegate callUUIDsByConversationUUID]( self,  "callUUIDsByConversationUUID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  __int128 v61 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  int v9 = -[CXCallUpdate initWithTUConversation:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithTUConversation:", v5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteMembers]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v10 count]));

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteMembers]);
  id v13 = [v12 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v67;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v67 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v66 + 1) + 8 * (void)i) handle]);
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(+[CXHandle handleWithTUHandle:](&OBJC_CLASS___CXHandle, "handleWithTUHandle:", v17));
        [v11 addObject:v18];
      }

      id v14 = [v12 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }

    while (v14);
  }

  -[CXCallUpdate setRemoteParticipantHandles:](v9, "setRemoteParticipantHandles:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 activeRemoteParticipantCXHandles]);
  -[CXCallUpdate setActiveRemoteParticipantHandles:](v9, "setActiveRemoteParticipantHandles:", v19);

  -[CXCallUpdate setOneToOneModeEnabled:](v9, "setOneToOneModeEnabled:", [v5 isOneToOneModeEnabled]);
  -[CXCallUpdate setScreenSharingType:](v9, "setScreenSharingType:", [v5 screenSharingType]);
  int v20 = (void *)objc_claimAutoreleasedReturnValue([v5 mergedActiveRemoteParticipants]);
  if ([v20 count] != (id)1) {
    goto LABEL_12;
  }
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 mergedActiveRemoteParticipants]);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 anyObject]);
  id v23 = [v22 streamToken];

  if (v23)
  {
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v5 mergedActiveRemoteParticipants]);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v20 anyObject]);
    -[CXCallUpdate setVideoStreamToken:](v9, "setVideoStreamToken:", [v24 streamToken]);

LABEL_12:
  }

- (BOOL)shouldHandleProviderWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSDConversationProviderManager sharedInstance]( &OBJC_CLASS___CSDConversationProviderManager,  "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 conversationProviderForIdentifier:v3]);

  return v5 != 0LL;
}

- (BOOL)shouldHandleProvider:(id)a3
{
  if (a3) {
    return [a3 isDefaultProvider] ^ 1;
  }
  else {
    return 0;
  }
}

- (CSDProcessObserverProtocol)processObserver
{
  return self->_processObserver;
}

- (void).cxx_destruct
{
}

@end