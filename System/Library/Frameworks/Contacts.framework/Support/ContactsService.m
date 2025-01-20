@interface ContactsService
+ (Class)dataMapperClassForConnection:(id)a3;
+ (id)managedConfigurationForConnection:(id)a3;
- (BOOL)clientAllowedToUseSPI:(id *)a3;
- (BOOL)shouldNotReportFavoritesError:(id)a3;
- (CNAccessAuthorization)accessAuthorization;
- (CNContactStore)contactStore;
- (CNContactsEnvironment)environment;
- (CNContactsLogger)logger;
- (CNDataMapperConfiguration)dataMapperConfiguration;
- (CNQueryAnalyticsLogger)queryAnalyticsLogger;
- (CNRegulatoryLogger)regulatoryLogger;
- (CNScheduler)highPriorityWorkQueue;
- (CNScheduler)workQueue;
- (CNiOSAddressBookDataMapper)dataMapper;
- (ContactsService)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4 workQueue:(id)a5 highPriorityWorkQueue:(id)a6 connection:(id)a7 accessAuthorization:(id)a8;
- (ContactsService)initWithWorkQueue:(id)a3 highPriorityWorkQueue:(id)a4 connection:(id)a5;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)backgroundColorQueue;
- (OS_tcc_identity)assumedIdentity;
- (id)_bestWorkQueueForAuditToken:(id *)a3;
- (id)unitTestBaseURLWithOptions:(id)a3;
- (void)accountsMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)analyzeDatabaseWithReply:(id)a3;
- (void)authorizedKeysForContactKeys:(id)a3 withReply:(id)a4;
- (void)changeHistoryWithFetchRequest:(id)a3 withReply:(id)a4;
- (void)configureServiceWithOptions:(id)a3;
- (void)configureUnitTestWithOptions:(id)a3;
- (void)contactCountForFetchRequest:(id)a3 withReply:(id)a4;
- (void)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4 withReply:(id)a5;
- (void)contactsForFetchRequest:(id)a3 withMatchInfoReply:(id)a4;
- (void)containersMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)currentHistoryAnchorWithReply:(id)a3;
- (void)currentHistoryTokenWithReply:(id)a3;
- (void)defaultContainerIdentifierWithReply:(id)a3;
- (void)encodedContactsAndCursorForFetchRequest:(id)a3 withReply:(id)a4;
- (void)executeChangeHistoryClearRequest:(id)a3 withReply:(id)a4;
- (void)executeSaveRequest:(id)a3 withReply:(id)a4;
- (void)favoritesEntryDictionariesAtPath:(id)a3 withReply:(id)a4;
- (void)groupsMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)identifierWithReply:(id)a3;
- (void)meContactIdentifiersWithReply:(id)a3;
- (void)performAsyncWorkWithDataMapper:(id)a3;
- (void)performServicingRequestWork:(id)a3;
- (void)performWorkServicingSPI:(id)a3 authenticationFailureHandler:(id)a4;
- (void)performWorkWithContactStore:(id)a3;
- (void)performWorkWithDataMapper:(id)a3;
- (void)policyForContainerWithIdentifier:(id)a3 withReply:(id)a4;
- (void)progressiveContactsForFetchRequest:(id)a3 progressHandler:(id)a4 reply:(id)a5;
- (void)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 withReply:(id)a4;
- (void)reportFavoritesIssue:(id)a3;
- (void)sectionListOffsetsForSortOrder:(int64_t)a3 reply:(id)a4;
- (void)serverSearchContainersMatchingPredicate:(id)a3 withReply:(id)a4;
- (void)setAssumedIdentity:(id)a3;
- (void)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 withReply:(id)a6;
- (void)setDataMapper:(id)a3;
- (void)setDefaultAccountIdentifier:(id)a3 withReply:(id)a4;
- (void)setMeContact:(id)a3 forContainer:(id)a4 withReply:(id)a5;
- (void)setMeContact:(id)a3 withReply:(id)a4;
- (void)setQueryAnalyticsLogger:(id)a3;
- (void)setRegulatoryLogger:(id)a3;
- (void)shouldAnalyzeDatabaseWithReply:(id)a3;
- (void)subgroupsOfGroupWithIdentifier:(id)a3 withReply:(id)a4;
- (void)unifiedContactCountWithReply:(id)a3;
- (void)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5;
- (void)userActivityForContact:(id)a3 withReply:(id)a4;
- (void)verifyIndexWithReply:(id)a3;
- (void)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 withReply:(id)a5;
@end

@implementation ContactsService

- (ContactsService)initWithWorkQueue:(id)a3 highPriorityWorkQueue:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }

  else
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
  }

  v26[0] = v27;
  v26[1] = v28;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNAuditToken auditToken:](&OBJC_CLASS___CNAuditToken, "auditToken:", v26));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactsEnvironment currentEnvironment](&OBJC_CLASS___CNContactsEnvironment, "currentEnvironment"));
  id v16 = objc_msgSend((id)objc_opt_class(self, v14, v15), "managedConfigurationForConnection:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = -[CNAccessAuthorization initWithAuditToken:]( objc_alloc(&OBJC_CLASS___CNAccessAuthorization),  "initWithAuditToken:",  v12);
  v19 = objc_alloc_init(&OBJC_CLASS___CNDataMapperConfiguration);
  -[CNDataMapperConfiguration setEnvironment:](v19, "setEnvironment:", v13);
  -[CNDataMapperConfiguration setManagedConfiguration:](v19, "setManagedConfiguration:", v17);
  -[CNDataMapperConfiguration setIdentifierAuditMode:](v19, "setIdentifierAuditMode:", 1LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CNAccessAuthorization authorizer](v18, "authorizer"));
  -[CNDataMapperConfiguration setAuthorizationContext:](v19, "setAuthorizationContext:", v20);

  id v23 = objc_msgSend( objc_alloc((Class)objc_msgSend((id)objc_opt_class(self, v21, v22), "dataMapperClassForConnection:", v11)),  "initWithConfiguration:",  v19);
  v24 = -[ContactsService initWithDataMapper:dataMapperConfiguration:workQueue:highPriorityWorkQueue:connection:accessAuthorization:]( self,  "initWithDataMapper:dataMapperConfiguration:workQueue:highPriorityWorkQueue:connection:accessAuthorization:",  v23,  v19,  v8,  v9,  v11,  v18);

  return v24;
}

- (ContactsService)initWithDataMapper:(id)a3 dataMapperConfiguration:(id)a4 workQueue:(id)a5 highPriorityWorkQueue:(id)a6 connection:(id)a7 accessAuthorization:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v36 = a5;
  id v35 = a6;
  id v17 = a7;
  id v34 = a8;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___ContactsService;
  v18 = -[ContactsService init](&v38, "init");
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 environment]);
    objc_storeStrong((id *)&v18->_dataMapper, a3);
    v20 = (CNContactStore *)[[CNDataMapperContactStore alloc] initWithDataMapper:v15 dataMapperConfiguration:v16];
    contactStore = v18->_contactStore;
    v18->_contactStore = v20;

    objc_storeStrong((id *)&v18->_workQueue, a5);
    objc_storeStrong((id *)&v18->_highPriorityWorkQueue, a6);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 loggerProvider]);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 contactsLogger]);
    logger = v18->_logger;
    v18->_logger = (CNContactsLogger *)v23;

    objc_storeStrong((id *)&v18->_environment, v19);
    objc_storeWeak((id *)&v18->_connection, v17);
    objc_storeStrong((id *)&v18->_accessAuthorization, a8);
    dispatch_queue_t v25 = dispatch_queue_create("contactsBackgroundColorQueue", 0LL);
    backgroundColorQueue = v18->_backgroundColorQueue;
    v18->_backgroundColorQueue = (OS_dispatch_queue *)v25;

    if (v17) {
      [v17 auditToken];
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[CNAuditToken auditToken:](&OBJC_CLASS___CNAuditToken, "auditToken:", v37));
    __int128 v28 = -[CNRegulatoryLogger initWithAuditToken:assumedIdentity:]( objc_alloc(&OBJC_CLASS___CNRegulatoryLogger),  "initWithAuditToken:assumedIdentity:",  v27,  0LL);
    regulatoryLogger = v18->_regulatoryLogger;
    v18->_regulatoryLogger = v28;

    v30 = -[CNQueryAnalyticsLogger initWithAuditToken:assumedIdentity:]( objc_alloc(&OBJC_CLASS___CNQueryAnalyticsLogger),  "initWithAuditToken:assumedIdentity:",  v27,  0LL);
    queryAnalyticsLogger = v18->_queryAnalyticsLogger;
    v18->_queryAnalyticsLogger = v30;

    objc_storeStrong((id *)&v18->_dataMapperConfiguration, a4);
    v32 = v18;
  }

  return v18;
}

+ (id)managedConfigurationForConnection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CNManagedConfiguration);
  if (v3)
  {
    [v3 auditToken];
  }

  else
  {
    __int128 v8 = 0u;
    __int128 v9 = 0u;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[CNManagedProfileConnection sharedConnection]( &OBJC_CLASS___CNManagedProfileConnection,  "sharedConnection",  v8,  v9));
  id v6 = [v4 initWithAuditToken:&v8 managedProfileConnection:v5];

  return v6;
}

+ (Class)dataMapperClassForConnection:(id)a3
{
  return (Class)objc_opt_class(&OBJC_CLASS___CNiOSAddressBookDataMapper, a2, a3);
}

- (void)configureServiceWithOptions:(id)a3
{
  id v4 = a3;
  -[ContactsService configureUnitTestWithOptions:](self, "configureUnitTestWithOptions:", v4);
  -[ContactsService configureAssumedIdentityWithOptions:](self, "configureAssumedIdentityWithOptions:", v4);
}

- (void)configureUnitTestWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }

  else
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 entitlementVerifier]);
  __int128 v40 = v42;
  __int128 v41 = v43;
  unsigned int v9 = [v8 auditToken:&v40 hasBooleanEntitlement:CNEntitlementNameContactsServiceProxyConfigurable error:0];

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService unitTestBaseURLWithOptions:](self, "unitTestBaseURLWithOptions:", v4));
    if (v10)
    {
      __int128 v40 = v42;
      __int128 v41 = v43;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[CNAuditToken auditToken:](&OBJC_CLASS___CNAuditToken, "auditToken:", &v40));
      v11 = objc_alloc(&OBJC_CLASS___CNContactsEnvironment);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService environment](self, "environment"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 schedulerProvider]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService environment](self, "environment"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 loggerProvider]);
      id v16 = -[CNContactsEnvironment initWithSchedulerProvider:loggerProvider:]( v11,  "initWithSchedulerProvider:loggerProvider:",  v13,  v15);

      objc_super v38 = v16;
      -[CNContactsEnvironment setBaseURL:](v16, "setBaseURL:", v10);
      v19 = (void *)objc_opt_class(self, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v19 managedConfigurationForConnection:v20]);

      uint64_t v21 = -[CNAccessAuthorization initWithAuditToken:]( objc_alloc(&OBJC_CLASS___CNAccessAuthorization),  "initWithAuditToken:",  v39);
      uint64_t v22 = objc_alloc_init(&OBJC_CLASS___CNDataMapperConfiguration);
      -[CNDataMapperConfiguration setEnvironment:](v22, "setEnvironment:", v16);
      -[CNDataMapperConfiguration setManagedConfiguration:](v22, "setManagedConfiguration:", v37);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CNAccessAuthorization authorizer](v21, "authorizer"));
      -[CNDataMapperConfiguration setAuthorizationContext:](v22, "setAuthorizationContext:", v23);

      v26 = (void *)objc_opt_class(self, v24, v25);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
      __int128 v28 = (objc_class *)[v26 dataMapperClassForConnection:v27];

      id v29 = [[v28 alloc] initWithConfiguration:v22];
      v30 = objc_alloc(&OBJC_CLASS___ContactsService);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService workQueue](self, "workQueue"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService highPriorityWorkQueue](self, "highPriorityWorkQueue"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
      id v34 = -[ContactsService initWithDataMapper:dataMapperConfiguration:workQueue:highPriorityWorkQueue:connection:accessAuthorization:]( v30,  "initWithDataMapper:dataMapperConfiguration:workQueue:highPriorityWorkQueue:connection:accessAuthorization:",  v29,  v22,  v31,  v32,  v33,  v21);

      id v35 = self;
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](v35, "connection"));
      [v36 setExportedObject:v34];
    }
  }
}

- (id)unitTestBaseURLWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CNiOSAddressBookDataMapperUnitTestPathKey"]);
  v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CNiOSAddressBookDataMapperUnitTestInMemoryStoreKey"]);
    else {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (BOOL)clientAllowedToUseSPI:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }

  else
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 entitlementVerifier]);
  id v26 = 0LL;
  __int128 buffer = v27;
  __int128 v32 = v28;
  unsigned __int8 v9 = [v8 auditToken:&buffer hasBooleanEntitlement:CNEntitlementNameContactsFrameworkSPI error:&v26];
  id v10 = v26;

  if ((v9 & 1) != 0)
  {
    LOBYTE(v11) = 1;
    if (v10)
    {
LABEL_6:
      v29[0] = NSUnderlyingErrorKey;
      v29[1] = NSLocalizedFailureReasonErrorKey;
      v30[0] = v10;
      v30[1] = @"Couldn't check if caller had private entitlement";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
      goto LABEL_14;
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 entitlementVerifier]);
    id v25 = 0LL;
    __int128 buffer = v27;
    __int128 v32 = v28;
    unsigned int v11 = [v14 auditToken:&buffer isFirstOrSecondPartyWithError:&v25];
    id v15 = v25;

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
    id v17 = [v16 processIdentifier];

    if (v11)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService logger](self, "logger"));
      [v18 SPIUsageLackingEntitlementGrantedForPID:v17];
    }

    else
    {
      if (v15)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService logger](self, "logger"));
        [v19 internalError:v15];
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService logger](self, "logger"));
      [v20 SPIUsageLackingEntitlementRejectedForPID:v17];

      __int128 v43 = xmmword_100011D88;
      __int128 v44 = unk_100011D98;
      memset(v45, 0, sizeof(v45));
      __int128 v39 = xmmword_100011D48;
      __int128 v40 = unk_100011D58;
      __int128 v41 = xmmword_100011D68;
      __int128 v42 = unk_100011D78;
      __int128 v35 = xmmword_100011D08;
      __int128 v36 = unk_100011D18;
      __int128 v37 = xmmword_100011D28;
      __int128 v38 = unk_100011D38;
      __int128 buffer = *(_OWORD *)"<unknown>";
      __int128 v32 = unk_100011CD8;
      __int128 v33 = xmmword_100011CE8;
      __int128 v34 = unk_100011CF8;
      proc_name((int)v17, &buffer, 0xFFu);
      ABLogSimulateCrashReport( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Contacts client is attempting to use SPI without authorization: %s",  &buffer));
    }

    if (v10) {
      goto LABEL_6;
    }
  }

  v12 = 0LL;
LABEL_14:
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[CNErrorFactory errorWithCode:userInfo:]( &OBJC_CLASS___CNErrorFactory,  "errorWithCode:userInfo:",  100LL,  v12));
  uint64_t v22 = v21;
  if (a3) {
    char v23 = v11;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a3 = v21;
  }

  return v11;
}

- (void)performWorkWithDataMapper:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000040D4;
  v5[3] = &unk_100018538;
  id v6 = a3;
  id v4 = v6;
  -[ContactsService performAsyncWorkWithDataMapper:](self, "performAsyncWorkWithDataMapper:", v5);
}

- (void)performAsyncWorkWithDataMapper:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000041C0;
  v4[3] = &unk_100018560;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performServicingRequestWork:](v5, "performServicingRequestWork:", v4);
}

- (void)performWorkWithContactStore:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000042B4;
  v4[3] = &unk_100018560;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performServicingRequestWork:](v5, "performServicingRequestWork:", v4);
}

- (id)_bestWorkQueueForAuditToken:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 entitlementVerifier]);
  id v16 = 0LL;
  __int128 v7 = *(_OWORD *)&a3->var0[4];
  v15[0] = *(_OWORD *)a3->var0;
  v15[1] = v7;
  unsigned int v8 = [v6 auditToken:v15 allowsHighPriorityWithError:&v16];
  id v9 = v16;

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    if (v9)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService logger](self, "logger"));
      [v11 serviceError:v9];
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ContactsService workQueue](self, "workQueue"));
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ContactsService highPriorityWorkQueue](self, "highPriorityWorkQueue"));
  }

  v13 = (void *)v12;

  return v13;
}

- (void)performServicingRequestWork:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_100004574;
  id v17 = sub_100004584;
  id v18 = (id)objc_claimAutoreleasedReturnValue( +[CNInhibitor os_transactionInhibitorWithLabel:]( &OBJC_CLASS___CNInhibitor,  "os_transactionInhibitorWithLabel:",  @"com.apple.contactsd.ContactsService"));
  [(id)v14[5] start];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService connection](self, "connection"));
  id v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService _bestWorkQueueForAuditToken:](self, "_bestWorkQueueForAuditToken:", v12));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000458C;
  v9[3] = &unk_1000185D8;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  unsigned int v11 = &v13;
  [v7 performBlock:v9];

  _Block_object_dispose(&v13, 8);
}

- (void)performWorkServicingSPI:(id)a3 authenticationFailureHandler:(id)a4
{
  id v6 = (void (**)(void))a3;
  __int128 v7 = (void (**)(id, id))a4;
  id v10 = 0LL;
  unsigned int v8 = -[ContactsService clientAllowedToUseSPI:](self, "clientAllowedToUseSPI:", &v10);
  id v9 = v10;
  if (v8) {
    v6[2](v6);
  }
  else {
    v7[2](v7, v9);
  }
}

- (void)unifiedContactCountWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100004824;
  v4[3] = &unk_100018600;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performWorkWithDataMapper:](v5, "performWorkWithDataMapper:", v4);
}

- (void)contactCountForFetchRequest:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000497C;
  v9[3] = &unk_100018650;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004A84;
  v7[3] = &unk_100018678;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v10,  "performWorkServicingSPI:authenticationFailureHandler:",  v9,  v7);
}

- (void)sectionListOffsetsForSortOrder:(int64_t)a3 reply:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004B70;
  v10[3] = &unk_1000186C8;
  v10[4] = self;
  int64_t v12 = a3;
  id v5 = a4;
  id v11 = v5;
  id v6 = objc_retainBlock(v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100004C68;
  v8[3] = &unk_100018678;
  id v9 = v5;
  id v7 = v5;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( self,  "performWorkServicingSPI:authenticationFailureHandler:",  v6,  v8);
}

- (void)contactsForFetchRequest:(id)a3 withMatchInfoReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100004E00;
  v18[3] = &unk_100018650;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = objc_retainBlock(v18);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService queryAnalyticsLogger](self, "queryAnalyticsLogger"));
  [v11 recordQueryWithFetchRequest:v8];

  if ([v8 requiresMeContactAuthorization])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004F60;
    v16[3] = &unk_100018678;
    int64_t v12 = &v17;
    id v17 = v9;
    -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( self,  "performWorkServicingSPI:authenticationFailureHandler:",  v10,  v16);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService accessAuthorization](self, "accessAuthorization"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100004F78;
    v14[3] = &unk_100018678;
    int64_t v12 = &v15;
    id v15 = v9;
    [v13 performWork:v10 authorizingFetchRequest:v8 failureHandler:v14];
  }
}

- (void)encodedContactsAndCursorForFetchRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100005114;
  v18[3] = &unk_100018650;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  id v10 = objc_retainBlock(v18);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService queryAnalyticsLogger](self, "queryAnalyticsLogger"));
  [v11 recordQueryWithFetchRequest:v8];

  if ([v8 requiresMeContactAuthorization])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000053A8;
    v16[3] = &unk_100018678;
    int64_t v12 = &v17;
    id v17 = v9;
    -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( self,  "performWorkServicingSPI:authenticationFailureHandler:",  v10,  v16);
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService accessAuthorization](self, "accessAuthorization"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000053C8;
    v14[3] = &unk_100018678;
    int64_t v12 = &v15;
    id v15 = v9;
    [v13 performWork:v10 authorizingFetchRequest:v8 failureHandler:v14];
  }
}

- (void)progressiveContactsForFetchRequest:(id)a3 progressHandler:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService queryAnalyticsLogger](self, "queryAnalyticsLogger"));
  [v11 recordQueryWithFetchRequest:v8];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  _OWORD v15[2] = sub_1000054F4;
  v15[3] = &unk_1000187E0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = objc_alloc_init(&OBJC_CLASS___CNCancelationToken);
  id v12 = v18;
  id v13 = v9;
  id v14 = v8;
  -[ContactsService performAsyncWorkWithDataMapper:](self, "performAsyncWorkWithDataMapper:", v15);
  v10[2](v10, v12);
}

- (void)identifierWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005704;
  v4[3] = &unk_100018600;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performWorkWithDataMapper:](v5, "performWorkWithDataMapper:", v4);
}

- (void)meContactIdentifiersWithReply:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100005834;
  v6[3] = &unk_100018808;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005920;
  v4[3] = &unk_100018678;
  id v5 = v8;
  id v3 = v8;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v7,  "performWorkServicingSPI:authenticationFailureHandler:",  v6,  v4);
}

- (void)executeSaveRequest:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000059D8;
  v7[3] = &unk_100018830;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithContactStore:](v8, "performWorkWithContactStore:", v7);
}

- (void)containersMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005B4C;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)serverSearchContainersMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005C70;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)policyForContainerWithIdentifier:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005D94;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)accountsMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005EB8;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)groupsMatchingPredicate:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005FDC;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)subgroupsOfGroupWithIdentifier:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006100;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)defaultContainerIdentifierWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000061F8;
  v4[3] = &unk_100018600;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performWorkWithDataMapper:](v5, "performWorkWithDataMapper:", v4);
}

- (void)setDefaultAccountIdentifier:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006330;
  v9[3] = &unk_100018650;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006428;
  v7[3] = &unk_100018678;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v10,  "performWorkServicingSPI:authenticationFailureHandler:",  v9,  v7);
}

- (void)setMeContact:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006518;
  v9[3] = &unk_100018650;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000065B4;
  v7[3] = &unk_100018678;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v10,  "performWorkServicingSPI:authenticationFailureHandler:",  v9,  v7);
}

- (void)setMeContact:(id)a3 forContainer:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _OWORD v12[2] = sub_1000066C8;
  v12[3] = &unk_100018880;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000067E8;
  v10[3] = &unk_100018678;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v13,  "performWorkServicingSPI:authenticationFailureHandler:",  v12,  v10);
}

- (void)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 withReply:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  _OWORD v15[2] = sub_100006924;
  v15[3] = &unk_1000188D0;
  id v16 = self;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100006A5C;
  v13[3] = &unk_100018678;
  id v14 = v20;
  id v9 = v20;
  id v10 = v19;
  id v11 = v18;
  id v12 = v17;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v16,  "performWorkServicingSPI:authenticationFailureHandler:",  v15,  v13);
}

- (void)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100006B70;
  v14[3] = &unk_100018920;
  void v14[4] = self;
  id v16 = a4;
  id v17 = a5;
  id v15 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _OWORD v12[2] = sub_100006C70;
  v12[3] = &unk_100018790;
  void v12[4] = self;
  id v13 = v17;
  id v9 = v17;
  id v10 = v16;
  id v11 = v8;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( self,  "performWorkServicingSPI:authenticationFailureHandler:",  v14,  v12);
}

- (void)userActivityForContact:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006DA8;
  v9[3] = &unk_100018970;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006E94;
  v7[3] = &unk_100018790;
  void v7[4] = v10;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v10,  "performWorkServicingSPI:authenticationFailureHandler:",  v9,  v7);
}

- (void)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _OWORD v12[2] = sub_100006FF0;
  v12[3] = &unk_100018880;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007110;
  v10[3] = &unk_100018678;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v13,  "performWorkServicingSPI:authenticationFailureHandler:",  v12,  v10);
}

- (void)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 withReply:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _OWORD v12[2] = sub_100007224;
  v12[3] = &unk_100018880;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007344;
  v10[3] = &unk_100018678;
  id v11 = v16;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v13,  "performWorkServicingSPI:authenticationFailureHandler:",  v12,  v10);
}

- (void)changeHistoryWithFetchRequest:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000073FC;
  v7[3] = &unk_100018628;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ContactsService performWorkWithDataMapper:](v8, "performWorkWithDataMapper:", v7);
}

- (void)executeChangeHistoryClearRequest:(id)a3 withReply:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100007558;
  v9[3] = &unk_100018650;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007664;
  v7[3] = &unk_100018678;
  id v8 = v12;
  id v5 = v12;
  id v6 = v11;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v10,  "performWorkServicingSPI:authenticationFailureHandler:",  v9,  v7);
}

- (void)currentHistoryTokenWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000076F0;
  v4[3] = &unk_100018600;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performWorkWithDataMapper:](v5, "performWorkWithDataMapper:", v4);
}

- (void)currentHistoryAnchorWithReply:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000077F0;
  v4[3] = &unk_100018600;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[ContactsService performWorkWithDataMapper:](v5, "performWorkWithDataMapper:", v4);
}

- (void)reportFavoritesIssue:(id)a3
{
  id v3 = a3;
  ABDiagnosticsEnabled();
  _ABLog2(3LL, "-[ContactsService reportFavoritesIssue:]", 724LL, 0LL, @"%@");
  ABLogSimulateCrashReport(v3);
  ABLogDisplayInternalAlert(v3);
}

- (BOOL)shouldNotReportFavoritesError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v5 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v4, "code") == (id)260)
    {
      BOOL v6 = 1;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      if ([v7 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v4, "code") == (id)257)
      {
        BOOL v6 = 1;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
        else {
          BOOL v6 = 0;
        }
      }
    }
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)favoritesEntryDictionariesAtPath:(id)a3 withReply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007A8C;
  v7[3] = &unk_100018808;
  id v8 = self;
  id v9 = a4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007C68;
  v5[3] = &unk_100018678;
  id v6 = v9;
  id v4 = v9;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v8,  "performWorkServicingSPI:authenticationFailureHandler:",  v7,  v5);
}

- (void)writeFavoritesPropertyListData:(id)a3 toPath:(id)a4 withReply:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007D58;
  v10[3] = &unk_100018650;
  id v11 = self;
  id v12 = a3;
  id v13 = a5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007F7C;
  v8[3] = &unk_100018678;
  id v9 = v13;
  id v6 = v13;
  id v7 = v12;
  -[ContactsService performWorkServicingSPI:authenticationFailureHandler:]( v11,  "performWorkServicingSPI:authenticationFailureHandler:",  v10,  v8);
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 withReply:(id)a4
{
}

- (void)verifyIndexWithReply:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[CNErrorFactory errorWithCode:userInfo:]( &OBJC_CLASS___CNErrorFactory,  "errorWithCode:userInfo:",  104LL,  0LL));
  (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
}

- (void)authorizedKeysForContactKeys:(id)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsService accessAuthorization](self, "accessAuthorization"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 authorizedKeysForContactKeys:v7]);

  v6[2](v6, v9, 0LL);
}

- (void)shouldAnalyzeDatabaseWithReply:(id)a3
{
}

- (void)analyzeDatabaseWithReply:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNiOSAddressBookDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (CNDataMapperConfiguration)dataMapperConfiguration
{
  return self->_dataMapperConfiguration;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNScheduler)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (CNContactsLogger)logger
{
  return self->_logger;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (CNAccessAuthorization)accessAuthorization
{
  return self->_accessAuthorization;
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setRegulatoryLogger:(id)a3
{
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (void)setAssumedIdentity:(id)a3
{
}

- (OS_dispatch_queue)backgroundColorQueue
{
  return self->_backgroundColorQueue;
}

- (CNQueryAnalyticsLogger)queryAnalyticsLogger
{
  return self->_queryAnalyticsLogger;
}

- (void)setQueryAnalyticsLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end