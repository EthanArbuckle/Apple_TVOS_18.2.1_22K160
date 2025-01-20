@interface IDSGroupAgent
+ (id)sharedInstance;
- (BOOL)isAirDropSession:(id)a3;
- (BOOL)isAppleEndpointForExistingSession:(id)a3;
- (BOOL)isSessionControlEnabled;
- (IDSGroupAgent)initWithQueue:(id)a3 isSessionControlEnabled:(BOOL)a4;
- (IDSGroupSessionMultiplexer)multiplexer;
- (NEPolicySession)policySession;
- (NEPolicySession)policySessionWithEntitlment;
- (NSMutableDictionary)endpointToClientInfo;
- (NSMutableDictionary)endpointToResolvedParameters;
- (NSMutableDictionary)managedSessions;
- (NSMutableDictionary)membersArrayDict;
- (NSMutableDictionary)portCollisionDetection;
- (NSMutableDictionary)sessionIDToEndpoints;
- (NSMutableDictionary)sessionIDToEvaluators;
- (OS_dispatch_queue)queue;
- (OS_nw_agent)agent;
- (OS_nw_agent)entitledAgent;
- (OS_nw_channel)packetChannel;
- (id)generateSessionIDFromMemberArray:(id)a3;
- (id)resolveAppleEndpoint:(id)a3;
- (unsigned)getPortSignatureForTopic:(id)a3;
- (void)_injectPortTopicMappingForSession:(id)a3 topic:(id)a4 portSignature:(id)a5;
- (void)createNewSessionForClientRequest:(id)a3 isClient:(BOOL)a4 registrationCompletionBlock:(id)a5;
- (void)registerAgent;
- (void)registerEntitledAgent;
- (void)resolveAirDropProEndpointWithParams:(id)a3 options:(id)a4 agentResolveResponse:(id)a5;
- (void)setAgent:(id)a3;
- (void)setEndpointToClientInfo:(id)a3;
- (void)setEndpointToResolvedParameters:(id)a3;
- (void)setEntitledAgent:(id)a3;
- (void)setIsSessionControlEnabled:(BOOL)a3;
- (void)setManagedSessions:(id)a3;
- (void)setMembersArrayDict:(id)a3;
- (void)setMultiplexer:(id)a3;
- (void)setPacketChannel:(id)a3;
- (void)setPolicySession:(id)a3;
- (void)setPolicySessionWithEntitlment:(id)a3;
- (void)setPortCollisionDetection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionIDToEndpoints:(id)a3;
- (void)setSessionIDToEvaluators:(id)a3;
- (void)unregisterAgent;
- (void)unregisterEntitledAgent;
@end

@implementation IDSGroupAgent

+ (id)sharedInstance
{
  if (qword_1009C0DB8[0] != -1) {
    dispatch_once(qword_1009C0DB8, &stru_100904A98);
  }
  return (id)qword_1009C0DB0;
}

- (IDSGroupAgent)initWithQueue:(id)a3 isSessionControlEnabled:(BOOL)a4
{
  v6 = (OS_dispatch_queue *)a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IDSGroupAgent;
  v7 = -[IDSGroupAgent init](&v24, "init");
  v8 = v7;
  if (v7)
  {
    v7->_queue = v6;
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    endpointToResolvedParameters = v8->_endpointToResolvedParameters;
    v8->_endpointToResolvedParameters = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    endpointToClientInfo = v8->_endpointToClientInfo;
    v8->_endpointToClientInfo = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[IDSGroupSessionMultiplexer sharedInstance](&OBJC_CLASS___IDSGroupSessionMultiplexer, "sharedInstance"));
    multiplexer = v8->_multiplexer;
    v8->_multiplexer = (IDSGroupSessionMultiplexer *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    portCollisionDetection = v8->_portCollisionDetection;
    v8->_portCollisionDetection = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    managedSessions = v8->_managedSessions;
    v8->_managedSessions = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionIDToEndpoints = v8->_sessionIDToEndpoints;
    v8->_sessionIDToEndpoints = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sessionIDToEvaluators = v8->_sessionIDToEvaluators;
    v8->_sessionIDToEvaluators = v21;

    v8->_isSessionControlEnabled = a4;
  }

  return v8;
}

- (void)registerAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));

  if (!v3)
  {
    id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Agent with domain:%@, class:%@", @"com.apple.ids", @"IDSGroupAgent"));
    id v5 = [v4 UTF8String];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent queue](self, "queue"));
    v7 = (void *)nw_agent_create("com.apple.ids", "IDSGroupAgent", v5, v6);
    -[IDSGroupAgent setAgent:](self, "setAgent:", v7);

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[IDSGroupAgent setMembersArrayDict:](self, "setMembersArrayDict:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1003F2558;
    v35[3] = &unk_100904AE8;
    v35[4] = self;
    nw_agent_set_group_handlers(v9, v35, &stru_100904B28);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    v33[4] = self;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_1003F2A7C;
    v34[3] = &unk_100904B50;
    v34[4] = self;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1003F2DC4;
    v33[3] = &unk_100904B78;
    nw_agent_set_flow_handlers(v10, 3LL, 1LL, 1LL, v34, v33);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1003F31B8;
    v32[3] = &unk_100904BA0;
    v32[4] = self;
    nw_agent_add_resolve_handlers(v11, 6LL, 1LL, v32, &stru_100904BE0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    uint64_t v17 = IDSRealTimeContext(v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    nw_agent_set_flow_context(v12, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    nw_agent_change_state(v19, 1LL, 4LL, 0LL);

    v37[0] = 0LL;
    v37[1] = 0LL;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    nw_agent_get_uuid(v20, v37);

    v21 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v37);
    v22 = objc_alloc_init(&OBJC_CLASS___NEPolicySession);
    -[IDSGroupAgent setPolicySession:](self, "setPolicySession:", v22);

    id v23 = objc_alloc(&OBJC_CLASS___NEPolicy);
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](&OBJC_CLASS___NEPolicyResult, "netAgentUUID:", v21));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
    v36[0] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition ipProtocol:](&OBJC_CLASS___NEPolicyCondition, "ipProtocol:", 17LL));
    v36[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition requiredAgentDomain:agentType:]( &OBJC_CLASS___NEPolicyCondition,  "requiredAgentDomain:agentType:",  @"com.apple.ids",  @"IDSGroupAgent"));
    v36[2] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 3LL));
    id v29 = [v23 initWithOrder:0 result:v24 conditions:v28];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySession](self, "policySession"));
    [v30 addPolicy:v29];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySession](self, "policySession"));
    [v31 apply];
  }

- (void)registerEntitledAgent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));

  if (!v3)
  {
    id v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Agent with domain:%@, class:%@", @"com.apple.ids", @"IDSGroupEntitledAgent"));
    id v4 = [v29 UTF8String];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent queue](self, "queue"));
    v6 = (void *)nw_agent_create("com.apple.ids", "IDSGroupEntitledAgent", v4, v5);
    -[IDSGroupAgent setEntitledAgent:](self, "setEntitledAgent:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));
    v30[4] = self;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1003F36D8;
    v31[3] = &unk_100904BA0;
    v31[4] = self;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1003F3998;
    v30[3] = &unk_100904B78;
    nw_agent_add_resolve_handlers(v7, 6LL, 1LL, v31, v30);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));
    uint64_t v13 = IDSRealTimeContext(v8, v9, v10, v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    nw_agent_set_flow_context(v8, v14);

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));
    nw_agent_change_state(v15, 1LL, 4LL, 0LL);

    v33[0] = 0LL;
    v33[1] = 0LL;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));
    nw_agent_get_uuid(v16, v33);

    uint64_t v17 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v33);
    v18 = objc_alloc_init(&OBJC_CLASS___NEPolicySession);
    -[IDSGroupAgent setPolicySessionWithEntitlment:](self, "setPolicySessionWithEntitlment:", v18);

    id v19 = objc_alloc(&OBJC_CLASS___NEPolicy);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyResult netAgentUUID:](&OBJC_CLASS___NEPolicyResult, "netAgentUUID:", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
    v32[0] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition ipProtocol:](&OBJC_CLASS___NEPolicyCondition, "ipProtocol:", 17LL));
    v32[1] = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition requiredAgentDomain:agentType:]( &OBJC_CLASS___NEPolicyCondition,  "requiredAgentDomain:agentType:",  @"com.apple.ids",  @"IDSGroupEntitledAgent"));
    v32[2] = v23;
    objc_super v24 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition customEntitlement:]( &OBJC_CLASS___NEPolicyCondition,  "customEntitlement:",  @"com.apple.private.ids.agent.GroupRestricted"));
    v32[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 4LL));
    id v26 = [v19 initWithOrder:0 result:v20 conditions:v25];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySessionWithEntitlment](self, "policySessionWithEntitlment"));
    [v27 addPolicy:v26];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySessionWithEntitlment](self, "policySessionWithEntitlment"));
    [v28 apply];
  }

- (void)createNewSessionForClientRequest:(id)a3 isClient:(BOOL)a4 registrationCompletionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void, void))v9;
  if (v8)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    uint64_t v12 = (void *)IDSServiceNameAirDropWalkAway;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceWithIdentifier:IDSServiceNameAirDropWalkAway]);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appleIDAccountOnService:v13]);

    if (!v15)
    {
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog TransportLevelAgent](&OBJC_CLASS___IDSFoundationLog, "TransportLevelAgent"));
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v101 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "No account found for %@", buf, 0xCu);
      }

      v10[2](v10, 0LL, 0LL);
      goto LABEL_68;
    }

    BOOL v79 = v6;
    uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 unprefixedURIStringsFromRegistration]);
    v18 = (void *)_IDSCopyCallerIDWithSelfMessagingHint(0LL, v17, 0LL, 0LL, 0LL, 0LL, 0LL);

    v82 = self;
    if (-[IDSGroupAgent isAirDropSession:](self, "isAirDropSession:", v8))
    {
      v80 = v18;
      id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
      id v83 = v12;
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog TransportLevelAgent](&OBJC_CLASS___IDSFoundationLog, "TransportLevelAgent"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = IDSLoggableDescriptionForHandleOnService(v19, v83);
        v22 = v16;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138412290;
        uint64_t v101 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found airdrop_pro endpoint: %@", buf, 0xCu);

        uint64_t v16 = v22;
      }

      objc_super v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_alias(v8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 componentsSeparatedByString:@":"]);
      if ([v26 count] == (id)5)
      {
        v72 = v25;
        CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)v16;
        value = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:4]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:3]);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData __imDataWithHexString:](&OBJC_CLASS___NSData, "__imDataWithHexString:", v27));
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:1]);
        v74 = v15;
        v30 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:2]);
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%@",  v29,  v30));
        v76 = (void *)IDSCopyIDForTokenWithID(v28, v31);

        uint64_t v15 = v74;
        v32 = (void *)objc_claimAutoreleasedReturnValue([v74 primaryRegistration]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 pushToken]);

        v34 = (void *)IDSCopyBestGuessIDForID(v80);
        uint64_t v35 = IDSCopyIDForTokenWithID(v33, v34);

        v36 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndexedSubscript:3]);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "__imHexString"));
        v38 = v37;
        if (v37 && v36)
        {

          if (v35 && v76)
          {
            v99[0] = v35;
            v99[1] = v76;
            v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v99,  2LL));

            v18 = (void *)v35;
            id v40 = v83;
            uint64_t v16 = (NSMutableDictionary *)theDict;
            uint64_t v41 = (uint64_t)value;
LABEL_19:

            if (v41)
            {
              valuea = (void *)v41;
              v81 = v18;
              id v84 = v40;
              theDicta = (__CFDictionary *)v16;
              v73 = v13;
              v75 = v15;
              v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              __int128 v93 = 0u;
              __int128 v94 = 0u;
              __int128 v95 = 0u;
              __int128 v96 = 0u;
              id v50 = v39;
              id v51 = [v50 countByEnumeratingWithState:&v93 objects:v97 count:16];
              if (v51)
              {
                id v52 = v51;
                uint64_t v53 = *(void *)v94;
                do
                {
                  for (i = 0LL; i != v52; i = (char *)i + 1)
                  {
                    if (*(void *)v94 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    uint64_t v55 = *(void *)(*((void *)&v93 + 1) + 8LL * (void)i);
                    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
                    -[NSMutableDictionary setValue:forKey:](v49, "setValue:forKey:", v56, v55);
                  }

                  id v52 = [v50 countByEnumeratingWithState:&v93 objects:v97 count:16];
                }

                while (v52);
              }

              CFDictionarySetValue(theDicta, IDSSessionUniqueIDKey, valuea);
              CFDictionarySetValue(theDicta, IDSGroupSessionMessagesGroupIDKey, valuea);
              uint64_t v15 = v75;
              v57 = (void *)objc_claimAutoreleasedReturnValue([v75 uniqueID]);
              if (v57)
              {
                CFDictionarySetValue(theDicta, IDSSessionAccountIDKey, v57);
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_1006AD9A0();
              }

              id v61 = v50;
              if (v61)
              {
                CFDictionarySetValue(theDicta, IDSSessionDestinationsKey, v61);
                uint64_t v13 = v73;
              }

              else
              {
                uint64_t v13 = v73;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_1006AD920();
                }
              }

              v62 = v49;
              if (v62)
              {
                CFDictionarySetValue(theDicta, IDSSessionDestinationLightWeightStatusesKey, v62);
                v63 = v84;
              }

              else
              {
                v63 = v84;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_1006AD8A0();
                }
              }

              v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
              if (v64)
              {
                CFDictionarySetValue(theDicta, IDSGroupSessionIsLightweightParticipantKey, v64);
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_1006AD820();
              }

              v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v79));
              if (v65)
              {
                CFDictionarySetValue(theDicta, IDSSessionIsInitiatorKey, v65);
              }

              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_1006AD7A0();
              }

              CFDictionarySetValue(theDicta, IDSSessionIsMultiwayKey, &__kCFBooleanTrue);
              CFDictionarySetValue(theDicta, IDSSessionDisallowWifiInterfaceKey, &__kCFBooleanFalse);
              CFDictionarySetValue(theDicta, IDSSessionConnectionCountHintKey, &off_1009480A0);
              CFDictionarySetValue(theDicta, IDSSessionAlwaysSkipSelfKey, &__kCFBooleanFalse);
              CFDictionarySetValue(theDicta, IDSSessionWaitForPreConnectionDataKey, &__kCFBooleanFalse);
              uint64_t v16 = (NSMutableDictionary *)theDicta;
              CFDictionarySetValue(theDicta, IDSSessionPreferredAddressFamilyKey, &off_1009480A0);
              CFDictionarySetValue(theDicta, IDSSessionTransportTypeKey, &off_1009480B8);
              id v66 = [v10 copy];
              if (v66) {
                CFDictionarySetValue(theDicta, IDSSessionReliableUnicastRegistrationCompletionBlockKey, v66);
              }

              if (v63) {
                CFDictionarySetValue(theDicta, IDSSessionClientID, v63);
              }
              uint64_t v69 = im_primary_queue(v67, v68);
              v70 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v69);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_1003F4758;
              block[3] = &unk_1008F8440;
              v88 = theDicta;
              v89 = v82;
              id v90 = valuea;
              v92 = v10;
              id v40 = v63;
              id v91 = v40;
              id v19 = valuea;
              dispatch_async(v70, block);

              v18 = v81;
            }

            else
            {
              v10[2](v10, 0LL, 0LL);

              id v19 = v76;
            }

            goto LABEL_67;
          }

          v71 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog TransportLevelAgent]( &OBJC_CLASS___IDSFoundationLog,  "TransportLevelAgent"));
          uint64_t v16 = (NSMutableDictionary *)theDict;
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v101 = v35;
            __int16 v102 = 2112;
            v103 = v76;
            _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Can not create destination array from localDestination: %@ and remoteDestination: %@",  buf,  0x16u);
          }

          v10[2](v10, 0LL, 0LL);
        }

        else
        {
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog TransportLevelAgent]( &OBJC_CLASS___IDSFoundationLog,  "TransportLevelAgent"));
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v101 = (uint64_t)v38;
            __int16 v102 = 2112;
            v103 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "Can not create destination array from localPushToken: %@ and remotePushToken: %@",  buf,  0x16u);
          }

          v10[2](v10, 0LL, 0LL);
          uint64_t v15 = v74;
          uint64_t v16 = (NSMutableDictionary *)theDict;
        }

        v25 = v72;
      }

      else
      {
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog TransportLevelAgent]( &OBJC_CLASS___IDSFoundationLog,  "TransportLevelAgent"));
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v101 = (uint64_t)v8;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Unexpected format for endpoint: %@",  buf,  0xCu);
        }

        v10[2](v10, 0LL, 0LL);
        uint64_t v35 = (uint64_t)v80;
      }

      v18 = (void *)v35;
      id v40 = v83;
LABEL_67:

LABEL_68:
      goto LABEL_69;
    }

    v43 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_name(v8));
    id v19 = (id)objc_claimAutoreleasedReturnValue(v43);
    if (([v19 containsString:@"com.apple.airdrop_pro"] & 1) == 0)
    {
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog TransportLevelAgent](&OBJC_CLASS___IDSFoundationLog, "TransportLevelAgent"));
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v101 = (uint64_t)v8;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Unexpected format for endpoint: %@",  buf,  0xCu);
      }

      v10[2](v10, 0LL, 0LL);
      id v40 = 0LL;
      goto LABEL_67;
    }

    v44 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_alias(v8));
    uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)IDSCopyBestGuessIDForID(v18);
    v98[0] = v46;
    v76 = (void *)v45;
    v47 = v16;
    v48 = (void *)IDSCopyBestGuessIDForID(v45);
    v98[1] = v48;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v98, 2LL));

    uint64_t v16 = v47;
    uint64_t v41 = objc_claimAutoreleasedReturnValue(-[IDSGroupAgent generateSessionIDFromMemberArray:](v82, "generateSessionIDFromMemberArray:", v39));
    id v40 = 0LL;
    goto LABEL_19;
  }

  (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
LABEL_69:
}

- (id)generateSessionIDFromMemberArray:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_100904C48]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@","]);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);

    memset(md, 170, 20);
    id v7 = v6;
    CC_SHA1([v7 bytes], (CC_LONG)objc_msgSend(v7, "length"), md);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 20LL));
    id v9 = v8;
    __int128 v13 = *(_OWORD *)[v9 bytes];
    uint64_t v10 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v13);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10, "UUIDString", v13, *(void *)md, *(void *)&md[8], *(void *)&md[16]));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog TransportLevelAgent](&OBJC_CLASS___IDSFoundationLog, "TransportLevelAgent"));
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)md = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "generateStringFromMembers received unexpected input",  md,  2u);
    }

    uint64_t v11 = 0LL;
  }

  return v11;
}

- (BOOL)isAppleEndpointForExistingSession:(id)a3
{
  id v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_alias(a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[IDSGroupSessionConnectionParameters initWithStringRepresentation:]( objc_alloc(&OBJC_CLASS___IDSGroupSessionConnectionParameters),  "initWithStringRepresentation:",  v4);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSessionConnectionParameters sessionID](v5, "sessionID"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSessionConnectionParameters multiplexer](v5, "multiplexer"));
    unsigned __int8 v8 = [v7 isEqualToString:@"groupsession"];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isAirDropSession:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_name(v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t application_service_alias = nw_endpoint_get_application_service_alias(v3);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  application_service_alias));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@":"]);
  if ((unint64_t)[v8 count] >= 4)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    else {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)resolveAirDropProEndpointWithParams:(id)a3 options:(id)a4 agentResolveResponse:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = IDSSessionUniqueIDKey;
  id v27 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastLocalConnectionID]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastRemoteConnectionID]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastParentConnection]);
  uint64_t v14 = IDSGlobalLinkReliableUnicastRemoteType;
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:IDSGlobalLinkReliableUnicastRemoteType]);

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
    unsigned int v17 = [v16 unsignedCharValue];

    unsigned int v18 = 2 * (v17 < 9);
    if (v17 == 9) {
      unsigned int v18 = 3;
    }
    if (v17) {
      uint64_t v15 = v18;
    }
    else {
      uint64_t v15 = 1LL;
    }
  }

  id v19 = v11;
  dispatch_data_t v20 = dispatch_data_create([v19 bytes], (size_t)objc_msgSend(v19, "length"), 0, 0);
  id v21 = v12;
  dispatch_data_t v22 = dispatch_data_create([v21 bytes], (size_t)objc_msgSend(v21, "length"), 0, 0);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog TransportLevelAgent](&OBJC_CLASS___IDSFoundationLog, "TransportLevelAgent"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v32 = v13;
    __int16 v33 = 2112;
    id v34 = v19;
    __int16 v35 = 2112;
    id v36 = v21;
    __int16 v37 = 1024;
    int v38 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "resolve_handler: encode_ids_connection with connection %@, lcid:%@, rcid:%@, remote nw_interface_type:%d",  buf,  0x26u);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1003F5158;
  v28[3] = &unk_100904C70;
  v28[4] = self;
  id v29 = v10;
  id v30 = v8;
  id v24 = v8;
  id v25 = v10;
  nw_candidate_endpoint_for_ids_connection(v13, v27, v20, v22, v15, v28);
}

- (id)resolveAppleEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_name(v4));
  int v38 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v6 = sub_1003F56D8(v38);
  memset(__str, 170, 6);
  snprintf(__str, 6uLL, "%d", WORD1(v6));
  id v7 = sub_1003F2CF4();
  id v8 = objc_claimAutoreleasedReturnValue(v7);
  nw_endpoint_t host = nw_endpoint_create_host((const char *)[v8 cStringUsingEncoding:134217984], __str);
  uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_application_service_alias(v4));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  nw_endpoint_get_description(host));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = -[IDSGroupSessionConnectionParameters initWithStringRepresentation:]( objc_alloc(&OBJC_CLASS___IDSGroupSessionConnectionParameters),  "initWithStringRepresentation:",  v11);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSessionConnectionParameters sessionID](v14, "sessionID"));

  if (v15)
  {
    __int16 v35 = host;
    id v36 = v8;
    uint64_t v16 = v13;
    __int16 v37 = &v34;
    portCollisionDetection = self->_portCollisionDetection;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSessionConnectionParameters sessionID](v14, "sessionID"));
    id v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( portCollisionDetection,  "objectForKeyedSubscript:",  v18));

    if (!v19)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      dispatch_data_t v20 = self->_portCollisionDetection;
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSessionConnectionParameters sessionID](v14, "sessionID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);
    }

    dispatch_data_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v22));

    if (v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
      id v25 = (EndpointResolutionParameters *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v19,  "objectForKeyedSubscript:",  v24));

      if ((-[EndpointResolutionParameters isEqual:](v25, "isEqual:", v38) & 1) == 0)
      {
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog TransportLevelAgent]( &OBJC_CLASS___IDSFoundationLog,  "TransportLevelAgent"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v41 = v6;
          *(_WORD *)&v41[4] = 2112;
          *(void *)&v41[6] = v25;
          *(_WORD *)&v41[14] = 2112;
          *(void *)&v41[16] = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Collision detected for port Signature %d, topics:(%@, %@)",  buf,  0x1Cu);
        }

        v31 = 0LL;
        __int128 v13 = v16;
        nw_endpoint_t host = v35;
        goto LABEL_14;
      }
    }

    id v26 = objc_alloc(&OBJC_CLASS___EndpointResolutionParameters);
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  (unsigned __int16)v6));
    id v25 = -[EndpointResolutionParameters initWithParams:secondaryPort:](v26, "initWithParams:secondaryPort:", v11, v27);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_endpointToResolvedParameters,  "setObject:forKeyedSubscript:",  v25,  v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v38, v28);

    __int128 v13 = v16;
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog TransportLevelAgent](&OBJC_CLASS___IDSFoundationLog, "TransportLevelAgent"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t description = nw_endpoint_get_description(v4);
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v41 = v16;
      *(_WORD *)&v41[8] = 2080;
      *(void *)&v41[10] = description;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Resolved endpoint: %@ from %s", buf, 0x16u);
    }

    nw_endpoint_t host = v35;
    v31 = v35;
LABEL_14:

    id v8 = v36;
    goto LABEL_15;
  }

  v31 = 0LL;
LABEL_15:

  return v31;
}

- (void)unregisterAgent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent agent](self, "agent"));
    nw_agent_change_state(v4, 0LL, 0LL, 0LL);

    -[IDSGroupAgent setAgent:](self, "setAgent:", 0LL);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySession](self, "policySession"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySession](self, "policySession"));
    [v6 removeAllPolicies];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySession](self, "policySession"));
    [v7 apply];

    -[IDSGroupAgent setPolicySession:](self, "setPolicySession:", 0LL);
  }

- (void)unregisterEntitledAgent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent entitledAgent](self, "entitledAgent"));
    nw_agent_change_state(v4, 0LL, 0LL, 0LL);

    -[IDSGroupAgent setEntitledAgent:](self, "setEntitledAgent:", 0LL);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySessionWithEntitlment](self, "policySessionWithEntitlment"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySessionWithEntitlment](self, "policySessionWithEntitlment"));
    [v6 removeAllPolicies];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupAgent policySessionWithEntitlment](self, "policySessionWithEntitlment"));
    [v7 apply];

    -[IDSGroupAgent setPolicySessionWithEntitlment:](self, "setPolicySessionWithEntitlment:", 0LL);
  }

- (void)_injectPortTopicMappingForSession:(id)a3 topic:(id)a4 portSignature:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_portCollisionDetection,  "objectForKeyedSubscript:",  v11));
  if (!v10)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_portCollisionDetection,  "setObject:forKeyedSubscript:",  v10,  v11);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, v9);
}

- (unsigned)getPortSignatureForTopic:(id)a3
{
  return sub_1003F56D8(a3);
}

- (OS_nw_channel)packetChannel
{
  return self->_packetChannel;
}

- (void)setPacketChannel:(id)a3
{
}

- (OS_nw_agent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (OS_nw_agent)entitledAgent
{
  return self->_entitledAgent;
}

- (void)setEntitledAgent:(id)a3
{
}

- (NEPolicySession)policySession
{
  return self->_policySession;
}

- (void)setPolicySession:(id)a3
{
}

- (NEPolicySession)policySessionWithEntitlment
{
  return self->_policySessionWithEntitlment;
}

- (void)setPolicySessionWithEntitlment:(id)a3
{
}

- (NSMutableDictionary)membersArrayDict
{
  return self->_membersArrayDict;
}

- (void)setMembersArrayDict:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (NSMutableDictionary)endpointToResolvedParameters
{
  return self->_endpointToResolvedParameters;
}

- (void)setEndpointToResolvedParameters:(id)a3
{
}

- (NSMutableDictionary)endpointToClientInfo
{
  return self->_endpointToClientInfo;
}

- (void)setEndpointToClientInfo:(id)a3
{
}

- (NSMutableDictionary)portCollisionDetection
{
  return self->_portCollisionDetection;
}

- (void)setPortCollisionDetection:(id)a3
{
}

- (IDSGroupSessionMultiplexer)multiplexer
{
  return self->_multiplexer;
}

- (void)setMultiplexer:(id)a3
{
}

- (NSMutableDictionary)managedSessions
{
  return self->_managedSessions;
}

- (void)setManagedSessions:(id)a3
{
}

- (NSMutableDictionary)sessionIDToEndpoints
{
  return self->_sessionIDToEndpoints;
}

- (void)setSessionIDToEndpoints:(id)a3
{
}

- (NSMutableDictionary)sessionIDToEvaluators
{
  return self->_sessionIDToEvaluators;
}

- (void)setSessionIDToEvaluators:(id)a3
{
}

- (BOOL)isSessionControlEnabled
{
  return self->_isSessionControlEnabled;
}

- (void)setIsSessionControlEnabled:(BOOL)a3
{
  self->_isSessionControlEnabled = a3;
}

- (void).cxx_destruct
{
}

@end