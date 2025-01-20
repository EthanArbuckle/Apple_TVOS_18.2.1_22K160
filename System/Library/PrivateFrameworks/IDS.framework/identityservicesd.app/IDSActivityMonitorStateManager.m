@interface IDSActivityMonitorStateManager
+ (id)sharedInstance;
- (BOOL)isListeningOnActivity:(id)a3;
- (BOOL)startListeningOnActivity:(id)a3;
- (BOOL)stopListeningOnActivity:(id)a3;
- (FTMessageDelivery)messageDelivery;
- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 pushListener:(id)a8;
- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 queue:(id)a8;
- (IDSActivityPushListener)pushListener;
- (IDSActivityStateProvider)stateProvider;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSPeerIDManager)peerIDManager;
- (NSMutableDictionary)listenersByActivity;
- (NSMutableDictionary)topicStringToSubscribedInfo;
- (NSMutableSet)listeningOnActivities;
- (id)currentSubscriptionsForActivity:(id)a3;
- (id)storedUpdatesForActivity:(id)a3;
- (void)_subscribeForInfo:(id)a3 withDescription:(id)a4 resolvedTokens:(id)a5 withCompletion:(id)a6;
- (void)_updateListener;
- (void)ackUpdatesForActivity:(id)a3;
- (void)addListener:(id)a3 forActivity:(id)a4;
- (void)pushListener:(id)a3 receivedUpdatePush:(id)a4;
- (void)removeListener:(id)a3 forActivity:(id)a4;
- (void)removeSubscriptionForActivity:(id)a3 subActivity:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setListenersByActivity:(id)a3;
- (void)setListeningOnActivities:(id)a3;
- (void)setMessageDelivery:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPushListener:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setStateProvider:(id)a3;
- (void)setTopicStringToSubscribedInfo:(id)a3;
- (void)setup;
- (void)storeSubscription:(id)a3 forActivity:(id)a4;
- (void)subscribeForInfo:(id)a3 onActivity:(id)a4 withCompletion:(id)a5;
- (void)unsubscribeForActivity:(id)a3 subActivity:(id)a4 withCompletion:(id)a5;
@end

@implementation IDSActivityMonitorStateManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100021028;
  block[3] = &unk_1008F6558;
  block[4] = a1;
  if (qword_1009BE5C8 != -1) {
    dispatch_once(&qword_1009BE5C8, block);
  }
  return (id)qword_1009BE5C0;
}

- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 pushListener:(id)a8
{
  v14 = (IDSActivityPushListener *)a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v21 = im_primary_queue(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = -[IDSActivityMonitorStateManager initWithStateProvider:messageDelivery:peerIDManager:accountController:serviceController:queue:]( self,  "initWithStateProvider:messageDelivery:peerIDManager:accountController:serviceController:queue:",  v19,  v18,  v17,  v16,  v15,  v22);

  pushListener = v23->_pushListener;
  v23->_pushListener = v14;
  v25 = v14;

  -[IDSActivityPushListener setDelegate:](v23->_pushListener, "setDelegate:", v23);
  return v23;
}

- (IDSActivityMonitorStateManager)initWithStateProvider:(id)a3 messageDelivery:(id)a4 peerIDManager:(id)a5 accountController:(id)a6 serviceController:(id)a7 queue:(id)a8
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSActivityMonitorStateManager;
  id v18 = -[IDSActivityMonitorStateManager init](&v28, "init");
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_stateProvider, a3);
    uint64_t v20 = -[IDSActivityPushListener initWithQueue:shouldDowngradeOnLock:]( objc_alloc(&OBJC_CLASS___IDSActivityPushListener),  "initWithQueue:shouldDowngradeOnLock:",  v17,  0LL);
    pushListener = v19->_pushListener;
    v19->_pushListener = v20;

    objc_storeStrong((id *)&v19->_messageDelivery, a4);
    objc_storeStrong((id *)&v19->_peerIDManager, a5);
    objc_storeStrong((id *)&v19->_accountController, a6);
    objc_storeStrong((id *)&v19->_serviceController, a7);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    topicStringToSubscribedInfo = v19->_topicStringToSubscribedInfo;
    v19->_topicStringToSubscribedInfo = (NSMutableDictionary *)v22;
  }

  -[IDSActivityPushListener setDelegate:](v19->_pushListener, "setDelegate:", v19);

  return v19;
}

- (void)setup
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSActivityStateProvider storedActivityTopics](self->_stateProvider, "storedActivityTopics"));
  if ([v5 count])
  {
    v3 = (NSMutableSet *)[v5 mutableCopy];
    listeningOnActivities = self->_listeningOnActivities;
    self->_listeningOnActivities = v3;
  }

  -[IDSActivityMonitorStateManager _updateListener](self, "_updateListener");
}

- (void)addListener:(id)a3 forActivity:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  unsigned int v7 = +[IDSDXPCActivityMonitor isActivityMonitorSupported]( &OBJC_CLASS___IDSDXPCActivityMonitor,  "isActivityMonitorSupported");
  if (v6 && v7)
  {
    listenersByActivity = self->_listenersByActivity;
    if (!listenersByActivity)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v10 = self->_listenersByActivity;
      self->_listenersByActivity = v9;

      listenersByActivity = self->_listenersByActivity;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](listenersByActivity, "objectForKeyedSubscript:", v6));
    if (!v11)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_listenersByActivity,  "setObject:forKeyedSubscript:",  v11,  v6);
    }

    [v11 addObject:v12];
  }
}

- (void)removeListener:(id)a3 forActivity:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    listenersByActivity = self->_listenersByActivity;
    if (listenersByActivity)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( listenersByActivity,  "objectForKeyedSubscript:",  v6));
      v9 = v8;
      if (v8)
      {
        [v8 removeObject:v11];
        if (![v9 count]) {
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_listenersByActivity,  "setObject:forKeyedSubscript:",  0LL,  v6);
        }
        if (!-[NSMutableDictionary count](self->_listenersByActivity, "count"))
        {
          v10 = self->_listenersByActivity;
          self->_listenersByActivity = 0LL;
        }
      }
    }
  }
}

- (NSMutableSet)listeningOnActivities
{
  listeningOnActivities = self->_listeningOnActivities;
  if (listeningOnActivities) {
    return (NSMutableSet *)-[NSMutableSet copy](listeningOnActivities, "copy");
  }
  else {
    return (NSMutableSet *)(id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
}

- (BOOL)startListeningOnActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[NSMutableSet containsObject:](self->_listeningOnActivities, "containsObject:", v4);
  if ((v5 & 1) == 0)
  {
    listeningOnActivities = self->_listeningOnActivities;
    if (!listeningOnActivities)
    {
      unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v8 = self->_listeningOnActivities;
      self->_listeningOnActivities = v7;

      listeningOnActivities = self->_listeningOnActivities;
    }

    -[NSMutableSet addObject:](listeningOnActivities, "addObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 storedActivityTopics]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v10));

    [v11 addObject:v4];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
    [v12 setStoredActivityTopics:v11];

    -[IDSActivityMonitorStateManager _updateListener](self, "_updateListener");
  }

  return v5 ^ 1;
}

- (BOOL)stopListeningOnActivity:(id)a3
{
  id v4 = a3;
  listeningOnActivities = self->_listeningOnActivities;
  if (listeningOnActivities
    && -[NSMutableSet containsObject:](listeningOnActivities, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_listeningOnActivities, "removeObject:", v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 storedActivityTopics]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v7));

    [v8 removeObject:v4];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
    [v9 setStoredActivityTopics:v8];

    -[IDSActivityMonitorStateManager _updateListener](self, "_updateListener");
    -[IDSActivityMonitorStateManager ackUpdatesForActivity:](self, "ackUpdatesForActivity:", v4);

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isListeningOnActivity:(id)a3
{
  return -[NSMutableSet containsObject:](self->_listeningOnActivities, "containsObject:", a3);
}

- (id)storedUpdatesForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storedUpdatesForActivity:v4]);

  if (v6) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  return v8;
}

- (void)storeSubscription:(id)a3 forActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
  [v8 storeSubscription:v7 forActivity:v6];
}

- (void)removeSubscriptionForActivity:(id)a3 subActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
  [v8 removeSubscriptionForActivity:v7 subActivity:v6];
}

- (id)currentSubscriptionsForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 storedSubscriptionsForActivity:v4]);

  return v6;
}

- (void)ackUpdatesForActivity:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager stateProvider](self, "stateProvider"));
  [v5 storeUpdates:0 forActivity:v4];
}

- (void)subscribeForInfo:(id)a3 onActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager topicStringToSubscribedInfo](self, "topicStringToSubscribedInfo"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 expirationDate]);
  id v15 = [v13 compare:v14];

  if (![v12 isIdentical:v8] || v15 == (id)1)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___IDSActivityDescription);
    -[IDSActivityDescription setActivity:](v17, "setActivity:", v9);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    -[IDSActivityDescription setTimeSubscribed:](v17, "setTimeSubscribed:");
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 tokens]);
    id v19 = [v18 count];

    if (v19)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 tokens]);
      -[IDSActivityMonitorStateManager _subscribeForInfo:withDescription:resolvedTokens:withCompletion:]( self,  "_subscribeForInfo:withDescription:resolvedTokens:withCompletion:",  v8,  v17,  v20,  v10);
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 URIs]);
      id v22 = [v21 count];

      if (!v22)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceUniqueIDs]);
        id v35 = [v34 count];

        if (v35) {
          uint64_t v36 = -600LL;
        }
        else {
          uint64_t v36 = -104LL;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  v36,  0LL));
        v10[2](v10, v38);

        goto LABEL_16;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager serviceController](self, "serviceController"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceWithIdentifier:v9]);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager accountController](self, "accountController"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 accountsOnService:v20 withType:1]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);

      if ([v26 isRegistered])
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 unprefixedURIStringsFromRegistration]);
        v43 = (void *)_IDSCopyCallerIDWithSelfMessagingHint(0LL, v27, 0LL, 0LL, 0LL, 0LL, 1LL);

        objc_super v28 = (void *)objc_claimAutoreleasedReturnValue([v43 _bestGuessURI]);
        v45 = v20;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
        v44 = v26;
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v28,  v30));

        v31 = (void *)objc_claimAutoreleasedReturnValue([v44 primaryRegistration]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v31 registrationCert]);

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager peerIDManager](self, "peerIDManager"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v8 URIs]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v45 identifier]);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_100021E78;
        v46[3] = &unk_1008F65A8;
        v46[4] = self;
        id v47 = v8;
        v48 = v17;
        v49 = v10;
        id v26 = v44;
        LOBYTE(v39) = 0;
        [v40 startQueryForURIs:v32 fromIdentity:v41 fromURI:v42 fromService:v33 forSending:0 forRefresh:0 isForced:v39 reason:@"ActivityMonitorSubscription" completionBlock:v46];

        uint64_t v20 = v45;
      }

      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  -200LL,  0LL));
        v10[2](v10, v37);
      }
    }

    goto LABEL_16;
  }

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v51 = v9;
    __int16 v52 = 2112;
    id v53 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Found existing identical subscription for topic %@ with info %@.",  buf,  0x16u);
  }

  id v17 = (IDSActivityDescription *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSActivityMonitorErrorDomain,  666LL,  0LL));
  v10[2](v10, v17);
LABEL_16:
}

- (void)unsubscribeForActivity:(id)a3 subActivity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___IDSActivityScribeMessage);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"com.apple.icloud.presence.",  v8));
  -[IDSActivityScribeMessage setActivityTopic:](v11, "setActivityTopic:", v12);

  -[IDSActivityScribeMessage setVersion:](v11, "setVersion:", 1LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  -[IDSActivityScribeMessage setMessageID:](v11, "setMessageID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  -[IDSActivityScribeMessage setMetadataBlob:](v11, "setMetadataBlob:", v14);

  -[IDSActivityScribeMessage setSubActivity:](v11, "setSubActivity:", v9);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100022240;
  v19[3] = &unk_1008F65D0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  -[IDSActivityScribeMessage setCompletionBlock:](v11, "setCompletionBlock:", v19);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager messageDelivery](self, "messageDelivery"));
  [v18 sendMessage:v11];
}

- (void)_subscribeForInfo:(id)a3 withDescription:(id)a4 resolvedTokens:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager topicStringToSubscribedInfo](self, "topicStringToSubscribedInfo"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 activity]);
  [v14 setObject:v10 forKeyedSubscript:v15];

  id v16 = objc_alloc_init(&OBJC_CLASS___IDSActivityScribeMessage);
  -[IDSActivityScribeMessage setTokens:](v16, "setTokens:", v13);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 activity]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"com.apple.icloud.presence.",  v17));
  -[IDSActivityScribeMessage setActivityTopic:](v16, "setActivityTopic:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 subActivity]);
  -[IDSActivityScribeMessage setSubActivity:](v16, "setSubActivity:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 appContext]);
  -[IDSActivityScribeMessage setMetadataBlob:](v16, "setMetadataBlob:", v20);

  -[IDSActivityScribeMessage setPushPriority:](v16, "setPushPriority:", 10LL);
  -[IDSActivityScribeMessage setActivityPolicy:](v16, "setActivityPolicy:", 0LL);
  -[IDSActivityScribeMessage setVersion:](v16, "setVersion:", 1LL);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  -[IDSActivityScribeMessage setMessageID:](v16, "setMessageID:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 expirationDate]);
  [v22 timeIntervalSinceNow];
  -[IDSActivityScribeMessage setTtl:](v16, "setTtl:", vcvtpd_s64_f64(v23));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000226F0;
  v28[3] = &unk_1008F65D0;
  v28[4] = self;
  id v29 = v11;
  id v30 = v10;
  id v31 = v12;
  id v24 = v12;
  id v25 = v10;
  id v26 = v11;
  -[IDSActivityScribeMessage setCompletionBlock:](v16, "setCompletionBlock:", v28);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager messageDelivery](self, "messageDelivery"));
  [v27 sendMessage:v16];
}

- (void)_updateListener
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager listeningOnActivities](self, "listeningOnActivities"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imSetByApplyingBlock:", &stru_1008F6610));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager pushListener](self, "pushListener"));
  [v5 setTopicsToListenOn:v4];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager listeningOnActivities](self, "listeningOnActivities"));
  BOOL v6 = [v8 count] != 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager pushListener](self, "pushListener"));
  [v7 setShouldListen:v6];
}

- (void)pushListener:(id)a3 receivedUpdatePush:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activityTopic]);
  if ([v7 rangeOfString:@"com.apple.icloud.presence."]) {
    id v9 = 0LL;
  }
  else {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 substringFromIndex:v8]);
  }

  if (!v9) {
    goto LABEL_38;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager listeningOnActivities](self, "listeningOnActivities"));
  unsigned int v11 = [v10 containsObject:v9];

  if (!v11) {
    goto LABEL_38;
  }
  id v52 = v5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager serviceController](self, "serviceController"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 serviceWithIdentifier:v9]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager accountController](self, "accountController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountsOnService:v13 withType:1]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

  id v17 = 0LL;
  id v53 = (void *)v13;
  id v54 = v6;
  v56 = v9;
  id v51 = v16;
  if (v13 && v16)
  {
    if ([v16 isRegistered])
    {
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 registeredDevices]);
      id v19 = [v18 countByEnumeratingWithState:&v62 objects:v72 count:16];
      if (v19)
      {
        id v20 = v19;
        id v17 = 0LL;
        uint64_t v21 = *(void *)v63;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v63 != v21) {
              objc_enumerationMutation(v18);
            }
            double v23 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pushToken]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
            unsigned int v26 = [v24 isEqualToData:v25];

            if (v26)
            {
              id v27 = v23;

              id v17 = v27;
            }
          }

          id v20 = [v18 countByEnumeratingWithState:&v62 objects:v72 count:16];
        }

        while (v20);

        if (v17) {
          goto LABEL_23;
        }
      }

      else
      {
      }

      objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSActivityMonitorStateManager peerIDManager](self, "peerIDManager"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v6 token]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPushToken pushTokenWithData:](&OBJC_CLASS___IDSPushToken, "pushTokenWithData:", v29));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v53 identifier]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v28 urisMatchingPushToken:v30 service:v31]);

      [0 addObjectsFromArray:v32];
      id v6 = v54;
    }

    id v17 = 0LL;
  }

- (void)setListeningOnActivities:(id)a3
{
}

- (NSMutableDictionary)topicStringToSubscribedInfo
{
  return self->_topicStringToSubscribedInfo;
}

- (void)setTopicStringToSubscribedInfo:(id)a3
{
}

- (NSMutableDictionary)listenersByActivity
{
  return self->_listenersByActivity;
}

- (void)setListenersByActivity:(id)a3
{
}

- (IDSActivityStateProvider)stateProvider
{
  return self->_stateProvider;
}

- (void)setStateProvider:(id)a3
{
}

- (IDSActivityPushListener)pushListener
{
  return self->_pushListener;
}

- (void)setPushListener:(id)a3
{
}

- (FTMessageDelivery)messageDelivery
{
  return self->_messageDelivery;
}

- (void)setMessageDelivery:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end