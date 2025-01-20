@interface APSConnectionServer
+ (id)environmentForNamedPort:(id)a3 userPreferences:(id)a4;
+ (id)serverEnvironmentNamesForUserPreferences:(id)a3;
+ (id)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7;
+ (void)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7 returnServers:(id)a8;
- (APSConnectionServer)initWithDelegate:(id)a3 user:(id)a4 userPreferences:(id)a5 enableDarkWake:(BOOL)a6 environmentName:(id)a7 connectionPortName:(id)a8 processName:(id)a9 connection:(id)a10;
- (APSConnectionServerDelegate)delegate;
- (APSUser)user;
- (APSUserPreferences)userPreferences;
- (BOOL)_containsInvalidTopic:(id)a3;
- (BOOL)enableCriticalReliability;
- (BOOL)enableDarkWake;
- (BOOL)enableStatusChangeNotifications;
- (BOOL)isClosed;
- (BOOL)isConnected;
- (BOOL)isInitialized;
- (BOOL)isPublicTokenAcknowledged;
- (BOOL)trackActivityPresence;
- (NSData)publicToken;
- (NSSet)enabledTopics;
- (NSSet)ignoredTopics;
- (NSSet)nonWakingTopics;
- (NSSet)opportunisticTopics;
- (NSSet)pushWakeTopics;
- (NSSet)ultraConstrainedTopics;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)environmentName;
- (NSString)name;
- (NSString)processName;
- (OS_xpc_object)connection;
- (double)publicTokenDeliveryDelay;
- (id)JSONDebugState;
- (id)aps_prettyDescription;
- (id)connectionPortName;
- (id)entitledTopicsFromSet:(id)a3 unentitledTopics:(id *)a4;
- (id)processNameWithLabels:(BOOL)a3;
- (int64_t)publicTokenDeliveryRetries;
- (os_unfair_lock_s)connectionLock;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5;
- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 shouldBoostPriority:(BOOL)a6 withReply:(id)a7;
- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 withReply:(id)a6;
- (void)_handleInvalidateTokenForInfo:(id)a3;
- (void)_handleRequestTokenForInfo:(id)a3;
- (void)_informTopicManagerOfChangedFilter:(int64_t)a3 newTopics:(id)a4 oldTopics:(id)a5;
- (void)_initiateConnectionIfNecessary;
- (void)_lookUpMachPort;
- (void)_migratePersistentTopicsIfNeeded;
- (void)_redeliverCurrentPublicToken;
- (void)_resumeQueue;
- (void)_savePersistentConnection;
- (void)_savePersistentConnectionTopics;
- (void)_sendClientToken:(id)a3 forInfo:(id)a4;
- (void)_suspendQueue;
- (void)_warnIfOverlappingTopics:(id)a3 againstTopics:(id)a4 string:(id)a5;
- (void)acknowledgeDidReceivePublicToken:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3 forTopics:(id)a4 type:(id)a5;
- (void)close;
- (void)connectionHandshakeDidComplete;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)handleAckIncomingMessageWithGuid:(id)a3 topic:(id)a4 tracingUUID:(id)a5;
- (void)handleCancelOutgoingMessageWithID:(unint64_t)a3;
- (void)handleChannelSubscriptionFailures:(id)a3 forTopic:(id)a4;
- (void)handleConnectionStatusChanged:(BOOL)a3;
- (void)handleCurrentTokenForInfo:(id)a3;
- (void)handleCurrentURLTokenForInfo:(id)a3;
- (void)handleFakeMessage:(id)a3;
- (void)handleIncomingMessageReceiptWithTopic:(id)a3 tracingUUID:(id)a4;
- (void)handleInvalidatePerAppTokenForInfo:(id)a3;
- (void)handleInvalidatePerAppTokenForTopic:(id)a3 identifier:(id)a4;
- (void)handleInvalidateURLTokenForTopic:(id)a3;
- (void)handleNotificationAcknowledged;
- (void)handlePublicTokenDeliveryReply:(id)a3;
- (void)handleReceivedMessage:(id)a3;
- (void)handleReceivedToken:(id)a3 forInfo:(id)a4;
- (void)handleReceivedTokenError:(id)a3 forInfo:(id)a4;
- (void)handleRequestPerAppTokenForTopic:(id)a3 identifier:(id)a4;
- (void)handleRequestTokenForInfo:(id)a3;
- (void)handleRequestURLTokenForInfo:(id)a3;
- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4;
- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4;
- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6;
- (void)handleSendOutgoingMessage:(id)a3;
- (void)handleSubscribeToChannels:(id)a3 forTopic:(id)a4;
- (void)handleUnsubscribeFromChannels:(id)a3 forTopic:(id)a4;
- (void)saveAndUpdateDelegate;
- (void)setConnection:(id)a3;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)setEnableStatusChangeNotifications:(BOOL)a3;
- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6;
- (void)setIsInitialized:(BOOL)a3;
- (void)setIsPublicTokenAcknowledged:(BOOL)a3;
- (void)setKeepAliveConfiguration:(unint64_t)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setProcessName:(id)a3;
- (void)setPublicToken:(id)a3 needsAck:(BOOL)a4;
- (void)setPublicTokenDeliveryRetries:(int64_t)a3;
- (void)setPushWakeTopics:(id)a3;
- (void)setTrackActivityPresence:(BOOL)a3;
- (void)setUltraConstrainedTopics:(id)a3;
- (void)setUser:(id)a3;
- (void)setUserPreferences:(id)a3;
@end

@implementation APSConnectionServer

+ (id)serverEnvironmentNamesForUserPreferences:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentTopics]);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v20 = v6;
      id v21 = v3;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          v12 = 0LL;
          do
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "objectForKey:",  *(void *)(*((void *)&v22 + 1) + 8 * (void)v12),  v20,  v21,  (void)v22));
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
            if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"environment"]);
              if (([v4 containsObject:v16] & 1) == 0)
              {
                uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
                if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
                  [v4 addObject:v16];
                }
              }
            }

            v12 = (char *)v12 + 1;
          }

          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }

        while (v10);
      }

      v6 = v20;
      id v3 = v21;
    }
  }

  return v4;
}

+ (id)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "serversWithEnvironmentNames: %@",  (uint8_t *)&v21,  0xCu);
  }

  if (v12)
  {
    [a1 serversWithEnvironmentName:v12 user:v13 userPreferences:v14 excludeServers:v15 delegate:v16 returnServers:v17];
    id v19 = v17;
  }

  else
  {
    id v19 = 0LL;
  }

  return v19;
}

+ (void)serversWithEnvironmentName:(id)a3 user:(id)a4 userPreferences:(id)a5 excludeServers:(id)a6 delegate:(id)a7 returnServers:(id)a8
{
  kern_return_t v29;
  uint64_t v30;
  APSConnectionServer *v31;
  os_log_s *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  APSConnectionServer *v39;
  os_log_s *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  os_log_s *v44;
  const char *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSSet *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSSet *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSSet *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  NSSet *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  NSSet *v73;
  void *v74;
  NSSet *v75;
  NSSet *v76;
  void *v77;
  void *v78;
  NSSet *v79;
  NSSet *v80;
  NSMutableArray *v81;
  uint64_t v82;
  unsigned int v83;
  id v84;
  id v85;
  int v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  APSConnectionServer *v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  id v96;
  _BYTE v97[128];
  id v12 = a3;
  v85 = a4;
  id v13 = a5;
  v71 = a7;
  v69 = a8;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistentTopics]);
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v14)
  {
    uint64_t v17 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15);
    if ((objc_opt_isKindOfClass(v14, v18) & 1) != 0)
    {
      v70 = v13;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v67 = v14;
      id v19 = v14;
      id v20 = [v19 countByEnumeratingWithState:&v87 objects:v97 count:16];
      if (v20)
      {
        id v21 = v20;
        v83 = SANDBOX_CHECK_NO_REPORT | 2;
        uint64_t v22 = *(void *)v88;
        v68 = v12;
        v81 = v16;
        v82 = *(void *)v88;
        do
        {
          __int128 v23 = 0LL;
          v84 = v21;
          do
          {
            if (*(void *)v88 != v22) {
              objc_enumerationMutation(v19);
            }
            __int128 v24 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)v23);
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v24]);
            uint64_t v27 = objc_opt_class(v17[292], v26);
            if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0)
            {
              v86 = 0;
              id v28 = v24;
              v29 = objc_msgSend( v85,  "bootstrapLookupForPortName:outConnectionPort:",  objc_msgSend(v28, "UTF8String"),  &v86);
              v30 = getpid();
              v31 = (APSConnectionServer *)v28;
              -[APSConnectionServer UTF8String](v31, "UTF8String");
              if (sandbox_check(v30, "mach-lookup", v83))
              {
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v92 = v31;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "APSConnection is created with an invalid mach port that sandbox hasn't allowlisted yet. Please switc h to use mach port with format <com.apple.aps.*>. {MachPort: %@}",  buf,  0xCu);
                }
              }

              if ((v86 - 1) >= 0xFFFFFFFE)
              {
                v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
                id v21 = v84;
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  v45 = bootstrap_strerror(v29);
                  *(_DWORD *)buf = 138412546;
                  v92 = v31;
                  v93 = 2080;
                  v94 = v45;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Unable to bootstrap_lookup connection port for '%@': %s",  buf,  0x16u);
                }

                -[NSMutableArray addObject:](v16, "addObject:", v31);
              }

              else
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"environment"]);
                v34 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"processName"]);
                v35 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"tokenAcked"]);
                v36 = [v35 BOOLValue];

                v38 = objc_opt_class(&OBJC_CLASS___NSString, v37);
                if ((objc_opt_isKindOfClass(v33, v38) & 1) != 0
                  && [v33 isEqualToString:v12])
                {
                  v39 = -[APSConnectionServer initWithDelegate:user:userPreferences:enableDarkWake:environmentName:connectionPortName:processName:connection:]( objc_alloc(&OBJC_CLASS___APSConnectionServer),  "initWithDelegate:user:userPreferences:enableDarkWake:environmentName:connectionPortName:proces sName:connection:",  v71,  v85,  v70,  0LL,  v33,  v31,  v34,  0LL);
                  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    v92 = v39;
                    v93 = 2112;
                    v94 = (const char *)v31;
                    v95 = 2112;
                    v96 = v85;
                    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Creating server: %@ with connectionPortName: %@ user: %@",  buf,  0x20u);
                  }

                  if (v39)
                  {
                    -[APSConnectionServer setIsPublicTokenAcknowledged:](v39, "setIsPublicTokenAcknowledged:", v36);
                    v41 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"enabled"]);
                    v42 = APSSafeArrayOfStrings();
                    v43 = objc_claimAutoreleasedReturnValue(v42);

                    if (v43) {
                      v80 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v43);
                    }
                    else {
                      v80 = 0LL;
                    }
                    v46 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"ignored"]);
                    v47 = APSSafeArrayOfStrings();
                    v48 = objc_claimAutoreleasedReturnValue(v47);

                    v77 = (void *)v48;
                    if (v48) {
                      v79 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v48);
                    }
                    else {
                      v79 = 0LL;
                    }
                    v78 = (void *)v43;
                    v49 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"opportunistic"]);
                    v50 = APSSafeArrayOfStrings();
                    v51 = (NSSet *)objc_claimAutoreleasedReturnValue(v50);

                    v76 = v51;
                    if (v51) {
                      v51 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v51);
                    }
                    v52 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"nonWaking"]);
                    v53 = APSSafeArrayOfStrings();
                    v54 = objc_claimAutoreleasedReturnValue(v53);

                    if (v54) {
                      v55 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v54);
                    }
                    else {
                      v55 = 0LL;
                    }
                    v73 = v55;
                    v74 = (void *)v54;
                    -[APSConnectionServer setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:]( v39,  "setEnabledTopics:ignoredTopics:opportunisticTopics:nonWakingTopics:",  v80,  v79,  v51,  v55);
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"enableStatusUpdates"]);
                    v57 = v56;
                    if (v56) {
                      -[APSConnectionServer setEnableStatusChangeNotifications:]( v39,  "setEnableStatusChangeNotifications:",  [v56 BOOLValue]);
                    }
                    v72 = v57;
                    v58 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"pushWake"]);
                    v59 = APSSafeArrayOfStrings();
                    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

                    v75 = v51;
                    if (v60) {
                      v61 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v60);
                    }
                    else {
                      v61 = 0LL;
                    }
                    -[APSConnectionServer setPushWakeTopics:](v39, "setPushWakeTopics:", v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"ultraConstrained"]);
                    v63 = APSSafeArrayOfStrings();
                    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

                    if (v64) {
                      v65 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v64);
                    }
                    else {
                      v65 = 0LL;
                    }
                    -[APSConnectionServer setUltraConstrainedTopics:](v39, "setUltraConstrainedTopics:", v65);
                    [v69 addObject:v39];

                    id v12 = v68;
                  }
                }

                id v16 = v81;
                uint64_t v17 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
                id v21 = v84;
              }

              uint64_t v22 = v82;
            }

            __int128 v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v21 = [v19 countByEnumeratingWithState:&v87 objects:v97 count:16];
        }

        while (v21);
      }

      id v13 = v70;
      id v14 = v67;
    }
  }

  if (-[NSMutableArray count](v16, "count"))
  {
    v66 = [v14 mutableCopy];
    [v66 removeObjectsForKeys:v16];
    [v13 setPersistentTopics:v66];
  }
}

- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5
{
}

- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 withReply:(id)a6
{
}

- (void)_enqueueXPCMessage:(id)a3 wakingClient:(BOOL)a4 highPriority:(BOOL)a5 shouldBoostPriority:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  if (v12)
  {
    if (self->_enqueuedBlockCount >= 0x65)
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t enqueuedBlockCount = self->_enqueuedBlockCount;
        *(_DWORD *)buf = 138412546;
        v35 = self;
        __int16 v36 = 2048;
        unint64_t v37 = enqueuedBlockCount;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: _queue has too many operations %lu! Droping block.",  buf,  0x16u);
      }

      goto LABEL_19;
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10004DE4C;
    v27[3] = &unk_10011F290;
    id v14 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue( +[CUTWeakReference weakRefWithObject:]( &OBJC_CLASS___CUTWeakReference,  "weakRefWithObject:",  self));
    id v28 = v14;
    BOOL v32 = a5;
    v29 = self;
    id v30 = v12;
    id v31 = v13;
    BOOL v33 = v8;
    id v16 = objc_retainBlock(v27);
    uint64_t v17 = v16;
    if (self->_queue)
    {
      if (v10)
      {
        -[APSConnectionServer _initiateConnectionIfNecessary](self, "_initiateConnectionIfNecessary");
LABEL_13:
        id v20 = self;
        objc_sync_enter(v20);
        ++self->_enqueuedBlockCount;
        objc_sync_exit(v20);

        queue = (dispatch_queue_s *)self->_queue;
        if (v8)
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472LL;
          v25[2] = sub_10004E1B8;
          v25[3] = &unk_10011F268;
          id v26 = v17;
          dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v25);
          dispatch_async(queue, v22);
        }

        else
        {
          dispatch_async(queue, v17);
        }

        p_numberNotificationsQueued = (unint64_t *)&v20->_numberNotificationsQueued;
        do
          unint64_t v24 = __ldaxr(p_numberNotificationsQueued);
        while (__stlxr(v24 + 1, p_numberNotificationsQueued));
        goto LABEL_18;
      }

      if (!self->_isQueueSuspended) {
        goto LABEL_13;
      }
      p_numberNotificationsDropped = &self->_numberNotificationsDropped;
      do
        unint64_t v19 = __ldaxr((unint64_t *)p_numberNotificationsDropped);
      while (__stlxr(v19 + 1, (unint64_t *)p_numberNotificationsDropped));
    }

    else
    {
      ((void (*)(void *))v16[2])(v16);
    }

- (APSConnectionServer)initWithDelegate:(id)a3 user:(id)a4 userPreferences:(id)a5 enableDarkWake:(BOOL)a6 environmentName:(id)a7 connectionPortName:(id)a8 processName:(id)a9 connection:(id)a10
{
  id obj = a3;
  id v37 = a4;
  id v36 = a5;
  id v40 = a7;
  id v15 = a8;
  id v39 = a9;
  id v16 = (_xpc_connection_s *)a10;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___APSConnectionServer;
  uint64_t v17 = -[APSConnectionServer init](&v41, "init");
  if (!v17) {
    goto LABEL_20;
  }
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v43 = v17;
    __int16 v44 = 2112;
    id v45 = v40;
    __int16 v46 = 2112;
    id v47 = v15;
    __int16 v48 = 2112;
    id v49 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: Initializing connection server with environmentName '%@' and connectionPortName '%@' and processName '%@'",  buf,  0x2Au);
  }

  objc_storeStrong((id *)&v17->_userPreferences, a5);
  v17->_connectionLock._os_unfair_lock_opaque = 0;
  if (v15)
  {
    unint64_t v19 = objc_alloc(&OBJC_CLASS___NSString);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v37 name]);
    id v21 = -[NSString initWithFormat:](v19, "initWithFormat:", @"port=%@-user=%@-env=%@", v15, v20, v40);
LABEL_8:
    name = v17->_name;
    v17->_name = v21;

    goto LABEL_9;
  }

  if (v39)
  {
    dispatch_block_t v22 = objc_alloc(&OBJC_CLASS___NSString);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v37 name]);
    id v21 = -[NSString initWithFormat:](v22, "initWithFormat:", @"proc=%@-user=%@-env=%@", v39, v20, v40);
    goto LABEL_8;
  }

- (void)dealloc
{
  mach_port_name_t connectionMachPort = self->_connectionMachPort;
  if (connectionMachPort)
  {
    mach_port_deallocate(mach_task_self_, connectionMachPort);
    self->_mach_port_name_t connectionMachPort = 0;
  }

  if (self->_isQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSConnectionServer;
  -[APSConnectionServer dealloc](&v4, "dealloc");
}

- (void)_lookUpMachPort
{
  kern_return_t v4;
  os_log_s *v5;
  NSString *connectionPortName;
  void *v7;
  const char *v8;
  unsigned int v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  id v9 = 0;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer user](self, "user"));
  objc_super v4 = objc_msgSend( v3,  "bootstrapLookupForPortName:outConnectionPort:",  -[NSString UTF8String](self->_connectionPortName, "UTF8String"),  &v9);

  if (v9 - 1 > 0xFFFFFFFD)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      connectionPortName = self->_connectionPortName;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer user](self, "user"));
      BOOL v8 = bootstrap_strerror(v4);
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = connectionPortName;
      id v12 = 2112;
      id v13 = v7;
      id v14 = 2080;
      id v15 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Unable to bootstrap_look_up connection port '%@' for user %@: %s",  buf,  0x20u);
    }
  }

  else
  {
    self->_mach_port_name_t connectionMachPort = v9;
  }

- (void)close
{
  self->_isClosed = 1;
  connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connection](self, "connection"));
  if (connection)
  {
    -[APSConnectionServer _suspendQueue](self, "_suspendQueue");
    xpc_connection_set_context(connection, 0LL);
    xpc_connection_cancel(connection);
    -[APSConnectionServer setConnection:](self, "setConnection:", 0LL);
  }
}

- (OS_xpc_object)connection
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  objc_super v4 = self->_connection;
  os_unfair_lock_unlock(p_connectionLock);
  return v4;
}

- (NSString)processName
{
  return (NSString *)-[APSConnectionServer processNameWithLabels:](self, "processNameWithLabels:", 0LL);
}

- (id)processNameWithLabels:(BOOL)a3
{
  connectionPortName = self->_connectionPortName;
  if (connectionPortName)
  {
    objc_super v4 = &stru_100123240;
    if (a3) {
      objc_super v4 = @"portname=";
    }
    uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v4,  connectionPortName,  v8);
  }

  else
  {
    v6 = &stru_100123240;
    if (a3) {
      v6 = @"process=";
    }
    uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@[%i]",  v6,  self->_processName,  self->_clientPID);
  }

  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (NSString)debugDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer processNameWithLabels:](self, "processNameWithLabels:", 1LL));
  uint64_t v5 = objc_opt_class(self, v4);
  if (self->_enableCriticalReliability) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  uint64_t v7 = APSPrettyPrintCollection(self->_enabledTopics, 0LL, 0LL, 0LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = APSPrettyPrintCollection(self->_ignoredTopics, 0LL, 0LL, 0LL);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = APSPrettyPrintCollection(self->_opportunisticTopics, 0LL, 0LL, 0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = APSPrettyPrintCollection(self->_nonWakingTopics, 0LL, 0LL, 0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p: %@, criticalReliability=%s, enabledTopics=%@, ignoredTopics=%@, opportunisticTopics=%@, nonwakingTopics=%@>",  v5,  self,  v3,  v6,  v8,  v10,  v12,  v14));

  return (NSString *)v15;
}

- (id)aps_prettyDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer processNameWithLabels:](self, "processNameWithLabels:", 1LL));
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats incomingCounts](self->_payloadMessageStats, "incomingCounts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 total]);
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats incomingCounts](self->_payloadMessageStats, "incomingCounts"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats incomingCountsByTopic](self->_payloadMessageStats, "incomingCountsByTopic"));
    id v10 = sub_10004EBCC((uint64_t)v9, v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, @"in");
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats outgoingCounts](self->_payloadMessageStats, "outgoingCounts"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 total]);
  id v14 = [v13 count];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats outgoingCounts](self->_payloadMessageStats, "outgoingCounts"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats outgoingCountsByTopic](self->_payloadMessageStats, "outgoingCountsByTopic"));
    id v17 = sub_10004EBCC((uint64_t)v16, v15, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, @"out");
  }

  if (self->_enableCriticalReliability) {
    unint64_t v19 = "yes";
  }
  else {
    unint64_t v19 = "no";
  }
  uint64_t v20 = APSPrettyPrintCollection(self->_enabledTopics, 0LL, 0LL, 2LL);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = APSPrettyPrintCollection(self->_ignoredTopics, 0LL, 0LL, 2LL);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = APSPrettyPrintCollection(self->_opportunisticTopics, 0LL, 0LL, 2LL);
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  uint64_t v26 = APSPrettyPrintCollection(self->_nonWakingTopics, 0LL, 0LL, 2LL);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = APSPrettyPrintCollection(v4, 1LL, 2LL, 2LL);
  double v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@, criticalReliability=%s, enabledTopics=%@, ignoredTopics=%@, opportunisticTopics=%@, nonwakingTopics=%@, statistic=%@>",  v3,  v19,  v21,  v23,  v25,  v27,  v29));

  return v30;
}

- (void)_migratePersistentTopicsIfNeeded
{
  id v22 = (id)objc_claimAutoreleasedReturnValue(-[APSConnectionServer user](self, "user"));
  if ([v22 isDefaultUser])
  {

    return;
  }

  connectionPortName = self->_connectionPortName;

  if (connectionPortName)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer userPreferences](self, "userPreferences"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 defaultUserPersistentTopics]);

    if (v5 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
    {
      id v8 = [v5 mutableCopy];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:self->_connectionPortName]);
        id v11 = [v10 copy];

LABEL_10:
        [v9 removeObjectForKey:self->_connectionPortName];
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer userPreferences](self, "userPreferences"));
        [v12 setDefaultUserPersistentTopics:v9];

        if (v11)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer userPreferences](self, "userPreferences"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistentTopics]);

          if (!v14
            || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary, v15), (objc_opt_isKindOfClass(v14, v16) & 1) == 0)
            || (id v17 = (NSMutableDictionary *)[v14 mutableCopy]) == 0)
          {
            id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          }

          -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v11, self->_connectionPortName);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer userPreferences](self, "userPreferences"));
          [v18 setPersistentTopics:v17];

          unint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = self->_connectionPortName;
            id v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer user](self, "user"));
            *(_DWORD *)buf = 138412802;
            uint64_t v24 = self;
            __int16 v25 = 2112;
            uint64_t v26 = v20;
            __int16 v27 = 2112;
            uint64_t v28 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@ Migrate persistent topics for %@ from Default to %@",  buf,  0x20u);
          }
        }

        return;
      }
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    id v11 = 0LL;
    goto LABEL_10;
  }

- (void)setUser:(id)a3
{
  if (self->_user != a3) {
    -[APSConnectionServer _migratePersistentTopicsIfNeeded](self, "_migratePersistentTopicsIfNeeded");
  }
}

- (void)setConnection:(id)a3
{
  uint64_t v5 = (_xpc_connection_s *)a3;
  uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connection](self, "connection"));
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    connectionPortName = self->_connectionPortName;
    int v11 = 138413058;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    uint64_t v18 = connectionPortName;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Replacing xpc conn %@ with %@ for %@ (%@)",  (uint8_t *)&v11,  0x2Au);
  }

  if (v6 != v5)
  {
    if (v6)
    {
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1000BDD38();
      }

      xpc_connection_cancel(v6);
    }

    objc_storeStrong((id *)&self->_connection, a3);
    if (v5 && v6)
    {
      xpc_connection_get_audit_token(v5, &v11);
      if (-[NSSet count](self->_pushWakeTopics, "count") && !sub_1000467EC(&v11, APSPushWakeEntitlement)) {
        -[APSConnectionServer setPushWakeTopics:](self, "setPushWakeTopics:", 0LL);
      }
      if (-[NSSet count](self->_ultraConstrainedTopics, "count")
        && !sub_1000467EC(&v11, APSUltraConstrainedEntitlement))
      {
        -[APSConnectionServer setUltraConstrainedTopics:](self, "setUltraConstrainedTopics:", 0LL);
      }
    }

    else
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_1000BDCD4();
      }
    }

    -[APSConnectionServer _suspendQueue](self, "_suspendQueue");
  }
}

- (void)connectionHandshakeDidComplete
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connectionPortName](self, "connectionPortName"));

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connectionWasOpened:self];
  }

- (void)_resumeQueue
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    if (self->_isQueueSuspended)
    {
      dispatch_resume(queue);
      self->_isQueueSuspended = 0;
    }
  }

- (void)_suspendQueue
{
  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    if (!self->_isQueueSuspended)
    {
      dispatch_suspend(queue);
      self->_isQueueSuspended = 1;
    }
  }

- (void)connectionInvalidated
{
  if (!self->_connectionPortName)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained connectionWasClosed:self];
  }

- (id)connectionPortName
{
  return self->_connectionPortName;
}

- (void)handleConnectionStatusChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10004F560;
  v3[3] = &unk_10011F2B0;
  BOOL v4 = a3;
  -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v3,  0LL,  0LL);
}

- (void)_initiateConnectionIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connection](self, "connection"));

  if (!v3)
  {
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connectionPortName = self->_connectionPortName;
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = (APSConnectionServer *)connectionPortName;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Pinging client via mach since we are not currently connected for port %@",  buf,  0xCu);
    }

    if (-[NSString length](self->_connectionPortName, "length"))
    {
      if (self->_connectionMachPort + 1 > 1)
      {
        BOOL v7 = 0;
      }

      else
      {
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Should've had a valid mach port but didn't, trying to create port.",  buf,  2u);
        }

        -[APSConnectionServer _lookUpMachPort](self, "_lookUpMachPort");
        BOOL v7 = 1;
      }

      self->_freshMachPort = v7;
    }

    unsigned int connectionMachPort = self->_connectionMachPort;
    if (connectionMachPort - 1 > 0xFFFFFFFD)
    {
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_connectionPortName;
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ Invalid mach port - Cleaning up this named port's topics. %@",  buf,  0x16u);
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10004FB00;
      v12[3] = &unk_10011E4F0;
      v12[4] = self;
      dispatch_async(&_dispatch_main_q, v12);
    }

    else
    {
      uint64_t v9 = dispatch_queue_create("pingQueue", 0LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10004F820;
      block[3] = &unk_10011F2D8;
      unsigned int v14 = connectionMachPort;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }

- (void)handleReceivedMessage:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004FD00;
  v7[3] = &unk_10011F300;
  id v4 = a3;
  id v8 = v4;
  -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v7,  1,  [v4 priority] == (id)10);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog PUSHTRACE](&OBJC_CLASS___APSLog, "PUSHTRACE"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 tracingUUID]);
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Sending push to client. UUID: %@",  buf,  0x16u);
  }

  -[APSPayloadMessageStats payloadMessageReceived:](self->_payloadMessageStats, "payloadMessageReceived:", v4);
}

- (void)handleResult:(id)a3 forSendingOutgoingMessage:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  id v7 = [v6 messageID];
  id v8 = [v6 sendRTT];
  id v9 = [v6 ackTimestamp];

  -[APSConnectionServer handleResult:forSendingOutgoingMessageWithID:sendRTT:ackTimestamp:]( self,  "handleResult:forSendingOutgoingMessageWithID:sendRTT:ackTimestamp:",  v10,  v7,  v8,  v9);
}

- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4
{
}

- (void)handleResult:(id)a3 forSendingOutgoingMessageWithID:(unint64_t)a4 sendRTT:(unint64_t)a5 ackTimestamp:(unint64_t)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004FF00;
  v11[3] = &unk_10011F328;
  id v12 = a3;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  unint64_t v15 = a6;
  id v10 = v12;
  -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v11,  0LL,  1LL);
}

- (void)handleSendOutgoingMessage:(id)a3
{
  id v7 = a3;
  if (_os_feature_enabled_impl("IDS", "GFTPerfSignpostCollection"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
    unsigned int v5 = [v4 isEqualToString:@"com.apple.private.alloy.facetime.multi"];

    if (v5) {
      kdebug_trace(722010460, [v7 identifier], 0, 0, 0);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didReceiveOutgoingMessageToSend:v7];

  -[APSPayloadMessageStats payloadMessageSent:](self->_payloadMessageStats, "payloadMessageSent:", v7);
}

- (void)handleCancelOutgoingMessageWithID:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didReceiveCancellationForOutgoingMessageWithID:a3];
}

- (void)handleFakeMessage:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveFakeMessageToSend:v5];
}

- (void)handleRequestPerAppTokenForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[APSAppTokenInfo alloc] initUnextendedAppTokenWithTopic:v7 identifier:v6];

  -[APSConnectionServer _handleRequestTokenForInfo:](self, "_handleRequestTokenForInfo:", v8);
}

- (void)handleRequestTokenForInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Received extended app token request for info %@",  (uint8_t *)&v6,  0x16u);
  }

  -[APSConnectionServer _handleRequestTokenForInfo:](self, "_handleRequestTokenForInfo:", v4);
}

- (void)handleRequestURLTokenForInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Received web token request for info %@",  (uint8_t *)&v6,  0x16u);
  }

  -[APSConnectionServer _handleRequestTokenForInfo:](self, "_handleRequestTokenForInfo:", v4);
}

- (void)_handleRequestTokenForInfo:(id)a3
{
  id v4 = a3;
  -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didRequestTokenForInfo:v4];
}

- (void)handleReceivedToken:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 debugDescription]);
    int v10 = 138412802;
    __int16 v11 = self;
    __int16 v12 = 2112;
    unint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Received token %@ for info %@",  (uint8_t *)&v10,  0x20u);
  }

  -[APSConnectionServer _sendClientToken:forInfo:](self, "_sendClientToken:forInfo:", v6, v7);
}

- (void)handleReceivedTokenError:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] == (id)2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005056C;
    v8[3] = &unk_10011F350;
    id v9 = v7;
    id v10 = v6;
    -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v8,  1LL,  0LL);
  }
}

- (void)handleCurrentTokenForInfo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didRequestCurrentTokenForInfo:v5];
}

- (void)handleCurrentURLTokenForInfo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didRequestCurrentTokenForInfo:v5];
}

- (void)_sendClientToken:(id)a3 forInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 type];
  if (v8 == (id)2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained connection:self createURLTokenForToken:v6]);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100050A0C;
    v12[3] = &unk_10011F350;
    id v13 = v7;
    id v14 = v11;
    id v9 = v11;
    -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v12,  1LL,  0LL);

    goto LABEL_7;
  }

  if (v8 == (id)1)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10005095C;
    v15[3] = &unk_10011F350;
    id v16 = v7;
    id v17 = v6;
    -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v15,  1LL,  0LL);

    id v9 = v16;
    goto LABEL_7;
  }

  if (!v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005089C;
    v18[3] = &unk_10011F350;
    id v19 = v7;
    id v20 = v6;
    -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v18,  1LL,  0LL);

    id v9 = v19;
LABEL_7:
  }
}

- (void)handleInvalidatePerAppTokenForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[APSAppTokenInfo alloc] initUnextendedAppTokenWithTopic:v7 identifier:v6];

  -[APSConnectionServer _handleInvalidateTokenForInfo:](self, "_handleInvalidateTokenForInfo:", v8);
}

- (void)handleInvalidateURLTokenForTopic:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Received web token invalidate request for topic %@",  (uint8_t *)&v7,  0x16u);
  }

  id v6 = [[APSURLTokenInfo alloc] initWithTopic:v4];
  -[APSConnectionServer _handleInvalidateTokenForInfo:](self, "_handleInvalidateTokenForInfo:", v6);
}

- (void)handleInvalidatePerAppTokenForInfo:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: Received extended app token invalidate request for info %@",  (uint8_t *)&v6,  0x16u);
  }

  -[APSConnectionServer _handleInvalidateTokenForInfo:](self, "_handleInvalidateTokenForInfo:", v4);
}

- (void)_handleInvalidateTokenForInfo:(id)a3
{
  id v4 = a3;
  -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connection:self didInvalidateTokenForInfo:v4];
}

- (void)handleSubscribeToChannels:(id)a3 forTopic:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveSubscribeToChannels:v8 forTopic:v7];
}

- (void)handleUnsubscribeFromChannels:(id)a3 forTopic:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveUnsubscribeToChannels:v8 forTopic:v7];
}

- (void)handleIncomingMessageReceiptWithTopic:(id)a3 tracingUUID:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self didReceiveIncomingMessageReceiptWithTopic:v8 tracingUUID:v7];
}

- (void)handleAckIncomingMessageWithGuid:(id)a3 topic:(id)a4 tracingUUID:(id)a5
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained connection:self handleAckIncomingMessageWithGuid:v11 topic:v10 tracingUUID:v9];
}

- (void)setPublicToken:(id)a3 needsAck:(BOOL)a4
{
  int v6 = (NSData *)a3;
  id v7 = v6;
  publicToken = self->_publicToken;
  if (publicToken == v6 || publicToken && -[NSData isEqualToData:](v6, "isEqualToData:"))
  {
    char v9 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }

  else
  {
    id v10 = (NSData *)-[NSData copy](v7, "copy");
    id v11 = self->_publicToken;
    self->_publicToken = v10;

    char v9 = 1;
    if (a4)
    {
LABEL_12:
      BOOL v13 = 1LL;
LABEL_13:
      id v15 = -[NSData copy](self->_publicToken, "copy");
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CUTWeakReference weakRefWithObject:](&OBJC_CLASS___CUTWeakReference, "weakRefWithObject:", self));
      -[APSConnectionServer setIsPublicTokenAcknowledged:](self, "setIsPublicTokenAcknowledged:", 0LL);
      id v20 = v16;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000510B8;
      v21[3] = &unk_10011F300;
      id v22 = v15;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100051128;
      v19[3] = &unk_10011F300;
      id v17 = v16;
      id v18 = v15;
      -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:withReply:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:withReply:",  v21,  v13,  1LL,  v19);

      goto LABEL_14;
    }
  }

  if (!self->_isPublicTokenAcknowledged) {
    goto LABEL_12;
  }
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connection](self, "connection"));

  BOOL v13 = !self->_isPublicTokenAcknowledged;
  char v14 = v9 ^ 1;
  if (!v12) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
}

- (double)publicTokenDeliveryDelay
{
  return 60.0;
}

- (void)handlePublicTokenDeliveryReply:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v14 = APSGetXPCDataFromDictionary(v5, "publicToken");
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[APSConnectionServer acknowledgeDidReceivePublicToken:](self, "acknowledgeDidReceivePublicToken:", v15);

      -[APSConnectionServer isPublicTokenAcknowledged](self, "isPublicTokenAcknowledged");
      goto LABEL_11;
    }

    xpc_type_t v7 = type;
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connectionPortName](self, "connectionPortName"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer publicToken](self, "publicToken"));
      int v16 = 138413058;
      xpc_type_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      int64_t v21 = (int64_t)v10;
      __int16 v22 = 2048;
      int64_t v23 = -[APSConnectionServer publicTokenDeliveryRetries](self, "publicTokenDeliveryRetries");
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received %@ when updating public token. {connectionPort:%@, token: %@, retries: %ld}",  (uint8_t *)&v16,  0x2Au);
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (const _xpc_type_s *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer connectionPortName](self, "connectionPortName"));
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer publicToken](self, "publicToken"));
      int v16 = 138412802;
      xpc_type_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2048;
      int64_t v21 = -[APSConnectionServer publicTokenDeliveryRetries](self, "publicTokenDeliveryRetries");
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No reply received when updating public token. {connectionPort:%@, token: %@, retries: %ld}",  (uint8_t *)&v16,  0x20u);
    }
  }

  uint64_t v13 = -[APSConnectionServer publicTokenDeliveryRetries](self, "publicTokenDeliveryRetries");
  if (!-[APSConnectionServer isPublicTokenAcknowledged](self, "isPublicTokenAcknowledged") && v13 <= 2)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_redeliverCurrentPublicToken",  0LL);
    -[APSConnectionServer publicTokenDeliveryDelay](self, "publicTokenDeliveryDelay");
    -[APSConnectionServer performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_redeliverCurrentPublicToken",  0LL);
  }

- (void)_redeliverCurrentPublicToken
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@ scheduled public token delivery",  (uint8_t *)&v4,  0xCu);
  }

  if (!-[APSConnectionServer isClosed](self, "isClosed")
    && -[APSConnectionServer publicTokenDeliveryRetries](self, "publicTokenDeliveryRetries") <= 2
    && !-[APSConnectionServer isPublicTokenAcknowledged](self, "isPublicTokenAcknowledged"))
  {
    ++self->_publicTokenDeliveryRetries;
    -[APSConnectionServer setPublicToken:needsAck:](self, "setPublicToken:needsAck:", self->_publicToken, 1LL);
  }

- (void)setIsPublicTokenAcknowledged:(BOOL)a3
{
  connectionPortName = self->_connectionPortName;
  if (connectionPortName && (BOOL v5 = a3, -[NSString length](connectionPortName, "length")))
  {
    if (self->_isPublicTokenAcknowledged != v5)
    {
      self->_isPublicTokenAcknowledged = v5;
      if (v5) {
        self->_publicTokenDeliveryRetries = 0LL;
      }
      -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
    }
  }

  else
  {
    self->_isPublicTokenAcknowledged = 1;
  }

- (BOOL)isPublicTokenAcknowledged
{
  connectionPortName = self->_connectionPortName;
  return !connectionPortName || !-[NSString length](connectionPortName, "length") || self->_isPublicTokenAcknowledged;
}

- (void)acknowledgeDidReceivePublicToken:(id)a3
{
  id v4 = a3;
  connectionPortName = self->_connectionPortName;
  if (!connectionPortName || (NSUInteger v6 = -[NSString length](connectionPortName, "length"), !v4) || !v6)
  {
    char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      processName = self->_processName;
      int v13 = 138412290;
      uint64_t v14 = (APSConnectionServer *)processName;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Ignoring token acknowledgement from %@",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_12;
  }

  unsigned int v7 = -[NSData isEqualToData:](self->_publicToken, "isEqualToData:", v4);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  char v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000BDEB8((uint64_t *)&self->_connectionPortName, v9, v12);
    }
LABEL_12:

    goto LABEL_13;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = self->_connectionPortName;
    int v13 = 138412546;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    int v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Token acknowledged by %@",  (uint8_t *)&v13,  0x16u);
  }

  -[APSConnectionServer setIsPublicTokenAcknowledged:](self, "setIsPublicTokenAcknowledged:", 1LL);
LABEL_13:
}

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_messageSize != a3)
  {
    self->_messageSize = a3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[APSConnectionServer connectionPortName](self, "connectionPortName"));
    if (v5)
    {
      NSUInteger v6 = (void *)v5;
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer enabledTopics](self, "enabledTopics"));
      if (![v7 count])
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer opportunisticTopics](self, "opportunisticTopics"));
        if (![v8 count])
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer ignoredTopics](self, "ignoredTopics"));
          id v11 = [v10 count];

          if (!v11) {
            return;
          }
          goto LABEL_7;
        }
      }
    }

- (void)setLargeMessageSize:(unint64_t)a3
{
  if (self->_largeMessageSize != a3)
  {
    self->_unint64_t largeMessageSize = a3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[APSConnectionServer connectionPortName](self, "connectionPortName"));
    if (v5)
    {
      NSUInteger v6 = (void *)v5;
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer enabledTopics](self, "enabledTopics"));
      if (![v7 count])
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer opportunisticTopics](self, "opportunisticTopics"));
        if (![v8 count])
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer ignoredTopics](self, "ignoredTopics"));
          id v11 = [v10 count];

          if (!v11) {
            return;
          }
          goto LABEL_7;
        }
      }
    }

- (void)handleChannelSubscriptionFailures:(id)a3 forTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Sending failures %@ to client", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100051B6C;
  v11[3] = &unk_10011F350;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  -[APSConnectionServer _enqueueXPCMessage:wakingClient:highPriority:]( self,  "_enqueueXPCMessage:wakingClient:highPriority:",  v11,  1LL,  0LL);
}

- (void)_warnIfOverlappingTopics:(id)a3 againstTopics:(id)a4 string:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v19 = a5;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v21;
    *(void *)&__int128 v11 = 138412802LL;
    __int128 v18 = v11;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "containsObject:", v15, v18))
        {
          __int16 v16 = self->_processName;
          if (!v16) {
            __int16 v16 = self->_connectionPortName;
          }
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            __int16 v25 = v16;
            __int16 v26 = 2112;
            uint64_t v27 = v15;
            __int16 v28 = 2112;
            id v29 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Received request from %@ to put topic %@ into both %@ topic sets",  buf,  0x20u);
          }
        }
      }

      id v12 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }

    while (v12);
  }
}

- (void)_informTopicManagerOfChangedFilter:(int64_t)a3 newTopics:(id)a4 oldTopics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
    if (v7) {
      goto LABEL_3;
    }
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 0LL));
LABEL_3:
  id v9 = [v8 mutableCopy];
  [v9 minusSet:v7];
  id v10 = [v7 mutableCopy];
  [v10 minusSet:v8];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topicManager]);

  [v12 removeTopics:v9 connectionServer:self filter:a3];
  if ([v10 count])
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v10 count]));
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = v10;
    id v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      id v14 = v13;
      __int128 v20 = v12;
      id v21 = v10;
      id v22 = v9;
      id v23 = v8;
      id v24 = v7;
      uint64_t v15 = 0LL;
      uint64_t v16 = *(void *)v29;
      do
      {
        id v17 = 0LL;
        __int128 v18 = v15;
        do
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v17);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[APSTopicAttributes topicAttributesWithFilter:darkWakeEnabled:pushWakeEnabled:criticalWakeEnabled:ultraConstrainedEnabled:]( &OBJC_CLASS___APSTopicAttributes,  "topicAttributesWithFilter:darkWakeEnabled:pushWakeEnabled:criticalWakeEnabled:ultraConstrainedEnabled:",  a3,  -[NSSet containsObject:]( self->_darkWakeTopics,  "containsObject:",  v19,  v20,  v21,  v22,  v23,  v24),  -[NSSet containsObject:](self->_pushWakeTopics, "containsObject:", v19),  -[NSSet containsObject:](self->_criticalWakeTopics, "containsObject:", v19),  -[NSSet containsObject:](self->_ultraConstrainedTopics, "containsObject:", v19)));

          [v26 setObject:v15 forKey:v19];
          id v17 = (char *)v17 + 1;
          __int128 v18 = v15;
        }

        while (v14 != v17);
        id v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v14);

      id v8 = v23;
      id v7 = v24;
      id v10 = v21;
      id v9 = v22;
      id v12 = v20;
    }

    [v12 addTopicsAndAttributes:v26 connectionServer:self];
  }
}

- (BOOL)_containsInvalidTopic:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)i), "length", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)setEnabledTopics:(id)a3 ignoredTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[APSConnectionServer _warnIfOverlappingTopics:againstTopics:string:]( self,  "_warnIfOverlappingTopics:againstTopics:string:",  v10,  v12,  @"enabled and opportunistic");
  -[APSConnectionServer _warnIfOverlappingTopics:againstTopics:string:]( self,  "_warnIfOverlappingTopics:againstTopics:string:",  v10,  v11,  @"enabled and ignored");
  -[APSConnectionServer _warnIfOverlappingTopics:againstTopics:string:]( self,  "_warnIfOverlappingTopics:againstTopics:string:",  v11,  v12,  @"ignored and opportunistic");
  -[APSConnectionServer _warnIfOverlappingTopics:againstTopics:string:]( self,  "_warnIfOverlappingTopics:againstTopics:string:",  v10,  v13,  @"enabled and nonWaking");
  -[APSConnectionServer _warnIfOverlappingTopics:againstTopics:string:]( self,  "_warnIfOverlappingTopics:againstTopics:string:",  v11,  v13,  @"ignored and nonWaking");
  -[APSConnectionServer _warnIfOverlappingTopics:againstTopics:string:]( self,  "_warnIfOverlappingTopics:againstTopics:string:",  v12,  v13,  @"opportunistic and nonWaking");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 topicManager]);
  [v15 beginTransaction];

  if (v10)
  {
    if ((sub_1000773F0(v10, self->_enabledTopics) & 1) != 0)
    {
      int v16 = 0;
      id v17 = v10;
      if (!v12) {
        goto LABEL_28;
      }
    }

    else
    {
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = APSPrettyPrintCollection(v10, 0LL, 0LL, 0LL);
        id v21 = (NSSet *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138412546;
        v60 = self;
        __int16 v61 = 2112;
        v62 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: connection set enabled topics %@",  buf,  0x16u);
      }

      id v58 = 0LL;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[APSConnectionServer entitledTopicsFromSet:unentitledTopics:]( self,  "entitledTopicsFromSet:unentitledTopics:",  v10,  &v58));
      id v22 = v58;

      if (![v17 count] && objc_msgSend(v22, "count")
        || -[APSConnectionServer _containsInvalidTopic:](self, "_containsInvalidTopic:", v17))
      {
        enabledTopics = (NSSet *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
        if (os_log_type_enabled((os_log_t)enabledTopics, OS_LOG_TYPE_FAULT)) {
          sub_1000BE1A0((uint64_t)v17);
        }
        int v16 = 0;
      }

      else
      {
        int v16 = 1;
        -[APSConnectionServer _informTopicManagerOfChangedFilter:newTopics:oldTopics:]( self,  "_informTopicManagerOfChangedFilter:newTopics:oldTopics:",  1LL,  v17,  self->_enabledTopics);
        id v23 = v17;
        enabledTopics = self->_enabledTopics;
        self->_enabledTopics = v23;
      }

      if ([v22 count])
      {
        __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          sub_1000BE134((uint64_t)self);
        }
      }

      if (!v12)
      {
LABEL_28:
        __int128 v18 = 0LL;
        if (v11) {
          goto LABEL_29;
        }
        goto LABEL_47;
      }
    }
  }

  else
  {
    int v16 = 0;
    id v17 = 0LL;
    if (!v12) {
      goto LABEL_28;
    }
  }

  if ((sub_1000773F0(v12, self->_opportunisticTopics) & 1) != 0)
  {
    __int128 v18 = v12;
    if (v11) {
      goto LABEL_29;
    }
  }

  else
  {
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = APSPrettyPrintCollection(v12, 0LL, 0LL, 0LL);
      uint64_t v27 = (NSSet *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138412546;
      v60 = self;
      __int16 v61 = 2112;
      v62 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@: connection set opportuntistic topics %@",  buf,  0x16u);
    }

    id v57 = 0LL;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[APSConnectionServer entitledTopicsFromSet:unentitledTopics:]( self,  "entitledTopicsFromSet:unentitledTopics:",  v12,  &v57));
    id v28 = v57;

    if (![v18 count] && objc_msgSend(v28, "count")
      || -[APSConnectionServer _containsInvalidTopic:](self, "_containsInvalidTopic:", v18))
    {
      opportunisticTopics = (NSSet *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled((os_log_t)opportunisticTopics, OS_LOG_TYPE_FAULT)) {
        sub_1000BE0CC((uint64_t)v18);
      }
    }

    else
    {
      -[APSConnectionServer _informTopicManagerOfChangedFilter:newTopics:oldTopics:]( self,  "_informTopicManagerOfChangedFilter:newTopics:oldTopics:",  2LL,  v18,  self->_opportunisticTopics);
      __int128 v29 = v18;
      opportunisticTopics = self->_opportunisticTopics;
      self->_opportunisticTopics = v29;
      int v16 = 1;
    }

    if ([v28 count])
    {
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        sub_1000BE060((uint64_t)self);
      }
    }

    if (v11)
    {
LABEL_29:
      if ((sub_1000773F0(v11, self->_ignoredTopics) & 1) != 0)
      {
        int v32 = 0;
        BOOL v33 = v11;
        if (!v13) {
          goto LABEL_64;
        }
      }

      else
      {
        v34 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = APSPrettyPrintCollection(v11, 0LL, 0LL, 0LL);
          id v37 = (NSSet *)objc_claimAutoreleasedReturnValue(v36);
          *(_DWORD *)buf = 138412546;
          v60 = self;
          __int16 v61 = 2112;
          v62 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%@: connection set ignored topics %@",  buf,  0x16u);
        }

        id v56 = 0LL;
        BOOL v33 = (void *)objc_claimAutoreleasedReturnValue( -[APSConnectionServer entitledTopicsFromSet:unentitledTopics:]( self,  "entitledTopicsFromSet:unentitledTopics:",  v11,  &v56));
        id v38 = v56;

        if (![v33 count] && objc_msgSend(v38, "count")
          || -[APSConnectionServer _containsInvalidTopic:](self, "_containsInvalidTopic:", v33))
        {
          objc_super v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            sub_1000BDFF8((uint64_t)v33);
          }
          int v32 = 0;
        }

        else
        {
          -[APSConnectionServer _informTopicManagerOfChangedFilter:newTopics:oldTopics:]( self,  "_informTopicManagerOfChangedFilter:newTopics:oldTopics:",  3LL,  v33,  self->_ignoredTopics);
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            ignoredTopics = self->_ignoredTopics;
            *(_DWORD *)buf = 138412802;
            v60 = self;
            __int16 v61 = 2112;
            v62 = ignoredTopics;
            __int16 v63 = 2112;
            v64 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "%@: connection set ignored topics from %@ to %@",  buf,  0x20u);
          }

          objc_super v41 = (os_log_s *)-[NSSet mutableCopy](self->_ignoredTopics, "mutableCopy");
          -[os_log_s minusSet:](v41, "minusSet:", v33);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained connection:self subscribeToPreviouslyIgnoredTopics:v41];

          objc_storeStrong((id *)&self->_ignoredTopics, v33);
          int v32 = 1;
          v34 = &_s10Foundation4DataV36_unconditionallyBridgeFromObjectiveCyACSo6NSDataCSgFZ_ptr;
        }

        if ([v38 count])
        {
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34[275] connectionServer]);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
            sub_1000BDF8C((uint64_t)self);
          }
        }

        if (!v13) {
          goto LABEL_64;
        }
      }

      goto LABEL_48;
    }
  }

- (void)saveAndUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionTopicsChanged:self];

  -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
}

- (BOOL)isConnected
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained connectionDelegateIsConnectedToService:v2];

  return (char)v2;
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  self->_enableCriticalReliability = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionChangedCriticalReliability:self];
}

- (void)setTrackActivityPresence:(BOOL)a3
{
  self->_trackActivityPresence = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained connectionChangedTrackActivityPresence:self];
}

- (void)setEnableStatusChangeNotifications:(BOOL)a3
{
  if (self->_enableStatusChangeNotifications != a3)
  {
    BOOL v3 = a3;
    self->_enableStatusChangeNotifications = a3;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"Disabling";
      if (v3) {
        id v6 = @"Enabling";
      }
      int v7 = 138412546;
      __int128 v8 = self;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: %@ status notifications for connection",  (uint8_t *)&v7,  0x16u);
    }
  }

- (void)_savePersistentConnectionTopics
{
}

- (void)_savePersistentConnection
{
  if (self->_connectionPortName)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer userPreferences](self, "userPreferences"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentTopics]);

    if (!v4
      || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0)
      || (int v7 = (NSMutableDictionary *)[v4 mutableCopy]) == 0)
    {
      int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }

    id v24 = v7;
    if (-[NSSet count](self->_enabledTopics, "count")
      || -[NSSet count](self->_ignoredTopics, "count")
      || -[NSSet count](self->_opportunisticTopics, "count")
      || -[NSSet count](self->_nonWakingTopics, "count"))
    {
      __int128 v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (-[NSSet count](self->_enabledTopics, "count"))
      {
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_enabledTopics, "allObjects"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, @"enabled");
      }

      if (-[NSSet count](self->_nonWakingTopics, "count"))
      {
        id v10 = -[NSSet mutableCopy](self->_nonWakingTopics, "mutableCopy");
        [v10 minusSet:self->_enabledTopics];
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v11, @"nonWaking");
      }

      if (-[NSSet count](self->_opportunisticTopics, "count"))
      {
        id v12 = -[NSSet mutableCopy](self->_opportunisticTopics, "mutableCopy");
        [v12 minusSet:self->_enabledTopics];
        [v12 minusSet:self->_nonWakingTopics];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v13, @"opportunistic");
      }

      if (-[NSSet count](self->_ignoredTopics, "count"))
      {
        id v14 = -[NSSet mutableCopy](self->_ignoredTopics, "mutableCopy");
        [v14 minusSet:self->_enabledTopics];
        [v14 minusSet:self->_opportunisticTopics];
        [v14 minusSet:self->_nonWakingTopics];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allObjects]);
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, @"ignored");
      }

      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", self->_environmentName, @"environment");
      processName = self->_processName;
      if (processName) {
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", processName, @"processName");
      }
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isPublicTokenAcknowledged));
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v17, @"tokenAcked");

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_enableDarkWake));
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v18, @"darkWakeEnabled");

      if (-[NSSet count](self->_pushWakeTopics, "count"))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_pushWakeTopics, "allObjects"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v19, @"pushWake");
      }

      if (-[NSSet count](self->_ultraConstrainedTopics, "count"))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_ultraConstrainedTopics, "allObjects"));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v20, @"ultraConstrained");
      }

      if (self->_enableStatusChangeNotifications)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v21, @"enableStatusUpdates");
      }

      -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v8, self->_connectionPortName);
    }

    else
    {
      -[NSMutableDictionary removeObjectForKey:](v24, "removeObjectForKey:", self->_connectionPortName);
    }

    id v22 = objc_autoreleasePoolPush();
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer userPreferences](self, "userPreferences"));
    [v23 setPersistentTopics:v24];

    objc_autoreleasePoolPop(v22);
  }

+ (id)environmentForNamedPort:(id)a3 userPreferences:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "environmentForNamedPort called for port %@ from user preferences %@",  (uint8_t *)&v22,  0x16u);
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentTopics]);
  if (v9)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
      if (v12)
      {
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"enabled"]);
          if ([v14 count])
          {
LABEL_10:

LABEL_11:
            int v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"environment"]);
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v22 = 138412546;
              id v23 = v16;
              __int16 v24 = 2112;
              id v25 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Found persistent connection in environment %@ from user preferences %@",  (uint8_t *)&v22,  0x16u);
            }

            goto LABEL_17;
          }

          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"opportunistic"]);
          if ([v15 count])
          {

            goto LABEL_10;
          }

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"ignored"]);
          id v20 = [v19 count];

          if (v20) {
            goto LABEL_11;
          }
        }
      }

      int v16 = 0LL;
LABEL_17:
      id v18 = v16;

      goto LABEL_18;
    }
  }

  id v18 = 0LL;
LABEL_18:

  return v18;
}

- (void)setPushWakeTopics:(id)a3
{
  id v4 = a3;
  if (self->_enableDarkWake)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[APSConnectionServer connection](self, "connection"));
    id v6 = (_xpc_connection_s *)v5;
    if (v5)
    {
      xpc_connection_get_audit_token(v5, buf);
      if (!sub_1000467EC(buf, APSPushWakeEntitlement))
      {

        int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          sub_1000BE294(v6);
        }

        id v4 = 0LL;
      }
    }

    if ((sub_1000773F0(self->_pushWakeTopics, v4) & 1) == 0)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
      __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topicManager]);

      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = APSPrettyPrintCollection(self->_pushWakeTopics, 0LL, 0LL, 0LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = APSPrettyPrintCollection(v4, 0LL, 0LL, 0LL);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = self;
        __int16 v37 = 2112;
        id v38 = v12;
        __int16 v39 = 2112;
        id v40 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: connection set push wake topics from %@ to %@",  buf,  0x20u);
      }

      objc_storeStrong((id *)&self->_pushWakeTopics, v4);
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 topicStatesForConnectionServer:self]);
      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v16)
      {
        id v17 = v16;
        id v28 = v9;
        __int128 v29 = v6;
        char v18 = 0;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v15);
            }
            id v21 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            int v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topicName", v28, v29));
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 attributes]);
            id v24 = [v4 containsObject:v22];
            if ((_DWORD)v24 != [v23 isPushWakeEnabled])
            {
              [v23 setPushWakeEnabled:v24];
              char v18 = 1;
            }
          }

          id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v17);

        -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
        __int16 v9 = v28;
        id v6 = v29;
        if ((v18 & 1) != 0)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 topicManager]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 policy]);
          [v27 filtersWillPotentiallyBeChangedBy:self];
        }
      }

      else
      {

        -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
      }
    }
  }

  else
  {
    id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1000BE208((uint64_t)v4, v6);
    }
  }
}

- (void)setUltraConstrainedTopics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[APSConnectionServer connection](self, "connection"));
  id v6 = (_xpc_connection_s *)v5;
  if (v5)
  {
    xpc_connection_get_audit_token(v5, buf);
    if (!sub_1000467EC(buf, APSUltraConstrainedEntitlement))
    {

      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_1000BE308(v6);
      }

      id v4 = 0LL;
    }
  }

  if ((sub_1000773F0(self->_ultraConstrainedTopics, v4) & 1) == 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topicManager]);

    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog connectionServer](&OBJC_CLASS___APSLog, "connectionServer"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = APSPrettyPrintCollection(self->_ultraConstrainedTopics, 0LL, 0LL, 0LL);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = APSPrettyPrintCollection(v4, 0LL, 0LL, 0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = self;
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: connection set ultra constrained topics from %@ to %@",  buf,  0x20u);
    }

    objc_storeStrong((id *)&self->_ultraConstrainedTopics, v4);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 topicStatesForConnectionServer:self]);
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      id v28 = v9;
      __int128 v29 = v6;
      char v18 = 0;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          int v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topicName", v28, v29));
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 attributes]);
          id v24 = [v4 containsObject:v22];
          if ((_DWORD)v24 != [v23 isUltraConstrainedEnabled])
          {
            [v23 setUltraConstrainedEnabled:v24];
            char v18 = 1;
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v17);

      -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
      __int16 v9 = v28;
      id v6 = v29;
      if ((v18 & 1) != 0)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 topicManager]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 policy]);
        [v27 filtersWillPotentiallyBeChangedBy:self];
      }
    }

    else
    {

      -[APSConnectionServer _savePersistentConnectionTopics](self, "_savePersistentConnectionTopics");
    }
  }
}

- (void)setKeepAliveConfiguration:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
  [v5 connection:self setKeepAliveConfiguration:a3];
}

- (id)entitledTopicsFromSet:(id)a3 unentitledTopics:(id *)a4
{
  return a3;
}

- (void)handleNotificationAcknowledged
{
  p_numberNotificationsAcknowledged = &self->_numberNotificationsAcknowledged;
  do
    unint64_t v4 = __ldaxr((unint64_t *)p_numberNotificationsAcknowledged);
  while (__stlxr(v4 + 1, (unint64_t *)p_numberNotificationsAcknowledged));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  self->_lastNotificationAcknowledgedTime = v5;
}

- (id)JSONDebugState
{
  v34[0] = @"statusChangeNotifications";
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_enableStatusChangeNotifications));
  v34[1] = @"trackAcitivityPresence";
  v35[0] = v3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_trackActivityPresence));
  v35[1] = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
  id v6 = [v5 mutableCopy];

  int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v8 = v7;
  connectionPortName = self->_connectionPortName;
  if (connectionPortName)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  connectionPortName,  @"portName");
    processName = self->_processName;
    if (processName) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  processName,  @"processName");
    }
  }

  else
  {
    uint64_t v11 = self->_processName;
    if (v11)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, @"processName");
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_dateCreated));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v12,  @"connectedTime");

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_clientPID));
      id v14 = @"pid";
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  self->_name,  @"name");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_dateCreated));
      id v14 = @"dateCreated";
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v14);
  }

  [v6 setObject:v8 forKeyedSubscript:@"XPCState"];
  publicToken = self->_publicToken;
  if (publicToken && -[NSData length](publicToken, "length")) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSData debugDescription](self->_publicToken, "debugDescription"));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = (void *)v16;
  [v6 setObject:v16 forKeyedSubscript:@"token"];

  v32[0] = @"enabled";
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_enabledTopics, "allObjects"));
  uint64_t v19 = (void *)v18;
  if (v18) {
    id v20 = (void *)v18;
  }
  else {
    id v20 = &__NSArray0__struct;
  }
  v33[0] = v20;
  v32[1] = @"opportunistic";
  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_opportunisticTopics, "allObjects"));
  int v22 = (void *)v21;
  if (v21) {
    id v23 = (void *)v21;
  }
  else {
    id v23 = &__NSArray0__struct;
  }
  v33[1] = v23;
  v32[2] = @"ignored";
  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_ignoredTopics, "allObjects"));
  id v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = (void *)v24;
  }
  else {
    uint64_t v26 = &__NSArray0__struct;
  }
  v33[2] = v26;
  v32[3] = @"nonWaking";
  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_nonWakingTopics, "allObjects"));
  id v28 = (void *)v27;
  if (v27) {
    __int128 v29 = (void *)v27;
  }
  else {
    __int128 v29 = &__NSArray0__struct;
  }
  v33[3] = v29;
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));
  [v6 setObject:v30 forKeyedSubscript:@"topics"];

  return v6;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  if (!-[NSSet count](self->_enabledTopics, "count")
    && !-[NSSet count](self->_opportunisticTopics, "count")
    && !-[NSSet count](self->_nonWakingTopics, "count"))
  {
    uint64_t v18 = @"No listening topics, will not send or receive push notifications";
    goto LABEL_39;
  }

  publicToken = self->_publicToken;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v7 = [WeakRetained connectionDelegateIsConnectedToService:self];

  if (!publicToken)
  {
    if (v7)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned int v20 = [v19 connectionDelegateHasConnectedUser:self];

      if (v20) {
        uint64_t v18 = @"Missing token";
      }
      else {
        uint64_t v18 = @"Missing token because user not connected";
      }
    }

    else
    {
      uint64_t v18 = @"Missing token because not connected to service";
    }

    goto LABEL_39;
  }

  if ((v7 & 1) == 0)
  {
    uint64_t v18 = @"Not connected to service";
    if (self->_enableDarkWake) {
      goto LABEL_39;
    }
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
    unsigned __int8 v22 = [v21 inDarkWake];

    if ((v22 & 1) != 0)
    {
      uint64_t v18 = @"Not connected to service during dark wake";
      goto LABEL_39;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
    unsigned int v29 = [v28 inFullWake];

    __int128 v30 = @"Not connected to service during sleep";
LABEL_37:
    if (!v29) {
      uint64_t v18 = v30;
    }
    goto LABEL_39;
  }

  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v9 = [v8 connectionDelegateHasConnectedUser:self];

  if ((v9 & 1) == 0)
  {
    uint64_t v18 = @"User not connected";
    if (self->_enableDarkWake) {
      goto LABEL_39;
    }
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
    unsigned __int8 v24 = [v23 inDarkWake];

    if ((v24 & 1) != 0)
    {
      uint64_t v18 = @"User not connected during dark wake";
      goto LABEL_39;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[APSWakeStateManager wakeStateManager](&OBJC_CLASS___APSWakeStateManager, "wakeStateManager"));
    unsigned int v29 = [v34 inFullWake];

    __int128 v30 = @"User not connected during sleep";
    goto LABEL_37;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  [v10 unionSet:self->_enabledTopics];
  [v10 unionSet:self->_opportunisticTopics];
  [v10 unionSet:self->_nonWakingTopics];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topicManager]);

  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v100 objects:v106 count:16];
  if (!v14) {
    goto LABEL_15;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v101;
  while (2)
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v101 != v16) {
        objc_enumerationMutation(v13);
      }
      if ([v12 hasListeningTopic:*(void *)(*((void *)&v100 + 1) + 8 * (void)i)])
      {

        if (!self->_processName && !self->_connectionMachPort)
        {
          uint64_t v18 = @"Unregistered port name";
          goto LABEL_35;
        }

        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats incomingCounts](self->_payloadMessageStats, "incomingCounts"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 total]);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastMessageTopic]);
        if (v27)
        {
        }

        else
        {
          __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[APSPayloadMessageStats outgoingCounts](self->_payloadMessageStats, "outgoingCounts"));
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 total]);
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 lastMessageTopic]);

          if (!v33)
          {
            uint64_t v18 = @"Waiting for push notifications";
            goto LABEL_35;
          }
        }

        uint64_t v18 = @"Ok";
        goto LABEL_35;
      }
    }

    id v15 = [v13 countByEnumeratingWithState:&v100 objects:v106 count:16];
    if (v15) {
      continue;
    }
    break;
  }

- (void)appendPrettyStatusToStatusPrinter:(id)a3 forTopics:(id)a4 type:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v31 = v10;
    objc_msgSend(v8, "appendDescription:unsignedIntegerValue:", v10, objc_msgSend(v9, "count"));
    [v8 pushIndent];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnectionServer delegate](self, "delegate"));
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v11 topicManager]);

    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v32 = v9;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"compare:"]);

    id obj = v13;
    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (!v14) {
      goto LABEL_36;
    }
    id v15 = v14;
    uint64_t v35 = *(void *)v38;
    while (1)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[APSPayloadMessageStats incomingCountsForTopic:]( self->_payloadMessageStats,  "incomingCountsForTopic:",  v17));
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[APSPayloadMessageStats outgoingCountsForTopic:]( self->_payloadMessageStats,  "outgoingCountsForTopic:",  v17));
        if (![v36 hasListeningTopic:v17])
        {
          unsigned __int8 v22 = @"Paused, topic is redlisted";
          goto LABEL_22;
        }

        if (v18)
        {
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v18 total]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastMessageTopic]);
          __int128 v33 = v20;
          if (v21)
          {
            id v13 = v21;

LABEL_19:
            unsigned __int8 v22 = @"Ok";
            goto LABEL_22;
          }

          if (!v19)
          {

            id v13 = 0LL;
            goto LABEL_21;
          }

          id v13 = 0LL;
        }

        else if (!v19)
        {
          goto LABEL_21;
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 total]);
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lastMessageTopic]);

        if (v18)
        {
        }

        if (v24) {
          goto LABEL_19;
        }
LABEL_21:
        unsigned __int8 v22 = @"Waiting for push notifications";
LABEL_22:
        [v8 appendDescription:@"topic" stringValue:v17];
        [v8 pushIndent];
        [v8 appendDescription:@"status" stringValue:v22];
        if (-[NSSet containsObject:](self->_pushWakeTopics, "containsObject:", v17)) {
          [v8 appendDescription:@"push-to-wake" BOOLValue:1];
        }
        if (-[NSSet containsObject:](self->_darkWakeTopics, "containsObject:", v17)) {
          [v8 appendDescription:@"dark-wake" BOOLValue:1];
        }
        if (-[NSSet containsObject:](self->_ultraConstrainedTopics, "containsObject:", v17)) {
          [v8 appendDescription:@"ultra-constrained" BOOLValue:1];
        }
        if (v18)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 total]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 lastMessageTopic]);

          if (v26)
          {
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[APSPayloadMessageStats incomingCountsForTopic:]( self->_payloadMessageStats,  "incomingCountsForTopic:",  v17));
            [v27 appendPrettyStatusToStatusPrinter:v8 total:0 direction:@"incoming"];
          }
        }

        if (v19)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v19 total]);
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 lastMessageTopic]);

          if (v29)
          {
            __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( -[APSPayloadMessageStats outgoingCountsForTopic:]( self->_payloadMessageStats,  "outgoingCountsForTopic:",  v17));
            [v30 appendPrettyStatusToStatusPrinter:v8 total:0 direction:@"reverse"];
          }
        }

        [v8 popIndent];
      }

      id v15 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (!v15)
      {
LABEL_36:

        [v8 popIndent];
        id v10 = v31;
        id v9 = v32;
        break;
      }
    }
  }
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  environmentName = self->_environmentName;
  connectionPortName = self->_connectionPortName;
  processName = self->_processName;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSUser name](self->_user, "name"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; %@/%@/%@ %@>",
                   v3,
                   self,
                   environmentName,
                   connectionPortName,
                   processName,
                   v7));

  return (NSString *)v8;
}

- (APSConnectionServerDelegate)delegate
{
  return (APSConnectionServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)enabledTopics
{
  return self->_enabledTopics;
}

- (NSSet)ignoredTopics
{
  return self->_ignoredTopics;
}

- (NSSet)opportunisticTopics
{
  return self->_opportunisticTopics;
}

- (NSData)publicToken
{
  return self->_publicToken;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)largeMessageSize
{
  return self->_largeMessageSize;
}

- (BOOL)enableCriticalReliability
{
  return self->_enableCriticalReliability;
}

- (BOOL)enableStatusChangeNotifications
{
  return self->_enableStatusChangeNotifications;
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (NSSet)pushWakeTopics
{
  return self->_pushWakeTopics;
}

- (NSSet)ultraConstrainedTopics
{
  return self->_ultraConstrainedTopics;
}

- (APSUser)user
{
  return self->_user;
}

- (NSSet)nonWakingTopics
{
  return self->_nonWakingTopics;
}

- (void)setProcessName:(id)a3
{
}

- (BOOL)enableDarkWake
{
  return self->_enableDarkWake;
}

- (BOOL)trackActivityPresence
{
  return self->_trackActivityPresence;
}

- (int64_t)publicTokenDeliveryRetries
{
  return self->_publicTokenDeliveryRetries;
}

- (void)setPublicTokenDeliveryRetries:(int64_t)a3
{
  self->_publicTokenDeliveryRetries = a3;
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (NSString)name
{
  return self->_name;
}

- (APSUserPreferences)userPreferences
{
  return self->_userPreferences;
}

- (void)setUserPreferences:(id)a3
{
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void).cxx_destruct
{
}

  ;
}

@end