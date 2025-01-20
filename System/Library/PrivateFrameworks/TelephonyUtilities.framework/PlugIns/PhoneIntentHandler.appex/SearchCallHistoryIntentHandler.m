@interface SearchCallHistoryIntentHandler
+ (unint64_t)maximumRecordCountForCallRecordTypeOptions:(unint64_t)a3;
- (NSCache)identifierToContactCache;
- (SearchCallHistoryIntentHandler)init;
- (SearchCallHistoryIntentHandler)initWithDataSource:(id)a3;
- (SearchCallHistoryIntentHandlerDataSource)dataSource;
- (id)callRecordsForRecentCallsWithRecordTypeOptions:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 recipient:(id)a6 capabilities:(unint64_t)a7 preferredProvider:(int64_t)a8 maximumRecordCount:(unint64_t)a9 unseen:(id)a10;
- (void)handleSearchCallHistory:(id)a3 completion:(id)a4;
- (void)resolveRecipientForSearchCallHistory:(id)a3 withCompletion:(id)a4;
@end

@implementation SearchCallHistoryIntentHandler

- (SearchCallHistoryIntentHandler)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___SearchCallHistoryIntentHandlerDataSource);
  v4 = -[SearchCallHistoryIntentHandler initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (SearchCallHistoryIntentHandler)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SearchCallHistoryIntentHandler;
  v6 = -[SearchCallHistoryIntentHandler init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSCache);
    identifierToContactCache = v7->_identifierToContactCache;
    v7->_identifierToContactCache = v8;
  }

  return v7;
}

+ (unint64_t)maximumRecordCountForCallRecordTypeOptions:(unint64_t)a3
{
  if ((a3 & 8) != 0) {
    return 1LL;
  }
  else {
    return 25LL;
  }
}

- (void)handleSearchCallHistory:(id)a3 completion:(id)a4
{
  v6 = (INSearchCallHistoryIntentResponse *)a3;
  v40 = (void (**)(id, id))a4;
  id v7 = IntentHandlerDefaultLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got a SearchCallHistory intent: %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[INSearchCallHistoryIntentResponse dateCreated](v6, "dateCreated"));
  v10 = (INSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue([v9 startDateComponents]);
  objc_super v11 = (INSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue([v9 endDateComponents]);
  v43 = (INSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue(-[INSearchCallHistoryIntentResponse recipient](v6, "recipient"));
  v12 = (INSearchCallHistoryIntentResponse *)-[INSearchCallHistoryIntentResponse callCapabilities]( v6,  "callCapabilities");
  v13 = (INSearchCallHistoryIntentResponse *)-[INSearchCallHistoryIntentResponse callTypes](v6, "callTypes");
  v42 = (INSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue(-[INSearchCallHistoryIntentResponse unseen](v6, "unseen"));
  id v41 = -[INSearchCallHistoryIntentResponse preferredCallProvider](v6, "preferredCallProvider");
  id v14 = IntentHandlerDefaultLog();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Start Date  : %@", buf, 0xCu);
  }

  id v16 = IntentHandlerDefaultLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "End Date    : %@", buf, 0xCu);
  }

  id v18 = IntentHandlerDefaultLog();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v43;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Recipient   : %@", buf, 0xCu);
  }

  id v20 = IntentHandlerDefaultLog();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v45 = v12;
    __int16 v46 = 1024;
    int v47 = v12 & 1;
    __int16 v48 = 1024;
    unsigned int v49 = (v12 >> 1) & 1;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Capabilities: %lx (audio: %d | video: %d)",  buf,  0x18u);
  }

  id v22 = IntentHandlerDefaultLog();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = INPreferredCallProviderGetName(v41);
    v25 = (INSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138412290;
    v45 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PreferredCallProvider: %@", buf, 0xCu);
  }

  id v26 = IntentHandlerDefaultLog();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45 = v13;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Types       : %lx", buf, 0xCu);
  }

  id v28 = IntentHandlerDefaultLog();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v42;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Unseen     : %@", buf, 0xCu);
  }

  id v30 = [(id)objc_opt_class(self) maximumRecordCountForCallRecordTypeOptions:v13];
  v31 = self;
  v32 = v10;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[INSearchCallHistoryIntentResponse date](v10, "date"));
  v34 = v11;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[INSearchCallHistoryIntentResponse date](v11, "date"));
  v36 = (void *)objc_claimAutoreleasedReturnValue( -[SearchCallHistoryIntentHandler callRecordsForRecentCallsWithRecordTypeOptions:startDate:endDate:recipient:capabilities:preferredProvider:maximumRecordCount:unseen:]( v31,  "callRecordsForRecentCallsWithRecordTypeOptions:startDate:endDate:recipient:capabilities:preferredPro vider:maximumRecordCount:unseen:",  v13,  v33,  v35,  v43,  v12,  v41,  v30,  v42));

  v37 = -[INSearchCallHistoryIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INSearchCallHistoryIntentResponse),  "initWithCode:userActivity:",  7LL,  0LL);
  -[INSearchCallHistoryIntentResponse setCallRecords:](v37, "setCallRecords:", v36);
  id v38 = IntentHandlerDefaultLog();
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Calling completion block with response: %@",  buf,  0xCu);
  }

  v40[2](v40, v37);
}

- (void)resolveRecipientForSearchCallHistory:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a3 recipient]);
  id v7 = IntentHandlerDefaultLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "resolveRecipientForSearchCallHistory: %@",  (uint8_t *)&v26,  0xCu);
  }

  if (!v6)
  {
    id v15 = IntentHandlerDefaultLog();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No recipient specified, returning notRequired",  (uint8_t *)&v26,  2u);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult notRequired](&OBJC_CLASS___INPersonResolutionResult, "notRequired"));
    goto LABEL_11;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 personHandle]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 value]);
  id v11 = [v10 length];

  if (v11)
  {
    id v12 = IntentHandlerDefaultLog();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Handle is present. Simply using the recipient to resolve with: %@",  (uint8_t *)&v26,  0xCu);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INPersonResolutionResult,  "successWithResolvedPerson:",  v6));
LABEL_11:
    v17 = (void *)v14;
    goto LABEL_20;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 siriMatches]);
  id v19 = [v18 count];
  id v20 = IntentHandlerDefaultLog();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Recipient contains siriMatches, preserving those and returning success",  (uint8_t *)&v26,  2u);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[INPersonResolutionResult successWithResolvedPerson:]( &OBJC_CLASS___INPersonResolutionResult,  "successWithResolvedPerson:",  v6));
  }

  else
  {
    if (v22)
    {
      LOWORD(v26) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No contacts match the specified recipient, returning unsupported (a.k.a. notFound)",  (uint8_t *)&v26,  2u);
    }

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult unsupported](&OBJC_CLASS___INPersonResolutionResult, "unsupported"));
  }

  v17 = (void *)v23;

LABEL_20:
  id v24 = IntentHandlerDefaultLog();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Resolving with: %@", (uint8_t *)&v26, 0xCu);
  }

  v5[2](v5, v17);
}

- (id)callRecordsForRecentCallsWithRecordTypeOptions:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 recipient:(id)a6 capabilities:(unint64_t)a7 preferredProvider:(int64_t)a8 maximumRecordCount:(unint64_t)a9 unseen:(id)a10
{
  int64_t v87 = a8;
  *((void *)&v90 + 1) = a4;
  *(void *)&__int128 v90 = a5;
  id v13 = a6;
  id v89 = a10;
  id v14 = IntentHandlerDefaultLog();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Performing call history lookup", buf, 2u);
  }

  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v90 != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsAfterDate:beforeDate:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsAfterDate:beforeDate:",  *((void *)&v90 + 1),  (void)v90));
    -[NSMutableArray addObject:](v16, "addObject:", v17);
  }

  if (v13)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler dataSource](self, "dataSource"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contactsDataSource]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler identifierToContactCache](self, "identifierToContactCache"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "tu_handlesMatchingPersonWithContactsDataSource:identifierToContactCache:",  v19,  v20));

    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithNumberOfRemoteParticipants:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithNumberOfRemoteParticipants:",  1LL));
    -[NSMutableArray addObject:](v16, "addObject:", v22);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchCallHistoryIntentHandler dataSource](self, "dataSource"));
    unint64_t v24 = a3;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 coreTelephonyDataSource]);
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allRelevantISOCountryCodes]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:",  v21,  v26));

    a3 = v24;
    -[NSMutableArray addObject:](v16, "addObject:", v27);
  }

  v88 = v13;
  if (a3)
  {
    id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    if ((a3 & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereOriginated:",  1LL));
      -[NSMutableArray addObject:](v28, "addObject:", v29);
    }

    if ((a3 & 2) != 0)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereOriginated:",  0LL));
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereAnswered:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereAnswered:",  0LL));
      unint64_t v32 = a3;
      v96[0] = v30;
      v96[1] = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 2LL));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v33));

      -[NSMutableArray addObject:](v28, "addObject:", v34);
      a3 = v32;
    }

    if ((a3 & 4) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereOriginated:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereOriginated:",  0LL));
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[CallHistoryDataSourcePredicate predicateForCallsThatWereAnswered:]( &OBJC_CLASS___CallHistoryDataSourcePredicate,  "predicateForCallsThatWereAnswered:",  1LL));
      unint64_t v37 = a3;
      v95[0] = v35;
      v95[1] = v36;
      id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v95, 2LL));
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v38));

      -[NSMutableArray addObject:](v28, "addObject:", v39);
      a3 = v37;
    }

    if (a3 >= 8)
    {
      id v40 = IntentHandlerDefaultLog();
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1000202B4(a3, v41, v42, v43, v44, v45, v46, v47);
      }
    }

    if (-[NSMutableArray count](v28, "count", v87) == (id)1)
    {
      uint64_t v48 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v28, "firstObject"));
    }

    else
    {
      if ((unint64_t)-[NSMutableArray count](v28, "count") < 2)
      {
LABEL_23:

        goto LABEL_24;
      }

      uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v28));
    }

    unsigned int v49 = (void *)v48;
    -[NSMutableArray addObject:](v16, "addObject:", v48);

    goto LABEL_23;
  }

- (SearchCallHistoryIntentHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSCache)identifierToContactCache
{
  return self->_identifierToContactCache;
}

- (void).cxx_destruct
{
}

@end