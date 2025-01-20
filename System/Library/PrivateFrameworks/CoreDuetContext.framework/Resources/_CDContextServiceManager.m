@interface _CDContextServiceManager
+ (id)sharedInstance;
- (CDMonitorManager)monitorManager;
- (_CDContextServiceManager)init;
- (id)_extractInteractionsFromEvents:(id)a3 onStream:(id)a4;
- (void)_recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)_setUpServices;
@end

@implementation _CDContextServiceManager

+ (id)sharedInstance
{
  if (qword_10000CBD0 != -1) {
    dispatch_once(&qword_10000CBD0, &stru_1000082E8);
  }
  return (id)qword_10000CBC8;
}

- (_CDContextServiceManager)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v3,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "_CDContextServiceManagerInit",  " enableTelemetry=YES ",  buf,  2u);
  }

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS____CDContextServiceManager;
  v4 = -[_CDContextServiceManager init](&v27, "init");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPaths knowledgeDirectory](&OBJC_CLASS____CDPaths, "knowledgeDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDCoreDataContextPersisting persistenceWithDirectory:]( &OBJC_CLASS____CDCoreDataContextPersisting,  "persistenceWithDirectory:",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDSharedMemoryKeyValueStore sharedInstance]( &OBJC_CLASS____CDSharedMemoryKeyValueStore,  "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDSharedMemoryContextPersisting persistenceWithSharedMemoryKeyValueStore:]( &OBJC_CLASS____CDSharedMemoryContextPersisting,  "persistenceWithSharedMemoryKeyValueStore:",  v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[_CDPolicyBasedPersisting persistenceWithPersistenceSurvivingReboot:persistenceSurvivingRelaunch:]( &OBJC_CLASS____CDPolicyBasedPersisting,  "persistenceWithPersistenceSurvivingReboot:persistenceSurvivingRelaunch:",  v6,  v8));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[_CDUserContextService sharedInstanceWithPersistence:]( &OBJC_CLASS____CDUserContextService,  "sharedInstanceWithPersistence:",  v9));
    userContextDaemon = v4->_userContextDaemon;
    v4->_userContextDaemon = (_CDUserContextService *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[_CDEventStreams sharedInstance](&OBJC_CLASS____CDEventStreams, "sharedInstance"));
    eventStreams = v4->_eventStreams;
    v4->_eventStreams = (_CDEventStreams *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[CDMonitorManager monitorManagerForEventStreams:domain:]( &OBJC_CLASS___CDMonitorManager,  "monitorManagerForEventStreams:domain:",  v4->_eventStreams,  1LL));
    monitorManager = v4->_monitorManager;
    v4->_monitorManager = (CDMonitorManager *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___CDNotifydMonitor);
    notifyMonitor = v4->_notifyMonitor;
    v4->_notifyMonitor = v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess]( &OBJC_CLASS____DKKnowledgeStore,  "knowledgeStoreWithDirectReadWriteAccess"));
    knowledgeStore = v4->_knowledgeStore;
    v4->_knowledgeStore = (_DKKnowledgeStore *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[_CDInteractionPolicies interactionPolicies](&OBJC_CLASS____CDInteractionPolicies, "interactionPolicies"));
    interactionPolicies = v4->_interactionPolicies;
    v4->_interactionPolicies = (_CDInteractionPolicies *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[_CDInteractionStore defaultDatabaseDirectory]( &OBJC_CLASS____CDInteractionStore,  "defaultDatabaseDirectory"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[_CDInteractionStore storeWithDirectory:readOnly:]( &OBJC_CLASS____CDInteractionStore,  "storeWithDirectory:readOnly:",  v22,  0LL));
    interactionStore = v4->_interactionStore;
    v4->_interactionStore = (_CDInteractionStore *)v23;

    -[_CDContextServiceManager _setUpServices](v4, "_setUpServices");
  }

  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](&OBJC_CLASS____CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "_CDContextServiceManagerInit",  (const char *)&unk_100006E3F,  buf,  2u);
  }

  return v4;
}

- (id)_extractInteractionsFromEvents:(id)a3 onStream:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 eventStreamProperties]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  unsigned __int8 v9 = [v8 isEqualToString:@"CallInProgress"];

  if ((v9 & 1) != 0)
  {
    uint64_t v10 = (id *)&OBJC_CLASS____DKCallMetadataKey_ptr;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 eventStreamProperties]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
    unsigned int v13 = [v12 isEqualToString:@"NextCalendarEvent"];

    if (!v13)
    {
LABEL_17:
      v16 = 0LL;
      goto LABEL_18;
    }

    uint64_t v10 = (id *)&OBJC_CLASS____DKCalendarMetadataKey_ptr;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue([*v10 interaction]);
  if (!v14) {
    goto LABEL_17;
  }
  v15 = (void *)v14;
  id v28 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v29 = v5;
  id v17 = v5;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 metadata]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v15]);

        if (v24 && [v24 mechanism] != (id)5) {
          [v16 addObject:v24];
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue([v22 metadata]);
        id v26 = [v25 mutableCopy];

        [v26 removeObjectForKey:v15];
        [v22 setMetadata:v26];
      }

      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v19);
  }

  id v6 = v28;
  id v5 = v29;
LABEL_18:

  return v16;
}

- (void)_setUpServices
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.coreduetd.serviceManager.historical background", v6);
  objc_initWeak(&location, self);
  monitorManager = self->_monitorManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004E80;
  v15[3] = &unk_1000083C8;
  unsigned __int8 v9 = v7;
  v16 = v9;
  objc_copyWeak(&v17, &location);
  -[CDMonitorManager setHistoricalHandler:](monitorManager, "setHistoricalHandler:", v15);
  uint64_t v10 = self->_monitorManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000052D8;
  v12[3] = &unk_1000083F0;
  v11 = v9;
  unsigned int v13 = v11;
  objc_copyWeak(&v14, &location);
  -[CDMonitorManager setHistoricalDeletingHandler:](v10, "setHistoricalDeletingHandler:", v12);
  -[CDMonitorManager setShutdownHandler:](self->_monitorManager, "setShutdownHandler:", &stru_100008430);
  -[CDMonitorManager start](self->_monitorManager, "start");
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  interactionPolicies = self->_interactionPolicies;
  v11 = (void (**)(id, id))a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[_CDInteractionPolicies filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:]( interactionPolicies,  "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:",  a3,  v7,  v6));
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100005F70(v12);
  }

  interactionStore = self->_interactionStore;
  uint64_t v15 = 0LL;
  v11[2]( v11,  -[_CDInteractionStore recordInteractions:error:](interactionStore, "recordInteractions:error:", v12, &v15));
}

- (CDMonitorManager)monitorManager
{
  return self->_monitorManager;
}

- (void).cxx_destruct
{
}

@end