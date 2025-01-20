@interface CSDIDSGroupSessionProvider
- (BOOL)isAVLess;
- (BOOL)isInitiator;
- (BOOL)isLightweightMember;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isScreenSharingRequest;
- (CSDConversationABTestConfiguration)testConfiguration;
- (CSDConversationServerBag)serverBag;
- (CSDIDSGroupSessionProvider)initWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 isLightweightMember:(BOOL)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13;
- (CSDIDSGroupSessionProviderDelegate)delegate;
- (IDSAccount)account;
- (IDSGroupSession)session;
- (NSArray)participantDestinationIDs;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)UUID;
- (NSString)callerID;
- (NSString)clientUUIDString;
- (NSString)description;
- (NSString)destination;
- (NSString)groupID;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unsigned)endedReason;
- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)allowParticipants:(id)a3;
- (void)dealloc;
- (void)groupSessionDidConnectUnderlyingLinks:(id)a3;
- (void)groupSessionDidDisconnectUnderlyingLinks:(id)a3;
- (void)groupSessionDidTerminate:(id)a3;
- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)joinWithOptions:(id)a3;
- (void)kickParticipants:(id)a3;
- (void)leave;
- (void)leaveWithOptions:(id)a3;
- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5;
- (void)reconnect;
- (void)registerPluginWithOptions:(id)a3;
- (void)removeRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)requestActiveParticipants;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4;
- (void)restart;
- (void)sendParticipantData:(id)a3 withContext:(id)a4;
- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5;
- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4;
- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5;
- (void)sessiondidReceiveKeyUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalParticipantType:(unsigned __int16)a3 memberDestinations:(id)a4;
- (void)setParticipantDestinationIDs:(id)a3;
- (void)setParticipantType:(unsigned __int16)a3 forRemoteMemberDestinations:(id)a4;
- (void)setPreferences:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)setSession:(id)a3;
- (void)setUpSession;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5;
- (void)updateParticipantInfo:(id)a3;
@end

@implementation CSDIDSGroupSessionProvider

- (CSDIDSGroupSessionProvider)initWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 isLightweightMember:(BOOL)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v45 = a7;
  id v46 = a12;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___CSDIDSGroupSessionProvider;
  v23 = -[CSDIDSGroupSessionProvider init](&v47, "init");
  v24 = v23;
  if (v23)
  {
    id v43 = v22;
    objc_storeStrong((id *)&v23->_groupID, a3);
    objc_storeStrong((id *)&v24->_participantDestinationIDs, a4);
    objc_storeStrong((id *)&v24->_account, a6);
    objc_storeStrong((id *)&v24->_queue, a7);
    v25 = (NSString *)[v21 copy];
    callerID = v24->_callerID;
    v24->_callerID = v25;

    v24->_isOneToOneModeEnabled = a8;
    v24->_isLightweightMember = a9;
    v24->_isScreenSharingRequest = a11;
    v24->_avLess = a10;
    v27 = objc_alloc_init(&OBJC_CLASS___TUFeatureFlags);
    featureFlags = v24->_featureFlags;
    v24->_featureFlags = v27;

    v29 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v24->_serverBag;
    v24->_serverBag = (CSDConversationServerBag *)v29;

    objc_storeStrong((id *)&v24->_testConfiguration, a12);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CSDIDSChat faceTimeAppUUID](&OBJC_CLASS___CSDIDSChat, "faceTimeAppUUID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CSDIDSChat faceTimeAppUUID](&OBJC_CLASS___CSDIDSChat, "faceTimeAppUUID"));
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 UUIDString]);
      p_clientUUIDString = &v24->_clientUUIDString;
      clientUUIDString = v24->_clientUUIDString;
      v24->_clientUUIDString = (NSString *)v34;
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      clientUUIDString = (NSString *)objc_claimAutoreleasedReturnValue([v33 UUIDString]);
      v37 = (NSString *)-[NSString copy](clientUUIDString, "copy");
      p_clientUUIDString = &v24->_clientUUIDString;
      v38 = v24->_clientUUIDString;
      v24->_clientUUIDString = v37;
    }

    v24->_isInitiator = a13;
    -[CSDIDSGroupSessionProvider setUpSession](v24, "setUpSession");
    id v39 = sub_1001704C4();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *p_clientUUIDString;
      *(_DWORD *)buf = 138412802;
      id v49 = v20;
      __int16 v50 = 2112;
      v51 = v41;
      __int16 v52 = 2112;
      id v53 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "initWithGroupID: participantDestinationIDs: %@, clientUUIDString: %@, testConfiguration: %@",  buf,  0x20u);
    }

    id v22 = v43;
  }

  return v24;
}

- (void)dealloc
{
  if ((objc_opt_respondsToSelector(self->_session, "invalidate") & 1) != 0) {
    -[IDSGroupSession invalidate](self->_session, "invalidate");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDIDSGroupSessionProvider;
  -[CSDIDSGroupSessionProvider dealloc](&v3, "dealloc");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (void)setUpSession
{
  v32[0] = IDSSessionTransportTypeKey;
  v32[1] = IDSSessionAlwaysSkipSelfKey;
  v33[0] = &off_1003F16A8;
  v33[1] = &__kCFBooleanTrue;
  v32[2] = IDSGroupSessionMessagesGroupIDKey;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider groupID](self, "groupID"));
  v33[2] = v3;
  v32[3] = IDSGroupSessionMessagesGroupMembersKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider participantDestinationIDs](self, "participantDestinationIDs"));
  v33[3] = v4;
  v32[4] = IDSGroupSessionMessagesCallerIDKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider callerID](self, "callerID"));
  v33[4] = v5;
  v32[5] = IDSGroupSessionStartedAsUPlusOneKey;
  if (-[CSDIDSGroupSessionProvider isOneToOneModeEnabled](self, "isOneToOneModeEnabled")) {
    v6 = &__kCFBooleanTrue;
  }
  else {
    v6 = &__kCFBooleanFalse;
  }
  v33[5] = v6;
  v32[6] = IDSGroupSessionIsLightweightParticipantKey;
  if (-[CSDIDSGroupSessionProvider isLightweightMember](self, "isLightweightMember")) {
    v7 = &__kCFBooleanTrue;
  }
  else {
    v7 = &__kCFBooleanFalse;
  }
  v33[6] = v7;
  v32[7] = IDSSessionClientUUIDKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider clientUUIDString](self, "clientUUIDString"));
  v33[7] = v8;
  v32[8] = IDSGroupSessionShortMKIEnabledKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider testConfiguration](self, "testConfiguration"));
  else {
    v10 = &__kCFBooleanFalse;
  }
  v33[8] = v10;
  v32[9] = IDSGroupSessionTLEEnabledKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider testConfiguration](self, "testConfiguration"));
  else {
    v12 = &__kCFBooleanFalse;
  }
  v33[9] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  10LL));
  id v14 = [v13 mutableCopy];

  if (-[CSDIDSGroupSessionProvider isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CSDIDSGroupSessionProvider isInitiator](self, "isInitiator")));
    [v14 setObject:v15 forKeyedSubscript:IDSGroupSessionIsInitiatorKey];
  }

  id v16 = sub_1001704C4();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = TULoggableStringForObject(v14);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    int v30 = 138412290;
    v31 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Creating IDSGroupSession with options %@",  (uint8_t *)&v30,  0xCu);
  }

  id v20 = objc_alloc(&OBJC_CLASS___IDSGroupSession);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider account](self, "account"));
  id v22 = [v14 copy];
  v23 = -[IDSGroupSession initWithAccount:options:](v20, "initWithAccount:options:", v21, v22);
  -[CSDIDSGroupSessionProvider setSession:](self, "setSession:", v23);

  if (-[CSDIDSGroupSessionProvider isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider featureFlags](self, "featureFlags"));
    if (![v24 uPlusOneSessionWithCapabilitiesEnabled])
    {
LABEL_22:

      goto LABEL_23;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider serverBag](self, "serverBag"));
    unsigned int v26 = [v25 isUPlusOneSessionCapabilitiesEnabled];

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsModernGFT));
      -[CSDIDSGroupSessionProvider addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v27,  0LL);

      if (-[CSDIDSGroupSessionProvider isScreenSharingRequest](self, "isScreenSharingRequest"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsSSRC));
        -[CSDIDSGroupSessionProvider addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v24,  0LL);
        goto LABEL_22;
      }
    }
  }

- (IDSGroupSession)session
{
  return self->_session;
}

- (unsigned)endedReason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  unsigned int v3 = [v2 sessionEndedReason];

  return v3;
}

- (NSString)UUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sessionID]);

  return (NSString *)v3;
}

- (NSString)destination
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 destination]);

  return (NSString *)v3;
}

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "preferences: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v7 setPreferences:v4];
}

- (void)joinWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = TULoggableStringForObject(v4);
    int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v17 = 138412290;
    uint64_t v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "options: %@", (uint8_t *)&v17, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider featureFlags](self, "featureFlags"));
  v10 = (CSDMessagingConversationParticipantDidJoinContext *)objc_claimAutoreleasedReturnValue( -[CSDIDSGroupSessionProvider serverBag]( self,  "serverBag"));
  if (!-[CSDMessagingConversationParticipantDidJoinContext isUPlusOneSessionCapabilitiesEnabled]( v10,  "isUPlusOneSessionCapabilitiesEnabled"))
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSGroupSessionStartedAsUPlusOneKey]);
  int v12 = [v11 intValue];

  if (v12 >= 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsModernGFT));
    -[CSDIDSGroupSessionProvider addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v13,  0LL);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IDSGroupSessionClientContextDataKey]);
    v10 = -[CSDMessagingConversationParticipantDidJoinContext initWithData:]( objc_alloc(&OBJC_CLASS___CSDMessagingConversationParticipantDidJoinContext),  "initWithData:",  v9);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingConversationParticipantDidJoinContext screenSharingRequest]( v10,  "screenSharingRequest"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  IDSRegistrationPropertySupportsSSRC));
      -[CSDIDSGroupSessionProvider addRequiredCapabilities:requiredLackOfCapabilities:]( self,  "addRequiredCapabilities:requiredLackOfCapabilities:",  v15,  0LL);
    }

    goto LABEL_8;
  }

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1001704C4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = TULoggableStringForHandles(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v15 = 138412802;
    id v16 = v13;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "participantDestinationIDs: %@ contextData: %@ triggeredLocally: %d",  (uint8_t *)&v15,  0x1Cu);
  }

  -[CSDIDSGroupSessionProvider setParticipantDestinationIDs:](self, "setParticipantDestinationIDs:", v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v14 updateMembers:v8 withContext:v9 triggeredLocally:v5];
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = sub_1001704C4();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = TULoggableStringForHandles(v12);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    int v25 = 138413314;
    unsigned int v26 = v19;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "participantDestinationIDs: %@ contextData: %@ requiredCapabilities: %@ requiredLackOfCapabilities: %@ triggeredLocally: %d",  (uint8_t *)&v25,  0x30u);
  }

  id v20 = objc_alloc(&OBJC_CLASS___IDSMessagingCapabilities);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
  id v23 = [v20 initWithRequiredCapabilities:v21 requiredMissingCapabilities:v22];

  -[CSDIDSGroupSessionProvider setParticipantDestinationIDs:](self, "setParticipantDestinationIDs:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v24 updateMembers:v12 withContext:v13 messagingCapabilities:v23 triggeredLocally:v7];
}

- (void)sendParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending participantData: %@, context: %@",  (uint8_t *)&v13,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v11 = objc_opt_respondsToSelector(v10, "updateParticipantData:withContext:");

  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v12 updateParticipantData:v6 withContext:v7];
  }
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "updateParticipantInfo: %@",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v8 = objc_opt_respondsToSelector(v7, "updateParticipantInfo:");

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v9 updateParticipantInfo:v4];
  }
}

- (void)leave
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v5 leaveGroupSession];
}

- (void)leaveWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Leaving with options: %@",  (uint8_t *)&v11,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v8 = objc_opt_respondsToSelector(v7, "leaveGroupSessionWithOptions:");

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  int v10 = v9;
  if ((v8 & 1) != 0) {
    [v9 leaveGroupSessionWithOptions:v4];
  }
  else {
    [v9 leaveGroupSession];
  }
}

- (void)restart
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", v8, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v6 = objc_opt_respondsToSelector(v5, "invalidate");

  if ((v6 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v7 invalidate];

    -[CSDIDSGroupSessionProvider setUpSession](self, "setUpSession");
  }

- (void)requestActiveParticipants
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v7 = 138412290;
    char v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v7, 0xCu);
  }

  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v6 requestActiveParticipants];
}

- (void)reconnect
{
  id v3 = sub_1001704C4();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v9 = 138412290;
    int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v9, 0xCu);
  }

  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v7 = objc_opt_respondsToSelector(v6, "reconnectUPlusOneSession");

  if ((v7 & 1) != 0)
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v8 performSelector:"reconnectUPlusOneSession"];
  }

- (void)kickParticipants:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v5 manageDesignatedMembers:v4 withType:1];
}

- (void)allowParticipants:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v5 manageDesignatedMembers:v4 withType:2];
}

- (void)registerPluginWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "session: %@, options: %@",  (uint8_t *)&v11,  0x16u);
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v9 = objc_opt_respondsToSelector(v8, "registerPluginWithOptions:");

  if ((v9 & 1) != 0)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v10 performSelector:"registerPluginWithOptions:" withObject:v4];
  }
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v12 = 138412546;
    __int16 v13 = v10;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "session: %@, requestDataCryptor: %@",  (uint8_t *)&v12,  0x16u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v11 requestDataCryptorForTopic:v6 completionHandler:v7];
}

- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v12 = 138412802;
    __int16 v13 = v10;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "session: %@, requestEncryptionKeyForParticipants: %@ topic: %@",  (uint8_t *)&v12,  0x20u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v11 requestEncryptionKeyForParticipants:v6];
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v9 = objc_opt_respondsToSelector(v8, "setRequiredCapabilities:requiredLackOfCapabilities:");

  if ((v9 & 1) != 0)
  {
    id v10 = sub_1001704C4();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
      int v22 = 138412802;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "session: %@, setRequiredCapabilities: %@ requiredLackOfCapabilities: %@",  (uint8_t *)&v22,  0x20u);
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requiredCapabilities]);
    id v15 = [v14 mutableCopy];

    if ([v6 count])
    {
      if (!v15) {
        id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      }
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
      [v15 addObjectsFromArray:v16];
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 requiredLackOfCapabilities]);
    id v19 = [v18 mutableCopy];

    if ([v7 count])
    {
      if (!v19) {
        id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
      [v19 addObjectsFromArray:v20];
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v21 setRequiredCapabilities:v15 requiredLackOfCapabilities:v19];
  }
}

- (void)removeRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v18 = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "session: %@, removeRequiredCapabilities: %@ requiredLackOfCapabilities: %@",  (uint8_t *)&v18,  0x20u);
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requiredCapabilities]);
  id v13 = [v12 mutableCopy];

  if ([v6 count]) {
    [v13 minusSet:v6];
  }
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 requiredLackOfCapabilities]);
  id v16 = [v15 mutableCopy];

  if ([v7 count]) {
    [v16 minusSet:v7];
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v17 setRequiredCapabilities:v13 requiredLackOfCapabilities:v16];
}

- (NSSet)requiredCapabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requiredCapabilities]);

  return (NSSet *)v3;
}

- (NSSet)requiredLackOfCapabilities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 requiredLackOfCapabilities]);

  return (NSSet *)v3;
}

- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1001704C4();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    *(_DWORD *)buf = 138412802;
    v38 = v10;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "session: %@, addAliasesToConversationContainer: %@ salt: %@",  buf,  0x20u);
  }

  int v11 = objc_alloc(&OBJC_CLASS___NSUUID);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionIDAliasWithSalt:v7]);
  __int16 v14 = -[NSUUID initWithUUIDString:](v11, "initWithUUIDString:", v13);
  [v6 setGroupUUID:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  objc_msgSend( v6,  "setLocalParticipantIdentifier:",  objc_msgSend(v15, "createAliasForParticipantID:salt:", objc_msgSend(v6, "localParticipantIdentifier"), v7));

  id v16 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v30 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 virtualParticipants]);
  id v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      __int16 v20 = 0LL;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v20);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
        id v23 = self;
        id v24 = v7;
        id v25 = objc_msgSend(v22, "createAliasForParticipantID:salt:", objc_msgSend(v21, "identifier"), v7);

        id v26 = objc_alloc(&OBJC_CLASS___TUConversationVirtualParticipant);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v21 pluginName]);
        id v28 = v25;
        id v7 = v24;
        self = v23;
        id v29 = [v26 initWithIdentifier:v28 pluginName:v27];
        -[NSMutableSet addObject:](v16, "addObject:", v29);

        __int16 v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v18);
  }

  [v30 setVirtualParticipants:v16];
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v13 = 138412802;
    __int16 v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "session: %@, participantIDForAlias: %llu salt: %@",  (uint8_t *)&v13,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  id v11 = [v10 participantIDForAlias:a3 salt:v6];

  return (unint64_t)v11;
}

- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5
{
  id v8 = a4;
  char v9 = (void (**)(id, unint64_t))a5;
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    int v19 = 138412802;
    __int16 v20 = v12;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "session: %@, participantIDForAlias: %llu salt: %@",  (uint8_t *)&v19,  0x20u);
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  char v14 = objc_opt_respondsToSelector(v13, "getParticipantIDForAlias:salt:completionHandler:");

  if ((v14 & 1) != 0)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    [v15 getParticipantIDForAlias:a3 salt:v8 completionHandler:v9];
  }

  else
  {
    id v16 = sub_1001704C4();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
      int v19 = 138412290;
      __int16 v20 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "session: %@ doesn't support async participantID fetching, falling back to sync form.",  (uint8_t *)&v19,  0xCu);
    }

    v9[2](v9, -[CSDIDSGroupSessionProvider participantIDForAlias:salt:](self, "participantIDForAlias:salt:", a3, v8));
  }
}

- (void)setLocalParticipantType:(unsigned __int16)a3 memberDestinations:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if ((_DWORD)v4 == 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSRegistrationPropertySupportsAVLess));
    -[CSDIDSGroupSessionProvider removeRequiredCapabilities:requiredLackOfCapabilities:]( self,  "removeRequiredCapabilities:requiredLackOfCapabilities:",  v7,  0LL);
  }

  id v8 = sub_1001704C4();
  char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    uint64_t v11 = TULoggableStringForHandles(v6);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v14 = 138412802;
    __int16 v15 = v10;
    __int16 v16 = 1024;
    int v17 = v4;
    __int16 v18 = 2112;
    int v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "session: %@ updating local participant type: %hu destinations: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  -[CSDIDSGroupSessionProvider setParticipantDestinationIDs:](self, "setParticipantDestinationIDs:", v6);
  self->_avLess = (_DWORD)v4 == 0;
  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v13 updateParticipantType:v4 members:v6 withContext:0 triggeredLocally:1];
}

- (void)setParticipantType:(unsigned __int16)a3 forRemoteMemberDestinations:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = sub_1001704C4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    uint64_t v10 = TULoggableStringForHandles(v6);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    int v13 = 138412802;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 2112;
    __int16 v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "session: %@ updating remote participant type: %hu destinations: %@",  (uint8_t *)&v13,  0x1Cu);
  }

  -[CSDIDSGroupSessionProvider setParticipantDestinationIDs:](self, "setParticipantDestinationIDs:", v6);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v12 updateParticipantType:v4 members:v6 withContext:0 triggeredLocally:0];
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
    id v8 = (void *)v7;
    char v9 = @"NO";
    if (v3) {
      char v9 = @"YES";
    }
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "session: %@ setScreening: %@",  (uint8_t *)&v11,  0x16u);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider session](self, "session"));
  [v10 setCallScreeningMode:v3];
}

- (void)groupSessionDidTerminate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate", a3));
  [v4 sessionProviderDidTerminate:self];
}

- (void)groupSessionDidDisconnectUnderlyingLinks:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "groupSessionDidDisconnectUnderlyingLinks for session: %@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v7 sessionProvider:self didReceiveUnderlyingLinksStatus:0];
}

- (void)groupSessionDidConnectUnderlyingLinks:(id)a3
{
  id v4 = a3;
  id v5 = sub_1001704C4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "groupSessionDidConnectUnderlyingLinks for session: %@",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v7 sessionProvider:self didReceiveUnderlyingLinksStatus:1];
}

- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self endedWithReason:v5 error:v7];
}

- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 participantIDs]);
  id v10 = [v8 participantIdentifier];

  [v11 sessionProvider:self didJoinGroupWithParticipantIdentifiers:v9 localParticipantIdentifier:v10 error:v7];
}

- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v6 sessionProvider:self didLeaveGroupWithError:v5];
}

- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self didReceiveActiveParticipants:v7 success:v5];
}

- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self didReceiveActiveLightweightParticipants:v7 success:v5];
}

- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self didReceiveLeftParticipantID:a4 withContext:v7];
}

- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self didReceiveJoinedParticipantID:a4 withContext:v7];
}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v6 sessionProvider:self didReceiveReport:v5];
}

- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v11 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v12 sessionProvider:self didReceiveKickedParticipantIDs:v11 withCode:v9 withType:v8 isTruncated:v7];
}

- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6
{
  if (a6 <= 3u) {
    -[CSDIDSGroupSessionProvider session:didReceiveBlockedParticipantIDs:withCode:withType:isTruncated:]( self,  "session:didReceiveBlockedParticipantIDs:withCode:withType:isTruncated:",  a3,  a4,  *(void *)&a5);
  }
}

- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v8 sessionProvider:self didReceiveLocalParticipantType:v5 error:v7];
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v6 sessionProvider:self didRegisterPluginAllocationInfo:v5];
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v6 sessionProvider:self didUnregisterPluginAllocationInfo:v5];
}

- (void)sessiondidReceiveKeyUpdate:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate", a3));
  [v4 sessionProviderDidReceiveKeyUpdate:self];
}

- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v9 sessionProvider:self didReceiveDataBlob:v8 forParticipant:v7];
}

- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  uint64_t v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate"));
  [v11 sessionProvider:self didReceiveData:v10 dataType:v6 forParticipant:v9];
}

- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CSDIDSGroupSessionProvider delegate](self, "delegate", a3));
  [v6 sessionProvider:self didReceiveServerErrorCode:v4];
}

- (BOOL)isAVLess
{
  return self->_avLess;
}

- (void)setSession:(id)a3
{
}

- (CSDIDSGroupSessionProviderDelegate)delegate
{
  return (CSDIDSGroupSessionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)participantDestinationIDs
{
  return self->_participantDestinationIDs;
}

- (void)setParticipantDestinationIDs:(id)a3
{
}

- (NSString)clientUUIDString
{
  return self->_clientUUIDString;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (IDSAccount)account
{
  return self->_account;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_isOneToOneModeEnabled;
}

- (BOOL)isLightweightMember
{
  return self->_isLightweightMember;
}

- (BOOL)isScreenSharingRequest
{
  return self->_isScreenSharingRequest;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (NSString)callerID
{
  return self->_callerID;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (CSDConversationABTestConfiguration)testConfiguration
{
  return self->_testConfiguration;
}

- (void).cxx_destruct
{
}

@end