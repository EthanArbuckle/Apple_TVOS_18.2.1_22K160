@interface CDPeopleDaemon
+ (BOOL)isKnowledgeAgent;
+ (BOOL)writeRepopulationCheckpoint:(id)a3;
+ (id)machServiceName;
+ (id)readRepopulationCheckpoint;
- (BOOL)adjustPosixPermissionsForStorage:(id)a3;
- (BOOL)isClassCLocked;
- (BOOL)isKnowledgeAgent;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requestInteractionRepopulation;
- (BOOL)versionCheckAndUpgradeIfNecessaryAndPossible;
- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3;
- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4;
- (CDPeopleDaemon)initWithUserKnowledgeStore:(id)a3;
- (_CDInteractionStore)store;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSContactSuggester)contactSuggester;
- (_PSEnsembleModel)ensembleModel;
- (_PSFamilyRecommender)familyRecommender;
- (_PSMessagesPinningSuggester)messagesPinningSuggester;
- (_PSSuggester)suggester;
- (id)workQueue;
- (int64_t)readVersionNumberFromDefaults;
- (void)_maintainPrivacy;
- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4;
- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6;
- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)candidatesForShareSheetRanking:(id)a3;
- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4;
- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5;
- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4;
- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4;
- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)handleError:(id)a3;
- (void)logSizeOfStorage:(id)a3;
- (void)maintainPrivacy;
- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)populateAppSharesCache;
- (void)populateAppUsageCache;
- (void)populatePeopleSuggesterCaches;
- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5;
- (void)rankedFamilySuggestionsWithReply:(id)a3;
- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7;
- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6;
- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4;
- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4;
- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5;
- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5;
- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6;
- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)refreshPeopleSuggesterCaches;
- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5;
- (void)reportPeopleStatistics;
- (void)setIsKnowledgeAgent:(BOOL)a3;
- (void)setupDataProtectionChangeHandler;
- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4;
- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5;
- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5;
- (void)writeVersionNumberToDefaults:(unint64_t)a3;
- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
@end

@implementation CDPeopleDaemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____CDInteractionXPCProtocol));
  setClassesForCDInteractionXPCInterface();
  [v5 setExportedInterface:v6];
  [v5 _setQueue:self->super._delegate];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.coreduetd.allow"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.coreduetd.people"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.contactsui"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.contacts"]);
  v11 = v10;
  if (v7)
  {
    v12 = v7;
  }

  else if (v8)
  {
    v12 = v8;
  }

  else
  {
    if (!v9)
    {
      goto LABEL_13;
    }

    v12 = v9;
  }

  if ([v12 BOOLValue])
  {
LABEL_8:
    v13 = objc_alloc_init(&OBJC_CLASS___CDPeopleDaemonConnection);
    -[CDPeopleDaemonConnection setDaemon:](v13, "setDaemon:", self);
    -[CDPeopleDaemonConnection setQueryInteractionsOnlyAuthorization:]( v13,  "setQueryInteractionsOnlyAuthorization:",  0LL);
    [v5 setExportedObject:v13];
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = [v5 processIdentifier];
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Connection from PID %d accepted",  (uint8_t *)v17,  8u);
    }

    [v5 resume];
    BOOL v15 = 1;
    goto LABEL_16;
  }

- (CDPeopleDaemon)initWithUserKnowledgeStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths peopleDatabaseDirectory](&OBJC_CLASS___CDDPaths, "peopleDatabaseDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDInteractionStore storeWithDirectory:knowledgeStore:readOnly:]( &OBJC_CLASS____CDInteractionStore,  "storeWithDirectory:knowledgeStore:readOnly:",  v5,  v4,  1LL));
  v7 = -[CDPeopleDaemon initWithKnowledgeStore:interactionStore:]( self,  "initWithKnowledgeStore:interactionStore:",  v4,  v6);

  return v7;
}

- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths peopleDatabaseDirectory](&OBJC_CLASS___CDDPaths, "peopleDatabaseDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDInteractionStore storeWithDirectory:knowledgeStore:readOnly:]( &OBJC_CLASS____CDInteractionStore,  "storeWithDirectory:knowledgeStore:readOnly:",  v5,  v4,  0LL));
  v7 = -[CDPeopleDaemon initWithKnowledgeStore:interactionStore:]( self,  "initWithKnowledgeStore:interactionStore:",  v4,  v6);

  return v7;
}

+ (BOOL)isKnowledgeAgent
{
  return 0;
}

+ (id)machServiceName
{
  unsigned int v2 = [a1 isKnowledgeAgent];
  v3 = (id *)&_CDInteractionMachServiceName;
  if (v2) {
    v3 = (id *)&_CDInteractionUserMachServiceName;
  }
  return *v3;
}

- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduet.people.CDPeopleDaemon",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  unsigned int v10 = +[CDPeopleDaemon isKnowledgeAgent](&OBJC_CLASS___CDPeopleDaemon, "isKnowledgeAgent");
  LOBYTE(self->super._reserved1) = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CDPeopleDaemon machServiceName](&OBJC_CLASS___CDPeopleDaemon, "machServiceName"));
  if (v10)
  {
    v61.receiver = self;
    v61.super_class = (Class)&OBJC_CLASS___CDPeopleDaemon;
    v12 = -[CDPeopleDaemon initWithMachServiceName:](&v61, "initWithMachServiceName:", v11);

    if (v12)
    {
      p_reserved2 = &v12->super._reserved2;
      objc_storeStrong(&v12->super._reserved2, a4);
      -[CDPeopleDaemon setDelegate:](v12, "setDelegate:", v12);
      dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      BOOL v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
      dispatch_queue_t v16 = dispatch_queue_create("com.apple.coreduet.knowledge-agent.people.work", v15);
      id delegate = v12->super._delegate;
      v12->super._id delegate = v16;

      v18 = objc_alloc_init(&OBJC_CLASS____DKDataProtectionStateMonitor);
      dispatch_queue_t userQueue = v12->super._userQueue;
      v12->super._dispatch_queue_t userQueue = v18;

      uint64_t v66 = 0LL;
      v67 = &v66;
      uint64_t v68 = 0x2050000000LL;
      v20 = (void *)qword_100022658;
      uint64_t v69 = qword_100022658;
      if (!qword_100022658)
      {
        state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
        state.opaque[1] = 3221225472LL;
        v63 = sub_10000CA7C;
        v64 = &unk_10001C740;
        v65 = &v66;
        sub_10000CA7C((uint64_t)&state);
        v20 = (void *)v67[3];
      }

      id v21 = v20;
      _Block_object_dispose(&v66, 8);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 defaultConfiguration]);
      uint64_t v66 = 0LL;
      v67 = &v66;
      uint64_t v68 = 0x2050000000LL;
      v23 = (void *)qword_100022668;
      uint64_t v69 = qword_100022668;
      if (!qword_100022668)
      {
        state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
        state.opaque[1] = 3221225472LL;
        v63 = sub_10000CB30;
        v64 = &unk_10001C740;
        v65 = &v66;
        sub_10000CB30((uint64_t)&state);
        v23 = (void *)v67[3];
      }

      v24 = v23;
      _Block_object_dispose(&v66, 8);
      id v25 = objc_alloc_init(v24);
      [*p_reserved2 setReadConcurrently:1];
      [v25 setInteractionStore:*p_reserved2];
      [v25 setKnowledgeStore:v7];
      policies = v12->_policies;
      v12->_policies = (_CDInteractionPolicies *)v25;
      id v27 = v25;

      [v22 setSuggestionModel:v12->_policies];
      v28 = -[_PSSuggester initWithConfiguration:]( objc_alloc(&OBJC_CLASS____PSSuggester),  "initWithConfiguration:",  v22);
      dataProtection = v12->_dataProtection;
      v12->_dataProtection = v28;

      -[CDPeopleDaemon populatePeopleSuggesterCaches](v12, "populatePeopleSuggesterCaches");
    }
  }

  else
  {
    v60.receiver = self;
    v60.super_class = (Class)&OBJC_CLASS___CDPeopleDaemon;
    v12 = -[CDPeopleDaemon initWithMachServiceName:](&v60, "initWithMachServiceName:", v11);

    if (v12)
    {
      objc_storeStrong(&v12->super._reserved2, a4);
      objc_storeStrong((id *)&v12->_advisor, a3);
      v30 = objc_alloc_init(&OBJC_CLASS____DKDataProtectionStateMonitor);
      dispatch_queue_t v31 = v12->super._userQueue;
      v12->super._dispatch_queue_t userQueue = v30;

      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[_CDInteractionAdviceEngine interactionAdviceEngineWithStore:]( &OBJC_CLASS____CDInteractionAdviceEngine,  "interactionAdviceEngineWithStore:",  v12->super._reserved2));
      xconnection = v12->super._xconnection;
      v12->super._xconnection = (void *)v32;

      -[CDPeopleDaemon setDelegate:](v12, "setDelegate:", v12);
      uint64_t v34 = objc_claimAutoreleasedReturnValue(+[_CDInteractionPolicies interactionPolicies](&OBJC_CLASS____CDInteractionPolicies, "interactionPolicies"));
      reserved0 = v12->super.reserved0;
      v12->super.reserved0 = (void *)v34;

      dispatch_queue_attr_t v36 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v37 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v36);
      dispatch_queue_t v38 = dispatch_queue_create("com.apple.coreduetd.people.work", v37);
      id v39 = v12->super._delegate;
      v12->super._id delegate = v38;

      -[CDPeopleDaemon setupDataProtectionChangeHandler](v12, "setupDataProtectionChangeHandler");
      -[CDPeopleDaemon versionCheckAndUpgradeIfNecessaryAndPossible]( v12,  "versionCheckAndUpgradeIfNecessaryAndPossible");
      -[CDPeopleDaemon populatePeopleSuggesterCaches](v12, "populatePeopleSuggesterCaches");
      [v12->super._reserved2 closeStorage];
      objc_initWeak((id *)&state, v12);
      uint64_t v40 = _CDInteractionMachServiceName;
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472LL;
      v58[2] = sub_100007254;
      v58[3] = &unk_10001C628;
      objc_copyWeak(&v59, (id *)&state);
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[_CDPeriodicSchedulerJob jobWithPeriod:schedulerJobName:handler:]( &OBJC_CLASS____CDPeriodicSchedulerJob,  "jobWithPeriod:schedulerJobName:handler:",  2LL,  v40,  v58));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicScheduler sharedInstance](&OBJC_CLASS____CDPeriodicScheduler, "sharedInstance"));
      [v42 registerJob:v41];

      objc_destroyWeak(&v59);
      objc_destroyWeak((id *)&state);
    }
  }

  if (LOBYTE(v12->super._reserved1))
  {
    objc_initWeak((id *)&state, v12);
    if (LOBYTE(v12->super._reserved1)) {
      v43 = @"com.apple.coreduet.knowledge-agent.people.refresh-cache";
    }
    else {
      v43 = @"com.apple.coreduetd.people.refresh-cache";
    }
    v44 = v43;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000072E0;
    v56[3] = &unk_10001C628;
    objc_copyWeak(&v57, (id *)&state);
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[_CDPeriodicSchedulerJob jobWithPeriod:schedulerJobName:handler:]( &OBJC_CLASS____CDPeriodicSchedulerJob,  "jobWithPeriod:schedulerJobName:handler:",  1LL,  v44,  v56));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPeriodicScheduler sharedInstance](&OBJC_CLASS____CDPeriodicScheduler, "sharedInstance"));
    [v46 registerJob:v45];

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)&state);
  }

  dispatch_queue_attr_t v47 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v48 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v47);
  dispatch_queue_t v49 = dispatch_queue_create("com.apple.peopleSuggestionQueue", v48);
  serviceName = v12->super._serviceName;
  v12->super._serviceName = (NSString *)v49;

  dispatch_queue_attr_t v51 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v52 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v51);
  dispatch_queue_t v53 = dispatch_queue_create("com.apple.appExtensionQueue", v52);
  v54 = (void *)v12->super._state;
  v12->super._os_activity_scope_state_s state = (uint64_t)v53;

  -[CDPeopleDaemon resume](v12, "resume");
  return v12;
}

- (id)workQueue
{
  return self->super._delegate;
}

- (void)setupDataProtectionChangeHandler
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100007428;
  v3[3] = &unk_10001C650;
  objc_copyWeak(&v4, &location);
  -[dispatch_queue_s setChangeHandler:](self->super._userQueue, "setChangeHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)populatePeopleSuggesterCaches
{
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000116DC();
    }
  }

  else
  {
    id v4 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.populatePeopleSuggesterCaches",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v4, &state);
    os_activity_scope_leave(&state);

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    v3 = (os_log_s *)dispatch_queue_create("com.apple.coreduet.PeopleSuggesterAppAndPeopleCache", v6);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000076D0;
    block[3] = &unk_10001C678;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v3, block);
  }
}

- (void)refreshPeopleSuggesterCaches
{
  if (!-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    [v3 refreshCaches];
  }

- (void)handleError:(id)a3
{
  id v4 = a3;
  if (v4
    && +[_CDErrorUtilities isCoreDataFatalError:]( &OBJC_CLASS____CDErrorUtilities,  "isCoreDataFatalError:",  v4))
  {
    id delegate = self->super._delegate;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100007918;
    v10[3] = &unk_10001C6A0;
    id v11 = v4;
    v12 = self;
    v6 = v10;
    id v7 = (dispatch_queue_s *)delegate;
    id v8 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000CBE4;
    block[3] = &unk_10001C780;
    id v14 = v8;
    id v15 = v6;
    id v9 = v8;
    dispatch_async(v7, block);
  }
}

- (int64_t)readVersionNumberFromDefaults
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = [v2 integerForKey:@"InteractionStoreVersion"];

  return (int64_t)v3;
}

- (void)writeVersionNumberToDefaults:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setInteger:a3 forKey:@"InteractionStoreVersion"];
  [v4 synchronize];
}

- (BOOL)versionCheckAndUpgradeIfNecessaryAndPossible
{
  if ((id)-[CDPeopleDaemon readVersionNumberFromDefaults](self, "readVersionNumberFromDefaults") == (id)1) {
    return 1;
  }
  if (!-[dispatch_queue_s isDataAvailableFor:]( self->super._userQueue,  "isDataAvailableFor:",  NSFileProtectionCompleteUntilFirstUserAuthentication)) {
    return 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007BA8;
  block[3] = &unk_10001C678;
  void block[4] = self;
  if (qword_100022650 != -1) {
    dispatch_once(&qword_100022650, block);
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100011708();
  }

  BOOL v3 = 1;
  -[CDPeopleDaemon writeVersionNumberToDefaults:](self, "writeVersionNumberToDefaults:", 1LL);
  return v3;
}

- (BOOL)adjustPosixPermissionsForStorage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 directory]);
  v47[0] = v4;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseName]);
  v47[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));

  id v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@C.db", v7));
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@C.db-wal", v7));
  -[NSMutableArray addObject:](v8, "addObject:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@C.db-shm", v7));
  -[NSMutableArray addObject:](v8, "addObject:", v11);

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  obj = v8;
  id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
  if (!v12)
  {
    id v14 = 0LL;
    BOOL v32 = 1;
    goto LABEL_30;
  }

  id v13 = v12;
  uint64_t v34 = v7;
  id v35 = v3;
  id v14 = 0LL;
  uint64_t v15 = *(void *)v41;
  dispatch_queue_t v16 = &BMUseCaseConnectionProxy_ptr;
  while (2)
  {
    v17 = 0LL;
    id v36 = v13;
    do
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v16[13] defaultManager]);
      unsigned __int8 v20 = [v19 fileExistsAtPath:v18];

      if ((v20 & 1) != 0)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v16[13] defaultManager]);
        id v39 = v14;
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 attributesOfItemAtPath:v18 error:&v39]);
        id v23 = v39;

        if (!v22)
        {
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000118E4();
          }
          id v14 = v23;
          goto LABEL_28;
        }

        if (-[os_log_s filePosixPermissions](v22, "filePosixPermissions") == (id)420)
        {
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = v18;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "DB file %@ has correct POSIX permissions.",  buf,  0xCu);
          }

          id v14 = v23;
          goto LABEL_18;
        }

        id v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 420LL));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v25,  "setObject:forKeyedSubscript:",  v26,  NSFilePosixPermissions);

        id v27 = v16;
        v28 = (void *)objc_claimAutoreleasedReturnValue([v16[13] defaultManager]);
        id v38 = v23;
        unsigned __int8 v29 = [v28 setAttributes:v25 ofItemAtPath:v18 error:&v38];
        id v14 = v38;

        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
        dispatch_queue_t v31 = v30;
        if ((v29 & 1) == 0)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_100011944();
          }

LABEL_28:
          BOOL v32 = 0;
          goto LABEL_29;
        }

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Changed POSIX permission of %@ to 0644.",  buf,  0xCu);
        }

        id v13 = v36;
        dispatch_queue_t v16 = v27;
      }

      else
      {
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "DB file %@ does not exist. Skipping POSIX permissions check.",  buf,  0xCu);
        }
      }

+ (BOOL)writeRepopulationCheckpoint:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;

  [v4 setDouble:@"InteractionRepopluationCheckpoint" forKey:v6];
  [v4 synchronize];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000119A4();
  }

  return 1;
}

+ (id)readRepopulationCheckpoint
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 synchronize];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000119D0();
  }

  [v2 doubleForKey:@"InteractionRepopluationCheckpoint"];
  if (v4 == 0.0) {
    double v5 = 0LL;
  }
  else {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  return v5;
}

- (BOOL)requestInteractionRepopulation
{
  return 1;
}

- (BOOL)isClassCLocked
{
  return -[dispatch_queue_s isDataAvailableFor:]( self->super._userQueue,  "isDataAvailableFor:",  NSFileProtectionCompleteUntilFirstUserAuthentication) ^ 1;
}

- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v11[2](v11, 0LL);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [self->super.reserved0 filterAndModifyInteractionsWithPolicies:v10 enforceDataLimits:v8 enforcePrivacy:v7]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v12 count];
      uint64_t v15 = _CDCurrentOrXPCProcessName();
      dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 134218242;
      id v22 = v14;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Saving %lu interactions for client %{public}@",  buf,  0x16u);
    }

    id reserved2 = self->super._reserved2;
    id v20 = 0LL;
    id v18 = [reserved2 recordInteractions:v12 error:&v20];
    id v19 = v20;
    ((void (**)(id, id))v11)[2](v11, v18);
    -[CDPeopleDaemon handleError:](self, "handleError:", v19);
  }
}

- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v11[2](v11, 0LL);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [self->super.reserved0 filterAndModifyInteractionsWithPolicies:v10 enforceDataLimits:v8 enforcePrivacy:v7]);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v12 count];
      uint64_t v15 = _CDCurrentOrXPCProcessName();
      dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 134218242;
      id v22 = v14;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Updating %lu interactions for client %{public}@",  buf,  0x16u);
    }

    id reserved2 = self->super._reserved2;
    id v20 = 0LL;
    id v18 = [reserved2 updateInteractions:v12 error:&v20];
    id v19 = v20;
    ((void (**)(id, id))v11)[2](v11, v18);
    -[CDPeopleDaemon handleError:](self, "handleError:", v19);
  }
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = _CDCurrentOrXPCProcessName();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      id v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Querying interactions for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    _DWORD v17[2] = sub_10000885C;
    v17[3] = &unk_10001C6C8;
    id v18 = v12;
    objc_copyWeak(&v19, (id *)buf);
    [reserved2 queryInteractionsUsingPredicate:v10 sortDescriptors:v11 limit:a5 completionHandler:v17];
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = _CDCurrentOrXPCProcessName();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      id v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Querying contacts for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    _DWORD v17[2] = sub_100008AD4;
    v17[3] = &unk_10001C6C8;
    id v18 = v12;
    objc_copyWeak(&v19, (id *)buf);
    [reserved2 queryContactsUsingPredicate:v10 sortDescriptors:v11 limit:a5 completionHandler:v17];
    objc_destroyWeak(&v19);

    objc_destroyWeak((id *)buf);
  }
}

- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

  else
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543362;
      dispatch_queue_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Counting interactions for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100008D28;
    v12[3] = &unk_10001C6F0;
    id v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    [reserved2 countInteractionsUsingPredicate:v6 completionHandler:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
}

- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

  else
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543362;
      dispatch_queue_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Counting contacts for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100008F70;
    v12[3] = &unk_10001C6F0;
    id v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    [reserved2 countContactsUsingPredicate:v6 completionHandler:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0LL, 0LL);
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = _CDCurrentOrXPCProcessName();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Deleting interactions matching predicate for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v17 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v18 = _CDCurrentOrXPCProcessName();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = -[NSString initWithFormat:](v17, "initWithFormat:", @"for client %@", v19);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100009224;
    v21[3] = &unk_10001C6F0;
    id v22 = v12;
    objc_copyWeak(&v23, (id *)buf);
    [reserved2 deleteInteractionsMatchingPredicate:v10 sortDescriptors:v11 limit:a5 debuggingReason:v20 completionHandler:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

  else
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543362;
      dispatch_queue_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Deleting interactions with bundle id for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000946C;
    v12[3] = &unk_10001C6F0;
    id v13 = v7;
    objc_copyWeak(&v14, (id *)buf);
    [reserved2 deleteInteractionsWithBundleId:v6 completionHandler:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Deleting interactions with bundle id and account for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000096C8;
    v15[3] = &unk_10001C6F0;
    id v16 = v10;
    objc_copyWeak(&v17, (id *)buf);
    [reserved2 deleteInteractionsWithBundleId:v8 account:v9 completionHandler:v15];
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Deleting interactions with bundle id and domain for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100009924;
    v15[3] = &unk_10001C6F0;
    id v16 = v10;
    objc_copyWeak(&v17, (id *)buf);
    [reserved2 deleteInteractionsWithBundleId:v8 domainIdentifier:v9 completionHandler:v15];
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      id v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Deleting interactions with bundle id and domains for client %{public}@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    id reserved2 = self->super._reserved2;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100009B80;
    v15[3] = &unk_10001C6F0;
    id v16 = v10;
    objc_copyWeak(&v17, (id *)buf);
    [reserved2 deleteInteractionsWithBundleId:v8 domainIdentifiers:v9 completionHandler:v15];
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }
}

- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  unsigned int v11 = -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000119FC();
    }

    [v8 setSuggestionPath:@"suggestionPathClassCLocked"];
    v10[2](v10, &__NSArray0__struct, v8);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = _CDCurrentOrXPCProcessName();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Suggesting interactions for client %{public}@",  buf,  0xCu);
    }

    serviceName = (dispatch_queue_s *)self->super._serviceName;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    _DWORD v17[2] = sub_100009DD8;
    v17[3] = &unk_10001C718;
    void v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    dispatch_async(serviceName, v17);
  }
}

- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned int v8 = -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000119FC();
    }

    v7[2](v7, &__NSArray0__struct);
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = _CDCurrentOrXPCProcessName();
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v15 = 138543362;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Suggesting extensions for client %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon suggester](self, "suggester"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appExtensionSuggestionsFromContext:v6]);
    v7[2](v7, v14);

    id v7 = (void (**)(id, void *))v13;
  }
}

- (void)candidatesForShareSheetRanking:(id)a3
{
  double v4 = (void (**)(void))a3;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    id v10 = objc_opt_new(&OBJC_CLASS___NSSet);
    v4[2](v4);
  }

  else
  {
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = _CDCurrentOrXPCProcessName();
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Fetching candidates for Share Sheet ranking for client %{public}@",  buf,  0xCu);
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon suggester](self, "suggester"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 candidatesForShareSheetRankingCompute]);
    ((void (*)(void (**)(void), void *))v4[2])(v4, v9);
  }

- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSDictionary0__struct);
  }

  else
  {
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Fetching ephemeral features for Share Sheet for client: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 computeEphemeralFeaturesWithPredictionContext:v6]);
    v7[2](v7, v12);
  }
}

- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, id))a5;
  id v10 = a4;
  unsigned int v11 = -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
  int v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Could not Validate CoreML model as device is class C locked",  (uint8_t *)&v18,  2u);
    }

    v9[2](v9, v10);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = _CDCurrentOrXPCProcessName();
      int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v18 = 138543362;
      id v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Validating CoreML model for client %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 validateCoreMLModelWithRawInput:v8 predictionContext:v10]);

    v9[2](v9, (id)v17);
    uint64_t v9 = (void (**)(id, id))v17;
    id v10 = v16;
  }
}

- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Suggesting maps for client %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "predictWithMapsPredictionContext:maxSuggestions:",  v8,  objc_msgSend(v9, "integerValue")));
    v10[2](v10, v15);
  }
}

- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Suggesting zero keyword for client %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "suggestZKWSuggestionsWithPredictionContext:maxSuggestions:",  v8,  objc_msgSend(v9, "integerValue")));
    v10[2](v10, v15);
  }
}

- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Suggesting autocomplete for client %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 autocompleteSearchResultsWithPredictionContext:v6]);
    v7[2](v7, v12);
  }
}

- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Suggesting ranked names for client %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rankedNameSuggestionsWithPredictionContext:v8 name:v9]);
    v10[2](v10, v15);
  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void *))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v12[2](v12, &__NSArray0__struct);
  }

  else
  {
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = _CDCurrentOrXPCProcessName();
      int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v18 = 138543362;
      id v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Suggesting ranked global suggestions for client %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:",  v10,  v8,  objc_msgSend(v11, "integerValue")));
    v12[2](v12, v17);
  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void *))a7;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v14[2](v14, &__NSArray0__struct);
  }

  else
  {
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = _CDCurrentOrXPCProcessName();
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      int v20 = 138543362;
      id v21 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Suggesting ranked global suggestions with backfill option for client %{public}@",  (uint8_t *)&v20,  0xCu);
    }

    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v18,  "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:",  v12,  v10,  objc_msgSend(v13, "integerValue"),  v8));
    v14[2](v14, v19);
  }
}

- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v13[2](v13, &__NSArray0__struct);
  }

  else
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = _CDCurrentOrXPCProcessName();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v19 = 138543362;
      int v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Suggesting ranked global suggestions for client %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v17,  "rankedGlobalSuggestionsForSiriNLWithPredictionContext:maxSuggestions:interactionId:",  v10,  objc_msgSend(v11, "integerValue"),  v12));
    v13[2](v13, v18);
  }
}

- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Suggesting ranked autocomplete suggestions for client %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rankedAutocompleteSuggestionsFromContext:v8 candidates:v9]);
    v10[2](v10, v15);
  }
}

- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4
{
  double v5 = (void (**)(id, void *))a4;
  -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v5[2](v5, &__NSArray0__struct);
}

- (void)rankedFamilySuggestionsWithReply:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v4[2](v4, &__NSArray0__struct);
}

- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  double v5 = (void (**)(id, void *))a4;
  -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v5[2](v5, &__NSArray0__struct);
}

- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  double v5 = (void (**)(id, void *))a4;
  -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v5[2](v5, &__NSArray0__struct);
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  double v5 = (void (**)(id, void *))a4;
  -[CDPeopleDaemon isClassCLocked](self, "isClassCLocked");
  v5[2](v5, &__NSArray0__struct);
}

- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSDictionary0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Ranked Siri Handle Suggestions for client %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rankedSiriMLCRHandles:v9 context:v8]);
    v10[2](v10, v15);
  }
}

- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSDictionary0__struct);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Ranked Handle Suggestions for client %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon ensembleModel](self, "ensembleModel"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 rankedHandlesFromCandidateHandles:v6]);
    v7[2](v7, v12);
  }
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSDictionary0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v17 = 138543362;
      int v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "App Usage Distribution for client %{public}@",  (uint8_t *)&v17,  0xCu);
    }

    id v14 = [v9 integerValue];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon knowledgeStore](self, "knowledgeStore"));
    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[_PSAppUsageUtilities relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:knowledgeStore:]( &OBJC_CLASS____PSAppUsageUtilities,  "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:knowledgeStore:",  v8,  v14,  v15));
    v10[2](v10, v16);
  }
}

- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v16 = 138543362;
      int v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Contact suggestions for client %{public}@",  (uint8_t *)&v16,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon contactSuggester](self, "contactSuggester"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:",  objc_msgSend(v8, "integerValue"),  v9));
    v10[2](v10, v15);
  }
}

- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v15 = 138543362;
      int v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Ranking candidates for client %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([self->super._xconnection rankCandidateContacts:v8 usingSettings:v9]);
    v10[2](v10, v14);
  }
}

- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v7[2](v7, &__NSArray0__struct);
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = _CDCurrentOrXPCProcessName();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v12 = 138543362;
      int v13 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Advising interactions with people for client %{public}@",  (uint8_t *)&v12,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([self->super._xconnection adviseInteractionsUsingSettings:v6]);
    v7[2](v7, v11);
  }
}

- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v15 = 138543362;
      int v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Advising interactions with people using time of day for client %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([self->super._xconnection adviseInteractionsForDate:v8 usingSettings:v9]);
    v10[2](v10, v14);
  }
}

- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v10[2](v10, &__NSArray0__struct);
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = _CDCurrentOrXPCProcessName();
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v15 = 138543362;
      int v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Advising interactions with people using a query for client %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( [self->super._xconnection adviseInteractionsForKeywordsInString:v8 usingSettings:v9]);
    v10[2](v10, v14);
  }
}

- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void *))a6;
  if (-[CDPeopleDaemon isClassCLocked](self, "isClassCLocked"))
  {
    v13[2](v13, &__NSArray0__struct);
  }

  else
  {
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = _CDCurrentOrXPCProcessName();
      int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      int v18 = 138543362;
      int v19 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Advising interactions with people using social cues for client %{public}@",  (uint8_t *)&v18,  0xCu);
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue( [self->super._xconnection adviseSocialInteractionsForDate:v10 andSeedContacts:v11 usingSettings:v12]);
    v13[2](v13, v17);
  }
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = _CDCurrentOrXPCProcessName();
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = 138543362;
    uint64_t v15 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Tuning social advisor for client %{public}@",  (uint8_t *)&v14,  0xCu);
  }

  [self->super._xconnection tuneSocialAdvisorUsingSettings:v10 heartBeatHandler:v9];
  v8[2](v8);
}

- (void)maintainPrivacy
{
  id v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.maintainPrivacy",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  id delegate = self->super._delegate;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000BE90;
  v9[3] = &unk_10001C678;
  v9[4] = self;
  double v5 = v9;
  id v6 = (dispatch_queue_s *)delegate;
  id v7 = (void *)os_transaction_create("cd_dispatch_async_tx");
  state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
  state.opaque[1] = 3221225472LL;
  id v11 = sub_10000CBE4;
  uint64_t v12 = &unk_10001C780;
  id v13 = v7;
  id v14 = v5;
  id v8 = v7;
  dispatch_async(v6, &state);
}

- (void)_maintainPrivacy
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100011BBC();
  }

  kdebug_trace(725024896LL, 0LL, 0LL, 0LL, 0LL);
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionSignpost](&OBJC_CLASS____CDLogging, "interactionSignpost"));
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "MaintainPrivacy",  " enableTelemetry=YES ",  buf,  2u);
  }

  p_reserved0 = &self->super.reserved0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([self->super.reserved0 whitelistedFirstPartyBundleIds]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([self->super.reserved0 dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"bundleId IN %@ AND startDate < %@",  v6,  v7));

  id v9 = (char *)objc_msgSend( self->super._reserved2,  "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:",  v8,  &__NSArray0__struct,  objc_msgSend(self->super.reserved0, "maxNumberOfInteractionsDeleted"),  @"_maintainPrivacy allowlisted first party deletion predicate",  0);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100011B38(&self->super.reserved0);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*p_reserved0 whitelistedFirstPartyBundleIds]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*p_reserved0 dateOfOldestAllowedInteraction]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"NOT(bundleId IN %@) AND startDate < %@",  v11,  v12));

  id v14 = objc_msgSend( self->super._reserved2,  "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:",  v13,  &__NSArray0__struct,  objc_msgSend(*p_reserved0, "maxNumberOfInteractionsDeleted"),  @"_maintainPrivacy denylisted apps deletion predicate",  0);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100011AB4(&self->super.reserved0);
  }
  int v16 = &v9[(void)v14];

  id v17 = objc_msgSend( self->super._reserved2,  "deleteOldInteractionsIfNeededToLimitTotalNumber:limit:",  objc_msgSend(*p_reserved0, "maxNumberOfInteractionsStored"),  objc_msgSend(*p_reserved0, "maxNumberOfInteractionsDeleted"));
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100011A28(&self->super.reserved0);
  }

  -[CDPeopleDaemon reportPeopleStatistics](self, "reportPeopleStatistics");
  [self->super._reserved2 closeStorage];
  kdebug_trace(725024900LL, v16, v17, 0LL, 0LL);
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionSignpost](&OBJC_CLASS____CDLogging, "interactionSignpost"));
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134349568;
    id v21 = v16;
    __int16 v22 = 2050;
    id v23 = v17;
    __int16 v24 = 2050;
    uint64_t v25 = 0LL;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "MaintainPrivacy",  "LifespanLimitDeleted=%{signpost.telemetry:number1,public}lu TotalLimitDeleted=%{signpost.telemetry:number2,public} lu UserDoesNotExistDeleted=%{signpost.telemetry:number3,public}lu",  buf,  0x20u);
  }
}

- (void)populateAppUsageCache
{
  id v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.populateAppUsageCache",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  id v4 = sub_10000C324();
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeopleDaemon knowledgeStore](self, "knowledgeStore"));
  [v4 cacheAppUsageDurations:v5];
}

- (void)populateAppSharesCache
{
  unsigned int v2 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.populateAppSharesCache",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v3);
  os_activity_scope_leave(&v3);

  [sub_10000C324() cacheSharesForEachApp];
}

- (void)logSizeOfStorage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 directory]);
  v22[0] = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 databaseName]);

  v22[1] = v5;
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));

  id v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@C.db", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 attributesOfItemAtPath:v8 error:0]);

  if (v10)
  {
    id v11 = (char *)[v10 fileSize];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@C.db-wal", v7));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 attributesOfItemAtPath:v12 error:0]);

    if (v14)
    {
      uint64_t v15 = &v11[(void)[v14 fileSize]];
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        int v19 = v8;
        __int16 v20 = 2048;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "DatabaseSize for %@: %lluB", buf, 0x16u);
      }

      if (v15)
      {
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionSignpost](&OBJC_CLASS____CDLogging, "interactionSignpost"));
        if (os_signpost_enabled(v17))
        {
          *(_DWORD *)buf = 134349056;
          int v19 = v15;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "DatabaseSize",  "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ",  buf,  0xCu);
        }

        +[_CDDiagnosticDataReporter setValue:forScalarKey:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "setValue:forScalarKey:",  v15,  @"com.apple.coreduet.interactionStore.databaseSize");
      }
    }
  }
}

- (void)reportPeopleStatistics
{
  id v3 = _os_activity_create( (void *)&_mh_execute_header,  "Duet: com.apple.coreduetd.reportPeopleStatistics",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([self->super._reserved2 interactionCountPerMechanism]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
        id v12 = [v11 unsignedIntegerValue];

        v7 += (uint64_t)v12;
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.coreduet.interactionStore",  v10));
        +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "setValue:forScalarKey:limitingSigDigs:",  v12,  v13,  2LL);
      }

      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.total",  @"com.apple.coreduet.interactionStore"));
  +[_CDDiagnosticDataReporter setValue:forScalarKey:limitingSigDigs:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "setValue:forScalarKey:limitingSigDigs:",  v7,  v14,  2LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([self->super._reserved2 storage]);
  -[CDPeopleDaemon logSizeOfStorage:](self, "logSizeOfStorage:", v15);
}

- (_CDInteractionStore)store
{
  return (_CDInteractionStore *)self->super._reserved2;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_advisor;
}

- (_PSSuggester)suggester
{
  return self->_dataProtection;
}

- (_PSEnsembleModel)ensembleModel
{
  return self->_policies;
}

- (_PSFamilyRecommender)familyRecommender
{
  return self->_workQueue;
}

- (_PSMessagesPinningSuggester)messagesPinningSuggester
{
  return self->_peopleSuggestionQueue;
}

- (_PSContactSuggester)contactSuggester
{
  return self->_appExtensionQueue;
}

- (BOOL)isKnowledgeAgent
{
  return (BOOL)self->super._reserved1;
}

- (void)setIsKnowledgeAgent:(BOOL)a3
{
  LOBYTE(self->super._reserved1) = a3;
}

- (void).cxx_destruct
{
}

@end