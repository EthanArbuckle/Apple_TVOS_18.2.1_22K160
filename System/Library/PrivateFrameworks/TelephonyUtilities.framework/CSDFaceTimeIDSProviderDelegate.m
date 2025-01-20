@interface CSDFaceTimeIDSProviderDelegate
- (BOOL)canUpgradeChat:(id)a3;
- (BOOL)hasCallStartedConnectingWithUUID:(id)a3;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isMediaAllowedForChat:(id)a3;
- (BOOL)isMomentsAvailableForChat:(id)a3;
- (BOOL)isUpgradingCallWithUUID:(id)a3;
- (CSDConversationServerBag)conversationServerBag;
- (CSDFaceTimeIDSProviderDelegate)init;
- (CSDFaceTimeIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4;
- (CSDFaceTimeIDSProviderDelegate)initWithQueue:(id)a3;
- (CSDFaceTimeIDSProviderDelegateCapabilities)capabilities;
- (CSDFaceTimeIDSProviderDelegateServerBag)serverBag;
- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate;
- (NSMutableSet)chatsPendingUpgrade;
- (NSOrderedSet)telephonySenderIdentities;
- (NSSet)accounts;
- (OS_dispatch_queue)queue;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (double)upgradeTimeout;
- (id)ISOCountryCodeForCallWithUUID:(id)a3;
- (id)ISOCountryCodeForChat:(id)a3;
- (id)accountWithUUID:(id)a3 service:(id)a4;
- (id)callForConversation:(id)a3 withSessionToken:(id)a4;
- (id)callUpdateForChat:(id)a3;
- (id)facetimeIDSServiceGenerator;
- (id)isAccountActive;
- (id)outgoingChatGenerator;
- (id)outgoingSessionProviderGenerator;
- (id)upgradeCallForConversation:(id)a3 withSessionToken:(id)a4;
- (id)upgradeSessionUUIDForCallWithUUID:(id)a3;
- (void)chatEnded:(id)a3;
- (void)chatStartedConnecting:(id)a3;
- (void)endCallWithUUID:(id)a3;
- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3;
- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3;
- (void)endCallWithUUIDAsLocalHangup:(id)a3;
- (void)inviteIDSPeersWithAction:(id)a3 destinations:(id)a4 joinCallActionToFulfill:(id)a5 completion:(id)a6;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setAccounts:(id)a3;
- (void)setConversationServerBag:(id)a3;
- (void)setFaceTimeDemuxerDelegate:(id)a3;
- (void)setFacetimeIDSServiceGenerator:(id)a3;
- (void)setIsAccountActive:(id)a3;
- (void)setOutgoingChatGenerator:(id)a3;
- (void)setOutgoingSessionProviderGenerator:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setTelephonySenderIdentities:(id)a3;
- (void)setUpgradeTimeout:(double)a3;
- (void)updateProviderConfigurationWithAccounts:(id)a3;
- (void)updateProviderConfigurationWithAccounts:(id)a3 senderIdentities:(id)a4;
- (void)updateProviderConfigurationWithSenderIdentities:(id)a3;
- (void)upgradeChatIfNecessary:(id)a3;
@end

@implementation CSDFaceTimeIDSProviderDelegate

- (CSDFaceTimeIDSProviderDelegate)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CSDFaceTimeIDSProviderDelegate.m",  47,  @"%s is not available. Use an available initializer instead.",  "-[CSDFaceTimeIDSProviderDelegate init]");

  return 0LL;
}

- (CSDFaceTimeIDSProviderDelegate)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___CSDFaceTimeIDSProviderDelegateCapabilities);
  v6 = -[CSDFaceTimeIDSProviderDelegate initWithCapabilities:queue:](self, "initWithCapabilities:queue:", v5, v4);

  return v6;
}

- (CSDFaceTimeIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSProviderDelegate;
  v9 = -[CSDAbstractIDSProviderDelegate initWithCapabilities:queue:](&v36, "initWithCapabilities:queue:", v7, v8);
  v10 = v9;
  if (v9)
  {
    p_queue = &v9->_queue;
    objc_storeStrong((id *)&v9->_queue, a4);
    v12 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v12;

    objc_storeStrong((id *)&v10->_capabilities, a3);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[FTServerBag sharedInstance](&OBJC_CLASS___FTServerBag, "sharedInstance"));
    serverBag = v10->_serverBag;
    v10->_serverBag = (CSDFaceTimeIDSProviderDelegateServerBag *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    conversationServerBag = v10->_conversationServerBag;
    v10->_conversationServerBag = (CSDConversationServerBag *)v16;

    id facetimeIDSServiceGenerator = v10->_facetimeIDSServiceGenerator;
    v10->_id facetimeIDSServiceGenerator = &stru_1003D8D98;

    id isAccountActive = v10->_isAccountActive;
    v10->_id isAccountActive = &stru_1003D8DD8;

    objc_initWeak(&location, v10);
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    v32 = sub_10008CDF4;
    v33 = &unk_1003D8E00;
    objc_copyWeak(&v34, &location);
    v20 = objc_retainBlock(&v30);
    id outgoingSessionProviderGenerator = v10->_outgoingSessionProviderGenerator;
    v10->_id outgoingSessionProviderGenerator = v20;

    id outgoingChatGenerator = v10->_outgoingChatGenerator;
    v10->_id outgoingChatGenerator = &stru_1003D8E40;

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeAudioIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeAudioIDSService,  "sharedInstance",  v30,  v31,  v32,  v33));
    [v23 addServiceDelegate:v10 queue:*p_queue];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeVideoIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeVideoIDSService,  "sharedInstance"));
    [v24 addServiceDelegate:v10 queue:*p_queue];

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    chatsPendingUpgrade = v10->_chatsPendingUpgrade;
    v10->_chatsPendingUpgrade = (NSMutableSet *)v25;

    v10->_upgradeTimeout = 5.0;
    v27 = objc_alloc_init(&OBJC_CLASS___TUCallProviderManager);
    callProviderManager = v10->_callProviderManager;
    v10->_callProviderManager = v27;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)accountWithUUID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate callProviderManager](self, "callProviderManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 faceTimeProvider]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 senderIdentityForUUID:v6]);

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate callProviderManager](self, "callProviderManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 faceTimeProvider]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v12 senderIdentityForAccountUUID:v6]);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accounts]);

  id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v15)
  {
    id v30 = v6;
    id v31 = v7;
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "loginID", v30));
        uint64_t v20 = TUHandleForIDSCanonicalAddress(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        v22 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
        unsigned int v23 = [v22 isEqualToHandle:v21];

        if (v23)
        {
          v24 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate isAccountActive]( self,  "isAccountActive"));
          int v25 = ((uint64_t (**)(void, void *))v24)[2](v24, v18);

          if (v25)
          {
            id v15 = v18;
            id v26 = sub_1001704C4();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v6 = v30;
              id v37 = v30;
              __int16 v38 = 2112;
              id v39 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Found matching account: %@ for uuid: %@",  buf,  0x16u);
            }

            else
            {
              id v6 = v30;
            }

            id v7 = v31;
          }

          else
          {
            id v28 = sub_1001704C4();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            id v7 = v31;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v6 = v30;
              id v37 = v30;
              __int16 v38 = 2112;
              id v39 = 0LL;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Found matching account: %@ for uuid: %@ but it was not active and cannot be used for FaceTime.",  buf,  0x16u);
              id v15 = 0LL;
            }

            else
            {
              id v15 = 0LL;
              id v6 = v30;
            }
          }

          goto LABEL_21;
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15) {
        continue;
      }
      break;
    }

    id v6 = v30;
    id v7 = v31;
  }

- (void)inviteIDSPeersWithAction:(id)a3 destinations:(id)a4 joinCallActionToFulfill:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, void))a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate serverBag](self, "serverBag"));
  unsigned int v15 = [v14 isLoaded];

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate serverBag](self, "serverBag"));
    unsigned __int8 v17 = [v16 isQuickRelaySupported];

    if ((v17 & 1) == 0)
    {
      id v18 = sub_1001704C4();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[WARN] Server bag does not support quick relay",  buf,  2u);
      }

      id v20 = sub_1001704C4();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not attempting to use IDSSession for outgoing FT call because server bag does not allow quick relay invitations",  buf,  2u);
      }

      v13[2](v13, &__NSArray0__struct, 0LL);
      goto LABEL_42;
    }
  }

  else
  {
    id v22 = sub_1001704C4();
    unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Server bag is not loaded. Assuming we can make a FaceTime call over quick relay",  buf,  2u);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 handle]);
  int v25 = (CXTransaction *)objc_claimAutoreleasedReturnValue( -[CSDAbstractIDSProviderDelegate waitingChatWithHandle:isOutgoing:]( self,  "waitingChatWithHandle:isOutgoing:",  v24,  0LL));

  v98 = v10;
  if (v25)
  {
    id v96 = v11;
    id v26 = sub_1001704C4();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v103 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Tried to make an outgoing call when we already had a ringing call with the same destination: %@",  buf,  0xCu);
    }

    id v28 = v13;
    v13[2](v13, &__NSArray0__struct, 1LL);
    [v10 fail];
    id v29 = v12;
    [v12 fail];
    id v30 = v25;
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CXTransaction UUID](v25, "UUID"));
    __int128 v32 = -[CXAnswerCallAction initWithCallUUID:]( objc_alloc(&OBJC_CLASS___CXAnswerCallAction),  "initWithCallUUID:",  v31);
    __int128 v33 = -[CXTransaction initWithAction:](objc_alloc(&OBJC_CLASS___CXTransaction), "initWithAction:", v32);
    id v34 = sub_1001704C4();
    __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Requesting transaction to answer already-ringing call",  buf,  2u);
    }

    objc_super v36 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate faceTimeDemuxerDelegate](self, "faceTimeDemuxerDelegate"));
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = sub_10008DC94;
    v99[3] = &unk_1003D7B70;
    id v100 = v31;
    v101 = self;
    id v37 = v31;
    [v36 providerDelegate:self requestedTransaction:v33 completion:v99];

    id v11 = v96;
    id v12 = v29;
  }

  else
  {
    __int16 v38 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate facetimeIDSServiceGenerator]( self,  "facetimeIDSServiceGenerator"));
    uint64_t v39 = ((uint64_t (**)(void, id))v38)[2](v38, [v10 isVideo]);
    __int128 v32 = (CXAnswerCallAction *)objc_claimAutoreleasedReturnValue(v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue([v10 localSenderIdentityUUID]);
    if (v40)
    {
      id v41 = v11;
      v42 = (void *)objc_claimAutoreleasedReturnValue([v10 localSenderIdentityUUID]);
      v43 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate accountWithUUID:service:]( self,  "accountWithUUID:service:",  v42,  v32));
      v44 = v43;
      if (v43) {
        v45 = v43;
      }
      else {
        v45 = (CXTransaction *)objc_claimAutoreleasedReturnValue(-[CXAnswerCallAction account](v32, "account"));
      }
      __int128 v33 = v45;

      id v11 = v41;
    }

    else
    {
      __int128 v33 = (CXTransaction *)objc_claimAutoreleasedReturnValue(-[CXAnswerCallAction account](v32, "account"));
    }

    v46 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate isAccountActive]( self,  "isAccountActive"));
    int v47 = ((uint64_t (**)(void, CXTransaction *))v46)[2](v46, v33);

    if (v47)
    {
      v95 = v33;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CXTransaction csd_ISOCountryCode](v33, "csd_ISOCountryCode"));
      id v97 = v11;
      v94 = v48;
      if ([v48 length])
      {
        v50 = (void *)objc_opt_class(self, v49);
        v51 = v98;
        v52 = (void *)objc_claimAutoreleasedReturnValue([v98 handle]);
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 tuHandle]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v50 handleByFullyQualifyingHandle:v53 usingCountryCode:v48]);
        id v55 = v12;
        v56 = (void *)objc_claimAutoreleasedReturnValue([v54 value]);
        v57 = (void *)objc_claimAutoreleasedReturnValue([v56 IDSFormattedDestinationID]);

        id v12 = v55;
        id v11 = v97;
      }

      else
      {
        v57 = 0LL;
        v51 = v98;
      }

      if ([v57 length])
      {
        v108[0] = IDSSessionTransportTypeKey;
        v108[1] = IDSSessionWaitForPreConnectionDataKey;
        v109[0] = &off_1003F1708;
        v109[1] = &__kCFBooleanTrue;
        v109[2] = &__kCFBooleanTrue;
        v108[2] = IDSSessionAlwaysSkipSelfKey;
        v108[3] = IDSSessionInvitationIsRetryKey;
        v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v51 isRetry]));
        v109[3] = v60;
        uint64_t v61 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v109,  v108,  4LL));

        id v62 = sub_1001704C4();
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v103 = v95;
          __int16 v104 = 2112;
          id v105 = v11;
          __int16 v106 = 2112;
          uint64_t v107 = v61;
          _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "Starting FaceTime IDS chat using account: %@ destinations: %@ options: %@",  buf,  0x20u);
        }

        v92 = v32;
        v93 = v12;
        v91 = v57;
        if ([v12 screenShareRequestType])
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate featureFlags](self, "featureFlags"));
          id v65 = [v64 requestToScreenShareEnabled];
        }

        else
        {
          id v65 = 0LL;
        }

        v69 = (uint64_t (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate outgoingSessionProviderGenerator]( self,  "outgoingSessionProviderGenerator"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate queue](self, "queue"));
        uint64_t v71 = ((uint64_t (**)(void, CXTransaction *, id, uint64_t, id, void *))v69)[2]( v69,  v95,  v11,  v61,  v65,  v70);
        v90 = (void *)objc_claimAutoreleasedReturnValue(v71);

        id v72 = -[CSDExternalIDSDualSession initAsInitiatorWithSessionProvider:]( objc_alloc(&OBJC_CLASS___CSDExternalIDSDualSession),  "initAsInitiatorWithSessionProvider:",  v90);
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate callProviderManager](self, "callProviderManager"));
        v89 = (void *)objc_claimAutoreleasedReturnValue([v73 faceTimeProvider]);

        objc_msgSend( v72,  "setInvitationTimeout:",  (double)TUOutgoingInvitationTimeoutForCallProviderAndIsUpgrade( v89,  objc_msgSend(v51, "isVideo"),  objc_msgSend(v51, "isUpgrade")));
        v74 = (uint64_t (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate outgoingChatGenerator]( self,  "outgoingChatGenerator"));
        v75 = (void *)objc_claimAutoreleasedReturnValue([v51 callUUID]);
        v87 = (void *)objc_claimAutoreleasedReturnValue([v51 handle]);
        v88 = (void *)v61;
        v76 = (void *)objc_claimAutoreleasedReturnValue([v87 tuHandle]);
        id v77 = [v51 isVideo];
        id v78 = [v51 isRelay];
        v79 = (void *)objc_claimAutoreleasedReturnValue([v51 localSenderIdentityUUID]);
        uint64_t v80 = ((uint64_t (**)(void, id, void *, void *, id, id, void *))v74)[2]( v74,  v72,  v75,  v76,  v77,  v78,  v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue(v80);

        [v81 setDelegate:self];
        objc_msgSend(v81, "setShouldSuppressInCallUI:", objc_msgSend(v51, "shouldSuppressInCallUI"));
        id v28 = v13;
        [v81 startWithVideoAspectRatioDescriptor:v51 inviteCompletion:v13];
        -[CSDAbstractIDSProviderDelegate updateCacheWithChat:](self, "updateCacheWithChat:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
        v83 = (void *)objc_claimAutoreleasedReturnValue([v51 callUUID]);
        v84 = self;
        v85 = v51;
        __int128 v33 = v95;
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate callUpdateForChat:](v84, "callUpdateForChat:", v81));
        [v82 reportCallWithUUID:v83 updated:v86];

        [v85 fulfill];
        id v12 = v93;
        [v93 fulfill];

        id v11 = v97;
        id v30 = 0LL;
        v57 = v91;
        __int128 v32 = v92;
        v68 = v94;
      }

      else
      {
        id v66 = sub_1001704C4();
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        v68 = v94;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_1002B40D8(v51, (uint64_t)v57, v67);
        }

        id v28 = v13;
        v13[2](v13, &__NSArray0__struct, 0LL);
        __int128 v33 = v95;
        id v30 = 0LL;
      }
    }

    else
    {
      id v58 = sub_1001704C4();
      v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_1002B4178();
      }

      id v28 = v13;
      v13[2](v13, &__NSArray0__struct, 0LL);
      id v30 = 0LL;
    }
  }

  v13 = v28;
  id v10 = v98;
LABEL_42:
}

- (id)callUpdateForChat:(id)a3
{
  id v4 = a3;
  v5 = -[CXCallUpdate initWithFaceTimeIDSChat:](objc_alloc(&OBJC_CLASS___CXCallUpdate), "initWithFaceTimeIDSChat:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate ISOCountryCodeForChat:](self, "ISOCountryCodeForChat:", v4));

  -[CXCallUpdate setISOCountryCode:](v5, "setISOCountryCode:", v6);
  return v5;
}

- (id)upgradeCallForConversation:(id)a3 withSessionToken:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate callForConversation:withSessionToken:]( self,  "callForConversation:withSessionToken:",  a3,  a4));
  if (-[CSDFaceTimeIDSProviderDelegate canUpgradeChat:](self, "canUpgradeChat:", v5))
  {
    -[CSDFaceTimeIDSProviderDelegate upgradeChatIfNecessary:](self, "upgradeChatIfNecessary:", v5);
    id v6 = sub_1001704C4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[WARN] Found a chat to upgrade: %@",  (uint8_t *)&v10,  0xCu);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)callForConversation:(id)a3 withSessionToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chats](self, "chats"));
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteFromID]);
      id v24 = 0LL;
      id v15 = [v14 _stripPotentialTokenURIWithToken:&v24];
      id v16 = v24;

      if (v16)
      {
        if ([v16 isEqualToData:v7])
        {
          id v19 = v13;

          if (!v19) {
            goto LABEL_18;
          }
          id v20 = sub_1001704C4();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = v19;
            __int16 v31 = 2112;
            id v32 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Found existing chat: %@ for conversation: %@",  buf,  0x16u);
          }

          goto LABEL_21;
        }
      }

      else
      {
        id v17 = sub_1001704C4();
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1002B42C0(v33, v13, &v34, v18);
        }
      }

      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_18:
  id v22 = sub_1001704C4();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1002B4250((uint64_t)v6, v21);
  }
  id v19 = 0LL;
LABEL_21:

  return v19;
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callUUID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v6));

  if (-[CSDFaceTimeIDSProviderDelegate canUpgradeChat:](self, "canUpgradeChat:", v7))
  {
    -[CSDFaceTimeIDSProviderDelegate upgradeChatIfNecessary:](self, "upgradeChatIfNecessary:", v7);
  }

  else
  {
    id v8 = sub_1001704C4();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[WARN] Failing action %@ we determined that chat %@ cannot be upgraded.",  (uint8_t *)&v10,  0x16u);
    }

    [v5 fail];
  }
}

- (id)ISOCountryCodeForCallWithUUID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", a3));
  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate ISOCountryCodeForChat:](self, "ISOCountryCodeForChat:", v4));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)ISOCountryCodeForChat:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isVideo];
  id v6 = off_1003D5DA8;
  if (!v5) {
    id v6 = off_1003D5D98;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v6, "sharedInstance"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localSenderIdentityUUID]);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDFaceTimeIDSProviderDelegate accountWithUUID:service:]( self,  "accountWithUUID:service:",  v8,  v7));
      int v10 = v9;
      if (v9) {
        id v11 = v9;
      }
      else {
        id v11 = (id)objc_claimAutoreleasedReturnValue([v7 account]);
      }
      v13 = v11;
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 account]);
    }

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "csd_ISOCountryCode"));
  }

  else
  {
    __int16 v12 = 0LL;
  }

  return v12;
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)isUpgradingCallWithUUID:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", a3));
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate chatsPendingUpgrade](self, "chatsPendingUpgrade"));
    unsigned __int8 v6 = [v5 containsObject:v4];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)canUpgradeChat:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate chatsPendingUpgrade](self, "chatsPendingUpgrade"));
  unsigned int v6 = [v5 containsObject:v4];

  if (v4
    && [v4 isConnected]
    && [v4 isVideo]
    && [v4 isSendingVideo])
  {
    unsigned int v7 = [v4 isSendingAudio] & (v6 ^ 1);
  }

  else
  {
    unsigned int v7 = 0;
  }

  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      int v10 = &stru_1003E7718;
    }
    else {
      int v10 = @"Not";
    }
    int v12 = 138413826;
    v13 = v10;
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = [v4 isConnected];
    __int16 v18 = 1024;
    unsigned int v19 = [v4 isVideo];
    __int16 v20 = 1024;
    unsigned int v21 = [v4 isSendingVideo];
    __int16 v22 = 1024;
    unsigned int v23 = [v4 isSendingAudio];
    __int16 v24 = 1024;
    unsigned int v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@ Auto-upgrading because chatToUpgrade is %@, isConnected: %d, isVideo: %d, isSendingVideo: %d, isSendingAudio: % d isChatPendingUpgrade: %d",  (uint8_t *)&v12,  0x34u);
  }

  return v7;
}

- (void)upgradeChatIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Upgrading chat: %@", buf, 0xCu);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate chatsPendingUpgrade](self, "chatsPendingUpgrade"));
  [v7 addObject:v4];

  -[CSDFaceTimeIDSProviderDelegate upgradeTimeout](self, "upgradeTimeout");
  dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(v8 * 1000000000.0));
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008E6D0;
  block[3] = &unk_1003D7730;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v9, v10, block);
}

- (id)upgradeSessionUUIDForCallWithUUID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 upgradeSessionUUID]);

  return v4;
}

- (BOOL)hasCallStartedConnectingWithUUID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateStartedConnecting]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v4));
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cancelInvitationWithAnsweredElsewhere];
  }

  else
  {
    id v7 = sub_1001704C4();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chats](self, "chats"));
      int v11 = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find chat with UUID %@. All chats: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)endCallWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v4));
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 end];
  }

  else
  {
    id v7 = sub_1001704C4();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chats](self, "chats"));
      int v11 = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find chat with UUID %@. All chats: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)endCallWithUUIDAsLocalHangup:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v4));
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cancelInvitationWithLocalHangup];
    if ([v6 isConnected])
    {
      id v7 = sub_1001704C4();
      double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
        int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chats](self, "chats"));
        int v15 = 138412546;
        __int16 v16 = v9;
        __int16 v17 = 2112;
        __int16 v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Found chat with UUID %@. Ending it: %@",  (uint8_t *)&v15,  0x16u);
      }

      [v6 end];
    }
  }

  else
  {
    id v11 = sub_1001704C4();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chats](self, "chats"));
      int v15 = 138412546;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find chat with UUID %@. All chats: %@",  (uint8_t *)&v15,  0x16u);
    }
  }
}

- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chatWithUUID:](self, "chatWithUUID:", v4));
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cancelInvitationWithDeclinedElsewhere];
  }

  else
  {
    id v7 = sub_1001704C4();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate chats](self, "chats"));
      int v11 = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not find chat with UUID %@. All chats: %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (BOOL)isMediaAllowedForChat:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate faceTimeDemuxerDelegate](self, "faceTimeDemuxerDelegate"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
  unsigned __int8 v7 = [v5 providerDelegate:self isManagingCallWithUUID:v6];

  if ((v7 & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSProviderDelegate;
    BOOL v8 = -[CSDAbstractIDSProviderDelegate isMediaAllowedForChat:](&v13, "isMediaAllowedForChat:", v4);
  }

  else
  {
    id v9 = sub_1001704C4();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
      *(_DWORD *)buf = 138412290;
      int v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Not allowing media for chat as the call provider is not managing a call with UUID: %@",  buf,  0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)chatStartedConnecting:(id)a3
{
  id v4 = a3;
  if (objc_msgSend( -[CSDFaceTimeIDSProviderDelegate superclass](self, "superclass"),  "instancesRespondToSelector:",  "chatStartedConnecting:"))
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSProviderDelegate;
    -[CSDFaceTimeIDSProviderDelegate chatStartedConnecting:](&v11, "chatStartedConnecting:", v4);
  }

  if ([v4 isOutgoing])
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate faceTimeDemuxerDelegate](self, "faceTimeDemuxerDelegate"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dateStartedConnecting]);
    [v5 providerDelegate:self callWithUUID:v6 startedConnectingAtDate:v7];

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate callUpdateForChat:](self, "callUpdateForChat:", v4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAbstractIDSProviderDelegate provider](self, "provider"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    [v9 reportCallWithUUID:v10 updated:v8];
  }
}

- (void)chatEnded:(id)a3
{
  id v4 = a3;
  -[CSDAbstractIDSProviderDelegate updateCacheWithChat:](self, "updateCacheWithChat:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate chatsPendingUpgrade](self, "chatsPendingUpgrade"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate faceTimeDemuxerDelegate](self, "faceTimeDemuxerDelegate"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dateEnded]);
    id v10 = [v4 endedReason];
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 failureContext]);
    [v7 providerDelegate:self callWithUUID:v8 endedAtDate:v9 withReason:v10 failureContext:v11];

    if (objc_msgSend( -[CSDFaceTimeIDSProviderDelegate superclass](self, "superclass"),  "instancesRespondToSelector:",  "chatEnded:"))
    {
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSProviderDelegate;
      -[CSDAbstractIDSProviderDelegate chatEnded:](&v14, "chatEnded:", v4);
    }
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSDReportingController sharedInstance](&OBJC_CLASS___CSDReportingController, "sharedInstance"));
  [v12 chatReceived:v4];

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate chatsPendingUpgrade](self, "chatsPendingUpgrade"));
  [v13 removeObject:v4];
}

- (BOOL)isMomentsAvailableForChat:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate capabilities](self, "capabilities", a3));
  unsigned __int8 v4 = [v3 isMomentsAvailable];

  return v4;
}

- (void)updateProviderConfigurationWithAccounts:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate accounts](self, "accounts"));

  if (v4 != v6)
  {
    -[CSDFaceTimeIDSProviderDelegate setAccounts:](self, "setAccounts:", v6);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate telephonySenderIdentities](self, "telephonySenderIdentities"));
    -[CSDFaceTimeIDSProviderDelegate updateProviderConfigurationWithAccounts:senderIdentities:]( self,  "updateProviderConfigurationWithAccounts:senderIdentities:",  v6,  v5);
  }
}

- (void)updateProviderConfigurationWithSenderIdentities:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate telephonySenderIdentities](self, "telephonySenderIdentities"));

  if (v4 != v6)
  {
    -[CSDFaceTimeIDSProviderDelegate setTelephonySenderIdentities:](self, "setTelephonySenderIdentities:", v6);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDFaceTimeIDSProviderDelegate accounts](self, "accounts"));
    -[CSDFaceTimeIDSProviderDelegate updateProviderConfigurationWithAccounts:senderIdentities:]( self,  "updateProviderConfigurationWithAccounts:senderIdentities:",  v5,  v6);
  }
}

- (void)updateProviderConfigurationWithAccounts:(id)a3 senderIdentities:(id)a4
{
  id v32 = a3;
  id v5 = a4;
  id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v6 = sub_1001704C4();
  unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v46 = v5;
    __int16 v47 = 2112;
    id v48 = v32;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Matching sender identities %@ to IDS accounts %@",  buf,  0x16u);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v5;
  id v33 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v8;
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v10 = v32;
        id v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v36;
          while (2)
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v36 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
              __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 account]);
              __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUID]);

              __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 matchingSim]);
              unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 SIMIdentifier]);
              __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
              unsigned int v21 = [v19 isEqualToString:v20];

              if (v21)
              {
                -[NSMutableOrderedSet addObject:](v30, "addObject:", v9);

                goto LABEL_18;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

- (void)providerDidBegin:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSDFaceTimeIDSProviderDelegate;
  -[CSDAbstractIDSProviderDelegate providerDidBegin:](&v7, "providerDidBegin:", a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSDFaceTimeVideoIDSService sharedInstance]( &OBJC_CLASS___CSDFaceTimeVideoIDSService,  "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 service]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accounts]);
  -[CSDFaceTimeIDSProviderDelegate updateProviderConfigurationWithAccounts:]( self,  "updateProviderConfigurationWithAccounts:",  v6);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "service: %@ activeAccountsChanged: %@",  (uint8_t *)&v10,  0x16u);
  }

  -[CSDFaceTimeIDSProviderDelegate updateProviderConfigurationWithAccounts:]( self,  "updateProviderConfigurationWithAccounts:",  v7);
}

- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate
{
  return (CSDFaceTimeProviderDelegateManagerDelegate *)objc_loadWeakRetained((id *)&self->_faceTimeDemuxerDelegate);
}

- (void)setFaceTimeDemuxerDelegate:(id)a3
{
}

- (NSSet)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDFaceTimeIDSProviderDelegateCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSOrderedSet)telephonySenderIdentities
{
  return self->_telephonySenderIdentities;
}

- (void)setTelephonySenderIdentities:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)conversationServerBag
{
  return self->_conversationServerBag;
}

- (void)setConversationServerBag:(id)a3
{
}

- (NSMutableSet)chatsPendingUpgrade
{
  return self->_chatsPendingUpgrade;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDFaceTimeIDSProviderDelegateServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (id)facetimeIDSServiceGenerator
{
  return self->_facetimeIDSServiceGenerator;
}

- (void)setFacetimeIDSServiceGenerator:(id)a3
{
}

- (id)isAccountActive
{
  return self->_isAccountActive;
}

- (void)setIsAccountActive:(id)a3
{
}

- (id)outgoingSessionProviderGenerator
{
  return self->_outgoingSessionProviderGenerator;
}

- (void)setOutgoingSessionProviderGenerator:(id)a3
{
}

- (id)outgoingChatGenerator
{
  return self->_outgoingChatGenerator;
}

- (void)setOutgoingChatGenerator:(id)a3
{
}

- (double)upgradeTimeout
{
  return self->_upgradeTimeout;
}

- (void)setUpgradeTimeout:(double)a3
{
  self->_upgradeTimeout = a3;
}

- (void).cxx_destruct
{
}

@end